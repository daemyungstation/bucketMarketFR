<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<c:choose>
    <c:when test="${device eq Const.PC }">
        <%@ include file="/WEB-INF/jsp/pc/include/head.jsp"%>
        <%@ include file="/WEB-INF/jsp/pc/include/script.jsp"%>
    </c:when>
    <c:otherwise>
        <%@ include file="/WEB-INF/jsp/mo/include/head.jsp"%>
        <%@ include file="/WEB-INF/jsp/mo/include/script.jsp"%>
    </c:otherwise>
</c:choose>
</head>
<body style="background:#000;">
    <%@ include file="/WEB-INF/jsp/common/include/loading.jsp"%>
    <%@ include file="/WEB-INF/jsp/common/include/noBack.jsp"%>
    <script type="text/javascript">
        $(function () {
            var rendingUrl = $.action.main.index(),
                params = {};
            alert("인증이 필요한 페이지 입니다.\n인증페이지로 이동합니다.");
            <c:if test="${not empty exception.key}">
                rendingUrl = $.action.<c:out value="${exception.key}"/>();
            </c:if>
            <c:if test="${not empty exception.params}">
                params = <c:out value="${exception.params}" escapeXml="false"/>
            </c:if>
            $.requestPage(rendingUrl, params);
        });
    </script>
</body>
</html>
