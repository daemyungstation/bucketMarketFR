<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 상태 : 해제요청 --%>
<c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_REQUEST_RELEASE }">

<script>
    $(function () {
        closePopup1($(".layer-popup1"));
        alert("해제 요청 처리중입니다.\n처리 결과는 회원님의 휴대폰 번호로 통보됩니다.");
    });
</script>

</c:if>
<%-- 상태 : 해제요청 --%>

<%-- 상태 : 이용제한,해제요청 상태가 아닌 경우 --%>
<c:if test="${info.RDP_MST_STATE ne Code.PLANNER_STATE_STOP and info.RDP_MST_STATE ne Code.PLANNER_STATE_REQUEST_RELEASE }">

<script>
    $(function () {
        closePopup1($(".layer-popup1"));
        alert("플래너 정지 상태가 아닙니다.");
    });
</script>

</c:if>
<%-- 상태 : 이용제한,해제요청 상태가 아닌 경우 --%>

<%-- 상태 : 이용제한 --%>
<c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_STOP }">

<div id="divLayerInner" class="layer-inner">
    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">해제요청</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer layer-button"> <!-- 하단 버튼있을 경우 layer-button 추가 -->
        <div class="area-inner">

            <%-- 해제 요청 --%>
            <form id="releaseRequestForm" name="releaseRequestForm">

                <!-- 팝업본문 -->
                <div class="contain-commen-head">
                    <p class="text-normal-type1">레디플래너 해제 요청은 1회 제공되며,<br />처리 결과는 회원님의 휴대폰 번호로 통보됩니다.</p>
                    <dl class="box-form">
                        <dt class="necessary">내용</dt>
                        <dd>
                            <span class="form-textarea">
                                <textarea name="RDP_MST_RLS_RSN" placeholder="해제 요청 사유를 입력해 주세요" onkeyup="StringUtil.getStrLength(this, '.byte', 500);"></textarea>
                                <i><span class="byte">0</span>/500</i>
                            </span>
                        </dd>
                    </dl>
                </div>
    
                <!-- 하단 고정버튼 -->
                <div class="fixed-box-button">
                    <span class="btn-type-text1 disabled"><button type="button" id="btnSave">확인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
                </div>
                <!-- //하단 고정버튼 -->
            
            </form>

        </div>
    </div>
    <!-- //본문 -->
</div>

<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $releaseRequestForm = $layerPopup.find("#releaseRequestForm");
    // 폼
    $releaseRequestForm.validate({
        rules : {
            RDP_MST_RLS_RSN : { required : true }
        }
    });
    // 유효성 검사
    $releaseRequestForm.valid();
    // 확인
    $releaseRequestForm.on("click", "#btnSave", function() {
        if ($releaseRequestForm.valid()) {
            $.postSyncJsonAjax($.action.myplanner.release.request.form.ajax(), $releaseRequestForm.serializeObject(), function (data) {
                if (data.isSuccess) {
                    alert("정상적으로 해제 요청되었습니다.");
                    $.common.layer.close($layerPopup);
                } else {
                    alert("해제 요청이 실패하였습니다.");
                }
            });
        }
    });
});
</script>

</c:if>
<%-- 상태 : 이용제한 --%>