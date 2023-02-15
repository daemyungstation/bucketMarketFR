$(function () {
    var $header = $(".area-header"),
        $content = $(".area-content"),
        $body = $(".area-body"),
        $layerPopup = $(".layer-popup1, .layer-popup2, .layer-popup4"),
        $bottom = $(".area-aside.bottom");
    
    /* 숫자만 입력 */
    $content.add($body).add($layerPopup).find(".number, .onlyNumber").each(function() {
        var regex = new RegExp('^[\\d]*$');
        setInputFilter(this, function(value) {
            return regex.test(value);
       });
    });
    /* 뒤로가기 버튼 클릭 이벤트 */
    $header.on("click", ".btn-historyback", function () {
        history.go(-1);
    });
    /**********************************************************
     ************************** 레이어 ************************** 
     **********************************************************/
    /* 레이어 닫기 버튼 클릭 이벤트 */
    $layerPopup.on("click", ".btn-close", function () {
        $.common.layer.close($(this).closest(".layer-popup"));
    });
    /* 레이어 체크박스 변경 이벤트 */
    $layerPopup.on("change", ".form-checkbox", function () {
        var $this = $(this),
            $checkbox = $this.find("input[type='checkbox']");
        $this.toggleClass("checked");
        $checkbox.toggleClass("checked");
    });
    /* 레이어 라디오 변경 이벤트 */
    $layerPopup.on("change", ".form-radio", function () {
        var $this = $(this),
            $radio = $this.find("input[type='radio']");
        $layerPopup.find("input[name='" + $radio.attr("name") + "']")
            .attr("checked", false)
            .closest(".form-radio")
            .removeClass("checked");
        $this.addClass("checked");
        $radio.addClass("checked");
    });
    /* 클립보드 복사 */
    new ClipboardJS(".sns-copyurl", {
        text : function() {
          return document.location.href;
        }
    }).on("success", function(e) {
        alert("복사 되었습니다.");
    });
    
    if ($.resources.isPc) {
        var searchTargetArray = [$(".contain-search"), $(".box-search")];
        for (var i in searchTargetArray) {
            /* 검색엔터 이벤트 */
            searchTargetArray[i].on("keyup", ".searchword", function (e) {
                e.preventDefault();
                if (e.keyCode == 13) {
                    var value = $(this).val();
                    if (value != "") {
                        $.requestPage($.action.common.search.list(), {searchPrdMstNm : value});
                    }
                }
            });
            /* 검색버튼 클릭 이벤트 */
            searchTargetArray[i].on("click", ".btn-search", function (e) {
                e.preventDefault();
                var value = $(".searchword").val();
                if (value != "") {
                    $.requestPage($.action.common.search.list(), {searchPrdMstNm : value});
                } else {
                    alert("검색어를 입력해 주세요.");
                    return;
                }
            });
        }
        /* 네비게이션 클릭 이벤트 */
        $(".navigation").on("click", function () {
            var $this = $(this);
            if ($this.next(".navigation").length > 0) {
                var action = $.action.main.index();
                $.each($.action.data, function (key, value) {
                    if (value.hasOwnProperty($this.data("key"))) {
                        action = value[$this.data("key")];
                        return false;
                    }
                });
                var params = $this.data("params");
                if (typeof(params) != "undefined" && params != "") {
                    $.requestPage(action, eval(params));
                } else {
                    $.requestPage(action);
                }
            }
        });
    }
});
(function($) {
    /**
     * <pre>
     * 1. FuntionName : serializeObject
     * 2. ClassName  : jquery.common.js
     * 3. Comment    : form parameter object화 공통 함수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @returns
     */
    $.fn.serializeObject = function() {
        "use strict";
        var result = {};
        var extend = function(i, element) {
            var node = result[element.name]
            if ("undefined" !== typeof node && node !== null) {
                if ($.isArray(node)) {
                    node.push(element.value)
                } else {
                    result[element.name] = [node, element.value]
                }
            } else {
                result[element.name] = element.value
            }
        }
        $.each(this.serializeArray(), extend)
        return result
    };
    /**
     * <pre>
     * 1. FuntionName : setCsrfToken
     * 2. ClassName  : jquery.common.js
     * 3. Comment    : CSRF TOKEN SET
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     */
    $.fn.setCsrfToken = function () {
        var csrf = $.common.csrf.get();
        $(this).prepend(TagUtil.createDynamicInput("hidden", csrf.name, csrf.value));
    };
    /**
     * <pre>
     * 1. FuntionName : serializeObject
     * 2. ClassName  : jquery.common.js
     * 3. Comment    : class 목록 반환 공통 함수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @returns
     */
    $.fn.classes = function (callback) {
        var classes = [];
        $.each(this, function (i, v) {
            var splitClassName = v.className.split(/\s+/);
            for (var j = 0; j < splitClassName.length; j++) {
                var className = splitClassName[j];
                if (-1 === classes.indexOf(className)) {
                    classes.push(className);
                }
            }
        });
        if ('function' === typeof callback) {
            for (var i in classes) {
                callback(classes[i]);
            }
        }
        return classes;
    };
    /**
     * <pre>
     * 1. FuntionName : postSubmit
     * 2. ClassName  : jquery.common.js
     * 3. Comment    : POST SUBMIT 공통 함수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param action
     * @param target
     * @returns
     */
    $.fn.postSubmit = function (action, target) {
        var $this = $(this);
        if ($this.attr("enctype") == "multipart/form-data") {
            var csrf = $.common.csrf.get();
            action += "?" + csrf.name + "=" + csrf.value;
        }
        $this.setCsrfToken();
        $this.attr({
            "action" : action,
            "target" : ((typeof(target) != "undefined") ? target : "_self"),
            "method" : "POST"
        }).submit();
    };
    /**
     * <pre>
     * 1. FuntionName : getSubmit
     * 2. ClassName  : jquery.common.js
     * 3. Comment    : GET SUBMIT 공통 함수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param action
     * @param target
     * @returns
     */
    $.fn.getSubmit = function (action, target) {
        $(this).attr({
            "action" : action,
            "target" : ((typeof(target) != "undefined") ? target : "_self"),
            "method" : "GET"
        }).submit();
    };
    /**
     * <pre>
     * 1. FuntionName : postPop
     * 2. ClassName  : jquery.common.js
     * 3. Comment    : WINDOW POPUP POST SUBMIT 공통 함수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param action
     * @param target
     * @param option
     * @param callback
     * @returns
     */
    $.fn.postPop = function(action, target, option, callback, isOutLink) {
        if (typeof(callback) != "undefined") {
            $.fn.extend(jQuery, callback);
        }
        if (option == "_blank") {
            option = "";
        } else {
            option += ",scrollbars=no,resizeable=no,menubar=no,toolbar=no,location=no,directories=yes,fullscreen=no,status=no";
        }
        var $this = $(this);
        if (!(typeof(isOutLink) != "undefined" && isOutLink)) {
            $this.setCsrfToken();
        }
        var win = window.open("", target, option);
        $(this).attr({
            "action" : action,
            "target" : target,
            "method" : "POST"
        }).submit();
        return win;
    };
    /**
     * <pre>
     * 1. FuntionName : getPop
     * 2. ClassName  : jquery.common.js
     * 3. Comment    : WINDOW POPUP GET SUBMIT 공통 함수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param action
     * @param target
     * @param option
     * @param callback
     * @param isOutLink
     * @returns
     */
    $.fn.getPop = function(action, target, option, callback, isOutLink) {
        if (typeof(callback) != "undefined") {
            $.fn.extend(jQuery, callback);
        }
        if (option == "_blank") {
            option = "";
        } else {
            option += ",scrollbars=no,resizeable=no,menubar=no,toolbar=no,location=no,directories=yes,fullscreen=no,status=no";
        }
        var $this = $(this);
        action += "?";
        action += $this.serialize();
        if (!(typeof(isOutLink) != "undefined" && isOutLink)) {
            $this.setCsrfToken();
        }
        return window.open(action, target, option);
    };
    /**
     * <pre>
     * 1. FuntionName : requestLayer
     * 2. ClassName  : jquery.common.js
     * 3. Comment    : Layer 요청 공통 함수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param url
     * @param params
     * @param addClass
     * @param callback
     */
    $.fn.requestLayer = function (url, params, addClass, callback) {
        var $wrap = $(this);
        if (typeof(params) == "undefined") {
            params = {};
        }
        $.postSyncHtmlAjax(url, params, function (html) {
            $wrap.requestLayerByTemplate(html, addClass, callback);
        });
    };
    /**
     * <pre>
     * 1. FuntionName : requestLayer
     * 2. ClassName  : jquery.common.js
     * 3. Comment    : Layer 요청 공통 함수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param tmpl
     * @param addClass
     * @param callback
     */
    $.fn.requestLayerByTemplate = function (tmpl, addClass, callback) {
        var $wrap = $(this),
            $inner = $wrap.find(".layer-inner");
        $.common.layer.close($wrap);
        $inner.append(tmpl);
        if (typeof(callback) != "undefined") {
            callback.call($wrap, $inner);
        }
        $.common.layer.open($wrap, addClass);
    }
    $.fn.extend(jQuery, {
        common : {
            csrf : {
                get : function () {
                    var $head = $("head"),
                        csrfName = $head.find("meta[name='_csrf_name']").attr("content"),
                        csrfToken = $head.find("meta[name='_csrf_token']").attr("content"),
                        csrfHeader = $head.find("meta[name='_csrf_header']").attr("content");
                    return {name : csrfName, value : csrfToken, header : csrfHeader};
                },
                set : function (data) {
                    var csrf = $.common.csrf.get(),
                        name = csrf.name,
                        value = csrf.value;
                    if (data) {
                        if (typeof(data) == "object") {
                            if (TagUtil.getObjectClass(data) == "FormData") {
                                data.append(name, value);
                            } else {
                                data[name] = value;
                            }
                        } else {
                            if (data != "") {
                                data += "&";
                            }
                            data += name + "=" + value;
                        }
                    } else {
                        data = {};
                        data[name] = value;
                    }
                    return data;
                }
            },
            layer : {
                /**
                 * <pre>
                 * 1. FuntionName : common.layer.init
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 레이어 초기화 공통 함수
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 3. 23.
                 * </pre>
                 *
                 * @param $layer
                 * @returns
                 */
                init : function ($layer) {
                    var targets = [".form-checkbox", ".form-radio"];
                    $.each(targets, function (i, target) {
                        var $labels = $layer.find(targets);
                        $labels.each(function () {
                            var $label = $(this),
                                $input = $label.find("input[type='checkbox'], input[type='radio']");
                            if ($input.is(":checked")) {
                                $input.addClass("checked");
                                $label.addClass("checked");
                            }
                        });
                    });
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.layer.init
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 레이어 열기 공통 함수
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 3. 23.
                 * </pre>
                 *
                 * @param $layer
                 * @param addClass
                 * @returns
                 */
                open : function ($layer, addClass) {
                    $.common.layer.init($layer);
                    $layer.removeClass("active").addClass("active");
                    if (addClass != null && typeof(addClass) != "undefined") {
                        if (!$layer.hasClass(addClass)) {
                            $layer.addClass(addClass);
                        }
                    }
                    if ($.resources.isPc || $layer.hasClass("layer-popup2")) {
                        setTimeout(function () {
                            posPopup();
                        }, 0);
                    }
                    if ($.resources.isMobile) {
                        scrollDisable();
                    }
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.layer.init
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 레이어 닫기 공통 함수
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 3. 23.
                 * </pre>
                 *
                 * @param $layer
                 * @returns
                 */
                close : function ($layer) {
                    if ($layer.hasClass("layer-popup1")) {
                        $layer
                            .removeClass()
                            .addClass(["layer-popup", "layer-popup1"]);
                        if ($.resources.isMobile) {
                            scrollAble();
                        }
                    } else if ($layer.hasClass("layer-popup2")) {
                        $layer
                            .removeClass()
                            .addClass(["layer-popup", "layer-popup2"]);
                        if (!$layer.siblings(".layer-popup1").hasClass("active") && !$.resources.isPc) {
                            scrollAble();
                        }
                    } else if ($layer.hasClass("layer-popup4")) {
                        $layer
                            .removeClass()
                            .addClass(["layer-popup", "layer-popup4"]);
                        if ($.resources.isMobile) {
                            scrollAble();
                        }
                    }
                    $layer.find(".layer-inner").empty();
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.layer.hide
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 레이어 숨기기 공통 함수
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 3. 23.
                 * </pre>
                 *
                 * @param $layer
                 * @returns
                 */
                hide : function ($layer) {
                    if ($layer.hasClass("layer-popup1")) {
                        $layer.removeClass().addClass(["layer-popup", "layer-popup1"]);
                        if ($.resources.isMobile) {
                            scrollAble();
                        }
                    } else if ($layer.hasClass("layer-popup2")) {
                        $layer.removeClass().addClass(["layer-popup", "layer-popup2"]);
                        if (!$layer.siblings(".layer-popup1").hasClass("active") && $.resources.isMobile) {
                            scrollAble();
                        }
                    }
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.layer.sns
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : SNS 공유 Layer 공통 함수
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 3. 23.
                 * </pre>
                 *
                 * @param params
                 */
                sns : function (params) {
                    if (typeof(params) == "undefined") {
                        params = new Object();
                    }
                    $(".layer-popup2").requestLayer($.action.common.sns.view.layer(), params, "infor1");
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.layer.zipcode
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 우편번호 검색 Layer 공통 함수
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 3. 23.
                 * </pre>
                 * 
                 * @param callback
                 */
                zipcode : function (callback) {
                    $(".layer-popup1").requestLayer($.action.common.zipcode.list.layer(), null, "layer-zip-code");
                    $.callback = callback;
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.layer.term
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 약관 Layer 공통 함수
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 3. 23.
                 * </pre>
                 * 
                 * @param agrMstType
                 * @param agrMstGbn
                 * @param callback
                 */
                term : function (agrMstType, agrMstGbn, useEtcTitle, callback) {
                    $(".layer-popup1").requestLayer($.action.common.term.view.layer(), { "AGR_MST_TYPE" : agrMstType, "AGR_MST_GBN" : agrMstGbn, useEtcTitle : useEtcTitle }, "layer-agreement2");
                    $.callback = callback;
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.layer.ftc
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 사업자정보확인 Layer 공통 함수
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 3. 23.
                 * </pre>
                 * 
                 */
                ftc : function (agrMstType, agrMstGbn, callback) {
                    $(".layer-popup1").requestLayer($.action.common.ftc.view.layer(), null);
                    $.callback = callback;
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.layer.productSearch
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 상품검색 Layer 공통 함수
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 3. 23.
                 * </pre>
                 * 
                 * @param callback
                 */
                productSearch : function (params, callback) {
                    $(".layer-popup1").requestLayer($.action.common.product.search.layer(), params, "layer-product-search");
                    $.callback = callback;
                }
            },
            file : {
                /**
                 * <pre>
                 * 1. FuntionName : common.file.download
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 파일 다운로드
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 3. 23.
                 * </pre>
                 *
                 * @param CMM_FLE_IDX
                 * @returns
                 */
                download : function (CMM_FLE_IDX) {
                    var csrf = $.common.csrf.get();
                    if ($.resources.isApp) { // APP 일 경우 OUTLINK
                        var url = $.resources.domain.mobile;
                        url += $.action.common.file.download();
                        url += "?" + csrf.name + "=" + csrf.value;
                        url += "&CMM_FLE_IDX=" + CMM_FLE_IDX;
                        var params = {"outlink_url" : url};
                        if ($.resources.isAndroid) {
                            bucketmarketApp.openOutLinkFromJS(JSON.stringify(params));
                        } else if ($.resources.isIos) {
                            window.webkit.messageHandlers.openOutLinkFromJS.postMessage(JSON.stringify(params));
                        }
                    } else {
                        var params = [
                            TagUtil.createDynamicInput("hidden", csrf.name, csrf.value),
                            TagUtil.createDynamicInput("hidden", "CMM_FLE_IDX", CMM_FLE_IDX)
                        ];
                        if ($.resources.isMobile) {
                            TagUtil.createDynamicForm("dynamicFileDownloadForm", $.action.common.file.download())
                                .append(params)
                                .appendTo("body")
                                .postPop($.action.common.file.download(), "filedownloadPopup", "_blank");
                        } else {
                            TagUtil.createDynamicForm("dynamicFileDownloadForm", $.action.common.file.download())
                                .append(params)
                                .appendTo("body")
                                .postSubmit($.action.common.file.download());
                        }
                        $("#dynamicFileDownloadForm").remove();
                    }
                }
            },
            check : {
                /**
                 * <pre>
                 * 1. FuntionName : common.check.ssn
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 실명 확인
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 5. 13.
                 * </pre>
                 *
                 * @param jumin1
                 * @param jumin2
                 * @param name
                 * @param srvNo
                 * @returns
                 */
                ssn : function (jumin1, jumin2, name, srvNo, callback) {
                    var params = {
                        jumin1 : jumin1,
                        jumin2 : jumin2,
                        name : name,
                        srvNo : srvNo
                    };
                    $.postSyncJsonAjax($.action.common.check.ssn.ajax(), params, callback);
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.check.bankAccount
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 은행 계좌 확인
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 5. 13.
                 * </pre>
                 *
                 * @param jumin1
                 * @param jumin2
                 * @param name
                 * @param srvNo
                 * @returns
                 */
                bankAccount : function (bankCode, bankAccount, callback) {
                    var params = {
                        bankCode : bankCode,
                        bankAccount : bankAccount
                    };
                    $.postSyncJsonAjax($.action.common.check.bank.account.ajax(), params, callback);
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.check.oneself
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 본인인증
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 5. 13.
                 * </pre>
                 *
                 * @param addVar
                 * @param callback
                 */
                oneself : function (addVar, callback) {
                    $.oneselfReqNum;
                    $.oneselfCallback = callback;
                    if ($.resources.isApp && $.resources.isAndroid) {
                        $.postSyncJsonAjax($.action.common.oneself.req.num.ajax(), null, function (data) {
                            $.oneselfReqNum = data.reqNum;
                            bucketmarketApp.openAuthJS($.oneselfReqNum);
                        });
                    } else {
                        $("#oneselfForm").remove();
                        TagUtil.createDynamicForm("oneselfForm").appendTo("body");
                        var $oneselfForm = $("#oneselfForm");
                        $.postSyncJsonAjax($.action.common.oneself.req.num.ajax(), null, function (data) {
                            $.oneselfReqNum = data.reqNum;
                            $oneselfForm.append(TagUtil.createDynamicInput("hidden", "reqNum", $.oneselfReqNum));
                        });
                        if ($.oneselfReqNum) {
                            var win = $oneselfForm.getPop($.action.common.oneself.req.popup(), "oneselfPopup", "width=400,height=630", undefined, true);
                            if (win == null) {
                                alert("팝업 차단 기능이 설정되어있습니다\n\n차단 기능을 해제(팝업허용) 한 후 다시 이용해 주십시오.");
                                if (win) {
                                    win.close();
                                }
                                return;
                            }
                        }
                    }
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.check.oneselfCallback
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 본인인증 결과
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 5. 13.
                 * </pre>
                 *
                 * @param data
                 * @returns data = {isSuccess : boolean, resultCode : String, resultMessage : String}
                 */
                oneselfCallback : function (data) {
                    data = {
                        retInfo : data,
                        reqNum : $.oneselfReqNum
                    };
                    $.postSyncJsonAjax($.action.common.oneself.result.ajax(), data, function (data) {
                        $.oneselfCallback.call(this, data);
                    });
                }
            },
            sign : {
                interval : null,
                /**
                 * <pre>
                 * 1. FuntionName : common.sign.request
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 전자서명 요청
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 5. 13.
                 * </pre>
                 *
                 * @param callback
                 * @param name
                 * @param phoneNumber
                 * @param birthday
                 */
                request : function (callback, name, phoneNumber, birthday) {
                    $.common.sign.clearInterval();
                    var params = {};
                    if (!$.resources.isUserLogin) {
                        params = {
                            NAME : name,
                            PHONE_NO : phoneNumber,
                            BIRTHDAY : birthday
                        };
                    }
                    $.postSyncJsonAjax($.action.common.signature.request.ajax(), params, function (data) {
                        var result = data.result;
                        if (result.isSuccess) {
                            $.common.sign.interval = setInterval(function () {
                                $.common.sign.status(callback);
                            }, 1000);
                        } else {
                            alert(result.resultMessage + "\n errorCode : [" + result.resultCode + "]");
                            $.common.sign.clearInterval();
                        }
                    });
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.sign.status
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 전자서명 상태 조회
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 5. 13.
                 * </pre>
                 * @param callback
                 */
                status : function (callback) {
                    $.postSyncJsonAjax($.action.common.signature.status.ajax(), null, function (data) {
                        var result = data.result;
                        if (result.isSuccess) {
                            $.common.sign.clearInterval();
                            callback.call(this);
                        } else {
                            var resultCode = result.resultCode;
                            if (resultCode != "PREPARE") {
                                alert(result.resultMessage + "\n errorCode : [" + resultCode + "]");
                                $.common.sign.clearInterval();
                            }
                        }
                    });
                },
                /**
                 * <pre>
                 * 1. FuntionName : common.sign.clearInterval
                 * 2. ClassName  : jquery.common.js
                 * 3. Comment    : 전자서명 상태 조회 Interval Clear
                 * 4. 작성자       : upleat
                 * 5. 작성일       : 2020. 5. 13.
                 * </pre>
                 * @param callback
                 */
                clearInterval : function () {
                    if ($.common.sign.interval != null) {
                        clearInterval($.common.sign.interval);
                    }
                }
            }
        },
        /**
         * <pre>
         * 1. FuntionName : requestPage
         * 2. ClassName  : jquery.common.js
         * 3. Comment    : 페이지 이동 함수
         * 4. 작성자       : upleat
         * 5. 작성일       : 2020. 3. 23.
         * </pre>
         *
         * @param url
         * @param params
         * @param method
         * @returns
         */
        requestPage : function (url, params, method) {
            method = typeof(method) == "undefined" ? "GET" : method;
            TagUtil.createDynamicForm("dynamicFileDownloadForm", url, method).appendTo("body");
            
            var $dynamicFileDownloadForm = $("#dynamicFileDownloadForm");
            if (typeof(params) != "undefined") {
                var param = new Array();
                $.each(params, function (key, value) {
                    if (Array.isArray(value)) {
                        $.each(value, function () {
                            param.push(TagUtil.createDynamicInput("hidden", key, this));
                        });
                    } else {
                        param.push(TagUtil.createDynamicInput("hidden", key, value));
                    }
                });
                $dynamicFileDownloadForm.append(param);
            }
            $dynamicFileDownloadForm.submit();
            $dynamicFileDownloadForm.remove();
        },
        /**
         * <pre>
         * 1. FuntionName : requestCategory
         * 2. ClassName  : jquery.common.js
         * 3. Comment    : 카테고리 호출
         * 4. 작성자       : upleat
         * 5. 작성일       : 2020. 3. 23.
         * </pre>
         *
         * @param callback
         */
        requestCategory : function (callback) {
            if ($.resources.isApp) {
                if ($.resources.isAndroid) {
                    bucketmarketApp.openGnb();
                } else if ($.resources.isIos) {
                    window.webkit.messageHandlers.openGnb.postMessage("");
                }
            } else {
                $.postSyncJsonAjax($.action.display.category.product.list.ajax(), null, function (data) {
                    var $categoryArea = $(".category-area");
                    var list = data.list;
                    if ($.resources.isPc) {
                        $categoryArea.empty();
                        $.each(list, function (i, row) {
                            if (row.PRD_CTG_LEVEL == 0) {
                                $categoryArea.append(TagUtil.createDynamicCategory(row.PRD_CTG_IDX, row.PRD_CTG_NM, row.PRD_CTG_LEVEL));
                            } else {
                                $categoryArea.find("[category-key='" + row.PRD_CTG_UP_IDX + "']")
                                    .append(TagUtil.createDynamicCategory(row.PRD_CTG_IDX, row.PRD_CTG_NM, row.PRD_CTG_LEVEL));
                            }
                        });
                        callback.call(this);
                    } else {
                        var category = new Array();
                        $.each(list, function (i, row) {
                            category.push(TagUtil.createDynamicCategory(row.PRD_CTG_IDX, row.PRD_CTG_NM));
                        });
                        $categoryArea.empty().append(category);
                        callback.call(this);
                    }
                });
            }
        },
        /**
         * <pre>
         * 1. FuntionName : requestLink
         * 2. ClassName  : jquery.common.js
         * 3. Comment    : 링크 요청
         * 4. 작성자       : upleat
         * 5. 작성일       : 2020. 3. 23.
         * </pre>
         *
         * @param url
         * @param target
         */
        requestLink : function (url, target) {
            /********************************************************
             *                      OUTLINK 처리
             ********************************************************/
            if (url.indexOf($.resources.domain.front) == -1 && url.indexOf($.resources.domain.mobile) == -1) { 
                if ($.resources.isApp) { // APP 일 경우 OUTLINK
                    var params = {"outlink_url" : url};
                    if ($.resources.isAndroid) {
                        bucketmarketApp.openOutLinkFromJS(JSON.stringify(params));
                    } else if ($.resources.isIos) {
                        window.webkit.messageHandlers.openOutLinkFromJS.postMessage(JSON.stringify(params));
                    }
                } else { // WEB 일경우 
                    if ($.resources.linkTarget.href == target) {
                        document.location.href = url;
                    } else if ($.resources.linkTarget.window == target) {
                        window.open(url, "_blank");
                    } else {
                        return;
                    }
                }
            } else {
            /********************************************************
             *        크로스 도메인 문제로인해 디바이스에 맞게 도메인 치환 처리
             ********************************************************/
                url = url.replace($.resources.domain.front, "").replace($.resources.domain.mobile, "");
                if ($.resources.isPc) {
                    url = $.resources.domain.front + url;
                } else {
                    url = $.resources.domain.mobile + url;
                }
                if ($.resources.linkTarget.href == target) {
                    document.location.href = url;
                } else if ($.resources.linkTarget.window == target) {
                    window.open(url, "linkPopup");
                } else {
                    return;
                }
            }
        },
        /**
         * <pre>
         * 1. FuntionName : outlink
         * 2. ClassName  : jquery.common.js
         * 3. Comment    : 아웃 링크 요청
         * 4. 작성자       : upleat
         * 5. 작성일       : 2020. 3. 23.
         * </pre>
         *
         * @param url
         * @param target
         */
        outlink : function (url) {
            /********************************************************
             *                      OUTLINK 처리
             ********************************************************/
            if ($.resources.isApp) { // APP 일 경우 OUTLINK
                var params = {"outlink_url" : url};
                if ($.resources.isAndroid) {
                    bucketmarketApp.openOutLinkFromJS(JSON.stringify(params));
                } else if ($.resources.isIos) {
                    window.webkit.messageHandlers.openOutLinkFromJS.postMessage(JSON.stringify(params));
                }
            } else { // WEB 일경우 
                if ($.resources.linkTarget.href == target) {
                    document.location.href = url;
                } else if ($.resources.linkTarget.window == target) {
                    window.open(url, "linkPopup");
                } else {
                    return;
                }
            }
        },
        /**
         * <pre>
         * 1. FuntionName : checkBoxSelect
         * 2. ClassName  : jquery.common.js
         * 3. Comment    : checkbox 전체 선택/해제
         * 4. 작성자       : upleat
         * 5. 작성일       : 2020. 3. 23.
         * </pre>
         *
         * @param allSelect 전체선택 클래스
         * @param select 선택 클래스
         * @returns
         */
        checkBoxSelect : function(allSelect, select) {
            // 전체선택 이벤트 호출
            $(document).on("click", "." + allSelect, function() {
                checkBoxAllSelect(allSelect, select);
            });

            // 개별선택 이벤트 호출
            $(document).on("click", "." + select, function() {
                checkBoxUnitSelect(allSelect, select);
            });

            // 로딩
            if ($("." + allSelect).is(":checked")) {
                checkBoxAllSelect(allSelect, select);
            } else {
                checkBoxUnitSelect(allSelect, select);
            }
            
            function checkBoxAllSelect(allSelect, select) {
                var totalCount = $("." + select).length;
                if (totalCount <= 0) {
                    $("." + allSelect).prop("checked", false);
                    return;
                }
                if ($("." + allSelect).is(":checked")) {
                    $("." + select).prop("checked", true);
                } else {
                    $("." + select).prop("checked", false);
                }
            }
            function checkBoxUnitSelect(allSelect, select) {
                var checkdLength = $("." + select + ":checked").length;
                var totalCount = $("." + select).length;
                // 선택된 checkbox 확인
                if (checkdLength > 0 && checkdLength == totalCount) {
                    $("." + allSelect).prop("checked", true);
                } else {
                    $("." + allSelect).prop("checked", false);
                }
            }
        }
    });
    // pickadate
    if ($.fn.pickadate) {
        $.extend($.fn.pickadate.defaults, {
            monthsFull: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            weekdaysShort: ['월', '화', '수', '목', '금', '토', '일'],
            today: '오늘',
            clear: '삭제',
            close: '닫기',
            format: 'yyyy-mm-dd'
        });
    }
    // 비밀번호
    $.validator.addMethod("passwordCk", function(value, element) {
        var num = /[0-9]/;
        var eng = /[a-zA-Z]/;
        var etc = /[!@#$%^&+=]/;
        var check1 = ((value.match(num || "") || []).length > 0 ? 1 : 0) 
                   + ((value.match(eng || "") || []).length > 0 ? 1 : 0)
                   + ((value.match(etc || "") || []).length > 0 ? 1 : 0);
        return this.optional(element) || check1 >= 2;
    });
    $.extend($.validator.messages, {
        passwordCk : "(은)는 영문, 숫자, 특수문자를 포함하여 입력해 주세요."
    });
})(jQuery);