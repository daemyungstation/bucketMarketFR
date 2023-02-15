<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">라이프 서비스 신청</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">

        <%-- 라이프 서비스 등록 --%>
        <form id="form" name="form">
            <input type="hidden" name="ORD_MST_IDX" value="${info.ORD_MST_IDX }">
            <input type="hidden" name="CLM_LFS_SVC">

                <div class="box-member-payment">
                    <div class="table-type2 type3">
                        <table>
                            <colgroup>
                            <col width="110px">
                            <col width="auto">
                            <col width="80px">
                            <col width="80px">
                            <col width="90px">
                            <col width="60px">
                            <col width="80px">
                            </colgroup>
                            <tr>
                                <th>회원번호</th>
                                <th>가입상품명</th>
                                <th>가입일자</th>
                                <th>회원상태</th>
                                <th>상품금액</th>
                                <th>납입회차</th>
                                <th>납입금액</th>
                            </tr>
                            <tr>
                                <td class="member-num"><a href="javascript:;"><c:out value="${info.ACCNT_NO }"/></a></td>
                                <td class="member-product"><a href="javascript;"><c:out value="${info.PRD_MST_NM }"/></a></td>
                                <td><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy-MM-dd" /></td>
                                <td>가입</td>
                                <td><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원</td>
                                <td><c:out value="${info.PAY_NO }"/>회</td>
                                <td><fmt:formatNumber value="${info.PAY_SUM }" type="number"/>원</td>                   
                            </tr>
                        </table>
                    </div>
                    <p class="text-normal-type4">· 신청일로부터 영업일 2~3일 이내의 해피콜을 드립니다.</p>
        
                    <div class="contain-lifeservice">
                    <ul class="list-lifeservice">
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_LANGUAGE_STUDY_ABROAD }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_lifeservice6.png" alt="" >어학연수</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_GOLF }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_lifeservice8.png" alt="" >골프</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_CRUISE }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_lifeservice7.png" alt="" >크루즈</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_TRAVEL }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_lifeservice1.png" alt="" >여행</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_WEDDING }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_lifeservice2.png" alt="" >웨딩</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_INTERDEPENDENCE }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_lifeservice7.png" alt="" >상조</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_JEWALRY }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_lifeservice7.png" alt="" >주얼리</button></li>
                    </ul>
                    </div>
                </div>
        
                <div class="fixed-box-button">
                    <span class="btn-type-text1 disabled"><!-- 비활성화 disabled 클래스명 추가 -->
                        <button type="button" id="btnApply">신청하기</button>
                    </span>
                </div>
                
            </form>

        </div>
    </div>
    <!-- //본문 -->

<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $form = $layerPopup.find("#form");
    // 서비스 선택
    $layerPopup.off("click", "button.lifeservice").on("click", "button.lifeservice", function() {
        $(this).closest("li").siblings("li.on").removeClass("on");
        $(this).closest("li").addClass("on");
        $form.find("input[name='CLM_LFS_SVC']").val($(this).attr("data-code"));
        $form.find("#btnApply").closest("span.btn-type-text1").removeClass("disabled");
    });
    // 신청
    $layerPopup.off("click", "#btnApply").on("click", "#btnApply", function() {
        if ($(this).closest("span.btn-type-text1").hasClass("disabled") == false) {
            if (confirm("신청 하시겠습니까?")) {
                $.postSyncJsonAjax($.action.mycontract.lifeservice.apply.ajax(), $form.serializeObject(), function (data) {
                    if (data.isSuccess) {
                        alert("[" + $layerPopup.find("ul.list-lifeservice li.on").find("button.lifeservice").text() + "] 라이프 서비스 신청이 완료되었습니다.");
                        $.common.layer.close($layerPopup);
                    } else {
                        alert("라이프 서비스 신청이 실패하였습니다.");
                    }
                });
            }
        }
    })
});
</script>