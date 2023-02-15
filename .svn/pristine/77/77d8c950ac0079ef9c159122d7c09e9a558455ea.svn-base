<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/search.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|form-header-search"/>
        <jsp:param name="headerTitle" value="검색"/>
        <jsp:param name="searchword" value="${not empty commandMap.searchPrdMstNm ? commandMap.searchPrdMstNm : commandMap.searchPrdMstKwd }"/>
    </jsp:include>
    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-search">
                <c:if test="${not empty commandMap.searchPrdMstNm or not empty commandMap.searchPrdMstKwd}">
                    <c:if test="${empty list }">
                        <div class="box-information-searchresult">
                            <p class="text-information-type1 notice4"><u class="text-point2"><c:out value="${not empty commandMap.searchPrdMstNm ? commandMap.searchPrdMstNm : commandMap.searchPrdMstKwd }"/></u>에 대한<br />검색 결과가 없습니다.</p>
                            <ul class="text-information-list1">
                                <li>검색어 단어수를 줄여 검색해 보세요.</li>
                                <li>일반적인 문구로 다시 검색해 보세요.</li>
                                <li>단어의 철자가 정확한지 확인해 주세요.</li>
                            </ul>
                        </div>
                        <hr class="box-search-underline">
                        <c:if test="${not empty keywordList}">
                            <div class="box-hotkeyword">
                                <h2 class="title">지금 뜨고 있는 <span class="text-point1">핫 키워드</span></h2>
                                <c:forEach var="row" items="${keywordList }">
                                    <span class="keyword">
                                        <c:if test="${row.PPL_WRD_SCH eq Const.KEYWORD_TYPE_SEARCH }">
                                            <a href="javascript:requestPage(1, '', '<c:out value="${row.PPL_WRD_TEXT }"/>');">
                                                <c:out value="${row.PPL_WRD_TEXT }"/>
                                            </a>
                                        </c:if>
                                        <c:if test="${row.PPL_WRD_SCH eq Const.KEYWORD_TYPE_LINK }">
                                            <a href="javascript:$.requestLink('<c:out value="${row.PPL_WRD_URL }"/>', '<c:out value="${Const.LINK_TARGET_HREF }"/>');">
                                                <c:out value="${row.PPL_WRD_TEXT }"/>
                                            </a>
                                        </c:if>
                                    </span>
                                </c:forEach>
                            </div>
                        </c:if>
                    </c:if>
                    <c:if test="${not empty list }">
                        <div class="box-search-result">
                            <p class="text-information-type2"><strong class="text-point2">총 <fmt:formatNumber value="${totalCount }" type="number"/>개</strong>의 상품이 검색 되었습니다.</p>
                            <hr class="divline-type1">
                        </div>
                        <div class="box-product-list">
                            <c:forEach var="row" items="${list }">
                                <ui:productList info="${row }" thubnailSize="750" type="type2"/>
                            </c:forEach>
                            <div class="paginate">
                               <ui:paging paging="${paging }" jsFunction="paging"/>
                            </div>
                        </div>
                    </c:if>
                </c:if>
                <c:if test="${empty commandMap.searchPrdMstNm and empty commandMap.searchPrdMstKwd}">
                    <div class="box-tab-head">
                        <span <c:if test="${commandMap.latelyYn ne 'Y' }">class="on"</c:if>><button>인기 키워드</button></span>
                        <span <c:if test="${commandMap.latelyYn eq 'Y' }">class="on"</c:if>><button class="lately-button">최근 본 상품</button></span>
                    </div>
                    <div class="box-tab-body tab1  <c:if test="${commandMap.latelyYn ne 'Y' }">on</c:if>">
                        <c:if test="${not empty keywordList}">
                            <div class="box-hotkeyword">
                                <h2 class="title">지금 뜨고 있는 <span class="text-point1">핫 키워드</span></h2>
                                <c:forEach var="row" items="${keywordList }">
                                    <span class="keyword">
                                        <c:if test="${row.PPL_WRD_SCH eq Const.KEYWORD_TYPE_SEARCH }">
                                            <a href="javascript:requestPage(1, '', '<c:out value="${row.PPL_WRD_TEXT }"/>');">
                                                <c:out value="${row.PPL_WRD_TEXT }"/>
                                            </a>
                                        </c:if>
                                        <c:if test="${row.PPL_WRD_SCH eq Const.KEYWORD_TYPE_LINK }">
                                            <a href="javascript:$.requestLink('<c:out value="${row.PPL_WRD_URL }"/>', '<c:out value="${Const.LINK_TARGET_HREF }"/>');">
                                                <c:out value="${row.PPL_WRD_TEXT }"/>
                                            </a>
                                        </c:if>
                                    </span>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                    <div class="box-tab-body tab2 <c:if test="${commandMap.latelyYn eq 'Y' }">on</c:if>">
                        <c:if test="${empty list }">
                            <p class="text-empty-data">최근 본 상품이 없습니다.</p>
                        </c:if>
                        <c:if test="${not empty list }">
                            <div class="box-product-list">
                                <c:forEach var="row" items="${list }">
                                    <ui:productList info="${row }" thubnailSize="750" type="type2"/>
                                </c:forEach>
                                <div class="paginate">
                                   <ui:paging paging="${paging }" jsFunction="paging"/>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <%-- //본문 --%>
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <script>
        $(function () {
            var $areaHeader = $(".area-header"),
                $areaContent = $(".area-content");
            <%-- 검색엔터 이벤트 --%>
            $areaHeader.on("keyup", "#searchword", function (e) {
                e.preventDefault();
                if (e.keyCode == 13) {
                    requestPage(1, $(this).val(), "");
                }
            });
            <%-- 검색버튼 클릭 이벤트 --%>
            $areaHeader.on("click", ".btn-search", function (e) {
                e.preventDefault();
                requestPage(1, $areaHeader.find("#searchword").val(), "");
                
            });
            <%-- 페이징 --%>
            paging = function (cPage) {
                requestPage(cPage, "<c:out value="${commandMap.searchPrdMstNm}"/>", "<c:out value="${commandMap.searchPrdMstKwd}"/>");
            };
            <%-- 목록 호출 --%>
            requestPage = function (cPage, searchPrdMstNm, searchPrdMstKwd) {
                var params = {
                    cPage : cPage,
                    searchPrdMstNm : searchPrdMstNm,
                    searchPrdMstKwd : searchPrdMstKwd
                };
                $.requestPage($.action.common.search.list(), params);
            };
        });
    </script>
</body>
</html>