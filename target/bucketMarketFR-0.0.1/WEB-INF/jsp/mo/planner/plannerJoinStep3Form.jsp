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
    <jsp:param name="headerTitle" value="레디플래너 신청"/>
</jsp:include>
<!-- //헤더 -->

<!-- 본문 -->
<div class="area-content">
    <div class="area-inner">

        <div class="contain-join-head">
            <h2 class="title-step">신청완료</h2>
            <div class="box-step">
                <span>01</span>
                <span>02</span>
                <span class="on">03</span>
            </div>
        </div>
        
        <div class="contain-planner">
            <p class="text-information-type1"><span class="text-point2"><c:out value="${info.RDP_MST_MEM_NM }"/></span> 님,<br > 레디플래너 신청이 완료되었습니다.</p>
            <div class="box-planner">
                <dl>
                    <dt>플래너 번호</dt>
                    <dd>
                        <c:out value="${info.RDP_MST_NO }"/>
                        <span class="btn-copy" data-clipboard-text="<c:out value="${info.RDP_MST_NO }"/>"><button>복사하기</button></span>
                    </dd>
                    <dt>휴대폰 번호</dt>
                    <dd><c:out value="${info.RDP_MST_HP1 }"/>-<c:out value="${info.RDP_MST_HP2 }"/>-<c:out value="${info.RDP_MST_HP3 }"/></dd>
                </dl>
            </div>
        </div>

        <div class="contain-join-body">
            <p class="text-notice-type1">플래너 번호를 꼭 기억해 주세요!</p>
            <p class="text-normal-type1">신청승인이 완료되면 플래너 번호로 로그인 후, 아이디 생성 및 정산에 필요한 정보를 입력해 주셔야 최종 승인처리 됩니다.</p>
            <p class="text-normal-type1">심사 결과는 입력해 주신 휴대폰 번호로 통보됩니다.</p>
        </div>

        <!-- 하단 고정버튼 -->
        <div class="fixed-box-button">
            <span class="btn-type-text1"><button id="btnLogin">로그인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
        </div>
        <!-- //하단 고정버튼 -->

    </div>
</div>
<!-- //본문 -->
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>

<script>
    $(function () {
        var $areaContent = $(".area-content");
        // 클립보드로 복사
        new ClipboardJS(".btn-copy").on("success", function(e) {
            alert("클립보드로 복사 되었습니다.");
        });
        // 로그인
        $areaContent.on("click", "#btnLogin", function() {
            $.requestPage($.action.planner.login.form());
        });
    });
</script>

</body>
</html>