<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="layer-inner">
    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">CMS 결제수단 변경 신청</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">

            <div class="contain-history-subscripton1 type3">
                <dl>
                    <dt><span class="num-member"><c:out value="${info.MEM_NM }"/>&nbsp/&nbsp회원번호 <c:out value="${info.ACCNT_NO }"/></span><c:out value="${info.PRD_MST_NM }"/></dt>
                    <dd class="date"><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" /></dd>
                    <dd class="stat">가입(<c:out value="${info.PAY_MTHD_NM }"/>)</dd>
                </dl>
            </div>

            <hr class="divline-type2" >
            
            <%-- 결제수단 변경 폼 --%>
            <form id="paymentMethodForm">
                <input type="hidden" name="ORD_MST_IDX" value="<c:out value="${info.ORD_MST_IDX }"/>">

                <div class="contain-changepayment">
                    <p class="text-normal-type1" style="margin-bottom:20px">※ 신청정보 확인 후, 해피콜 가능시간에 연락을 드립니다.</p>
                    <h2 class="title">결제수단 정보</h2>
                    <dl class="box-form">
                        <dt><span>은행명</span></dt>
                        <dd>
                            <span class="form-select">
                                <select name="CLM_ACT_BNK">
                                    <option value="">선택</option>
                                    <c:forEach var="item" items="${codes.INICIS_BANK_CODE }">
                                        <option value="<c:out value="${item.CMN_COM_IDX }" />">
                                            <c:out value="${item.CMN_COM_NM }" />
                                        </option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="text-form-notice2">* 변경 신청 시에는 가입자명과 동일한 계좌만 가능합니다.</span>
                        </dd>
                    </dl>
                    <dl class="box-form">
                        <dt><span>계좌번호</span></dt>
                        <dd><span class="form-text"><input type="text" class="number" name="CLM_ACT_BNK_ACT" placeholder="" maxlength="20"></span>
                        <span class="text-form-notice2">※ 휴대폰 번호 등 평생 계좌는 등록이 불가능합니다.</span></dd>
                    </dl>
                    <dl class="box-form type2">
                        <dt><span>납부일자 <br >선택</span></dt>
                        <dd>
                            <div class="form-date-pay">
                                <c:forEach var="item" items="${codes.CLAIM_PAYMENT_METHOD_PAY_DT }">
                                    <label class="form-radio"><input type="radio" name="CLM_ACT_PAY_DT" value="<c:out value="${item.CMN_COM_IDX }" />"><c:out value="${item.CMN_COM_NM }" /></label>
                                </c:forEach>
                            </div>
                        </dd>
                    </dl>
                    <dl class="box-form">
                        <dt><span>해피콜 <br >가능 시간</span></dt>
                        <dd>
                            <span class="form-select">
                                <select name="CLM_ACT_HPC">
                                    <c:forEach var="item" items="${codes.HAPP_CALL }">
                                        <option value="<c:out value="${item.CMN_COM_IDX }" />">
                                            <c:out value="${item.CMN_COM_NM }" />
                                        </option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="text-form-notice2">* 18시 이후에는 해피콜을 운영하지 않습니다.</span>
                        </dd>
                    </dl>
                </div>

                <hr class="divline-type2">

                <div class="contain-information-card2">

                    <p class="text-notice-type1">유의사항</p>
                    <ul class="list-type2">
                        <li>결제 계좌 변경에는 3영업일이 소요됩니다. (결제계좌 변경 후 접수 신청을 하셔도 계좌정보는 이전 계좌가 나옵니다.)</li>
                        <li>계좌정보에 특이사항이 있을 경우 정상 신청되지 않을 수 있으며, 컨택센터에서 연락을 드립니다.</li>
                        <li>정보가 검색되지 않을 경우는 컨택센터 (1588 - 8511) 로 문의 바랍니다.</li>
                    </ul>
                </div>
    
                <!-- 하단 고정버튼 -->
                <div class="fixed-box-button">
                    <span class="btn-type-text1 disabled"><button>신청하기</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
                </div>
                <!-- //하단 고정버튼 -->
            
            </form>
            <%-- 결제수단 변경 폼 --%>

        </div>
    </div>
    <!-- //본문 -->
</div>

<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $paymentMethodForm = $layerPopup.find("#paymentMethodForm");
    // 신청하기
    $paymentMethodForm.validate({
        rules : {
            CLM_ACT_BNK : { required : true },
            CLM_ACT_BNK_ACT : { required : true, maxlength : 20 },
            CLM_ACT_PAY_DT : { required : true },
            CLM_ACT_HPC : { required : true }
        },
        submitHandler : function(form) {
            if (confirm("신청하시겠습니까?")) {
                $.postSyncJsonAjax($.action.mycontract.paymentmethod.cms.ajax(), $(form).serializeObject(), function (data) {
                    if (data.isSuccess) {
                        alert("CMS 결제수단변경 신청이 완료되었습니다.");
                        $.common.layer.close($layerPopup);
                    } else {
                        alert("CMS 결제수단변경 신청이 실패하였습니다.");
                    }
                });
            }
        }
    });
    $paymentMethodForm.valid();
});
</script>