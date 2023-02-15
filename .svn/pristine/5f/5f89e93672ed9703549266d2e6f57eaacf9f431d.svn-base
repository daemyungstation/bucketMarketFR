<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/customer.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title-btn|search"/>
        <jsp:param name="headerTitle" value="공지사항"/>
    </jsp:include>
    <jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
        <jsp:param name="navGroup" value="board"/>
    </jsp:include>
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-board">
                <ul>
                    <c:set var="types" value="topList|list"/>
                    <c:forTokens var="type" items="${types }" delims="|" varStatus="stat">
                        <c:if test="${not empty requestScope[type] }">
                            <c:forEach var="row" items="${requestScope[type] }" varStatus="i">
                                <li <c:if test="${stat.first }">class="notice"</c:if>>
                                    <a href="javascript:;" class="detail" data-key="<c:out value="${row.BRD_NTS_IDX }"/>">
                                        <p class="subject">
                                            <span>[<c:out value="${row.BRD_CMN_COM_NM }"/>]</span>
                                            <c:out value="${row.BRD_NTS_TITLE }"/>
                                        </p>
                                        <p class="date"><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy.MM.dd" /></p>
                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                    </c:forTokens>
                </ul>
            </div>
            <%-- 페이징 --%>
            <div class="paginate">
                <ui:paging paging="${paging }" jsFunction="paging"/>
            </div>
            <%-- //페이징 --%>
        </div>
    </div>
    <%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <script>
        $(function () {
            var $areaContent = $(".area-content");
            <%-- 목록 호출 --%>
            paging = function (cPage) {
                var params = {cPage : cPage};
                $.requestPage($.action.board.notice.list(), params);
            };
            <%-- 상세 호출 --%>
            $areaContent.on("click", "a.detail", function () {
                var params = {BRD_NTS_IDX : $(this).data("key")};
                $.requestPage($.action.board.notice.view(), params);
            });
        });
    </script>
</body>
</html>