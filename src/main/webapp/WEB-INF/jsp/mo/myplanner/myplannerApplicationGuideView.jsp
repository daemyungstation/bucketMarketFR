<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/myplanner.css">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|title-btn|search"/>
    <jsp:param name="headerTitle" value="이용가이드"/>
</jsp:include>
<!-- //헤더 -->
<!-- 카테고리 -->
<jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
    <jsp:param name="navGroup" value="myplanner"/>
</jsp:include>
<!-- //카테고리 -->

<!-- 본문 -->
<div class="area-content"> <!-- 하단 탭바일때 aside-tabbar 클래스 추가 -->
    <div class="area-inner">

        <div class="contain-planner-intro">
            <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_readyplanner_guide_mo.jpg" alt="레디플래너 가이드" />
        </div>
        
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
    });
</script>

</body>
</html>