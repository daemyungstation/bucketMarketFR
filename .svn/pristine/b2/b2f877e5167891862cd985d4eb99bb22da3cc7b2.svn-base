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
    <jsp:param name="headerGroup" value="historyback|title|search"/>
    <jsp:param name="headerTitle" value="본인확인 안내"/>
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

        <div class="box-information-mypage">
            <p class="text-information-type1">본인확인</p>
            <p class="text-information-type2">고객님의 소중한 가입/납입현황 등의 정보를 다루기 위한 보안 절차로 본인확인이 필요합니다. </p>
        </div>

        <div class="box-information-certifiphone">
            <p>본인 명의의 휴대폰으로 인증합니다.</p>
        </div>

        <!-- 하단 고정버튼 -->
        <div class="fixed-box-button">
            <span class="btn-type-text1"><button id="btnNext">본인확인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
        </div>
        <!-- //하단 고정버튼 -->

    </div>
</div>
<!-- //본문 -->

<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content");
        // 본인확인
        $areaContent.on("click", "#btnNext", function() {
            // # 서비스 번호 - 로그인
            $.common.check.oneself("", function (data) {
                if (data.isSuccess) {
                    window.location.replace($.action.mycontract.info.list.view());
                } else {
                    alert(data.resultMessage);
                }
            });
        });
    });
</script>

</body>
</html>