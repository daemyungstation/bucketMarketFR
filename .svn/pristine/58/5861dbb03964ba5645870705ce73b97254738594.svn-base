<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/mypage.css">
</head>
<body class="">

<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>

<jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
    <jsp:param name="oneDepth" value="MY계약"/>
    <jsp:param name="oneDepthKey" value="mycontract.info.list.view"/>
</jsp:include>

<!-- Body -->
<div class="area-body">
    <div class="area-inner">

        <div class="wrap">
        
            <%-- 좌측 메뉴 --%>
            <jsp:include page="/WEB-INF/jsp/pc/include/aside.jsp" flush="false">
                <jsp:param name="asideTitle" value="MY계약"/>
                <jsp:param name="asideGroup" value="mycontract"/>
            </jsp:include>
            <%-- //좌측 메뉴 --%>

            <div class="contain-body">
                <div class="content-header">
                    <h3 class="title">본인확인 안내</h3>
                </div>

                <div class="box-information-mypage">
                    <p class="text-information-type2">고객님의 소중한 가입/납입현황 등의 정보를 다루기 위한  보안 절차로 본인확인이 필요합니다.</p>
                </div>
        
                <div class="box-information-certifiphone">
                    <p>본인 명의의 휴대폰으로 인증합니다.</p>                    
                </div>

                <div class="box-btn center">
                    <span class="btn-type-text1"><!-- 비활성화 disabled 클래스명 추가 -->
                        <button id="btnNext">본인확인</button>
                    </span>
                </div>
                
            </div>
        </div>

    </div>
</div>
<!-- //Body -->

<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    
<script>
    $(function () {
        var $areaContent = $(".area-body");
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