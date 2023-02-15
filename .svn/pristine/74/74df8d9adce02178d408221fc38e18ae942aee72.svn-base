<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/payment.css">
    <script>fbq('track', 'AddPaymentInfo');</script>
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title"/>
        <jsp:param name="headerTitle" value="간편 상담 신청"/>
    </jsp:include>
    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-contract-title">
                        제품 금액 <span class="contain-contract-title-price"><fmt:formatNumber value="${info.PRD_MST_ISTM_SPT_PAY}" type="number"/></span>원을<br />
                        먼저 결제해주세요.<br/>
              <span class="contain-contract-title-desc">(자동 18개월 할부결제)</span>
            </div>
            
            <%-- 가입결제 --%>
            <div class="contain-product11">
                <div class="contain-inner">
                    <div class="contain-step on">
                        <div class="box-inner contain-contract-guide">
                                                결제한 금액은<br />
                            <span class="contain-contract-guide-bold">
                                                    버킷마켓에서<br />
                                                    매월 캐시백해드립니다.<br />
                            </span>
                            (할부이자 포함 금액 18개월 캐시백)
                        </div>
                        <%-- 하단 고정버튼 --%>
                        <div class="fixed-box-button">
                            <span class="btn-type-text1 request-payment"><button>결제하기</button></span>
                        </div>
                        <%-- //하단 고정버튼 --%>
                    </div>
                </div>
            </div>
            <%-- //가입결제 --%>
            <hr class="divline-type2" >
            <div class="contain-contract-desc">
                        상담 단계에서<br />
                        상품 취소를 희망하실 경우,<br />
                        결제도 자동 취소 됩니다.
            </div>
        </div>
    </div>
    <%-- //본문 --%>
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
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <script>
        $(function () {
            var $areaContent = $(".area-content"),
                $layerPopup = $(".layer-popup1"),
                $joinStepForm = $("#joinStepForm");
            <%-- 결제하기 버튼 클릭 이벤트 --%>
            $areaContent.on("click", ".request-payment", function (e) {
                $.postSyncJsonAjax($.action.contract.join.data.exists.ajax(), null, function (data) {
                    if (data.isLogin && data.isDataExists) {
                        fbq('track', 'CompleteRegistration');
                        $layerPopup.requestLayer($.action.pg.request.layer(), $joinStepForm.serializeObject());
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