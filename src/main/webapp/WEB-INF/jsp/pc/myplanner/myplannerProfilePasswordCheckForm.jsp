<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/myplanner.css">
</head>
<body class="">

<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>

<jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
    <jsp:param name="oneDepth" value="My레디플래너"/>
    <jsp:param name="oneDepthKey" value="myplanner.campaign.product.list"/>
</jsp:include>

<!-- Body -->
<div class="area-body">
    <div class="area-inner">

        <div class="wrap">

            <%-- 좌측 메뉴 --%>
            <jsp:include page="/WEB-INF/jsp/pc/include/aside.jsp" flush="false">
                <jsp:param name="asideTitle" value="My 레디플래너"/>
                <jsp:param name="asideGroup" value="myplanner_pc"/>
            </jsp:include>
            <%-- 정지 상태 안내 --%>

            <div class="contain-body">
                <div class="content-header">
                    <h3 class="title">비밀번호 확인</h3>
                </div>
                
                <form id="frm" name="frm">
                    <input type="hidden" name="RDP_MST_PW">

                    <div class="content-password-box">
                        <div class="box-password">
                            <p class="text-title">개인정보 안전하게 보호하기 위해 비밀번호를 확인하고 있습니다.<br /><br />비밀번호를 입력해 주세요.</p> 
                        
                            <div class="box-form">
                                <input type="password" name="RDP_MST_PW_TEMP" placeholder="영문,숫자,특수문자 2가지 이상 6~15자 이내" maxlength="15" >
                                <label class="form-alert <c:if test="${not empty errorMessage }">ver2</c:if>" message-target="RDP_MST_PW_TEMP" data-name="비밀번호"><c:out value="${errorMessage }" /></label>
                            </div>
                        
                            <span class="btn-type-text1 disabled"><!-- 비활성화 시 disabled 클래스 추가 -->
                                <button type="button" id="btnNext">확인</button>
                            </span>
                        </div>
                    </div>
                    
                </form>
                
            </div>
        </div>

    </div>
</div>
<!-- //Body -->

<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
<script>
    $(function () {
        var $areaContent = $(".area-body"),
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