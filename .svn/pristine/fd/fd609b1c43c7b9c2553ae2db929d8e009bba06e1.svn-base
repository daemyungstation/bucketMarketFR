<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 헤더 --%>
<header class="area-header-layer">
    <div class="area-inner">
        <h1 class="title">댓글 작성</h1>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</header>
<%-- //헤더 --%>
<%-- 본문 --%>
<div class="area-content-layer area-pad">
    <div class="area-inner">
        <form name="replyForm" id="replyForm" onsubmit="return false">
            <input type="hidden" name="PLN_MST_IDX" value="<c:out value="${commandMap.PLN_MST_IDX }"/>"/>
            <div class="contain-comment">
                <span class="form-textarea">
                    <textarea name="PLN_RPL_CTS" id="PLN_RPL_CTS" placeholder="내용을 입력해 주세요" onkeyup="StringUtil.getStrLength(this, '.byte', 600);" maxlength="600"></textarea>
                    <i><span class="byte">0</span>/600</i>
                    <label class="form-alert" message-target="PLN_RPL_CTS" data-name="내용"></label>
                </span>
                <div class="box-form">
                    <span>
                        <input type="text" name="PLN_RPL_NM" id="PLN_RPL_NM" placeholder="이름" maxlength="10"/>
                        <label class="form-alert" message-target="PLN_RPL_NM" data-name="이름"></label>
                    </span>
                    <span>
                        <input type="password" name="PLN_RPL_PW" id="PLN_RPL_PW" placeholder="비밀번호"/>
                        <label class="form-alert" message-target="PLN_RPL_PW" data-name="비밀번호"></label>
                    </span>
                </div>
            </div>
            <hr class="divline-type2">
            <div class="contain-comment">
                <h3 class="title">유의사항</h3>
                <div class="list-type2">
                    <ul>
                        <li>기획전과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 게시글이 삭제 조치 될 수 있습니다.</li>
                    </ul>
                </div>
            </div>
            <%-- 하단 고정버튼 --%>
            <div class="fixed-box-button">
                <span class="btn-type-text1 disabled"><button>저장</button></span><%-- 활성화 버튼 --%><%-- 비활성화 시 disabled 클래스 추가 --%>
            </div>
            <%-- //하단 고정버튼 --%>
        </form>
    </div>
</div>
<%-- //본문 --%>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
<script>
    $(function () {
        var $layerPopup = $(".layer-popup1"),
            $replyForm = $layerPopup.find("#replyForm");
        
        <%-- 폼 유효성 체크 및 전송 이벤트 --%>
        $replyForm.validate({
            rules : {
                PLN_RPL_CTS : {
                    required : true
                },
                PLN_RPL_NM : {
                    required : true
                },
                PLN_RPL_PW : {
                    required : true,
                    engOrNum : true,
                    rangelength : [6, 10]
                }
            },
            submitHandler : function(form) {
                if (confirm("저장 하시겠습니까?")) {
                    var $form = $(form);
                    $form.find("input[name='PLN_RPL_PW']").val(hex_sha512($form.find("input[name='PLN_RPL_PW']").val()).toString());
                    $.postSyncJsonAjax($.action.marketing.plan.reply.regist.ajax(), $form.serializeObject(), function (data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다.");
                            $.callback();
                            $.common.layer.close($layerPopup);
                        }
                    });
                }
            }
        });
    });
</script>