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
    <jsp:param name="headerTitle" value="라이프 서비스 신청"/>
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
        
                    <p class="text-information-type2">* 회원상태가 '가입' 인 상품만 신청이 가능합니다. 행사/해약처리 완료된 상품 내역은 표시되지 않습니다.</p>
                    <p class="text-information-type2">* 제공되는 서비스 중 하나를 선택하여 이용하실 수 있습니다. 상품별 라이프서비스는 1개 제공됩니다.</p>
            
                    <hr class="divline-type5">
                    
                    <%-- 가입내역 목록 --%>
                    <c:forEach var="item" items="${list }">

                        <div class="contain-history-subscripton1" data-idx="<c:out value="${item.ORD_MST_IDX }"/>">
                            <button class="info">
                            <dl>
                            
                                <%-- 계약 상태 별 분기 --%>
                                <c:choose>
                                    <%-- 접수 --%>
                                    <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_RECEIPT }">
                                        <dt><span class="num-member"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp회원번호</span><c:out value="${item.PRD_MST_NM }"/></dt>
                                    </c:when>
                                    <%-- 가입대기 --%>
                                    <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_WAITING_TO_JOIN }">
                                        <dt><span class="num-member"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp회원번호 <c:out value="${item.ACCNT_NO }"/></span><c:out value="${item.PRD_MST_NM }"/></dt>
                                    </c:when>
                                    <%-- 가입 --%>
                                    <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                                        <dt><span class="num-member"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp회원번호 <c:out value="${item.ACCNT_NO }"/></span><c:out value="${item.PRD_MST_NM }"/></dt>
                                    </c:when>
                                </c:choose>
                                
                                <dd class="detail">
                                    <dl>
                                        <dt>상품금액 :</dt>
                                        <dd><fmt:formatNumber value="${item.PROD_AMT }" type="number"/>원</dd>
                                    </dl>
                                    <dl>
                                        <dt>납입회차 :</dt>
                                        <dd><c:out value="${item.PAY_NO }"/>회</dd>
                                    </dl>
                                    <dl>
                                        <dt>납입금액 :</dt>
                                        <dd><fmt:formatNumber value="${item.PAY_SUM }" type="number"/>원</dd>
                                    </dl>
                                </dd>

                                <%-- 계약 상태 별 분기 --%>
                                <c:choose>
                                    <%-- 접수 --%>
                                    <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_RECEIPT }">
                                        <dd class="date"></dd>
                                        <dd class="stat">접수</dd>
                                    </c:when>
                                    <%-- 가입대기 --%>
                                    <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_WAITING_TO_JOIN }">
                                        <dd class="date"></dd>
                                        <dd class="stat">가입대기</dd>
                                    </c:when>
                                    <%-- 가입 --%>
                                    <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                                        <dd class="date"><ui:formatDate value="${item.JOIN_DT }" pattern="yyyy.MM.dd" /></dd>
                                        <dd class="stat">가입</dd>
                                    </c:when>
                                </c:choose>
                            </dl>
                            </button>
                
                            <div class="box-button">
                                <span class="btn-type-text7 type2"><button class="lifeservice">라이프 서비스 신청</button></span>
                            </div>
                        </div>
                    
                    </c:forEach>
                    
                    <!-- 수정 06/02 -->
                    <div class="contain-information-card2">
                        <p class="text-notice-type1">꼭 확인해 주세요.</p>
                        <p class="text-normal-type1">
                            ※ 라이프서비스를 신청하실 경우, 계약하신 라이프서비스 혹은 기존 계약을 종료하고 선택한 서비스를 사용하실 수 있으며, 잔여금을 일시로 완납 후 이용이 가능합니다.<br>
                            ※ 별도의 상품 변경은 어려우시며, 만약 제공 서비스 외 추가 서비스를 원하실 경우, 신청 접수 이후 제공업체 담당자와 상담 시 진행해 주시면 됩니다.<br>
                            ※ 제공서비스 업체 및 서비스의 내용이 변경될 수 있으며, 제휴사의 사정에 따라 제공이 어려울 수 있습니다.
                        </p>
                    </div>
                    <!-- //수정 06/02 -->
        
                </div>
            
            </c:when>
            <%-- 조회내역 있음 --%>
            
            <%-- 조회내역 없음 --%>
            <c:otherwise>
            
                <div class="area-mypage contain-membershipcard">
        
                    <p class="text-information-type2">* 청약철회/행사/해약 상품 내역은 표시 되지 않습니다.</p>
                    <p class="text-information-type2">* 일부 서비스 내용은 가입 및 납입상태에 따라 차이가 있을 수 있습니다. <br >더 자세한 내용은 1:1 상담하기 또는 컨택센터(1588-8511)로 문의 바랍니다.</p>
        
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
        // 라이프서비스 신청
        $areaContent.on("click", "button.lifeservice", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contain-history-subscripton1").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.lifeservice.apply.layer(), params);
        });
    });
</script>

</body>
</html>