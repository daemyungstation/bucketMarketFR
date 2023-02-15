<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/payment.css"> 
    <script>fbq('track', 'AddPaymentInfo');</script>
</head>
<body class="">
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-top-type3">
            <div class="area-inner">
                <div class="contain-order-top<c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') and info.PRD_MST_IRG_YN eq 'Y' }"> contain-order-irregular</c:if>">
                    <div class="box-order-inner">
                        <div class="box-order-title">
                            <span class="order-title"><c:out value="${info.PRD_MST_NM }"/></span>
                            <p class="text-account"><span><fmt:formatNumber value="${commandMap.ORD_MST_CNT }" type="number"/></span>개의 가입구좌</p>
                        </div>
<c:choose>
                            <%-- 상조 --%>
                            <c:when test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_DAEMYUG and info.PRD_MST_BND_YN eq 'Y' }">
                                <div class="box-order-details array3">
                                <ul>
                                    <li><p class="details-title">월지원금</p><span class="text-point1"><fmt:formatNumber value="${info.MON_REL_AMT }" type="number"/></span> 원</li>
                                    <li><p class="details-title">월납부금</p><span class="text-point1"><fmt:formatNumber value="${info.MON_PAY_AMT }" type="number"/></span> 원</li>
                                    <li><p class="details-title">납부회차</p><span class="text-point1"><fmt:formatNumber value="${info.EXPR_NO }" type="number"/></span> 회</li>
                                </ul>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="box-order-details array4">
                                    <ul>
                                        <%-- 즉발(채권) --%>
                                        <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y' }">
                                            <li><p class="details-title">총 지원혜택</p><span class="text-point1"><c:out value="${info.PRD_MST_SPT_TXT }"/></li>
                                            <li><p class="details-title">즉시 지원혜택</p><span class="text-point1"><fmt:formatNumber value="${info.REL_AMT }" type="number"/></span> 원</li>
                                            <li><p class="details-title">상품금액</p><span class="text-point1"><fmt:formatNumber value="${info.PROD_AMT }" type="number"/></span> 원</li>
                                            <li><p class="details-title">납부회차</p><span class="text-point1"><fmt:formatNumber value="${info.EXPR_NO }" type="number"/></span> 원</li>
                                        </c:if>
                                        <%-- 상조 --%>
                                        <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_DAEMYUG and info.PRD_MST_BND_YN eq 'Y' }">
                                            <li class="daemyung"><p class="details-title">월지원금</p><span class="text-point1"><fmt:formatNumber value="${info.MON_REL_AMT }" type="number"/></span> 원</li>
                                            <li class="daemyung"><p class="details-title">월납부금</p><span class="text-point1"><fmt:formatNumber value="${info.MON_PAY_AMT }" type="number"/></span> 원</li>
                                            <li class="daemyung"><p class="details-title">납부회차</p><span class="text-point1"><fmt:formatNumber value="${info.EXPR_NO }" type="number"/></span> 회</li>
                                        </c:if>
                                        <%-- 월지원형/즉발(비채권)/렌탈/할부지원 --%>
                                        <c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') && info.PRD_MST_TYPE ne Code.PRODUCT_TYPE_DAEMYUG }">
                                            <li><p class="details-title">월지원금</p><span class="text-point1"><fmt:formatNumber value="${info.MON_REL_AMT }" type="number"/></span> 원</li>
                                            <li><p class="details-title">지원회차</p><span class="text-point1"><fmt:formatNumber value="${info.REL_CNT }" type="number"/></span> 회</li>
                                            <%-- 정기형 --%>
                                            <c:if test="${info.PRD_MST_IRG_YN ne 'Y' }">
                                                <li><p class="details-title">월납부금</p><span class="text-point1"><fmt:formatNumber value="${info.MON_PAY_AMT }" type="number"/></span> 원</li>
                                                <li><p class="details-title">납부회차</p><span class="text-point1"><fmt:formatNumber value="${info.EXPR_NO }" type="number"/></span> 회</li>
                                            </c:if>
                                            <%-- 비정기형 --%>
                                            <c:if test="${info.PRD_MST_IRG_YN eq 'Y' }">
                                                <li>
                                                    <p class="details-title">월납부금</p>
                                                    <c:if test="${not empty info.PRD_MST_PAY_AMT1 }">
                                                        <span class="text-point1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT1 }" type="number"/></span> 원<br/>
                                                    </c:if>
                                                    <c:if test="${not empty info.PRD_MST_PAY_AMT2 }">
                                                        <span class="text-point1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT2 }" type="number"/></span> 원<br/>
                                                    </c:if>
                                                    <c:if test="${not empty info.PRD_MST_PAY_AMT3 }">
                                                        <span class="text-point1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT3 }" type="number"/></span> 원
                                                    </c:if>
                                                    
                                                </li>
                                                <li>
                                                    <p class="details-title">납부회차</p>
                                                    <c:if test="${not empty info.PRD_MST_PAY_CNT1 }">
                                                        <span class="text-point1"><c:out value="${info.PRD_MST_PAY_CNT1 }"/></span> 회<br/>
                                                    </c:if>
                                                    <c:if test="${not empty info.PRD_MST_PAY_CNT2 }">
                                                        <span class="text-point1"><c:out value="${info.PRD_MST_PAY_CNT2 }"/></span> 회<br/>
                                                    </c:if>
                                                    <c:if test="${not empty info.PRD_MST_PAY_CNT3 }">
                                                        <span class="text-point1"><c:out value="${info.PRD_MST_PAY_CNT3 }"/></span> 회<br/>
                                                    </c:if>
                                                    
                                                </li>
                                            </c:if>
                                        </c:if>
                                    </ul>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="contain-order-inner">
                    <h3 class="title">
                                        제품 금액 <span class="contain-contract-title-price"><fmt:formatNumber value="${info.PRD_MST_ISTM_SPT_PAY}" type="number"/></span>원을<br />
                                        먼저 결제해주세요.<br/>
                       <span class="contain-contract-title-desc">(자동 18개월 할부결제)</span>
                    </h3>
                    
                    <div class="contain-step">
                        <div class="box-step-form">
                            <div class="contain-contract-guide">
                                                    결제한 금액은<br />
                                <span class="contain-contract-guide-bold">
                                                        버킷마켓에서<br />
                                                        매월 캐시백해드립니다.<br />
                                </span>
                                (할부이자 포함 금액 18개월 캐시백)
                            </div>
                        </div>
                        <div class="fixed-box-button">
                            <span class="btn-type-text1 request-payment"><button>결제하기</button></span>
                        </div>
                        <div class="contain-contract-desc">
                                                상담 단계에서<br />
                                                상품 취소를 희망하실 경우,<br />
                                                결제도 자동 취소 됩니다.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- //Body --%>
    <form name="joinStepForm" id="joinStepForm">
        <input type="hidden" name="PRD_MST_NO" value="<c:out value="${commandMap.PRD_MST_NO }"/>"/>
        <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">
            <c:forEach var="PRD_OPT_IDX" items="${commandMap.PRD_OPT_IDXs }">
                <input type="hidden" name="PRD_OPT_IDXs" value="<c:out value="${PRD_OPT_IDX }"/>"/>
            </c:forEach>
        </c:if>
        <input type="hidden" name="ORD_MST_CNT" value="<c:out value="${commandMap.ORD_MST_CNT }"/>"/>
        <input type="hidden" name="ORD_MST_IDX" value=""/>
    </form>
    <form id="pgForm" name="pgForm" method="POST" accept-charset="EUC-KR"></form>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    <script language="javascript" type="text/javascript" src="<spring:eval expression="@pg['pg.script.url']"/>" charset="UTF-8"></script>
    <script>
        $(function () {
            var $areaBody = $(".area-body"),
                $layerPopup = $(".layer-popup1"),
                $joinStepForm = $("#joinStepForm");
            <%-- 페이지 로딩 후 앵커 이동 --%>
            $("html, body").animate({
                scrollTop: $(".request-payment").offset().top
            });
            <%-- 결제하기 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".request-payment", function (e) {
                $.postSyncJsonAjax($.action.contract.join.data.exists.ajax(), null, function (data) {
                    if (data.isLogin && data.isDataExists) {
                        $.postSyncJsonAjax($.action.pg.request.ajax(), $joinStepForm.serializeObject(), function (data) {
                            fbq('track', 'CompleteRegistration');
                            var params = new Array();
                            $.each(data.info, function (key, value) {
                                params.push(TagUtil.createDynamicInput("hidden", key, value));
                            });
                            var $pgForm = $("#pgForm");
                            $pgForm.empty();
                            $pgForm.append(params);
                            INIStdPay.pay("pgForm");
                        });
                    } else {
                        $joinStepForm.getSubmit($.action.contract.join.step1.form());  
                    }
                });
            });
            <%-- 결제 --%>
            payment = function (ordMstIdx) {
                var _nao={};
                _nao["cnv"] = wcs.cnv("1","${info.PRD_MST_ISTM_SPT_PAY}");
                wcs_do(_nao);
                $joinStepForm.find("input[name='ORD_MST_IDX']").val(ordMstIdx);
                $joinStepForm.postSubmit($.action.contract.join.regist());
            };
        });
    </script>
</body>
</html>