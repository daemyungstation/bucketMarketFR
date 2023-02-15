<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/join.css">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|navigation|title|search|home"/>
    <jsp:param name="headerTitle" value="아이디/비밀번호 찾기"/>
</jsp:include>
<!-- //헤더 -->

<!-- 본문 -->
<div class="area-content">
    <div class="area-inner">

        <div class="box-tab-head">
            <span><button onclick="javascript:$.requestPage($.action.planner.find.id.form());">아이디 찾기</button></span>
            <span class="on"><button>비밀번호 찾기</button></span>
        </div>
        <div>
            <div class="box-resultpassword">
                <p class="text-normal-type1"><span class="text-point2"><c:out value="${commandMap.RDP_MST_MEM_NM }" /></span>님, <br >비밀번호가 정상적으로 <br >등록되었습니다.</p>
            </div>

            <!-- 하단 고정버튼 -->
            <div class="fixed-box-button">
                <span class="btn-type-text1"><button onclick="javascript:$.requestPage($.action.planner.login.form());">로그인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
            </div>
            <!-- //하단 고정버튼 -->
        </div>

    </div>
</div>
<!-- //본문 -->
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content");
    });
</script>

</body>
</html>