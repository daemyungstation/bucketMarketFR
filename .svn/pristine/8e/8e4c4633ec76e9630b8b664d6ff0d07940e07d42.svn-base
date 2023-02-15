<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/search.css"> 
</head>
<body class="">
    <jsp:include page="/WEB-INF/jsp/pc/include/header.jsp">
        <jsp:param name="searchword" value="${not empty commandMap.searchPrdMstNm ? commandMap.searchPrdMstNm : commandMap.searchPrdMstKwd }"/>
    </jsp:include>
    <jsp:include page="/WEB-INF/jsp/pc/include/gnb.jsp">
        <jsp:param name="searchword" value="${not empty commandMap.searchPrdMstNm ? commandMap.searchPrdMstNm : commandMap.searchPrdMstKwd }"/>
    </jsp:include>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-inner">
            <div class="contain-search-box">
                <c:if test="${empty list }">
                    <div class="box-search-none">
                        <p class="text-result"><u class="text-point1"><c:out value="${not empty commandMap.searchPrdMstNm ? commandMap.searchPrdMstNm : commandMap.searchPrdMstKwd }"/></u>에 대한<br />검색 결과가 없습니다.</p>
                        <ul class="text-information-list1">
                            <li>검색어 단어수를 줄여 검색해 보세요.</li>
                            <li>일반적인 문구로 다시 검색해 보세요.</li>
                            <li>단어의 철자가 정확한지 확인해 주세요.</li>
                        </ul>
                    </div>
                    <c:if test="${not empty keywordList}">
                        <div class="box-hotkeyword">
                            <p class="title">지금 뜨고 있는 <span class="text-point1">핫 키워드</span></p>
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
                        <p class="text-result">
                            <span class="text-point1">
                                '<c:out value="${not empty commandMap.searchPrdMstNm ? commandMap.searchPrdMstNm : commandMap.searchPrdMstKwd }"/>'
                            </span> 검색결과
                        </p> 총 <span class="text-point1"><fmt:formatNumber value="${totalCount }" type="number"/></span>개의 상품이 검색 되었습니다.
                    </div>
                    <div class="box-product-search type2">
                        <div class="box-category-more">
                            <%-- 인기순(디폴트), 등록순, 지원금 높은 순, 지원금 낮은 순 --%>
                            <button class="btn-category"><c:out value="${Product.ORDERS[commandMap.prdMstOdr] }"/></button>
                            <div class="box-category-inner">
                                <c:forEach var="item" items="${Product.ORDERS }">
                                    <span class="prd-mst-odr">
                                        <label class="form-radio-category<c:if test="${commandMap.prdMstOdr eq item.key }"> checked</c:if>">
                                            <input type="radio" name="prdMstOdr" value="<c:out value="${item.key }"/>" <c:if test="${commandMap.prdMstOdr eq item.key }">checked="checked"</c:if>>
                                            <c:out value="${item.value }"/>
                                        </label>
                                    </span>
                                </c:forEach>
                            </div>
                        </div>
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
            </div>
        </div>
    </div>
    <%-- //Body --%>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    <script>
        $(function () {
            var $areaBody = $(".area-body");
            <%-- 페이징 --%>
            paging = function (cPage) {
                requestPage(cPage, "<c:out value="${commandMap.searchPrdMstNm}"/>", "<c:out value="${commandMap.searchPrdMstKwd}"/>");
            };
            <%-- 정렬순서 변경 이벤트 --%>
            $areaBody.on("click", ".prd-mst-odr", function () {
                requestPage(1, "<c:out value="${commandMap.searchPrdMstNm}"/>", "<c:out value="${commandMap.searchPrdMstKwd }"/>");
            });
            
            <%-- 목록 호출 --%>
            requestPage = function (cPage, searchPrdMstNm, searchPrdMstKwd) {
                var params = {
                    cPage : cPage,
                    searchPrdMstNm : searchPrdMstNm,
                    searchPrdMstKwd : searchPrdMstKwd,
                    prdMstOdr : $areaBody.find("input[name='prdMstOdr']:checked").val()
                };
                $.requestPage($.action.common.search.list(), params);
            };
        });
    </script>
</body>
</html>