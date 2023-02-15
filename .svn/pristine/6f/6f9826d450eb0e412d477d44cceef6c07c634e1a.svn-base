<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
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
            <div class="contain-board-view">
                <div class="box-view-title">
                    <h2 class="subject"><span>[<c:out value="${info.BRD_CMN_COM_NM }"/>]</span><c:out value="${info.BRD_NTS_TITLE }"/></h2>
                    <p class="date"><ui:formatDate value="${info.BRD_NTS_REG_DT }" pattern="yyyy.MM.dd" /></p>
                </div>
                <div class="box-view-content">
                    <c:if test="${not empty fileList }">
                        <c:forEach var="row" items="${fileList }" varStatus="i">
                            <p class="file">
                                <a href="javascript:$.common.file.download('<c:out value="${row.CMM_FLE_IDX }"/>')">
                                    <c:out value="${row.CMM_FLE_ORG_NM }"/>
                                </a>
                            </p>
                        </c:forEach>
                    </c:if>
                    
                    <div class="content">
                        <c:out value="${info.BRD_NTS_CONTENTS }" escapeXml="false"/>
                    </div>
                </div>
            </div>
            <%-- 하단 고정버튼 --%>
            <div class="fixed-box-button">
                <span class="btn-type-text1"><button class="list">목록</button></span>
            </div>
            <%-- //하단 고정버튼 --%>
        </div>
    </div>
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <script>
        $(function () {
            var $areaContent = $(".area-content");
            <%-- 목록 호출 --%>
            $areaContent.on("click", "button.list", function () {
                var params = {cPage : "<c:out value="${commandMap.cPage }"/>"};
                $.requestPage($.action.board.notice.list(), params);
            });
        });
    </script>
</body>
</html>