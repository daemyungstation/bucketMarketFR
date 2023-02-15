<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        <%-- 로그인 --%>
        <form id="frm" name="frm">
            <input type="hidden" name="RDP_MST_PW">
    
            <div class="contain-login">
    
                <h2 class="title">레디플래너 로그인</h2>
    
                <div class="box-form box-login">
                    <input type="text" name="RDP_MST_ID" placeholder="아이디" value="<c:out value="${commandMap.RDP_MST_ID }"/>" maxlength="20" >
                    <input type="password" name="RDP_MST_PW_TEMP" placeholder="비밀번호" maxlength="15">
                    <label class="form-alert <c:if test="${not empty commandMap.errorMessage }">on</c:if>" message-target="RDP_MST_ID" data-name="아이디"><c:out value="${commandMap.errorMessage }" /></label>
                    <label class="form-alert" message-target="RDP_MST_PW_TEMP" data-name="비밀번호"></label>
                </div>
    
                <div class="box-util-login">
                    <label class="form-checkbox">
                        <input type="checkbox" name="AUTO_LOGIN_YN" value="Y" <c:if test="${commandMap.AUTO_LOGIN_YN eq 'Y' }">checked="checked"</c:if> >
                        자동로그인
                    </label>
                    <span class="link-findidpass"><a href="javascript:$.requestPage($.action.planner.find.id.form());">아이디/비밀번호 찾기</a></span>
                </div>
    
                <p class="text-haveplaner"><a id="plannerNoLogin" href="javascript:;">플래너 번호가 있으신가요?</a></p>
    
                <div class="box-information-firstvisit">
                    <p class="text-firstvisit">처음오셨나요?</p>
                    <span class="btn-type-text2"><a href="javascript:$.requestPage($.action.planner.join.step1.form());">레디플래너 가입 신청 하러 가기</a></span>
                </div>
    
                <div class="fixed-box-button">
                    <span class="btn-type-text1 disabled"><button type="button" id="btnLogin">로그인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
                </div>
    
            </div>
            
        </form>
        <%-- //로그인 --%>
        
        <!-- 레디플래너 소개 컨텐츠 -->
        <div class="contain-rdplanner-intro">
            <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_bucket_intro_pc_c.jpg" alt="레디플래너 소개" />
        </div>

    </div>
</div>
<!-- //Body -->

<!-- 팝업 : 플래너번호 입력 -->
<div id="plannerNoLoginPopup" class="layer-popup2">
    <div class="layer-inner">
        <div class="contain-head">
            <p>레디플래너 신청완료 시 <br ><strong>발급받은 플래너 번호</strong>를 입력해 주세요.</p>
        </div>
        <hr class="divline-type1" >
        <div class="contain-body">
        
            <%-- 플래너번호 로그인 --%>
            <form id="loginByPlannerNo" name="loginByPlannerNo">
                <dl class="box-form">
                    <dt>플래너 번호</dt>
                    <dd>
                        <input type="text" name="RDP_MST_NO" maxlength="10" placeholder="플래너 번호 입력" >
                        <label class="form-alert" data-name="플래너 번호"></label>
                    </dd>
                </dl>
            </form>
            <%-- //플래너번호 로그인 --%>
            
            <div class="box-button">
                <span class="btn-type-text1"><button type="button" id="btnPlannerNoLogin">확인</button></span>
            </div>
        </div>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</div>
<!-- //팝업 : 플래너번호 입력 -->

<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
<script>
    $(function () {
        var $areaContent = $(".area-body");
            $frm = $areaContent.find("#frm");
        var $plannerNoLoginPopup = $("#plannerNoLoginPopup");
        var $plannerNoLoginForm = $plannerNoLoginPopup.find("#loginByPlannerNo");
        // 폼
        $frm.validate({
            rules : {
                RDP_MST_ID : { required : true, minlength : 6, maxlength : 20 },
                RDP_MST_PW_TEMP : { required : true, minlength : 6, maxlength : 15, passwordCk : true }
            }
        });
        // 폼
        $plannerNoLoginForm.validate({
            rules : {
                RDP_MST_NO : { required : true }
            }
        });
        // 아이디/비밀번호 입력 
        $areaContent.on("input", ".box-login input", function() {
            $frm.valid();
        });
        // 플래너 로그인
        $areaContent.on("click", "#btnLogin", function() {
            login();
        });
        $areaContent.on("keypress keydown keyup", "input[name='RDP_MST_ID'], input[name='RDP_MST_PW_TEMP']", function(e){
            if(e.keyCode == 13) { 
                login();
                e.preventDefault();
            }
        });
        // 팝업 - 플래너 번호 : 이동
        $plannerNoLoginPopup.on("keypress keydown keyup", function(e){
            if(e.keyCode == 13) { 
                plannerNoLogin();
                e.preventDefault();
            }
        });
        // 팝업 - 플래너 번호 로그인
        $areaContent.on("click", "#plannerNoLogin", function() {
            $.common.layer.open($plannerNoLoginPopup);
        });
        // 플래너 번호 로그인
        $plannerNoLoginPopup.on("click", "#btnPlannerNoLogin", function() {
            plannerNoLogin();
        });
        // 로그인
        function login() {
            if ($frm.valid()) {
                $frm.find("input[name='RDP_MST_PW']").val(hex_sha512($frm.find("input[name='RDP_MST_PW_TEMP']").val()).toString());
                $frm.find("input[name='RDP_MST_PW_TEMP']").attr("name", "");
                $frm.postSubmit($.action.planner.login.byIdPw());
            }
        }
        // 플래너 번호 로그인
        function plannerNoLogin() {
            if ($plannerNoLoginForm.valid()) {
                $plannerNoLoginForm.postSubmit($.action.planner.login.byPlannerNo());
            }
        }
    });
</script>
</body>
</html>