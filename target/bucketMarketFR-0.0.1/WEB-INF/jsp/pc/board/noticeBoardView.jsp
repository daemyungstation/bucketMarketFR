<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/customer.css">
</head>
<body class="">
    <c:set var="group" value="고객센터"/>
    <c:set var="page" value="공지사항"/>
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
        <jsp:param name="oneDepth" value="${group }"/>
        <jsp:param name="oneDepthKey" value="board.notice.list"/>
        <jsp:param name="twoDepth" value="${page }"/>
        <jsp:param name="twoDepthKey" value="board.notice.list"/>
    </jsp:include>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-inner">
            <div class="wrap">
                <jsp:include page="/WEB-INF/jsp/pc/include/aside.jsp" flush="false">
                    <jsp:param name="asideTitle" value="${group }"/>
                    <jsp:param name="asideGroup" value="board"/>
                </jsp:include>
                <div class="contain-body">
                    <div class="content-header">
                        <h3 class="title"><c:out value="${page }"/></h3>
                    </div>
                    <div class="contain-board-view">
                        <div class="box-view-title">
                            <h4 class="subject"><span>[<c:out value="${info.BRD_CMN_COM_NM }"/>]</span><c:out value="${info.BRD_NTS_TITLE }"/></h4>
                            <span class="date"><ui:formatDate value="${info.BRD_NTS_REG_DT }" pattern="yyyy.MM.dd" /></span>
                        </div>
                        <div class="box-view-content">
                            <c:if test="${not empty fileList }">
                                <c:forEach var="row" items="${fileList }" varStatus="i">
                                    <span class="file">
                                        <a href="javascript:$.common.file.download('<c:out value="${row.CMM_FLE_IDX }"/>')">
                                            <c:out value="${row.CMM_FLE_ORG_NM }"/>
                                        </a>
                                    </span>
                                </c:forEach>
                            </c:if>
                            <div class="content">
                                <c:out value="${info.BRD_NTS_CONTENTS }" escapeXml="false"/>
                            </div>
                        </div>
                    </div>
                    <div class="box-btn right">
                        <span class="btn-type-text1"><button class="list">목록</button></span>
                    </div>
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
            <%-- 목록 호출 --%>
            $areaBody.on("click", "button.list", function () {
                var params = {cPage : "<c:out value="${commandMap.cPage }"/>"};
                $.requestPage($.action.board.notice.list(), params);
            });
        });
    </script>
</body>
</html>