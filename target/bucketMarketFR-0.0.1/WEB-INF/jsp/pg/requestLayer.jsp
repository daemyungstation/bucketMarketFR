<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 헤더 --%>
<header class="area-header-layer">
    <div class="area-inner">
        <h1 class="title">전자청약 상품가입 신청</h1>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</header>
<%-- //헤더 --%>
<%-- 본문 --%>
<div class="area-content-layer">
    <div class="area-inner">
        <iframe name="paymentGate" width="100%" height="100%" frameborder="no" border="0" style="display:block; width:100vw; height: 100vh">
        </iframe>
        <form id="pgForm" name="pgForm" method="POST" accept-charset="EUC-KR">
            <c:forEach var="item" items="${info }">
                <input type="hidden" name="<c:out value="${item.key }"/>" value="<c:out value="${item.value }"/>"/>
            </c:forEach>
        </form>
    </div>
</div>
<%-- //본문 --%>
<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $pgForm = $layerPopup.find("#pgForm");
    $pgForm.postSubmit("<spring:eval expression="@pg['pg.mobile.domain']"/>", "paymentGate");
    layerClose = function () {
        $.common.layer.close($layerPopup);
    };
});
</script>