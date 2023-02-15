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
    <jsp:param name="headerTitle" value="맴버십 카드 조회"/>
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
        
                <div class="area-mypage contain-membershipcard">
        
                    <p class="text-information-type2">* 가입하신 상품의 멤버십 카드를 조회할 수 있습니다.</p>
                    <p class="text-information-type2">* 청약철회/행사/해약 상품 내역은 표시 되지 않습니다.</p>
            
                    <hr class="divline-type5">
                    
                    <%-- 가입내역 목록 --%>
                    <c:forEach var="item" items="${list }">

                        <div class="contain-history-subscripton1" data-idx="<c:out value="${item.ORD_MST_IDX }"/>">
                            <button class="info">
                            <dl>
                                <dt><span class="num-member"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp회원번호 <c:out value="${item.ACCNT_NO }"/></span><c:out value="${item.PRD_MST_NM }"/></dt>
                                <dd class="date"><ui:formatDate value="${item.JOIN_DT }" pattern="yyyy.MM.dd" /></dd>
                                <dd class="stat">가입</dd>
                            </dl>
                            </button>
                
                            <div class="box-button">
                                <span class="btn-type-text7 type2"><button class="membership">멤버십 카드 정보</button></span>
                            </div>
                        </div>
                    
                    </c:forEach>
                    
                </div>
            
            </c:when>
            <%-- 조회내역 있음 --%>
            
            <%-- 조회내역 없음 --%>
            <c:otherwise>
            
                <div class="area-mypage contain-membershipcard">
        
                    <p class="text-information-type2">* 가입하신 상품의 멤버십 카드를 조회할 수 있습니다.</p>
                    <p class="text-information-type2">* 청약철회/행사/해약 상품 내역은 표시 되지 않습니다.</p>
        
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
        // 맴버십 카드 정보
        $areaContent.on("click", "button.membership", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contain-history-subscripton1").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.membership.view.layer(), params);
        });
    });
</script>

</body>
</html>