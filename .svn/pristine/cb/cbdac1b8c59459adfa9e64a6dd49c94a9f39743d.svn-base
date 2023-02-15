<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">해지신청</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">
        
            <input type="hidden" id="ORD_MST_IDX" value="<c:out value="${info.ORD_MST_IDX }"/>">

            <div class="area-mypage">
                <div class="box-cancel-app">
                    <p class="text-normal-type1">* 신청일로부터 영업일 2~3일 이내 해피콜을 통해 처리됩니다.</p>

                    <div class="table-type1 type2">
                        <table>
                            <colgroup>
                                <col style="width:100px">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>가입자명</th>
                                    <td><c:out value="${info.MEM_NM }"/></td>
                                </tr>
                                <tr>
                                    <th>회원번호</th>
                                    
                                    <%-- 계약 상태 별 분기 --%>
                                    <c:choose>
                                        <%-- 접수 --%>
                                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_RECEIPT }">
                                            <td></td>
                                        </c:when>
                                        <%-- 가입대기 --%>
                                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_WAITING_TO_JOIN }">
                                            <td><c:out value="${info.ACCNT_NO }"/></td>
                                        </c:when>
                                        <%-- 가입 --%>
                                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                                            <td><c:out value="${info.ACCNT_NO }"/></td>
                                        </c:when>
                                    </c:choose>
                                    
                                </tr>
                                <tr>
                                    <th>상품명</th>
                                    <td><c:out value="${info.PRD_MST_NM }"/></td>
                                </tr>
                                <tr>
                                    <th>상품금액</th>
                                    <td><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원</td>
                                </tr>
                                <tr>
                                    <th>납입회차</th>
                                    <td><c:out value="${info.PAY_NO }"/>회</td>
                                </tr>
                                <tr>
                                    <th>납입금액</th>
                                    <td><c:out value="${info.PAY_SUM }"/>원</td>
                                </tr>
                                <tr>
                                    <th>회원상태</th>
                                    
                                    <%-- 계약 상태 별 분기 --%>
                                    <c:choose>
                                        <%-- 접수 --%>
                                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_RECEIPT }">
                                            <td>접수</td>
                                        </c:when>
                                        <%-- 가입대기 --%>
                                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_WAITING_TO_JOIN }">
                                            <td>가입대기</td>
                                        </c:when>
                                        <%-- 가입 --%>
                                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                                            <td>가입</td>
                                        </c:when>
                                    </c:choose>
                                    
                                </tr>
                            </tbody>
                            
                        </table>
                    </div>
                    
                    <div class="box-button-right">
                        <span class="btn-type-text7 type4"><button class="refund">해약환급금 조회</button></span>
                    </div>
                    
                    <div class="box-member-note type3">
                        <span>유의사항</span>
                        <ul class="text-information-list1">
                            <li>증서 수령일로부터 14일 이내에 청약철회 가능하며, 이후부터는 중도해약으로 진행됩니다.</li>
                            <li>단, 상품의 결합혜택에 따라 상이할 수 있습니다. 자세한 사항은 대명아임레디 고객센터 ☎1588-8511에서 전화로 안내해 드립니다.</li>
                        </ul>
                    </div>

                </div>
            </div>

            <div class="fixed-box-button">
                <span class="btn-type-text1"><!-- 비활성화 disabled 클래스명 추가 -->
                    <button id="btnApply">신청하기</button>
                </span>
            </div>

        </div>
    </div>
    <!-- //본문 -->

<script>
$(function () {
    var $layerPopup = $(".layer-popup1");
    // 해약환급금 조회
    $layerPopup.off("click", "button.refund").on("click", "button.refund", function() {
        var params = { ORD_MST_IDX : $layerPopup.find("#ORD_MST_IDX").val() }
        $(".layer-popup4").requestLayer($.action.mycontract.paymentrefund.refund.view.layer(), params, "layer-member1");
    });
    // 신청하기
    $layerPopup.off("click", "#btnApply").on("click", "#btnApply", function() {
        if (confirm("해지신청하시겠습니까?")) {
            var params = { ORD_MST_IDX : $layerPopup.find("#ORD_MST_IDX").val() };
            $.postSyncJsonAjax($.action.mycontract.info.contract.cancel.ajax(), params, function (data) {
                if (data.isSuccess) {
                    alert("해지신청이 완료되었습니다.");
                    $.common.layer.close($layerPopup);
                } else {
                    alert("해지신청이 실패하였습니다.");
                }
            });
        }
    });
});
</script>