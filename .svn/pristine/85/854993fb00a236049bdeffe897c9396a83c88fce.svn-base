<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">정산계좌 변경</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">
            
            <%-- 계좌 예금주 확인용 이름 --%>
            <c:if test="${info.RDP_MST_BUSI_CLS eq Code.PLANNER_BUSINESS_CLASS_PRIVATE }">
                <input id="rdpMstBnkActName" type="hidden" value="<c:out value="${info.RDP_MST_MEM_NM }"/>"> <%-- 개인 --%>
            </c:if>
            <c:if test="${info.RDP_MST_BUSI_CLS eq Code.PLANNER_BUSINESS_CLASS_NATURAL_PERSON }">
                <input id="rdpMstBnkActName" type="hidden" value="<c:out value="${info.RDP_MST_CEO_NM }"/>"> <%-- 사업자 --%>
            </c:if>
            
            <%-- 정산계좌 변경 --%>
            <form id="changeBankForm" name="changeBankForm">

                <!-- 팝업본문 -->
                <div class="contain-commen-head">
                    <p class="text-normal-type1">레디플래너 리워드 정산 계좌 정보를 변경합니다.</p>
    
                    <dl class="box-form">
                        <dt>은행</dt>
                        <dd><span class="form-select">
                            <select name="RDP_MST_BNK_CD">
                                <option value="">은행선택</option>
                                <c:if test="${not empty codes.INICIS_BANK_CODE }">
                                    <c:forEach var="row" items="${codes.INICIS_BANK_CODE }" varStatus="i">
                                        <option value="<c:out value="${row.CMN_COM_IDX }"/>" data-cmn_com_etc1="${row.CMN_COM_ETC1 }" <c:if test="${row.CMN_COM_IDX eq info.RDP_MST_BNK_CD }">selected="selected"</c:if>>
                                            <c:out value="${row.CMN_COM_NM }" />
                                        </option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </span></dd>
                    </dl>
                    <dl class="box-form">
                        <dt>계좌번호</dt>
                        <dd><input type="text" class="number" name="RDP_MST_BNK_ACT" value="<ui:formatBankAccount value="${info.RDP_MST_BNK_ACT }"/>" maxlength="20"></dd>
                        <label class="form-alert" message-target="RDP_MST_BNK_ACT" data-name="계좌번호"></label>
                    </dl>
                    <dl class="box-form">
                        <dt>예금주</dt>
                        <dd><input type="text" name="RDP_MST_ACT_HDR" placeholder="계좌확인 시 자동 입력" readonly="readonly" ></dd>            
                    </dl>
                    <span class="btn-type-text8"><button id="btnCheckBankAccount" type="button">계좌인증</button></span>
                    
                    <input type="hidden" name="RDP_MST_BNK_ACT_CHECK">
                    <label class="form-alert" message-target="RDP_MST_BNK_ACT_CHECK" data-name="계좌인증"></label>
                    <c:if test="${info.RDP_MST_BUSI_CLS eq Code.PLANNER_BUSINESS_CLASS_PRIVATE }">
                        <input type="hidden" name="RDP_MST_BNK_ACT_NAME_CHECK">
                        <label class="form-alert" message-target="RDP_MST_BNK_ACT_NAME_CHECK" data-name="예금주는 사용자 이름과 같아야 합니다."></label>
                    </c:if>
                    <c:if test="${info.RDP_MST_BUSI_CLS eq Code.PLANNER_BUSINESS_CLASS_NATURAL_PERSON }">
                        <input type="hidden" name="RDP_MST_BNK_ACT_NAME_CHECK">
                        <label class="form-alert" message-target="RDP_MST_BNK_ACT_NAME_CHECK" data-name="예금주는 대표자명과 같아야 합니다."></label>
                    </c:if>
                        
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
    
