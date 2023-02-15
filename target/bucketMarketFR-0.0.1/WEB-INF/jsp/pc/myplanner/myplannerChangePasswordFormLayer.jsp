<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">비밀번호 변경</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">

            <form id="changePasswordForm" name="changePasswordForm">
                <input type="hidden" name="RDP_MST_PW_OLD">
                <input type="hidden" name="RDP_MST_PW">
                <input type="hidden" name="RDP_MST_PW_CHECK">
            
                <!-- 팝업본문 -->
                <div class="content-rdmember-layer01">                   
                    <dl class="box-form">
                        <dt>기존 비밀번호</dt>
                        <dd><input type="password" name="RDP_MST_PW_OLD_TEMP" placeholder="영문,숫자,특수문자 2가지 이상 6~15자 이내"></dd>
                        <dd class="form-alert" message-target="RDP_MST_PW_OLD_TEMP" data-name="기존 비밀번호"></dd>
                    </dl>
                    <dl class="box-form">
                        <dt>새 비밀번호</dt>
                        <dd><input type="password" id="rdpMstPw" name="RDP_MST_PW_TEMP" placeholder="영문,숫자,특수문자 2가지 이상 6~15자 이내"></dd>
                        <dd class="form-alert" message-target="RDP_MST_PW_TEMP" data-name="새 비밀번호"></dd>
                    </dl>
                    <dl class="box-form">
                        <dt>새 비밀번호 확인</dt>
                        <dd><input type="password" name="RDP_MST_PW_CHECK_TEMP" placeholder="영문,숫자,특수문자 2가지 이상 6~15자 이내" maxlength="15">
                        <dd class="form-alert" message-target="RDP_MST_PW_CHECK_TEMP" data-name="새 비밀번호"></dd>
                        </dd>
                    </dl>
                </div>
                <!-- //팝업본문 -->
    
                <!-- 하단 고정버튼 -->
                <div class="fixed-box-button">
                    <span class="btn-type-text1 disabled"><button type="button" id="btnSave">확인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
                </div>
                <!-- //하단 고정버튼 -->
                
            </form>

        </div>
    </div>
    <!-- //본문 -->
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $changePasswordForm = $layerPopup.find("#changePasswordForm");
    // 폼
    $changePasswordForm.validate({
        rules : {
            RDP_MST_PW_OLD_TEMP : { required : true, minlength : 6, maxlength : 15 },
            RDP_MST_PW_TEMP : { required : true, minlength : 6, maxlength : 15, passwordCk : true  },
            RDP_MST_PW_CHECK_TEMP : { required : true, minlength : 6, maxlength : 15, equalTo : "#rdpMstPw", passwordCk : true  }
        }
    });
    // 유효성 검사
    $changePasswordForm.valid();
    // 확인
    $changePasswordForm.on("click", "#btnSave", function() {
        if ($changePasswordForm.valid()) {
            $changePasswordForm.find("input[name='RDP_MST_PW_OLD']").val(hex_sha512($changePasswordForm.find("input[name='RDP_MST_PW_OLD_TEMP']").val()).toString());
            $changePasswordForm.find("input[name='RDP_MST_PW']").val(hex_sha512($changePasswordForm.find("input[name='RDP_MST_PW_TEMP']").val()).toString());
            $changePasswordForm.find("input[name='RDP_MST_PW_OLD_TEMP']").attr("name", "");
            $changePasswordForm.find("input[name='RDP_MST_PW_TEMP']").attr("name", "");
            $changePasswordForm.find("input[name='RDP_MST_PW_CHECK_TEMP']").attr("name", "");
            $.postSyncJsonAjax($.action.myplanner.change.password.form.ajax(), $changePasswordForm.serializeObject(), function (data) {
                if (data.isSuccess) {
                    alert("비밀번호 변경이 정상적으로 저장되었습니다.");
                    $.common.layer.close($layerPopup);
                } else {
                    if (data.message) {
                        alert(data.message);
                    } else {
                        alert("변경 요청이 실패하였습니다.");
                    }
                    $.common.layer.close($layerPopup);
                }
            });
        }
    });
});
</script>