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
    <jsp:param name="headerGroup" value="historyback|title|search"/>
    <jsp:param name="headerTitle" value="비밀번호 확인"/>
</jsp:include>
<!-- //헤더 -->

<!-- 본문 -->
<div class="area-content"> <!-- 하단 탭바일때 aside-tabbar 클래스 추가 -->
    <div class="area-inner">
    
        <form id="frm" name="frm">
            <input type="hidden" name="RDP_MST_PW">

            <div class="box-password-layer">
                <p class="text-information-type2">개인정보 안전하게 보호하기 위해<br />비밀번호를 확인하고 있습니다.<br />비밀번호를 입력해 주세요.</p> 
    
                <div class="box-form">
                    <input type="password" name="RDP_MST_PW_TEMP" placeholder="영문,숫자,특수문자 2가지 이상 6~15자 이내" maxlength="15" >
                    <label class="form-alert <c:if test="${not empty errorMessage }">ver2</c:if>" message-target="RDP_MST_PW_TEMP" data-name="비밀번호"><c:out value="${errorMessage }" /></label>
                </div>
            </div>
    
            <!-- 하단 고정버튼 -->
            <div class="fixed-box-button">
                <span class="btn-type-text1 disabled"><button type="button" id="btnNext">확인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
            </div>
            <!-- //하단 고정버튼 -->
        
        </form>

    </div>
</div>
<!-- //본문 -->

<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>

<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
<script>
    $(function () {
        var $areaContent = $(".area-content"),
            $frm = $areaContent.find("#frm");
        // 폼
        $frm.validate({
            rules : {
                RDP_MST_PW_TEMP : { required : true, minlength : 6, maxlength : 15, passwordCk : true }
            }
        });
        // 서브밋 방지
        $areaContent.on("keyup", "input[name='RDP_MST_PW_TEMP']",  function(e){
            if (e.keyCode == 13) { 
                next();
                e.preventDefault();
            }
        });
        // 비밀번호
        $areaContent.on("input", "input[name='RDP_MST_PW_TEMP']", function() {
            $frm.valid();
        });
        // 확인
        $areaContent.on("click", "#btnNext", function() {
            next();
        });
        // 확인
        function next() {
            if ($frm.valid()) {
                $frm.find("input[name='RDP_MST_PW']").val(hex_sha512($frm.find("input[name='RDP_MST_PW_TEMP']").val()).toString());
                $frm.find("input[name='RDP_MST_PW_TEMP']").attr("name", "");
                $frm.postSubmit($.action.myplanner.profile.password.check.request());
            }
        }
    });
</script>
</body>
</html>