<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/search.css"> 
</head>
<body class="">
    <c:set var="group" value="큐레이션"/>
    <c:set var="page" value="나만의 맞춤추천"/>
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
        <jsp:param name="oneDepth" value="${group }"/>
        <jsp:param name="oneDepthKey" value="board.notice.list"/>
        <jsp:param name="twoDepth" value="${page }"/>
        <jsp:param name="twoDepthKey" value="board.contact.us.form"/>
    </jsp:include>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-inner">
            <div class="contain-curation-box">
                <h3 class="title"><c:out value="${page }"/></h3>
                <c:if test="${empty commandMap.searchCrtKwdIdxs or fn:length(commandMap.searchCrtKwdIdxs) eq 0}">
                    <div class="box-curation-head">
                        <span class="title">나에게 딱 맞는 상품</span>
                        <p>지금 바로 추천해 드립니다.<br />1분도 안걸려요~</p>
                    </div>
                    <c:forEach var="row" items="${curationList }" varStatus="stat">
                        <div class="box-curation-step">
                            <p class="subject">
                                <span class="text-point1">STEP <c:out value="${stat.index + 1 }"/></span>
                                <c:out value="${row.CRT_MST_QST }"/>
                            </p>
                            <div class="box-curation-icon">
                                <c:forEach var="keywordRow" items="${row.keywordList }">
                                    <span class="curation-icon" data-key="<c:out value="${keywordRow.CRT_KWD_IDX }"/>">
                                        <a href="javascript:;">#<c:out value="${fn:replace(keywordRow.CRT_KWD_SLT, '#', '') }"/></a>
                                    </span>
                                </c:forEach>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="box-btn center">
                        <span class="btn-type-text1 disabled">
                            <button>결과 보기</button>
                        </span>
                    </div>
                </c:if>
                <c:if test="${not empty commandMap.searchCrtKwdIdxs and fn:length(commandMap.searchCrtKwdIdxs) gt 0}">
                    <c:if test="${empty list }">
                        <div class="box-curation-head">
                            <div class="box-search-none type2">
                                <p class="text-result"><span class="text-point1">선택하신 키워드 관련 상품</span>은<br>준비중에 있습니다.^^</p>
                            </div>
                            <div class="box-curation-step type3">
                                <div class="box-curation-icon">
                                    <c:forEach var="row" items="${curationKeywordList }">
                                        <span class="keyword"><a href="javascript:;">#<c:out value="${fn:replace(row.CRT_KWD_SLT, '#', '') }"/></a></span>
                                    </c:forEach>
                                </div>
                                <span class="btn-type-text3"><button onclick="javascript:$.requestPage($.action.display.curation.list());">다시하기</button></span>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${not empty list }">
                        <div class="box-curation-head">
                            <span class="title">내가 선택한 키워드는?</span>
                        </div>
                        <div class="box-curation-step type2">
                            <div class="box-curation-icon">
                                <c:forEach var="row" items="${curationKeywordList }">
                                        <span class="curation-icon on"><a href="javascript:;">#<c:out value="${fn:replace(row.CRT_KWD_SLT, '#', '') }"/></a></span>
                                </c:forEach>
                            </div>
                            <span class="btn-type-text3"><button onclick="javascript:$.requestPage($.action.display.curation.list());">다시하기</button></span>
                        </div>
                        <div class="box-store-list array5">
                            <c:forEach var="row" items="${list }">
                                <ui:productList info="${row }" thubnailSize="750" type="type3"/>
                            </c:forEach>
                        </div>
                        <div class="paginate">
                            <ui:paging paging="${paging }" jsFunction="paging"/>
                        </div>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
    <%-- //Body --%>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    <c:if test="${empty commandMap.searchCrtKwdIdxs or fn:length(commandMap.searchCrtKwdIdxs) eq 0}">
        <script>
            $(function () {
                var $areaBody = $(".area-body");
                <%-- 선택 키워드 클릭 이벤트 --%>
                $areaBody.on("click", ".curation-icon", function () {
                    $(this).toggleClass("on");
                    var $step = $areaBody.find(".box-curation-step");
                    if ($step.find(".curation-icon").filter(".on").length > 0) {
                        $areaBody.find(".btn-type-text1").removeClass("disabled");
                    } else {
                        $areaBody.find(".btn-type-text1").addClass("disabled");
                    }
                });
                <%-- 결과보기 버튼 클릭 이벤트 --%>
                $areaBody.on("click", ".btn-type-text1", function () {
                    if ($(this).hasClass("disabled")) {
                        alert("키워드를 선택해 주세요.");
                        return;
                    }
                    var params = new Array();
                    $areaBody.find(".curation-icon").filter(".on").each(function () {
                        params.push($(this).data("key")); 
                    });
                    var params2 = new Array();
                    $areaBody.find(".box-curation-step").each(function () {
                        var param2 = new Array();
                        $(this).find(".curation-icon").filter(".on").each(function () {
                            param2.push($(this).data("key")); 
                        });
                        if(param2.length > 0) {
                            params2.push(param2.join(","));
                        }
                    });
                    $.requestPage($.action.display.curation.list(), {searchCrtKwdIdxs : params, searchCrtKwdIdxArys : params2});
                });
            });
        </script>
    </c:if>
</body>
</html>