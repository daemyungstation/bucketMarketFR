<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/store.css">
</head>
<body>
    <c:set var="headerGroup" value="historyback|title-btn|search"/>
    <c:set var="headerTitle" value="${categoryProductDisplayNaviInfo.PRD_CTG_NM }"/>
    <c:if test="${not empty commandMap.searchPrdMstKwd }">
        <c:set var="headerGroup" value="historyback|title|search"/>
        <c:set var="headerTitle" value="#${commandMap.searchPrdMstKwd }"/>
    </c:if>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="${headerGroup }"/>
        <jsp:param name="headerTitle" value="${headerTitle }"/>
    </jsp:include>
    <jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
        <jsp:param name="navGroup" value="product"/>
        <jsp:param name="categoryListName" value="categoryProductDisplayList"/>
    </jsp:include>
    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-store">
                <c:if test="${not empty bannerList }">
                    <div class="box-popup-store swiper-container">
                        <div class="swiper-wrapper">
                            <c:forEach var="row" items="${bannerList }">
                                <div class="swiper-slide">
                                    <a href="javascript:$.requestLink('<c:out value="${row.BNR_MST_URL }"/>', '<c:out value="${row.BNR_MST_TGT }"/>');">
                                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${row.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/none.png'"/>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                        <c:if test="${fn:length(bannerList) gt 1 }">
                            <div class="swiper-pagination"></div>
                            <div class="swiper-control">
                                <button class="btn-play on">재생</button>
                                <button class="btn-stop">정지</button>
                            </div>
                        </c:if>
                    </div>
                </c:if>
                <c:if test="${not empty categoryProductDisplaySubList and fn:length(categoryProductDisplaySubList) gt 1 }">
                    <div class="box-store-category swiper-container">
                        <div class="swiper-wrapper">
                            <c:forEach var="row" items="${categoryProductDisplaySubList }" varStatus="stat">
                                <div class="swiper-slide">
                                    <a href="javascript:$.requestPage($.action.product.basic.list(), { PRD_CTG_IDX: '<c:out value="${row.PRD_CTG_IDX }"/>' });">
                                        <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/category/<c:out value="${row.PRD_CTG_IDX }"/>.png" alt="<c:out value="${row.PRD_CTG_NM }"/>" >
                                        <c:out value="${row.PRD_CTG_NM }"/>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty categoryProductDisplayKeywordList }">
                    <div class="box-hotkeyword">
                        <h2 class="title">관련 키워드</h2>
                        <c:forEach var="row" items="${categoryProductDisplayKeywordList }">
                            <span class="keyword" data-prd_ctg_kwd="<c:out value="${row.PRD_CTG_KWD }"/>">
                                <a href="javascript:;">
                                    #<c:out value="${row.PRD_CTG_KWD }"/>
                                </a>
                            </span>
                        </c:forEach>
                    </div>
                </c:if>
                <div class="box-product-search">
                    <span class="data-count"><fmt:formatNumber value="${totalCount }" type="number"/> 개</span>
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
                <div class="box-store-list">
                    <c:if test="${empty list }">
                        <p class="text-empty-data">상품을 준비중입니다.</p>
                    </c:if>
                    <c:if test="${not empty list }">
                        <c:forEach var="row" items="${list }">
                            <ui:productList info="${row }" thubnailSize="750" type="type2"/>
                        </c:forEach>
                    </c:if>
                </div>
                <%-- 페이징 --%>
                <div class="paginate">
                    <ui:paging paging="${paging }" jsFunction="paging"/>
                </div>
                <%-- //페이징 --%>
            </div>
        </div>
    </div>
    <%-- //본문 --%>
    <%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <script>
        $(function () {
            var $areaContent = $(".area-content");
            <%-- 키워드 클릭 이벤트 --%>
            $areaContent.on("click", ".keyword", function () {
                requestPage(1, "<c:out value="${commandMap.prdMstOdr }"/>", $(this).data("prd_ctg_kwd"));
            });
            <%-- 정렬순서 변경 이벤트 --%>
            $areaContent.on("click", ".prd-mst-odr", function () {
                requestPage(1, $(this).find("input[name='prdMstOdr']").val(), "<c:out value="${commandMap.searchPrdMstKwd }"/>");
            });
            <%-- 페이징 --%>
            paging = function (cPage) {
                requestPage(cPage, "<c:out value="${commandMap.prdMstOdr }"/>", "<c:out value="${commandMap.searchPrdMstKwd }"/>");
            };
            <%-- 목록 호출 --%>
            function requestPage(cPage, prdMstOdr, searchPrdMstKwd) {
                var params = {
                    PRD_CTG_IDX : "<c:out value="${categoryProductDisplayNaviInfo.PRD_CTG_IDX }"/>",
                    cPage : cPage,
                    prdMstOdr : prdMstOdr,
                    searchPrdMstKwd: searchPrdMstKwd
                }; 
                $.requestPage($.action.product.basic.list(), params);
                
            };
        });
    </script>
</body>
</html>