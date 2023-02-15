<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<spring:eval var="fileAllows" expression="@file['file.allowed.extensions.image']" />
<spring:eval var="fileMaxSize" expression="@file['file.max.byte.size.image']" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta property="og:site_name" key="site_name" content="<spring:eval expression="@resource['project.title']"/>" class="meta-sns-share">
    <meta property="og:url" key="url" content="<spring:eval expression="@resource['front.ssl.domain']"/><c:out value="${requestURI }"/><c:out value="${paramsQueryString }"/>" class="meta-sns-share"/>
    <meta property="og:type" key="type" content="article"  class="meta-sns-share"/>
    <meta property="og:title" key="title" content="<c:out value="${info.EVT_MST_TITLE}"/>" class="meta-sns-share"/>
    <meta property="og:description" key="description" content="<spring:eval expression="@resource['project.title']"/> 이벤트"  class="meta-sns-share"/>
    <meta property="og:image" key="image" content="<spring:eval expression="@resource['front.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${info.CMM_FLE_WEB_PC_PATH}"/>" class="meta-sns-share"/>
    <meta property="og:image:width" key="image_width" content="750" class="meta-sns-share"/>
    <meta property="og:image:height" key="image_height" content="750" class="meta-sns-share"/>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/promotion.css">
</head>
<body class="">
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
        <jsp:param name="oneDepth" value="이벤트"/>
        <jsp:param name="oneDepthKey" value="marketing.event.list"/>
    </jsp:include>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-inner">
            <div class="contain-event-box">
                <h3 class="title">이벤트</h3>
                <div class="box-detail-product1">
                    <c:if test="${not empty eventList }">
                        <div class="box-event-select">
                            <span class="form-select">
                                <select class="select-other-event">
                                    <option value="" selected="selected">이벤트 더보기</option>
                                    <c:forEach var="row" items="${eventList }">
                                        <option value="<c:out value="${row.EVT_MST_IDX }"/>" selected="selected"><c:out value="${row.EVT_MST_TITLE }"/></option>
                                    </c:forEach>
                                </select>
                            </span>
                        </div>
                    </c:if>
                    <%@include file="/WEB-INF/jsp/pc/include/sns.jsp" %>
                </div>
                <div class="box-detail-product2">
                    <c:if test="${not empty info.EVT_MST_PC_MDA and info.EVT_MST_PC_MDA ne '<p>&nbsp;</p>' }">
                        <div class="video">
                            <c:out value="${info.EVT_MST_PC_MDA }" escapeXml="false"/>
                        </div>
                    </c:if>
                    <div class="content">
                        <c:out value="${info.EVT_MST_PC_DTL }" escapeXml="false"/>
                    </div>
                </div>
                <c:if test="${info.EVT_MST_RPL_YN eq 'Y' }">
                    <div class="box-detail-product5">
                        <form name="replyRegistForm" id="replyRegistForm" onsubmit="return false">
                            <div class="form-comment">
                                <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${info.EVT_MST_IDX }"/>"/>
                                <input type="hidden" name="EVT_MST_PSN_YN" value="<c:out value="${info.EVT_MST_PSN_YN }"/>"/>
                                <span class="form-textarea">
                                    <textarea name="EVT_RPL_CTS" id="EVT_RPL_CTS" onkeyup="StringUtil.getStrLength(this, '.byte', 600);" maxlength="600" placeholder="이벤트과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 게시글이 삭제 조치 될 수 있습니다."></textarea>
                                    <i><span class="byte">0</span>/600</i>
                                    <label class="form-alert" message-target="EVT_RPL_CTS" data-name="내용"></label>
                                </span>
                                <span class="btn-type-text1 disabled"><button>댓글 작성하기</button></span>
                                <div class="box-form">
                                    <span>
                                        <input type="text" name="EVT_RPL_NM" id="EVT_RPL_NM" placeholder="(필수) 이름" maxlength="10"/>
                                        <label class="form-alert" message-target="EVT_RPL_NM" data-name="이름"></label>
                                    </span>
                                    <span>
                                        <input type="password" name="EVT_RPL_PW" id="EVT_RPL_PW" placeholder="(필수) 비밀번호" maxlength=""/>
                                        <label class="form-alert" message-target="EVT_RPL_PW" data-name="비밀번호"></label>
                                    </span>
                                </div>
                                <c:if test="${info.EVT_MST_IMG_YN eq 'Y'}">
                                    <div class="box-addphoto">
                                        <span class="btn-addphoto">
                                            <input type="file" name="FILE" style="display:none;"/>
                                            <button class="file-add" onclick="return false;">이미지 등록</button>
                                        </span>
                                        <div class="box-photo">
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <c:if test="${info.EVT_MST_PSN_YN eq 'Y' }">
                                <div class="box-agreement">
                                    <dl class="box-form">
                                        <dt class="necessary"><span class="text-point1">(필수)</span> 개인정보 수집 및 활용 동의</dt>
                                        <dd>
                                            <div class="agreement-inner">
                                                <div class="box-inner">
                                                    <c:out value="${personalInfomationUseTermInfo.AGR_MST_CONTENTS }" escapeXml="false"/>
                                                </div>
                                            </div>
                                            <div class="agreement-checkbox">
                                                <label class="form-checkbox type2"><input type="checkbox" name="EVT_RPL_PSN_YN" value="Y">개인정보 수집 및 활용에 동의합니다.</label>
                                                <label class="form-alert" message-target="EVT_RPL_PSN_YN" data-name="개인정보 수집 및 활용에 동의"></label>
                                                <span class="form-w350">
                                                    <input type="text" name="EVT_RPL_HP" id="EVT_RPL_HP" class="number" placeholder="'-' 없이 입력해주세요" maxlength="11">
                                                    <label class="form-alert" message-target="EVT_RPL_HP" data-name="연락처"></label>
                                                </span>
                                            </div>
                                        </dd>
                                    </dl>
                                    <dl class="box-form">
                                        <dt>(선택) 마케팅 활용 동의</dt>
                                        <dd>
                                            <div class="agreement-inner">
                                                <div class="box-inner">
                                                    <c:out value="${marketingTermInfo.AGR_MST_CONTENTS }" escapeXml="false"/>
                                                </div>
                                            </div>
                                            <div class="agreement-checkbox">
                                                <label class="form-checkbox type2"><input type="checkbox" name="EVT_RPL_MKT_YN" value="Y">마케팅 활용에 동의합니다.</label>
                                            </div>
                                        </dd>
                                    </dl>
                                </div>
                            </c:if>
                        </form>
                        <p class="count">댓글 <strong class="text-point2 list-total-count"></strong>개</p>
                        <div class="box-commentlist list-area">
                        </div>
                        <div class="paginate">
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <%-- //Body --%>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/paging.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
    <script id="eventReplyImageTemplate" type="text/x-jquery-tmpl">
        \${CMM_FLE_ORG_NM}
        <span class="btn-delete-photo" {{if CMM_FLE_IDX}}data-key="\${CMM_FLE_IDX}"{{/if}}><button>삭제</button></span>
    </script>
    <script id="eventReplyListTemplate" type="text/x-jquery-tmpl">
        {{if StringUtil.getInt(totalCount) == 0}}
            <p class="text-information-type2">등록된 댓글이 없습니다.</p>
        {{else}}
            <div class="contain-qna">
                {{each(i, row) list}}
                    <div class="box-comment">
                        <span class="name">\${row.EVT_RPL_NM}</span>
                        <span class="date">\${StringUtil.formatDate(row.EVT_RPL_REG_DT, "yyyy.MM.dd")}</span>
                        <span class="content">
                            {{html StringUtil.replaceEnterToBr(row.EVT_RPL_CTS)}}
                            {{if row.CMM_FLE_WEB_PATH}}
                                <br/>
                                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/>\${row.CMM_FLE_WEB_PATH}"/>
                            {{/if}}
                        </span>
                        <div class="box-comment-more">
                            <button class="btn-comment">더보기</button>
                            <div class="box-comment-inner">
                                <span><button class="reply-edit" data-key="\${row.EVT_RPL_IDX}">수정</button></span>
                                <span><button class="reply-remove" data-key="\${row.EVT_RPL_IDX}">삭제</button></span>
                            </div>
                        </div>
                    </div>
                {{/each}}
            </div>
        {{/if}}
    </script>
    <script id="eventReplyEditTemplate" type="text/x-jquery-tmpl">
        <div class="form-comment">
            <form name="replyModifyForm" id="replyModifyForm">
                <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${info.EVT_MST_IDX }"/>"/>
                <input type="hidden" name="EVT_RPL_IDX" value="\${info.EVT_RPL_IDX}"/>
                <span class="form-textarea">
                    <textarea name="EVT_RPL_CTS" id="EVT_RPL_CTS" onkeyup="StringUtil.getStrLength(this, '.byte', 600);" maxlength="600" placeholder="이벤트과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 게시글이 삭제 조치 될 수 있습니다.">\${info.EVT_RPL_CTS}</textarea>
                    <i><span class="byte">\${info.EVT_RPL_CTS.length}</span>/600</i>
                    <label class="form-alert" message-target="EVT_RPL_CTS" data-name="내용"></label>
                </span>
                <span class="btn-type-text1"><button>저장</button></span>
                <span class="btn-type-text3"><button class="reply-cancel" onclick="return false">취소</button></span>
                <div class="box-form">
                    <span>
                        <input type="text" name="EVT_RPL_NM" id="EVT_RPL_NM" value="\${info.EVT_RPL_NM}" placeholder="(필수) 이름" maxlength="10"/>
                        <label class="form-alert" message-target="EVT_RPL_NM" data-name="이름"></label>
                    </span>
                    <span>
                        <input type="password" name="EVT_RPL_PW" id="EVT_RPL_PW" value="" placeholder="(필수) 비밀번호" maxlength=""/>
                        <label class="form-alert" message-target="EVT_RPL_PW" data-name="비밀번호"></label>
                    </span>
                </div>
                <div class="box-addphoto">
                    <span class="btn-addphoto">
                        <input type="file" name="FILE" style="display:none;"/>
                        <button class="file-add" onclick="return false;">이미지 등록</button>
                    </span>
                    <div class="box-photo">
                        {{if fileList}}
                            {{each(i, row) fileList}}
                                {{tmpl(row) "#eventReplyImageTemplate"}}
                            {{/each}}
                        {{/if}}
                    </div>
                </div>
            </form>
        </div> 
    </script>
    <script>
        $(function () {
            var defaultParm = {EVT_MST_IDX : "<c:out value="${info.EVT_MST_IDX }"/>"};
            var $areaBody = $(".area-body"),
                $layerPopup = $(".layer-popup2"),
                $totalCount = $areaBody.find(".list-total-count"),
                $listArea = $areaBody.find(".list-area"),
                $paginate = $areaBody.find(".paginate"),
                $replyRegistForm = $areaBody.find("#replyRegistForm");
                $eventReplyListTemplate = $("#eventReplyListTemplate"),
                $eventReplyEditTemplate = $("#eventReplyEditTemplate"),
                $eventReplyImageTemplate = $("#eventReplyImageTemplate");
            <%-- 이벤트 더보기 셀렉트 박스 변경 이벤트 --%>
            $areaBody.on("change", ".select-other-event", function () {
                var value = $(this).val();
                if (value != "") {
                    var params = {EVT_MST_IDX : value};
                    $.requestPage($.action.marketing.event.view(), params);
                }
            });
            <%-- 이미지 등록 버튼  클릭 이벤트 --%>
            $areaBody.off("click", ".file-add").on("click", ".file-add", function (e) {
                e.preventDefault();
                $(this).siblings("input[name='FILE']").trigger("click");
            });
            <%-- 이미지 삭제 버튼  클릭 이벤트 --%>
            $areaBody.off("click", ".btn-delete-photo").on("click", ".btn-delete-photo", function (e) {
                e.preventDefault();
                var $this = $(this);
                var cmmFleDelIdx = $this.data("key");
                if (typeof(cmmFleDelIdx) != "undefined") {
                    var $replyModifyForm = $this.closest("#replyModifyForm");
                    $replyModifyForm.append(TagUtil.createDynamicInput("hidden", "CMM_FLE_DEL_IDXs", cmmFleDelIdx));
                }
                $this.closest(".box-photo").empty();
            });
            <%-- 파일변경 이벤트 --%>
            $areaBody.off("click", "input[name='FILE']").on("change", "input[name='FILE']", function () {
                var $this = $(this),
                    $boxPhoto = $this.closest(".btn-addphoto").siblings(".box-photo");
                var value = $this.val();
                if (value != "") {
                    if (validFileExt(value) && validFileSize(this)) {
                        var fileDir = value.split("\\");
                        var fileName = fileDir[fileDir.length - 1]; 
                        $boxPhoto.empty();
                        $eventReplyImageTemplate.tmpl({CMM_FLE_ORG_NM : fileName}).appendTo($boxPhoto);
                    } else {
                        $this.val("");
                        $boxPhoto.empty();
                    }
                } else {
                    $boxPhoto.empty();
                }
            });
            <%-- 댓글 등록 폼 유효성 체크 및 전송 이벤트 --%>
            $replyRegistForm.validate({
                rules : {
                    EVT_RPL_CTS : {
                        required : true
                    },
                    EVT_RPL_NM : {
                        required : true
                    },
                    EVT_RPL_PW : {
                        required : true,
                        engOrNum : true,
                        rangelength : [6, 10]
                    },
                    EVT_RPL_PSN_YN : {
                        required : true
                    },
                    EVT_RPL_HP : {
                        required : true,
                        number : true
                    }
                },
                submitHandler : function(form) {
                    if (confirm("저장 하시겠습니까?")) {
                        var $form = $(form),
                            $file = $form.find("input[name='FILE']");
                        $form.find("input[name='EVT_RPL_PW']").val(hex_sha512($form.find("input[name='EVT_RPL_PW']").val()).toString());
                        var formData = new FormData(),
                            params = $(form).serializeObject();
                        if ($file.length > 0 && $file.val() != "") {
                            formData.append("FILE", $form.find("input[name='FILE']")[0].files[0]);
                        }
                        $.each(params, function (key, value) {
                            formData.append(key, value);
                        });
                        $.postSyncMultipartJsonAjax($.action.marketing.event.reply.regist.ajax(), formData, function (data) {
                            if (data.isSuccess) {
                                alert("저장 되었습니다.");
                                $form.find("input[type='text'], input[type='password'], textarea").val("");
                                var $checkboxForm = $form.find(".form-checkbox");
                                $checkboxForm.removeClass("checked");
                                $checkboxForm.find("input[type='checkbox']").attr("checked", false);
                                StringUtil.getStrLength(form.EVT_RPL_CTS, ".byte", 600);
                                $form.find(".form-alert").removeClass(["ver2", "on"]);
                                requestReplyList(1);
                            }
                        });
                    }
                }
            });
            <%-- 댓글 수정 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".reply-edit", function () {
                var $this = $(this);
                var evtRplIdx = $this.data("key");
                $this.closest(".box-comment-inner").removeClass("active");
                openLoginFormLayer(evtRplIdx, function (prdQnAMemNm, prdQnAMemPw) {
                    var $boxComment = $this.closest(".box-comment");
                    $.postSyncJsonAjax($.action.marketing.event.reply.info.ajax(), $.extend({EVT_RPL_IDX : evtRplIdx}, defaultParm), function (data) {
                        $eventReplyEditTemplate.tmpl(data.info).appendTo($boxComment);
                        var $replyModifyForm = $boxComment.find("#replyModifyForm");
                        <%-- 댓글 수정 폼 유효성 체크 및 전송 이벤트 --%>
                        $replyModifyForm.validate({
                            rules : {
                                EVT_RPL_CTS : {
                                    required : true
                                },
                                EVT_RPL_NM : {
                                    required : true
                                },
                                EVT_RPL_PW : {
                                    required : true,
                                    engOrNum : true,
                                    rangelength : [6, 10]
                                }
                            },
                            submitHandler : function(form) {
                                if (confirm("저장 하시겠습니까?")) {
                                    var $form = $(form),
                                        $file = $form.find("input[name='FILE']");
                                    $form.find("input[name='EVT_RPL_PW']").val(hex_sha512($form.find("input[name='EVT_RPL_PW']").val()).toString());
                                    var formData = new FormData(),
                                        params = $(form).serializeObject();
                                    if ($file.length > 0 && $file.val() != "") {
                                        formData.append("FILE", $form.find("input[name='FILE']")[0].files[0]);
                                    }
                                    $.each(params, function (key, value) {
                                        formData.append(key, value);
                                    });
                                    $.postSyncMultipartJsonAjax($.action.marketing.event.reply.modify.ajax(), formData, function (data) {
                                        if (data.isSuccess) {
                                            alert("저장 되었습니다.");
                                            requestReplyList();
                                        }
                                    });
                                }
                            }
                        });
                        <%-- 댓글 수정 폼 취소버튼 클릭 이벤트 --%>
                        $replyModifyForm.off("click", ".reply-cancel").on("click", ".reply-cancel", function (e) {
                            e.preventDefault();
                            requestReplyList();
                        });
                    });
                });
            });
            <%-- 댓글 삭제 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".reply-remove", function () {
                var $this = $(this);
                var evtRplIdx = $this.data("key");
                $this.closest(".box-comment-inner").removeClass("active");
                openLoginFormLayer(evtRplIdx, function (prdQnAMemNm, prdQnAMemPw) {
                    if (confirm("댓글을 삭제하시겠습니까?")) {
                        $.postSyncJsonAjax($.action.marketing.event.reply.remove.ajax(), $.extend({EVT_RPL_IDX : evtRplIdx}, defaultParm), function (data) {
                            if (data.isSuccess) {
                                alert("댓글이 삭제되었습니다.");
                            } else {
                                alert("댓글 삭제에 실패하였습니다.");
                            }
                            requestReplyList(1);
                        });
                    }
                });
            });
            <%-- 댓글 목록 호출 --%>
            requestReplyList = function (cPage) {
                if (typeof(cPage) == "undefined") {
                    cPage = StringUtil.getInt($paginate.find(".on").text());
                }
                $.postSyncJsonAjax($.action.marketing.event.reply.list.ajax(), $.extend({cPage : cPage}, defaultParm), function (data) {
                    var totalCount = StringUtil.getInt(data.totalCount);
                    $totalCount.text(StringUtil.setComma(totalCount));
                    $listArea.siblings(".text-information-type2").remove();
                    $listArea.empty();
                    if (totalCount > 0) {
                        $eventReplyListTemplate.tmpl(data).appendTo($listArea);
                        commentMore();
                    } else {
                        $listArea.before($eventReplyListTemplate.tmpl(data));
                    }
                    $paginate.paging(data.paging, requestReplyList);
                });
            };
            <%-- 로그인 폼 레이어 열기 --%>
            openLoginFormLayer = function (evtRplIdx, callback) {
                var $loginFormLayer = $(".layer-popup2");
                $loginFormLayer.requestLayer($.action.common.login.form.layer(), {title : "본인 댓글 확인", sessionYn : "N"});
                $.callback = function (prdQnAMemNm, prdQnAMemPw) {
                    var params = $.extend({searchEvtRplIdx : evtRplIdx, searchEvtRplNm : prdQnAMemNm, searchEvtRplPw : prdQnAMemPw}, defaultParm);
                    $.postSyncJsonAjax($.action.marketing.event.reply.login.ajax(), params, function (data) {
                        if (data.isSuccess) {
                            callback(prdQnAMemNm, prdQnAMemPw);
                        } else {
                            alert("이름과 비밀번호가 일치하지 않습니다.");
                        }
                    });
                }
            };
            
            <%-- 첨부파일 확장자 확인 --%>
            function validFileExt(value) {
                var valid = false,
                    extName = value.substring(value.lastIndexOf(".") + 1).toLowerCase(),
                    allows = "<c:out value="${fileAllows }"/>".split("|");
                for (var i = 0; i < allows.length; i++) {
                    if (extName == $.trim(allows[i])) {
                        valid = true;
                        break;
                    }
                }
                if (!valid) {
                    alert("업로드 불가능한 파일 입니다.\n*업로드 가능 파일[" + allows.join(", ") + "]");
                }
                return valid;
            }
            <%-- 첨부파일 용량 확인 --%> 
            function validFileSize(object) {
                var valid = false,
                    sizeinbytes = 0;
                if (window.ActiveXObject) {
                    sizeinbytes = new ActiveXObject("Scripting.FileSystemObject").getFile(object.value).size;
                } else { 
                    sizeinbytes = object.files[0].size;
                }
                var i = 0,
                    fSExt = ["Bytes", "KB", "MB", "GB"],
                    maxSize = StringUtil.getInt("<c:out value="${fileMaxSize}"/>");
                while (maxSize > 900) {
                    maxSize /= 1024;
                    i++;
                }
                if (sizeinbytes > StringUtil.getInt("<c:out value="${fileMaxSize}"/>")) {
                    alert("첨부파일은 " + ((Math.round(maxSize * 100) / 100) + fSExt[i]) + " 이하로 등록가능합니다.");
                } else {
                    valid = true;
                }
                return valid;
            }
            if ($listArea.length > 0) {
                requestReplyList(1);
            }
        });
    </script>
</body>
</html>