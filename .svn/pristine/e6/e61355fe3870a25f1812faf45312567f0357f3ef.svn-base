<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/mypage.css">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|title-btn|search"/>
    <jsp:param name="headerTitle" value="배송/지원혜택 조회"/>
</jsp:include>
<!-- //헤더 -->
<!-- 카테고리 -->
<jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
    <jsp:param name="navGroup" value="mycontract"/>
</jsp:include>
<!-- //카테고리 -->

<!-- 본문 -->
<div class="area-content"> <!-- 하단 탭바일때 aside-tabbar 클래스 추가 -->
    <div class="area-inner">
    
        <c:choose>
        
            <%-- 조회내역 있음 --%>
            <c:when test="${fn:length(list) gt 0 }">
            
                <div class="area-mypage contain-payment">

                    <p class="text-information-type2">* 가입하신 상품의 배송 현황 및 매월 지원혜택 지급내역을 조회 할 수 있습니다.</p>
                    
                    <hr class="divline-type5">
                    
                    <%-- 가입내역 목록 --%>
                    <c:forEach var="item" items="${list }">
        
                        <div class="contain-history-subscripton1" data-idx="<c:out value="${item.ORD_MST_IDX }"/>">
                            <button class="info">
                            <dl>
                                <dt><span class="num-member"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp회원번호 <c:out value="${item.ACCNT_NO }"/></span><c:out value="${item.PRD_MST_NM }"/></dt>
                                <dd class="date"><ui:formatDate value="${item.JOIN_DT }" pattern="yyyy.MM.dd" /></dd>
                            
                                <%-- 상품유형 별 상태 노출 --%>
                                <c:choose>
                                    <%-- 월지원형 --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT }">
                                        <c:if test="${item.BENEFIT_NO gt 0}">
                                            <dd class="stat"><c:out value="${item.BENEFIT_NO }"/>회 지급완료</dd>
                                        </c:if>
                                        <c:if test="${item.BENEFIT_NO le 0}">미지급</c:if>
                                    </c:when>
                                    <%-- 즉발(채권) --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and item.PRD_MST_BND_YN eq 'Y'}">
                                        <dd class="stat"><c:out value="${item.ORD_MST_DLV_STATE_NM }"/></dd>
                                    </c:when>
                                    <%-- 즉발(비채권) --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and item.PRD_MST_BND_YN ne 'Y'}">
                                        <c:if test="${item.BENEFIT_NO gt 0}">
                                            <dd class="stat"><c:out value="${item.BENEFIT_NO }"/>회 지급완료</dd>
                                        </c:if>
                                        <c:if test="${item.BENEFIT_NO le 0}">미지급</c:if>
                                    </c:when>
                                    <%-- 렌탈 --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL }">
                                        <c:if test="${item.BENEFIT_NO gt 0}">
                                            <dd class="stat"><c:out value="${item.BENEFIT_NO }"/>회 지급완료</dd>
                                        </c:if>
                                        <c:if test="${item.BENEFIT_NO le 0}">미지급</c:if>
                                    </c:when>
                                    <%-- 할부지원 --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                                        <dd class="stat"><c:out value="${item.ORD_MST_DLV_STATE_NM }"/></dd>
                                    </c:when>
                                </c:choose>
                                
                            </dl>
                            </button>
                            <div class="box-button">
                            
                                <%-- 상품유형 별 버튼 노출 --%>
                                <c:choose>
                                    <%-- 월지원형 --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT }">
                                        <c:if test="${item.BENEFIT_NO gt 0}">
                                            <span class="btn-type-text7"><button class="benefit">지원/혜택 조회</button></span>
                                        </c:if>
                                        <c:if test="${item.BENEFIT_NO le 0}">
                                            <span class="btn-type-text7" style="display: none;"><button class="benefit">지원/혜택 조회</button></span>
                                        </c:if>
                                    </c:when>
                                    <%-- 즉발(채권) --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and item.PRD_MST_BND_YN eq 'Y'}">
                                        <span class="btn-type-text7"><button class="shipping">배송현황 조회</button></span>
                                    </c:when>
                                    <%-- 즉발(비채권) --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and item.PRD_MST_BND_YN ne 'Y'}">
                                        <c:if test="${item.BENEFIT_NO gt 0}">
                                            <span class="btn-type-text7"><button class="benefit">지원/혜택 조회</button></span>
                                        </c:if>
                                        <c:if test="${item.BENEFIT_NO le 0}">
                                            <span class="btn-type-text7" style="display: none;"><button class="benefit">지원/혜택 조회</button></span>
                                        </c:if>
                                    </c:when>
                                    <%-- 렌탈 --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL }">
                                        <c:if test="${item.BENEFIT_NO gt 0}">
                                            <span class="btn-type-text7"><button class="benefit">지원/혜택 조회</button></span>
                                        </c:if>
                                        <c:if test="${item.BENEFIT_NO le 0}">
                                            <span class="btn-type-text7" style="display: none;"><button class="benefit">지원/혜택 조회</button></span>
                                        </c:if>
                                    </c:when>
                                    <%-- 할부지원 --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                                        <span class="btn-type-text7"><button class="shipping">배송현황 조회</button></span>
                                    </c:when>
                                </c:choose>
                                
                            </div>
                        </div>
                    
                    </c:forEach>
                    
                </div>
            
            </c:when>
            <%-- 조회내역 있음 --%>
            
            <%-- 조회내역 없음 --%>
            <c:otherwise>
            
                <div class="area-mypage contain-payment">

                    <p class="text-information-type2">* 가입하신 상품의 배송 현황 및 매월 지원혜택 지급내역을 조회 할 수 있습니다.</p>
                    
                    <hr class="divline-type5">
        
                    <p class="text-noresult">조회 내역이 없습니다.</p>
        
                </div>
                
            </c:otherwise>
            <%-- 조회내역 없음 --%>
            
        </c:choose>

    </div>
</div>
<!-- //본문 -->

<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>

<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content");
        // 상세
        $areaContent.on("click", "button.info", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contain-history-subscripton1").attr("data-idx") }
            $.requestPage($.action.mycontract.info.detail.view, params);
        });
        // 지원/혜택 조회
        $areaContent.on("click", "button.benefit", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contain-history-subscripton1").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.shipping.benefit.view.layer(), params);
        });
        // 배송현황 조회
        $areaContent.on("click", "button.shipping", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contain-history-subscripton1").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.shipping.shipping.view.layer(), params);
        });
    });
</script>

</body>
</html>