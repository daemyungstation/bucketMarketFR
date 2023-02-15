<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="layer-inner">
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

                <div class="contain-lifeservice">

                    <p class="text-normal-type1">* 신청일로부터 영업일 2~3일 이내의 해피콜을 드립니다.</p>

                    <ul class="list-lifeservice">
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_LANGUAGE_STUDY_ABROAD }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_lifeservice6.png" alt="" >어학연수</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_GOLF }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_lifeservice8.png" alt="" >골프</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_CRUISE }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_lifeservice7.png" alt="" >크루즈</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_TRAVEL }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_lifeservice1.png" alt="" >여행</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_WEDDING }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_lifeservice2.png" alt="" >웨딩</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_INTERDEPENDENCE }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_lifeservice7.png" alt="" >상조</button></li>
                        <li><button type="button" class="lifeservice" data-code="<c:out value="${Code.LIFE_SERVICE_JEWALRY }"/>"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_lifeservice7.png" alt="" >주얼리</button></li>
                    </ul>

                </div>

                <!-- 하단 고정버튼 -->
                <div class="fixed-box-button">
                    <span class="btn-type-text1 disabled"><button type="button" id="btnApply">신청하기</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
                </div>
                <!-- //하단 고정버튼 -->
            
            </form>
            <%-- 후기 등록 --%>

        </div>
    </div>
    <!-- //본문 -->
</div>

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