<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $changeBankForm = $layerPopup.find("#changeBankForm");
    // 숫자
    $layerPopup.find(".number, .onlyNumber").each(function() {
        var regex = new RegExp('^[\\d]*$');
        setInputFilter(this, function(value) {
            return regex.test(value);
       });
    });
    // 폼
    $changeBankForm.validate({
        ignore : ".ignore input, .ignore select, .ignore textarea",
        rules : {
            RDP_MST_BNK_CD : { required : true },
            RDP_MST_BNK_ACT : { required : true, number : true },
            RDP_MST_BNK_ACT_NAME_CHECK : { equalTo : "#rdpMstBnkActName" },
            RDP_MST_BNK_ACT_CHECK : { required : true }
        },
        messages : {
            RDP_MST_BNK_ACT_CHECK : { required : "은 필수입니다" },
            RDP_MST_BNK_ACT_NAME_CHECK : { equalTo : "" }
        }
    });
    // 은행 및 계좌
    $layerPopup.off("change", "select[name='RDP_MST_BNK_CD']").on("change", "select[name='RDP_MST_BNK_CD']", function() {
        $layerPopup.find("input[name='RDP_MST_BNK_ACT_CHECK']").val("");
        $layerPopup.find("input[name='RDP_MST_BNK_ACT_NAME_CHECK']").val("");
        $changeBankForm.valid();
    });
    $layerPopup.off("input", "input[name='RDP_MST_BNK_ACT']").on("input", "input[name='RDP_MST_BNK_ACT']", function() {
        $layerPopup.find("input[name='RDP_MST_BNK_ACT_CHECK']").val("");
        $layerPopup.find("input[name='RDP_MST_BNK_ACT_NAME_CHECK']").val("");
        $changeBankForm.valid();
    });
    // 유효성 검사
    $changeBankForm.valid();
    // 계좌 확인
    $layerPopup.off("click", "#btnCheckBankAccount").on("click", "#btnCheckBankAccount", function() {
        if ($layerPopup.find("select[name='RDP_MST_BNK_CD'], input[name='RDP_MST_BNK_ACT']").valid()) {
            var bankCode = $layerPopup.find("select[name='RDP_MST_BNK_CD']").find("option:selected").data("cmn_com_etc1");
            var bankAccount = $layerPopup.find("input[name='RDP_MST_BNK_ACT']").val();
            $.common.check.bankAccount(bankCode, bankAccount, function(data) {
                // 초기화
                $layerPopup.find("input[name='RDP_MST_ACT_HDR']").val("");
                $layerPopup.find("input[name='RDP_MST_BNK_ACT_CHECK']").val("");
                $layerPopup.find("input[name='RDP_MST_BNK_ACT_NAME_CHECK']").val("");
                if (data.isSuccess) {
                    // 계좌정보 출력
                    $layerPopup.find("input[name='RDP_MST_ACT_HDR']").val(data.depositor);
                    $layerPopup.find("input[name='RDP_MST_BNK_ACT_CHECK']").val("Y");
                    if ("<c:out value="${info.RDP_MST_BUSI_CLS }"/>" == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_PRIVATE }"/>") {
                        // 개인
                        $layerPopup.find("input[name='RDP_MST_BNK_ACT_NAME_CHECK']").val(data.depositor);
                    } else if ("<c:out value="${info.RDP_MST_BUSI_CLS }"/>" == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_NATURAL_PERSON }"/>") {
                        // 개인 사업자
                        $layerPopup.find("input[name='RDP_MST_BNK_ACT_NAME_CHECK']").val(data.depositor);
                    } else if ("<c:out value="${info.RDP_MST_BUSI_CLS }"/>" == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_LEGAL_PERSON }"/>") {
                        // 법인 사업자인 경우 예금주 확인을 하지 않음
                        $layerPopup.find("input[name='RDP_MST_BNK_ACT_NAME_CHECK']").val("");
                    }
                    alert("계좌정보가 인증되었습니다.");
                } else {
                    alert(data.message); // 오류 메세지
                }
                $changeBankForm.valid();
            });
        }
    });
    // 확인
    $changeBankForm.off("click", "#btnSave").on("click", "#btnSave", function() {
        if ($changeBankForm.valid()) {
            $.postSyncJsonAjax($.action.myplanner.change.bank.form.ajax(), $changeBankForm.serializeObject(), function (data) {
                if (data.isSuccess) {
                    alert("정산계좌가 정상적으로 변경되었습니다.");
                    $.common.layer.close($layerPopup);
                    document.location.reload();
                } else {
                    alert("정산계좌 변경이 실패하였습니다.");
                }
            });
        }
    });
});
</script>