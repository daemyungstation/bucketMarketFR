<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/join.css">
</head>
<body class="">

<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>

<jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
    <jsp:param name="oneDepth" value="로그인"/>
    <jsp:param name="oneDepthKey" value="planner.login.form"/>
</jsp:include>

<!-- Body -->
<div class="area-body">
    <div class="area-inner">

        <div class="contain-login">

            <div class="sub-tab-head">
                <span class="on"><button>아이디 찾기</button></span>
                <span><button onclick="javascript:$.requestPage($.action.planner.find.pw.form());">비밀번호 찾기</button></span>
            </div>
            <div>
                <div class="box-findid">
                    <p class="text-information-type1 byphone">휴대폰 본인확인으로 찾기</p>
                    <p class="text-information-type2-1">가입된 명의자의 휴대폰 본인확인을 통해 <br >찾을 수 있습니다.</p>
                </div>

                <!-- 하단 고정버튼 -->
                <div class="fixed-box-button">
                    <span class="btn-type-text1"><button id="btnFindId">본인확인</button></span>
                </div>
                <!-- //하단 고정버튼 -->
                
                <%-- 아이디 찾기 --%>
                <form id="frm" name="frm"></form>
                
            </div>

        </div>

    </div>
</div>
<!-- //Body -->

<!-- 팝업 : 가입이력 안내  -->
<c:if test="${info.notFound eq true}">
    <div class="layer-popup2 active">
        <div class="layer-inner">
            <div class="contain-head">
                <p class="text-title-type1">가입이력확인</p>
            </div>
            <hr class="divline-type1" >
            <div class="contain-body">
    
                <p class="text-normal-type2">입력된 정보의 가입 이력이 확인되지 않습니다. <br >정확한 정보를 입력해 주세요.</p>
                <div class="box-button">
                    <span class="btn-type-text1"><button onclick="javascript:closePopup2($(this));">확인</button></span>
                </div>
            </div>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </div>
</c:if>
<!-- //팝업 : 가입이력 안내 -->

<!-- 팝업 : 플래너 신청 중 안내  -->
<c:if test="${info.inApplyState eq true}">
    <div class="layer-popup2 active">
        <div class="layer-inner">
            <div class="contain-head">
                <p class="text-title-type1">안내드립니다.</p>
            </div>
            <hr class="divline-type1" >
            <div class="contain-body">
    
                <p class="text-normal-type2">
                    레디플래너 아이디 생성 및 정산 계좌를 등록한 <br >
                    활동 플래너만 이용가능한 서비스 입니다. <br >
                    제공받은 플래너번호로 로그인하시어 <br >
                    정보를 확인해 주세요.
                </p>
                <div class="box-button">
                    <span class="btn-type-text1"><button onclick="javascript:closePopup2($(this));">확인</button></span>
                </div>
            </div>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </div>
</c:if>
<!-- //팝업 : 플래너 신청 중 안내 -->

<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    
<script>
    $(function () {
        var $areaContent = $(".area-body");
            $frm = $areaContent.find("#frm");
        // 본인확인
        $areaContent.on("click", "#btnFindId", function() {
            // # 서비스 번호 - 플래너 아이디 찾기
            $.common.check.oneself("", function (data) {
                if (data.isSuccess) {
                    $frm.postSubmit($.action.planner.find.id.find());
                } else {
                    alert(data.resultMessage);
                }
            });
        });
    });
</script>
</body>
</html>