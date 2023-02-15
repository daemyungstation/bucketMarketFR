<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contain-head">
    <p class="text-title-type2">
        <c:out value="${fn:replace(commandMap.title, newLineChar, '<br/>') }" escapeXml="false"/>
    </p>
</div>
<hr class="divline-type1" >
<div class="contain-body">
    <form name="loginForm" id="loginForm" onsubmit="return false">
        <div class="box-form">
            <input type="text" name="USER_NM" placeholder="이름">
            <label class="form-alert" message-target="USER_NM" data-name="이름"></label>
            <input type="password" name="USER_PWD" placeholder="비밀번호">
            <label class="form-alert" message-target="USER_PWD" data-name="비밀번호"></label>
        </div>
        <span class="btn-type-text1"><button>확인</button></span>
    </form>
</div>
<span class="btn-close btn-layer-close"><button>닫기</button></span>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
<script>
$(function () {
    var $layerPopup = $(".layer-popup2"),
        $loginForm = $layerPopup.find("#loginForm");
    <%-- 폼 유효성 체크 --%>
    $loginForm.validate({
        rules : {
            USER_NM : {
                required : true
            },
            USER_PWD : {
                required : true
            }
        },
        submitHandler : function(form) {
            var sessionYn = "<c:out value="${commandMap.sessionYn }"/>",
                userNm = form.USER_NM.value,
                userPwd = hex_sha512(form.USER_PWD.value).toString();
            if (sessionYn == "Y") {
                var $form = $(form);
                $form.find("input[name='USER_PWD']").val(userPwd);
                $.postSyncJsonAjax($.action.common.board.login.ajax(), $form.serializeObject(), function (data) {
                    if (data.isSuccess) {
                        $.callback(userNm, userPwd);
                        $.common.layer.close($layerPopup);
                    }
                });
            } else {
                $.callback(userNm, userPwd);
                $.common.layer.close($layerPopup);
            }
        }
    });
});
</script>