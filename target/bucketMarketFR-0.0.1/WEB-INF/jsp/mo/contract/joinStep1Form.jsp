<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/payment.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title"/>
        <jsp:param name="headerTitle" value="전자청약 상품가입 신청"/>
    </jsp:include>
    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <%-- 상품정보 --%>
            <div class="contain-product1">
                <div class="box-detail-product11">
                    <p class="detail1"><c:out value="${info.PRD_MST_NM }"/></p>
                    <p class="detail2">
                        <%-- 즉발(채권) --%>
                        <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y' }">
                            <c:out value="${info.PRD_MST_SPT_TXT }"/>
                        </c:if>
                        <%-- 월지원형/즉발(비채권)/렌탈/할부지원 --%>
                        <c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') }">
                            <fmt:formatNumber value="${info.MON_REL_AMT }" type="number"/> 원 X <fmt:formatNumber value="${info.REL_CNT }" type="number"/>회 지원
                        </c:if>
                    </p>
                    <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">
                        <p class="detail3">
                            <c:forEach begin="1" end="${commandMap.ORD_MST_CNT }" varStatus="stat">
                                <c:forEach var="row" items="${optionList }">
                                    <c:if test="${commandMap.PRD_OPT_IDXs[stat.index - 1] eq row.PRD_OPT_IDX }">
                                        <c:out value="${row.PRD_OPT_DTL }"/><c:out value="${not stat.last ? ', ' : '' }"/>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </p>
                    </c:if>
                </div>
                <div class="box-detail-product12">
                    <p class="detail1"><fmt:formatNumber value="${commandMap.ORD_MST_CNT }" type="number"/>개의 가입구좌</p>
                    <%-- 즉발(채권) --%>
                    <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y' }">
                        <p class="detail2"><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원 X <fmt:formatNumber value="${info.EXPR_NO }" type="number"/>회 납입</p>
                    </c:if>
                    <%-- 월지원형/즉발(비채권)/렌탈/할부지원 --%>
                    <c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') }">
                        <%-- 정기형 --%>
                        <c:if test="${info.PRD_MST_IRG_YN ne 'Y' }">
                            <p class="detail2"><fmt:formatNumber value="${info.MON_PAY_AMT }" type="number"/>원 X <fmt:formatNumber value="${info.EXPR_NO }" type="number"/>회</p>
                        </c:if>
                        <%-- 비정기형 --%>
                        <c:if test="${info.PRD_MST_IRG_YN eq 'Y' }">
                            <c:if test="${not empty info.PRD_MST_PAY_AMT1 and not empty info.PRD_MST_PAY_CNT1 }">
                                <p class="detail2"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT1 }"/>원 × <c:out value="${info.PRD_MST_PAY_CNT1 }"/>회 납입</p>
                            </c:if>
                            <c:if test="${not empty info.PRD_MST_PAY_AMT2 and not empty info.PRD_MST_PAY_CNT2 }">
                                <p class="detail2"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT2 }"/>원 × <c:out value="${info.PRD_MST_PAY_CNT2 }"/>회 납입</p>
                            </c:if> 
                            <c:if test="${not empty info.PRD_MST_PAY_AMT3 and not empty info.PRD_MST_PAY_CNT3 }">
                                <p class="detail2"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT3 }"/>원 × <c:out value="${info.PRD_MST_PAY_CNT3 }"/>회 납입</p>
                            </c:if> 
                             
                        </c:if>
                    </c:if>
                </div>
            </div>
            <%-- //상품정보 --%>
            <hr class="divline-type2" >
            <%-- 가입결제 --%>
            <div class="contain-product11">
                <div class="contain-inner">
                    <div class="contain-step on">
                        <h3 class="title-step-order">① 약관동의 및 본인확인</h3>
                        <form name="contractForm" id="contractForm">
                            <div class="box-inner">
                                <span class="btn-type-allagree" data-agr_mst_title="전자청약 약관 설명서"><button>약관 전체동의</button></span>
                                <div class="box-agreement">
                                    <c:forEach var="row" items="${termList }" varStatus="stat">
                                        <span class="act-agreement" data-cmn_com_idx="<c:out value="${row.CMN_COM_IDX }"/>" data-agr_mst_title="<c:out value="${row.CMN_COM_ETC3 }"/>">
                                            <label class="form-checkbox">
                                                <c:choose>
                                                    <c:when test="${row.CMN_COM_IDX eq Code.TERM_MARKETING }">
                                                        <input type="checkbox" name="MEM_AGR_TRM_CD<c:out value="${stat.index }"/>" class="terms" value="<c:out value="${row.CMN_COM_IDX }"/>"/>
                                                        <i>(선택)</i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="checkbox" name="MEM_AGR_TRM_CD<c:out value="${stat.index }"/>" class="terms required" value="<c:out value="${row.CMN_COM_IDX }"/>"/>
                                                        <i class="necessary">(필수)</i>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:out value="${row.CMN_COM_ETC3 }"/>
                                            </label>
                                        </span>
                                    </c:forEach>
                                </div>
                            </div>
                            <%-- 하단 고정버튼 --%>
                            <div class="fixed-box-button">
                                <span class="btn-type-text1 disabled"><button>본인확인</button></span>
                            </div>
                            <%-- //하단 고정버튼 --%>
                        </form>
                    </div>
                    <div class="contain-step">
                        <h3 class="title-step-order">② 가입정보입력</h3>
                    </div>
                    <div class="contain-step">
                        <h3 class="title-step-order">③ 카카오페이 인증</h3>
                    </div>
                    <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                        <div class="contain-step">
                            <h3 class="title-step-order">④ 할부지원형 결제</h3>
                        </div>
                        <div class="contain-step">
                            <h3 class="title-step-order">⑤ 상품가입 완료</h3>
                        </div>
                    </c:if>
                    <c:if test="${info.PRD_MST_TYPE ne Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                        <div class="contain-step">
                            <h3 class="title-step-order">④ 상품가입 완료</h3>
                        </div>
                    </c:if>
                </div>
            </div>
            <%-- //가입결제 --%>
        </div>
    </div>
    <%-- //본문 --%>
    <form name="termsForm" id="termsForm"></form>
    <form name="joinStepForm" id="joinStepForm">
        <input type="hidden" name="PRD_MST_NO" value="<c:out value="${commandMap.PRD_MST_NO }"/>"/>
        <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">
            <c:forEach var="PRD_OPT_IDX" items="${commandMap.PRD_OPT_IDXs }">
                <input type="hidden" name="PRD_OPT_IDXs" value="<c:out value="${PRD_OPT_IDX }"/>"/>
            </c:forEach>
        </c:if>
        <input type="hidden" name="ORD_MST_CNT" value="<c:out value="${commandMap.ORD_MST_CNT }"/>"/>
    </form>
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
    <script id="cancellationTemplate" type="text/x-jquery-tmpl">
        <c:if test="${not empty cancellationAmountList }">
            <h2 class="table-title"><c:out value="${info.PRD_MST_NM }"/> 해약환급금 및 환급율</h2>
            <div class="box-scroll-table2">
                <c:set var="index" value="0"/>
                <c:forEach var="row" items="${cancellationAmountList }" varStatus="stat">
                    <c:if test="${stat.index mod 30 eq 0}">
                        <table>
                        <tbody>
                            <tr>
                                <th>회차</th>
                                <th>환급금</th>
                            </tr>
                    </c:if>
                    <tr>
                        <th><c:out value="${row.NO}"/></th>
                        <td><fmt:formatNumber value="${row.RESN_AMT}" type="number"/></td>
                    </tr>
                    <c:set var="index" value="${index + 1}"/>
                    <c:if test="${(index gt 0 and index mod 30 eq 0) or stat.last}">
                        </tbody>
                        </table>
                        <c:set var="index" value="0"/>
                    </c:if>
                </c:forEach>
            </div>
        </c:if>
    </script>
    <script id="termsTemplate" type="text/x-jquery-tmpl">
        <header class="area-header-layer">
            <div class="area-inner">
                <h1 class="title">\${AGR_MST_TITLE}</h1>
                <span class="btn-close"><button>닫기</button></span>
            </div>
        </header>
        <div class="area-content-layer">
            <div class="area-inner">
                <div class="contain-agreement type2">
                    {{if CMN_COM_IDX == ""}}
                        <c:forEach var="row" items="${termList}">
                            <h2 class="title"><c:out value="${row.CMN_COM_ETC3 }"/></h2>
                            <div class="box-agreement scroll type2">
                                <div class="box-inner">
                                    <c:out value="${row.AGR_MST_CONTENTS}" escapeXml="false"/>
                                </div>
                            </div>
                            <c:if test="${row.AGR_MST_CFM_FRT_YN eq 'Y' }">
                                {{tmpl '#cancellationTemplate'}}
                            </c:if>
                        </c:forEach>
                    {{else CMN_COM_IDX != ""}}
                        <c:forEach var="row" items="${termList}">
                            {{if CMN_COM_IDX == "<c:out value="${row.CMN_COM_IDX}"/>"}}
                                <h2 class="title"><c:out value="${row.CMN_COM_ETC3 }"/></h2>
                                <div class="box-agreement scroll type2">
                                    <div class="box-inner">
                                        <c:out value="${row.AGR_MST_CONTENTS}" escapeXml="false"/>
                                    </div>
                                </div>
                                <c:if test="${row.AGR_MST_CFM_FRT_YN eq 'Y' }">
                                    {{tmpl '#cancellationTemplate'}}
                                </c:if>
                            {{/if}}
                        </c:forEach>
                    {{/if}}
                </div>
            </div>
        </div>
    </script>
    <script>
        $(function () {
            var $areaContent = $(".area-content"),
                $layerPopup = $(".layer-popup1"),
                $contractForm = $areaContent.find("#contractForm"),
                $joinStepForm = $("#joinStepForm"),
                $termsForm = $("#termsForm");
            var $termsTemplate = $("#termsTemplate");
            <%-- 약관 전체동의 버튼 클릭 이벤트 --%>
            $areaContent.on("click", ".btn-type-allagree", function (e) {
                e.preventDefault();
                $(this).toggleClass("checked");
                if ($(this).hasClass("checked")) {
                    openTermsLayer("", $(this).data("agr_mst_title"), function () {
                        checkboxToggle(true);
                        $contractForm.valid();
                    });
                } else {
                    checkboxToggle(false);
                    $contractForm.valid();
                }
            });
            <%-- 약관 개별동의 버튼 클릭 이벤트 --%>
            $areaContent.on("change", ".terms", function () {
                var $checkbox = $(this);
                var checked = $checkbox.is(":checked");
                if (checked) {
                    var $span = $checkbox.closest(".act-agreement")
                    openTermsLayer($span.data("cmn_com_idx"), $span.data("agr_mst_title"));
                }
                $contractForm.valid();
            });
            <%-- 약관 레이어 호출 --%>
            function openTermsLayer (cmnComIdx, agrMstTitle, callback) {
                $layerPopup.requestLayerByTemplate($termsTemplate.tmpl({CMN_COM_IDX : cmnComIdx, AGR_MST_TITLE : agrMstTitle}), null, callback);
            }
            <%-- 체크박스 토글 --%>
            function checkboxToggle (checked) {
                var $checkboxs = $areaContent.find(".form-checkbox");
                $checkboxs.each(function () {
                    var $this = $(this);
                    if (checked) {
                        $this.addClass("checked");
                    } else {
                        $this.removeClass("checked");
                    }
                    $this.find("input[type='checkbox']").attr("checked", checked);
                });
            }
            <%-- 본인확인 버튼 클릭 이벤트 --%>
            $contractForm.validate({
                submitHandler : function(form) {
                    $.common.check.oneself("", function (data) {
                        if (data.isSuccess) {
                            var params = new Array();
                            $(form).find(".terms:checked").each(function () {
                                params.push(TagUtil.createDynamicInput("hidden", "MEM_AGR_TRM_CD", this.value));
                            });
                            $termsForm.append(params);
                            $.postSyncJsonAjax($.action.contract.join.form.save.ajax(), $termsForm.serialize(), function () {
                                $.requestPage($.action.contract.join.step2.form(), $joinStepForm.serializeObject());
                            });
                        } else {
                            alert(data.resultMessage + "\n" + "[" + data.resultCode + "]");
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>