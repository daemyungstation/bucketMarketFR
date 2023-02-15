<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/customer.css">
</head>
<body class="">
    <c:set var="group" value="고객센터"/>
    <c:set var="page" value="1:1문의하기"/>
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
        <jsp:param name="oneDepth" value="${group }"/>
        <jsp:param name="oneDepthKey" value="board.notice.list"/>
        <jsp:param name="twoDepth" value="${page }"/>
        <jsp:param name="twoDepthKey" value="board.inquiry.form"/>
    </jsp:include>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-inner">
    
            
            <div class="wrap">
                <jsp:include page="/WEB-INF/jsp/pc/include/aside.jsp" flush="false">
                    <jsp:param name="asideTitle" value="${group }"/>
                    <jsp:param name="asideGroup" value="board"/>
                </jsp:include>
                <div class="contain-body">
                    <div class="content-header">
                        <h3 class="title"><c:out value="${page }"/></h3>
                    </div>
                    <div class="box-guide">
                        <p class="guide01"><span>궁금하신 사항은 1:1문의로 질문해 보세요.</span></p>
                    </div>
                    <div class="sub-tab-head type2">
                        <span class="inquiry-tab on"><button class="tab-button" data-type="form">1:1 문의하기</button></span>
                        <span><button class="tab-button" data-type="login">나의 문의내역</button></span>
                    </div>
                    <div class="box-tab-body tab1 on"></div>
                    <div class="box-tab-body tab2">
                    </div>
                    
                </div>
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
    <script id="inquiryFormTemplate" type="text/x-jquery-tmpl">
        <form name="inquiryForm" id="inquiryForm" onsubmit="return false">
            <div class="box-inquiry-form">
                <div class="box-inquiry type2">
                    <p class="text-notice-type2 form">* 필수입력사항</p>
                    <p class="box-inquiry-title">기본정보 입력</p>
                    <dl class="box-form">
                        <dt class="necessary">이름</dt>
                        <dd>
                            <span class="form-w300">
                                <input type="text" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" placeholder="홍길동" maxlength="17"/>
                                <label class="form-alert" message-target="MEM_MST_MEM_NM" data-name="이름"></label>
                            </span>
                        </dd>
                    </dl>
                    <dl class="box-form">
                        <dt class="necessary">연락처</dt>
                       <dd>
                            <span class="form-w300">
                                <input type="text" name="MEM_ADV_HP" id="MEM_ADV_HP" placeholder="'-' 없이 입력해주세요" maxlength="11">
                                <label class="form-alert" message-target="MEM_ADV_HP" data-name="답변 받을 연락처"></label>
                            </span>
                        </dd>
                    </dl>
                    <dl class="box-form">
                        <dt class="necessary">비밀번호</dt>
                        <dd>
                            <span class="form-w300">
                                <input type="password" name="MEM_ADV_PW" id="MEM_ADV_PW" placeholder="비밀번호를 입력해주세요">
                                <label class="form-alert" message-target="MEM_ADV_PW" data-name="비밀번호"></label>
                            </span>
                        </dd>
                    </dl>
                </div>
                <div class="box-inquiry type2">
                    <p class="box-inquiry-title">상세항목 입력</p>
                    <dl class="box-form">
                        <dt class="necessary">문의유형</dt>
                        <dd class="form-w800">
                            <span class="form-radio-type">
                                <c:forEach var="row" items="${codeList }" varStatus="stat">
                                    <label class="form-radio <c:if test="${stat.first}">checked</c:if>">
                                        <input type="radio" name="MEM_ADV_QST_TYPE" value="<c:out value="${row.CMN_COM_IDX }"/>"<c:if test="${stat.first}">checked="checked"</c:if>/>
                                        <c:out value="${row.CMN_COM_NM }"/>
                                    </label>
                                </c:forEach>
                            </span>
                            <label class="form-alert" message-target="MEM_ADV_QST_TYPE" data-name="문의유형"></label>
                        </dd>
                    </dl>
                    <dl class="box-form addi">
                        <dt class="necessary">제목</dt>
                        <dd>
                            <input type="text" name="MEM_ADV_TITLE" id="MEM_ADV_TITLE" maxlength="70" onkeyup="StringUtil.getStrLength(this, '.title-byte', 200);">
                            <i><span class="title-byte">0</span>/200</i>
                            <label class="form-alert" message-target="MEM_ADV_TITLE" data-name="제목"></label>
                        </dd>
                    </dl>
                    <dl class="box-form">
                        <dt class="necessary">내용</dt>
                        <dd>
                            <span class="form-textarea">
                                <textarea name="MEM_ADV_CONTENTS" id="MEM_ADV_CONTENTS" maxlength="500" onkeyup="StringUtil.getStrLength(this, '.byte', 500);"></textarea>
                                <i><span class="byte">0</span>/500</i>
                            </span>
                            <label class="form-alert" message-target="MEM_ADV_CONTENTS" data-name="내용"></label>
                        </dd>
                    </dl>
                </div>
                <div class="box-inquiry type2">
                    <p class="box-inquiry-title necessary">개인정보 수집 및 활용 동의</p>
                    <span class="form-provision">
                        <c:out value="${termInfo.AGR_MST_CONTENTS }" escapeXml="false"/>
                    </span>
                    <label class="form-checkbox"><input type="checkbox" name="MEM_ADV_PSN_YN" id="MEM_ADV_PSN_YN" value="Y" >개인정보 수집 및 활용에 동의합니다.</label>
                    <label class="form-alert alert-right" message-target="MEM_ADV_PSN_YN" data-name="개인정보 수집 및 활용에 동의"></label>
                </div>
            </div>  
            <div class="box-btn center">
                <span class="btn-type-text1 save disabled">
                    <button>저장</button>
                </span>
            </div>
        </form>
    </script>
    <script id="inquiryBasicProductFormTemplate" type="text/x-jquery-tmpl">
        <dl class="box-form basic-product-box">
            <dt class="necessary">문의 상품</dt>
            <dd>
                <span class="form-addbutton">
                    <input type="hidden" name="PRD_MST_NO" id="PRD_MST_NO" value=""/>
                    <input type="text" name="PRD_MST_NM" id="PRD_MST_NM" readonly="readonly" placeholder="ex)냉장고, TV">
                    <span class="btn-type-text1"><button class="product-search" onclick="return false;">검색</button></span>
                </span>
                <label class="form-alert" message-target="PRD_MST_NM" data-name="문의 상품"></label>
            </dd>
        </dl>
    </script>
    <script id="inquiryCompleteTemplate" type="text/x-jquery-tmpl">
        <div class="box-inquiry-complete">
            <p class="text-information-type1 notice2">감사합니다<br ><strong class="text-point1">1:1 문의 접수</strong>가 완료 되었습니다. </p>
            <p class="text-information-type2">접수하신 문의는 고객센터 > 나의 문의내역에서<br />확인 하실 수 있습니다.</p>
        </div>
    </script>
    <script id="inquiryLoginFormTemplate" type="text/x-jquery-tmpl">
        <div class="box-inquiry">
            <form name="loginForm" id="loginForm" onsubmit="return false">
                <div class="box-password">
                    <div class="inquiry-password">
                        <p class="text-title">문의내역을 확인하기 위한 정보를 입력해 주세요</p>
                        <dl class="box-form">
                            <dt>이름</dt>
                            <dd>
                                <input type="text" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" placeholder="홍길동" maxlength="17"/>
                                <label class="form-alert" message-target="MEM_MST_MEM_NM" data-name="이름"></label>
                            </dd>
                        </dl>
                        <dl class="box-form">
                            <dt>비밀번호</dt>
                            <dd>
                                <input type="password" name="MEM_ADV_PW" id="MEM_ADV_PW" placeholder="비밀번호를 입력해주세요">
                                <label class="form-alert" message-target="MEM_ADV_PW" data-name="비밀번호"></label>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="box-btn center">
                    <span class="btn-type-text1 login disabled">
                        <button>확인</button>
                    </span>
                </div>
            </form>
        </div>
    </script>
    <script id="inquiryListTemplate" type="text/x-jquery-tmpl">
        {{if list.length == 0}}
            <div class="box-faq-empty"><p class="search_empty">문의하신 내역이 없습니다.</p></div>
        {{else}}
            <div class="box-faq ui-accordion">
                {{each(i, row) list}}
                    <dl>
                        <dt>
                            <div class="box-myfaq-question">
                                {{if row.MEM_ADV_RPL_YN == "N"}}
                                    <span class="state faq-stand">대기</span>
                                {{else}}
                                    <span class="state faq-end">완료</span>
                                {{/if}}
                                <span class="subject">\${row.MEM_ADV_TITLE}</span>
                                <span class="date">\${StringUtil.formatDate(row.MEM_ADV_REG_DT, "yyyy.MM.dd")}</span>
                            </div>
                        </dt>
                        <dd>
                            <div class="box-myfaq-answer">
                                <span class="q"><span>\${row.MEM_ADV_TITLE}</span></span>
                                <span class="faq-con">{{html StringUtil.replaceEnterToBr(row.MEM_ADV_CONTENTS)}}</span>
                                {{if row.MEM_ADV_RPL_YN == "Y"}}
                                    <span class="a"><span>\${row.MEM_ADV_TITLE}</span></span>
                                    <span class="faq-con type2">{{html row.MEM_ADV_RPL_CONTENTS}}</span>
                                {{/if}}
                            </div>
                        </dd>
                    </dl>
                {{/each}}
            </div>
            <div class="paginate">
            </div>
        {{/if}}
    </script>
    <script>
        $(function () {
            var $areaBody = $(".area-body"),
                $firstTab = $areaBody.find(".tab1"),
                $secondTab = $areaBody.find(".tab2");
            var $inquiryFormTemplate = $("#inquiryFormTemplate"),
            $inquiryBasicProductFormTemplate = $("#inquiryBasicProductFormTemplate"),
                $inquiryCompleteTemplate = $("#inquiryCompleteTemplate"),
                $inquiryLoginFormTemplate = $("#inquiryLoginFormTemplate"),
                $inquiryListTemplate = $("#inquiryListTemplate");
            <%-- 탭 클릭 이벤트 --%>
            $areaBody.off("click", ".tab-button").on("click", ".tab-button", function () {
                var type = $(this).data("type");
                if (type == "form") {
                    appendFirstTab(type);
                } else if (type == "login" || type == "list") {
                    apppendSecondTab(type);
                }
                fixedButtonHandler(type);
            });
            <%-- 문의유형 셀렉트박스 변경 이벤트 --%>
            $firstTab.off("change", "input[name='MEM_ADV_QST_TYPE']").on("click", "input[name='MEM_ADV_QST_TYPE']", function () {
                var $this = $(this),
                    $boxForm = $this.closest(".box-form")
                if ($this.val() == "<c:out value="${Code.QUESTION_TYPE_PRODUCT_CODE }"/>") {
                    $boxForm.after($inquiryBasicProductFormTemplate.tmpl());
                } else {
                    $boxForm.siblings(".basic-product-box").remove();
                }
            });
            <%-- 상품검색 버튼 클릭 이벤트 --%>
            $firstTab.off("click", ".product-search").on("click", ".product-search", function () {
                $.common.layer.productSearch(null, function (data) {
                    var $inquiryForm = $firstTab.find("#inquiryForm");
                    $inquiryForm.find("#PRD_MST_NO").val(data.PRD_MST_NO);
                    $inquiryForm.find("#PRD_MST_NM").val(data.PRD_MST_NM);
                });
            });
            <%-- 하단 고정 버튼 핸들러 --%>
            function fixedButtonHandler (type) {
                var $firstFixedBoxButton = $firstTab.find(".fixed-box-button"),
                    $secondFixedBoxButton = $secondTab.find(".fixed-box-button");
                $firstFixedBoxButton.hide();
                $secondFixedBoxButton.hide();
                if (type == "form") {
                    $firstFixedBoxButton.show();
                } else if (type == "login") {
                    $secondFixedBoxButton.show();
                }
            }
            <%-- 1:1 문의 등록 --%>
            function save (form) {
                if (confirm("저장 하시겠습니까?")) {
                    var $form = $(form);
                    $form.find("#MEM_ADV_PW").val(hex_sha512($form.find("#MEM_ADV_PW").val()).toString());
                    $.postSyncJsonAjax($.action.board.inquiry.regist.ajax(), $form.serializeObject(), function (data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다.");
                            appendFirstTab("complete");
                        }
                    });
                }
            }
            <%-- 1:1 문의 로그인 --%>
            function login(form) {
                var $loginForm = $(form);
                var params = {
                    searchMemMstMemNm : $loginForm.find("#MEM_MST_MEM_NM").val(),
                    searchMemAdvPw : hex_sha512($loginForm.find("#MEM_ADV_PW").val()).toString()
                };
                $.postSyncJsonAjax($.action.board.inquiry.login.ajax(), params, function (data) {
                    apppendSecondTab("list", params);
                });
            }
            <%-- 1:1 문의 탭 내용 --%>
            function appendFirstTab (type) {
                $firstTab.empty();
                if (type == "form") {
                    $inquiryFormTemplate.tmpl().appendTo($firstTab);
                    radioBtn_Ck();
                    checkBox_Ck();
                    var $inquiryForm = $firstTab.find("#inquiryForm"); 
                    <%-- 폼 유효성 체크 --%>
                    $inquiryForm.validate({
                        rules : {
                            MEM_MST_MEM_NM : {
                                required : true
                            },
                            MEM_ADV_HP : {
                                required : true,
                                number : true,
                                maxlength : 11
                            },
                            MEM_ADV_PW : {
                                required : true,
                                rangelength : [6, 10]
                            },
                            MEM_ADV_QST_TYPE : {
                                required : true
                            },
                            PRD_MST_NM : {
                                required : true
                            },
                            MEM_ADV_TITLE : {
                                required : true
                            },
                            MEM_ADV_CONTENTS : {
                                required : true
                            },
                            MEM_ADV_PSN_YN : {
                                required : true
                            }
                        },
                        submitHandler : save
                    });
                } else if (type == "complete") {
                    $inquiryCompleteTemplate.tmpl().appendTo($firstTab);
                    fixedButtonHandler(type);
                }
            }
            <%-- 나의 1:1 문의 탭 내용 --%>
            function apppendSecondTab (type, params) {
                $secondTab.empty();
                if (type == "login") {
                    $inquiryLoginFormTemplate.tmpl().appendTo($secondTab);
                    var $loginForm = $secondTab.find("#loginForm");
                    <%-- 폼 유효성 체크 --%>
                    $loginForm.validate({
                        rules : {
                            MEM_MST_MEM_NM : {
                                required : true
                            },
                            MEM_ADV_PW : {
                                required : true
                            }
                        },
                        submitHandler : login
                    });
                } else if (type == "list") {
                    $.params = params;
                    requestInquiryList(1);
                }
            }
            <%-- 나의 문의내역 호출 --%>
            requestInquiryList = function (cPage) {
                var params = $.params;
                params.cPage = cPage;
                $.postSyncJsonAjax($.action.board.inquiry.list.ajax(), params, function (data) {
                    $secondTab.empty();
                    $inquiryListTemplate.tmpl(data).appendTo($secondTab);
                    fixedButtonHandler("list");
                    $secondTab.find("dt").off("click").on("click", function() {
                        AccordionUI($(this))
                    });
                    $secondTab.find(".paginate").paging(data.paging, requestInquiryList);
                });
            };
            appendFirstTab("form");
        });
    </script>
</body>
</html>