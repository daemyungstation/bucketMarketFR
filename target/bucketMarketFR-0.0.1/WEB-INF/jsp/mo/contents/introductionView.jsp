<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/fullpage.css">
</head>
<body>
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|title|search"/>
    <jsp:param name="headerTitle" value="버킷마켓 소개"/>
</jsp:include>
<div class="area-content">
    <div class="area-inner">
        <div class="box-bucket-intro">
            <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro.png" alt="버킷마켓 소개" />
        </div>
    </div>
</div>
<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content");
    });
</script>
</body>
</html>