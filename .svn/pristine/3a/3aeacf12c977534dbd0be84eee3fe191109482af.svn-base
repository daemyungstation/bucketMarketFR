<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/search.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title|search"/>
        <jsp:param name="headerTitle" value="나만의 맞춤 추천"/>
    </jsp:include>
    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <c:if test="${empty commandMap.searchCrtKwdIdxs or fn:length(commandMap.searchCrtKwdIdxs) eq 0}">
                <div class="contain-curation">
                    <div class="box-curation-head">
                        <h2>나에게 딱 맞는 상품</h2>
                        <p class="text-information-type2">지금 바로 추천해 드립니다.<br />1분도 안걸려요~ </p>
                        <hr class="divline-type1" >
                    </div>
                    <c:forEach var="row" items="${curationList }" varStatus="stat">
                        <div class="box-curation-step">
                            <h3><span class="text-point1">STEP <c:out value="${stat.index + 1 }"/></span><c:out value="${row.CRT_MST_QST }"/></h3>
                            <div class="box-curation-icon">
                                <c:forEach var="keywordRow" items="${row.keywordList }">
                                    <span class="curation-icon" data-key="<c:out value="${keywordRow.CRT_KWD_IDX }"/>">
                                        <a href="javascript:;">#<c:out value="${fn:replace(keywordRow.CRT_KWD_SLT, '#', '') }"/></a>
                                    </span>
                                </c:forEach>
                            </div>
                            <hr class="divline-type1" >
                        </div>
                    </c:forEach>
                </div>
                <div class="fixed-box-button">
                    <span class="btn-type-text1 disabled"><button>결과보기</button></span>
                </div>
            </c:if>
            <c:if test="${not empty commandMap.searchCrtKwdIdxs and fn:length(commandMap.searchCrtKwdIdxs) gt 0}">
                <div class="contain-curation">
                    <c:if test="${empty list }">
                        <p class="text-empty-data"><span class="text-point1">선택하신 키워드</span>에 대한<br />상품 검색 결과가 없습니다.</p>
                    </c:if>
                    <c:if test="${not empty list }">
                        <div class="box-curation-head">
                            <h2>내가 선택한 키워드는</h2>
                        </div>
                    </c:if>
                    <div class="box-curation-step">
                        <div class="box-curation-icon">
                            <c:forEach var="row" items="${curationKeywordList }">
                                <span class="curation-icon on"><a href="javascript:;">#<c:out value="${fn:replace(row.CRT_KWD_SLT, '#', '') }"/></a></span>
                            </c:forEach>
                        </div>
                        <span class="btn-type-text4"><button onclick="javascript:$.requestPage($.action.display.curation.list());">다시하기</button></span>
                    </div>
                </div>
                <c:if test="${not empty list }">
                    <div class="box-curation-list">
                        <c:forEach var="row" items="${list }">
                            <ui:productList info="${row }" thubnailSize="750" type="type2"/>
                        </c:forEach>
                        <div class="paginate">
                            <ui:paging paging="${paging }" jsFunction="paging"/>
                        </div>
                    </div>
                </c:if>
            </c:if>
        </div>
    </div>
    <%-- //본문 --%>
    <%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <c:if test="${empty commandMap.searchCrtKwdIdxs or fn:length(commandMap.searchCrtKwdIdxs) eq 0}">
        <script>
            $(function () {
                var $areaContent = $(".area-content");
                <%-- 선택 키워드 클릭 이벤트 --%>
                $areaContent.on("click", ".curation-icon", function () {
                    $(this).toggleClass("on");
                    var $step = $areaContent.find(".box-curation-step");
                    if ($step.find(".curation-icon").filter(".on").length > 0) {
                        $areaContent.find(".btn-type-text1").removeClass("disabled");
                    } else {
                        $areaContent.find(".btn-type-text1").addClass("disabled");
                    }
                });
                <%-- 결과보기 버튼 클릭 이벤트 --%>
                $areaContent.on("click", ".btn-type-text1", function () {
                    if ($(this).hasClass("disabled")) {
                        alert("키워드를 선택해 주세요.");
                        return;
                    }
                    var params = new Array();
                    $areaContent.find(".curation-icon").filter(".on").each(function () {
                        params.push($(this).data("key")); 
                    });
                    $.requestPage($.action.display.curation.list(), {searchCrtKwdIdxs : params});
                });
            });
        </script>
    </c:if>
</body>
</html>