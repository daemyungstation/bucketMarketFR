<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">카드 결제수단변경 신청</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">
            
        <%-- 결제수단 변경 폼 --%>
        <form id="paymentMethodForm">
            <input type="hidden" name="ORD_MST_IDX" value="<c:out value="${info.ORD_MST_IDX }"/>">

                <div class="box-member-payment">
                    <div class="table-type2 type2">
                        <table>
                            <colgroup>
                                <col style="width: 200px">
                                <col style="width: auto">
                                <col style="width: 120px">
                                <col style="width: 110px">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>회원번호</th>
                                    <th>가입상품명</th>
                                    <th>가입일자</th>
                                    <th>회원상태</th>
                                </tr>
                                <tr>
                                    <td class="member-num"><a href="javascript;"><c:out value="${info.ACCNT_NO }"/></a></td>
                                    <td class="member-product"><a href="javascript;"><c:out value="${info.PRD_MST_NM }"/></a></td>
                                    <td><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" /></td>
                                    <td class="member-state">가입(<c:out value="${info.PAY_MTHD_NM }"/>)</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
        
                    <div class="contain-changepayment">
                        <h2 class="title-paymentdetail type2">결제수단 정보</h2>
                        <p class="text-normal-type1">· 신청정보 확인 후, 해피콜 가능시간에 연락을 드립니다.</p>
                        <dl class="box-form" style="margin-top:20px;">
                            <dt><span>카드명</span></dt>               
                            <dd>
                                <span class="form-select">
                                    <select name="CLM_ACT_CRD">
                                        <option value="">선택</option>
                                        <c:forEach var="item" items="${codes.INICIS_CARD_CODE }">
                                            <option value="<c:out value="${item.CMN_COM_IDX }" />">
                                                <c:out value="${item.CMN_COM_NM }" />
                                            </option>
                                        </c:forEach>
                                    </select>
                                </span>
                                <span class="text-form-notice2">* 변경 신청 시에는 가입자명과 동일한 계좌/카드만 가능합니다.</span>
                            </dd>
                        </dl>
                        <dl class="box-form">
                            <dt><span>카드번호</span></dt>
                            <dd><span class="form-text"><input type="text" class="number" name="CLM_ACT_CRD_NO" placeholder="" maxlength="20"></span></dd>
                        </dl>
                        <dl class="box-form">
                            <dt><span>유효기간</span></dt>
                            <dd>
                                <div class="form-date-card">
                                    <span class="form-text"><input type="text" class="number" name="CLM_ACT_CRD_YY" placeholder="" maxlength="2"></span><i> 년 /</i>
                                    <span class="form-text"><input type="text" class="number" name="CLM_ACT_CRD_MM" placeholder="" maxlength="2"></span><i> 월</i>
                                </div>
                            </dd>
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
                        <dl class="box-form fixed">
                            <dt>카드출금이체 약관 및 개인정보 제공 동의</dt>
                            <dd>
                                <div class="contain-agreement">
                                    <div class="box-agreement">
                                        <!-- 약관내용 -->
                                        <c:out value="${termInfo.AGR_MST_CONTENTS }" escapeXml="false"/>
                                    </div>
                                    <label class="form-checkbox"><input type="checkbox" name="AGREEMENT_YN" value="Y">동의합니다.</label>
                                </div>
                            </dd>
                        </dl>
                    </div>
        
                    <p class="text-notice-type1">유의사항</p>
                    <ul class="text-information-list1" style="margin-bottom:30px;">
                        <li>결제 계좌 변경에는 3영업일이 소요됩니다. (결제계좌 변경 후 접수 신청을 하셔도 계좌정보는 이전 계좌가 나옵니다.)</li>
                        <li>계좌정보에 특이사항이 있을 경우 정상 신청되지 않을 수 있으며, 컨택센터에서 연락을 드립니다.</li>
                        <li>정보가 검색되지 않을 경우는 컨택센터 (1588 - 8511) 로 문의 바랍니다.</li>
                    </ul>
                </div>
        
                <div class="fixed-box-button">
                    <span class="btn-type-text1 disabled"><!-- 비활성화 disabled 클래스명 추가 -->
                        <button>신청하기</button>
                    </span>
                </div>
                
            </form>

        </div>
    </div>
    <!-- //본문 -->

<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $paymentMethodForm = $layerPopup.find("#paymentMethodForm");
    // checkbox
    checkBox_Ck();//checkbox
    // 신청하기
    $paymentMethodForm.validate({
        rules : {
            CLM_ACT_CRD : { required : true },
            CLM_ACT_CRD_NO : { required : true },
            CLM_ACT_CRD_YY : { required : true, minlength : 2, maxlength : 2 },
            CLM_ACT_CRD_MM : { required : true, minlength : 1, maxlength : 2, min : 1, max : 12 },
            CLM_ACT_PAY_DT : { required : true },
            CLM_ACT_HPC : { required : true },
            AGREEMENT_YN : { required : true }
        },
        submitHandler : function(form) {
            if (confirm("신청하시겠습니까?")) {
                $.postSyncJsonAjax($.action.mycontract.paymentmethod.card.ajax(), $(form).serializeObject(), function (data) {
                    if (data.isSuccess) {
                        alert("카드 결제수단변경 신청이 완료되었습니다.");
                        $.common.layer.close($layerPopup);
                    } else {
                        alert("카드 결제수단변경 신청이 실패하였습니다.");
                    }
                });
            }
        }
    });
    $paymentMethodForm.valid();
});
</script>