<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 헤더 --%>
<header class="area-header-layer">
    <div class="area-inner">
        <h1 class="title"><c:out value="${term.AGR_MST_TITLE }"/></h1>

        <span class="btn-close"><button>닫기</button></span>
    </div>
</header>
<%-- //헤더 --%>
<%-- 본문 --%>
<div class="area-content-layer">
    <div class="area-inner">
        <div class="contain-provision-layer">
            <h2 class="title" term_key="<c:out value="${term.AGR_MST_IDX }"/>"><c:out value="${term.AGR_MST_TITLE }"/></h2>
            <c:if test="${not empty termPrevList }">
                <c:forEach var="row" items="${termPrevList }">
                    <c:if test="${term.AGR_MST_IDX ne row.AGR_MST_IDX }">
                        <h2 class="title" term_key="<c:out value="${row.AGR_MST_IDX }"/>"  style="display: none;"><c:out value="${row.AGR_MST_TITLE }"/></h2>
                    </c:if>
                </c:forEach>
            </c:if>
            <div class="box-agreement scroll">
                <div class="box-inner" term_key="<c:out value="${term.AGR_MST_IDX }"/>">
                    <c:out value="${term.AGR_MST_CONTENTS }" escapeXml="false"/>
                </div>
                <c:if test="${not empty termPrevList }">
                    <c:forEach var="row" items="${termPrevList }">
                        <c:if test="${term.AGR_MST_IDX ne row.AGR_MST_IDX }">
                            <div class="box-inner" term_key="<c:out value="${row.AGR_MST_IDX }"/>" style="display: none;">
                                <c:out value="${row.AGR_MST_CONTENTS }" escapeXml="false"/>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <c:if test="${not empty termPrevList }">
                <span class="form-select">
                    <select class="prev-term-select">
                        <c:forEach var="row" items="${termPrevList }">
                            <option value="<c:out value="${row.AGR_MST_IDX }"/>"><ui:formatDate value="${row.AGR_MST_CRT_DAY }" pattern="개정일: yyyy.MM.dd"/></option>
                        </c:forEach>
                    </select>
                </span>
        </c:if>
    </div>
</div>
<%-- //본문 --%>
<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $areaInner = $layerPopup.find(".area-inner:eq(1)");
    $layerPopup.on("change", ".prev-term-select", function () {
        $areaInner.find(".title").hide();
        $areaInner.find(".box-inner").hide();
        $areaInner.find("[term_key='" + $(this).val() + "']").show();
        $layerPopup.find("h1.title").text($layerPopup.find(".title[term_key='" + $(this).val() + "']").text());
    });
});
</script>