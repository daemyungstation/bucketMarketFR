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
    <jsp:param name="headerTitle" value="My계약"/>
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
    
        <%-- 본인확인 --%>
        <form id="oneselfForm" name="oneselfForm">
            <input type="hidden" name="RETURN_URL">
        </form>

        <div class="box-information-mypage">
        
            <c:choose>
                <c:when test="${empty info.USER_CI }">
                    <p class="text-information-type1"><span class="text-point2">본인인증</span>이 필요합니다.</p><!-- 본인인증 전 -->
                </c:when>
                <c:otherwise>
                    <p class="text-information-type1">환영합니다. <span class="text-point2"><c:out value="${info.USER_NM }"/></span>님</p><!-- 본인인증 후 -->
                    <span class="btn-logout"><button id="btnLogout">로그아웃</button></span>
                </c:otherwise>
            </c:choose>
            
            <p class="text-information-type2">가입내용/납입내역 조회 및 가입한 상품에 <br >배송, 지원/혜택에 대한 상세 정보를 제공합니다.</p>
        </div>

        <hr class="divline-type1">
        
        <div class="box-quicklink">
            <span class="link1"><a href="javascript:$.requestPage($.action.mycontract.info.list.view());">가입내역 <br >조회</a></span>
            <span class="link2"><a href="javascript:$.requestPage($.action.mycontract.paymentrefund.list.view());">납입/환급금 <br >조회</a></span>
            <!-- <span class="link3"><a href="javascript:$.requestPage($.action.mycontract.shipping.list.view());">배송/지원혜택 <br >조회</a></span> -->
            <span class="link4"><a href="javascript:$.requestPage($.action.mycontract.paymentmethod.list.view());">결제수단 변경 <br >신청</a></span>
            <span class="link5"><a href="javascript:$.requestPage($.action.mycontract.membership.list.view());">멤버십카드 <br >조회</a></span>
            <span class="link6"><a href="javascript:$.requestPage($.action.mycontract.lifeservice.list.view());">라이프 서비스 <br >신청</a></span>
        </div>

        <%-- 배너 영역 --%>
        <c:if test="${not empty banner }">
        
            <div class="box-banner-type1">
                <c:set var="banner" value="${banner[0] }"/>
                <a href="javascript:$.requestLink('<c:out value="${banner.BNR_MST_URL }"/>', '<c:out value="${banner.BNR_MST_TGT }"/>');">
                    <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${banner.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${banner.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/none.png'"/>
                </a>
            </div>
            
        </c:if>
        <%-- 배너 영역 --%>

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
        var $areaContent = $(".area-content"),
            $oneselfForm = $areaContent.find("#oneselfForm");
        // 로그아웃
        $areaContent.on("click", "#btnLogout", function() {
            if (confirm("로그아웃 하시겠습니까?")) {
                alert("로그아웃 되었습니다.");
                $.requestPage($.action.mycontract.logout());
            }
        });
    });
</script>

</body>
</html>