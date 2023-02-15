<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="layer-inner">
    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">지원혜택 조회</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">

            <div class="contain-history-subscripton1 type3">
                <dl>
                    <dt><span class="num-member"><c:out value="${info.MEM_NM }"/>&nbsp/&nbsp회원번호 <c:out value="${info.ACCNT_NO }"/></span><c:out value="${info.PRD_MST_NM }"/></dt>
                    <dd class="date"><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" /></dd>
                    <c:if test="${info.BENEFIT_NO gt 0}">
                        <dd class="stat"><c:out value="${info.BENEFIT_NO }"/>회 지급완료</dd>
                    </c:if>
                    <c:if test="${info.BENEFIT_NO le 0}">
                        <dd class="stat">미지급</dd>
                    </c:if>
                </dl>
            </div>

            <hr class="divline-type2" >
            
            <c:if test="${!empty info.PRD_MST_BND_ID }">
            <div class="contain-information-payment">
                <h3 class="title">추가 정보</h3>
                <!-- 정보 -->
                <div class="box-information-product1">
                    <dl>
                        <dt><c:out value="${info.PRD_MST_BND_ID }"/></dt>
                        <dd><c:out value="${info.ORD_MST_VDR_BNF_ID }"/></dd>
                    </dl>
                </div>
                <!-- //정보 -->
            </div>
            </c:if>

            <div class="box-paymenthistory">
                <h3 class="title">지급내역</h3>
                
                <c:forEach var="item" items="${info.benefitList }">
                
                    <dl class="payment">
                        <c:if test="${info.BENEFIT_NO gt 0}">
                            <dt><c:out value="${item.PAY_NO }"/>회차</dt>
                            <dd class="date">지급일 <ui:formatDate value="${item.PAY_DAY }" pattern="yyyy.MM.dd" /></dd>
                            <dd class="history">지급완료</dd>
                        </c:if>
                        <c:if test="${info.BENEFIT_NO le 0}">
                            <dt></dt>
                            <dd class="date"></dd>
                            <dd class="history">미지급</dd>
                        </c:if>
                    </dl>
                
                </c:forEach>
                
            </div>

        </div>
    </div>
    <!-- //본문 -->
</div>

<script>
$(function () {
    var $layerPopup = $(".layer-popup1");
});
</script>