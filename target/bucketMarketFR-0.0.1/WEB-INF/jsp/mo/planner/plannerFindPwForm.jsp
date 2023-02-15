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
        
            <%-- 비밀번호 찾기 --%>
            <form id="frm" name="frm">
            
                <div class="box-findpassword">
                    <p class="text-normal-type1">비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
                    <input type="text" name="RDP_MST_ID" value="<c:out value="${commandMap.RDP_MST_ID }" />" maxlength="20" >
                    <p class="text-normal-type1 text-point1">비밀번호는 가입된 명의자의 휴대폰 본인확인을 통해 새로운 비밀번호로 설정됩니다.</p>
                </div>
    
                <!-- 하단 고정버튼 -->
                <div class="fixed-box-button">
                    <span class="btn-type-text1 disabled"><button type="button" id="btnNext">본인확인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
                </div>
                <!-- //하단 고정버튼 -->
            
            </form>
        </div>

    </div>
</div>
<!-- //본문 -->

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
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content");
            $frm = $areaContent.find("#frm");
        // 폼
        $frm.validate({
            rules : {
                RDP_MST_ID : { required : true, minlength : 6, maxlength : 20 },
            }
        });
        // 폼 초기화
        $frm.valid();
        // 아이디
        $areaContent.on("input", "input[name='RDP_MST_ID']", function() {
            $frm.valid();
        });
        // 본인확인
        $areaContent.on("click", "#btnNext", function() {
            if ($frm.valid()) {
                // # 서비스 번호 - 플래너 비밀번호 찾기
                $.common.check.oneself("", function (data) {
                    if (data.isSuccess) {
                        $frm.postSubmit($.action.planner.find.pw.find());
                    } else {
                        alert(data.resultMessage);
                    }
                });
            }
        });
    });
</script>

</body>
</html>