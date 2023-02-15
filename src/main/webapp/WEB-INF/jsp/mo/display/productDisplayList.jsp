<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/store.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title|search"/>
        <jsp:param name="headerTitle" value="베스트 랭킹"/>
    </jsp:include>
    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-bestranking">
                <div class="box-bestranking-head">
                    <h2 class="title">베스트 상품</h2>
                    <p class="text-information-type2">카테고리별 베스트 상품도 놓치지 마세요</p>
                </div>
                <%-- category-swiper --%>
                <div class="box-store-category swiper-container">
                    <div class="swiper-wrapper">
                        <c:if test="${not empty codeList }">
                            <c:forEach var="row" items="${codeList }" varStatus="stat">
                                <c:if test="${stat.first }">
                                    <div class="swiper-slide title-top10 <c:if test="${row.CMN_COM_IDX eq commandMap.searchCmnComIdx }">on</c:if>">
                                        <h3>
                                            <a href="javascript:$.requestPage($.action.display.product.list(), { searchCmnComIdx : '<c:out value="${row.CMN_COM_IDX }"/>' });" >
                                                <c:out value="${row.CMN_COM_NM }"/>
                                            </a>
                                        </h3>
                                    </div>
                                </c:if>
                                <c:if test="${not stat.first }">
                                    <div class="swiper-slide <c:if test="${row.CMN_COM_IDX eq commandMap.searchCmnComIdx }">on</c:if>">
                                        <a href="javascript:$.requestPage($.action.display.product.list(), { searchCmnComIdx : '<c:out value="${row.CMN_COM_IDX }"/>' });" >
                                            <c:set var="categoryIconKey">${row.CMN_COM_IDX }</c:set>
                                            <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/category/<c:out value="${Const.CATEGORY_ICONS[categoryIconKey] }"/>" alt="<c:out value="${row.CMN_COM_NM }"/>" >
                                            <c:out value="${row.CMN_COM_NM }"/>
                                        </a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
                <c:if test="${empty list }">
                    <p class="text-empty-data">베스트 집계 중 입니다.</p>
                </c:if>
                <c:if test="${not empty list }">
                    <div class="box-bestranking-list">
                        <c:forEach var="row" items="${list }">
                            <ui:productList info="${row }" thubnailSize="750" type="type3"/>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <%-- //본문 --%>
    <%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
</body>
</html>