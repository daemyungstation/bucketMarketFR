<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/store.css">
</head>
<body>
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
        <jsp:param name="navListName" value="categoryProductDisplayNaviList"/>
        <jsp:param name="keyword" value="${commandMap.searchPrdMstKwd }"/>
    </jsp:include>
    <%-- Body --%>
    <div class="area-body">
        <c:if test="${empty commandMap.searchPrdMstKwd }">
            <div class="area-top-type2">
                <div class="area-inner">
                    <div class="contain-store-top">
                        <div class="content-header">
                            <h3 class="title <c:if test="${categoryProductDisplayLevel gt Const.CATEGORY_TOP_LEVEL }"> type2</c:if>">
                                <c:out value="${categoryProductDisplayNaviInfo.PRD_CTG_NM }"/>
                            </h3>
                        </div>
                        <c:if test="${not empty bannerList }">
                            <div class="box-popup-store swiper-container">
                                <div class="swiper-wrapper">
                                    <c:forEach var="row" items="${bannerList }">
                                        <div class="swiper-slide">
                                            <a href="javascript:$.requestLink('<c:out value="${row.BNR_MST_URL }"/>', '<c:out value="${row.BNR_MST_TGT }"/>');">
                                                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${row.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/none.png'" style="max-width: 1920px; max-height: 280px;"/>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>
                                <c:if test="${fn:length(bannerList) gt 1 }">
                                    <div class="swiper-pagination"></div>
                                </c:if>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:if>
        <div class="area-inner">
            <div class="contain-store-box">
                <c:if test="${not empty commandMap.searchPrdMstKwd }">
                    <div class="box-hotkeyword-result">
                        <span class="keyword on"><a href="javascript:;">#<c:out value="${commandMap.searchPrdMstKwd }"/></a></span>
                    </div>
                </c:if>
                <c:if test="${not empty categoryProductDisplaySubList and fn:length(categoryProductDisplaySubList) gt 1 }">
                    <div class="box-store-category">
                        <div class="store-category-list">
                            <c:forEach var="row" items="${categoryProductDisplaySubList }" varStatus="stat">
                                <span class="store-name">
                                    <a href="javascript:$.requestPage($.action.product.basic.list(), { PRD_CTG_IDX: '<c:out value="${row.PRD_CTG_IDX }"/>' });">
                                        <c:out value="${row.PRD_CTG_NM }"/>
                                    </a>
                                </span>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty categoryProductDisplayKeywordList }">
                    <div class="box-hotkeyword">
                        <p class="title">관련 키워드</p>
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
                    <span class="data-count"><fmt:formatNumber value="${totalCount }" type="number"/>개</span>
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
                <c:if test="${empty list }">
                    <p class="text-empty-data">상품을 준비중입니다.</p>
                </c:if>
                <c:if test="${not empty list }">
                    <div class="box-store-list array4">
                        <c:forEach var="row" items="${list }">
                            <ui:productList info="${row }" thubnailSize="750" type="type3"/>
                        </c:forEach>
                    </div>
                </c:if>
                <div class="paginate">
                    <ui:paging paging="${paging }" jsFunction="paging"/>
                </div>
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
            <%-- 키워드 클릭 이벤트 --%>
            $areaBody.on("click", ".keyword", function () {
                requestPage(1, "<c:out value="${commandMap.prdMstOdr }"/>", $(this).data("prd_ctg_kwd"));
            });
            <%-- 정렬순서 변경 이벤트 --%>
            $areaBody.on("click", ".prd-mst-odr", function () {
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