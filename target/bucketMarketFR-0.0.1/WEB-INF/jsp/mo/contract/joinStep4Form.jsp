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
                    <div class="contain-step complete">
                        <h3 class="title-step-order">① 약관동의 및 본인확인</h3>
                    </div>
                    <div class="contain-step complete">
                        <h3 class="title-step-order">② 가입정보입력</h3>
                    </div>
                    <div class="contain-step complete">
                        <h3 class="title-step-order">③ 카카오페이 인증</h3>
                    </div>
                    <div class="contain-step on">
                        <h3 class="title-step-order">④ 할부지원형 결제</h3>
                        <div class="box-inner">
                            <div class="box-certification-kakao-complete"><%-- 인증 후 --%>
                                <p class="text-information">전자서명이 인증완료되었습니다. <br/>사전 결제금액을 결제하시면 가입신청이 완료됩니다.</p>
                            </div>
                        </div>
                        <%-- 하단 고정버튼 --%>
                        <div class="fixed-box-button">
                            <span class="btn-type-text1 request-payment"><button>결제하기</button></span>
                        </div>
                        <%-- //하단 고정버튼 --%>
                    </div>
                    <div class="contain-step">
                        <h3 class="title-step-order">⑤ 상품가입 완료</h3>
                    </div>
                </div>
            </div>
            <%-- //가입결제 --%>
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
                        $layerPopup.requestLayer($.action.pg.request.layer(), $joinStepForm.serializeObject());
                    } else {
                        $joinStepForm.getSubmit($.action.contract.join.step1.form());
                    }
                });
            });
            <%-- 결제 --%>
            payment = function (ordMstIdx) {
                $joinStepForm.find("input[name='ORD_MST_IDX']").val(ordMstIdx);
                $joinStepForm.postSubmit($.action.contract.join.regist());
            };
        });
    </script>
</body>
</html>