<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/store.css"> 
</head>
<body class="">
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-inner">
            <div class="contain-bestranking">
                <div class="box-store-category">
                    <div class="store-category-list">
                        <c:forEach var="row" items="${codeList }" varStatus="stat">
                            <span class="store-name<c:if test="${row.CMN_COM_IDX eq  commandMap.searchCmnComIdx }"> on</c:if>">
                                <a href="javascript:$.requestPage($.action.display.product.list(), { searchCmnComIdx : '<c:out value="${row.CMN_COM_IDX }"/>' });" >
                                    <c:out value="${row.CMN_COM_NM }"/>
                                </a>
                            </span>
                        </c:forEach>
                    </div>
                </div>
                <c:if test="${empty list }">
                    <p class="text-empty-data">베스트 집계 중 입니다.</p>
                </c:if>
                <c:if test="${not empty list }">
                    <div class="box-store-list array5-best">
                        <c:forEach var="row" items="${list }">
                            <ui:productList info="${row }" thubnailSize="750" type="type3"/>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <%-- //Body --%>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
</body>
</html>