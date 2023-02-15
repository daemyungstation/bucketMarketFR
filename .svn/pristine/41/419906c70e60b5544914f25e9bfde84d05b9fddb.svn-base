<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/fullpage.css">
</head>
<body class="">
<c:if test="${not empty top }">
    <div class="area-topbanner">
        <div class="area-inner">
            <a href="javascript:$.requestLink('<c:out value="${top.BNR_MST_URL }"/>', '<c:out value="${top.BNR_MST_TGT }"/>');">
                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${top.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${top.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/none.png'"/>
            </a>
            <span class="btn-close-banner"><button onclick="javascript:$.cookie('topBannerHide', 1, { expires : 1 });">닫기</button></span>
        </div>
    </div>
</c:if>
<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/nav.jsp" %>
<!-- Body -->
<div class="area-body">
    <!-- Full Content -->
    <div class="area-top-type2"><!-- 구분이 필요할 경우를 대비 type숫자 -->
        <div class="area-inner">
            <div class="box-bucket-intro">
                <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/pc/images/img_bucket_intro.png" alt="버킷마켓 소개" />
            </div>
        </div>
    </div>
    <!-- //Full Content -->
</div>
<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>

</body>
</html>