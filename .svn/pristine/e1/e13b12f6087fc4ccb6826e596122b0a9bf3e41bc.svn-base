<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<c:choose>
    <c:when test="${device eq Const.PC }">
        <%@ include file="/WEB-INF/jsp/pc/include/head.jsp"%>
    </c:when>
    <c:otherwise>
        <%@ include file="/WEB-INF/jsp/mo/include/head.jsp"%>
    </c:otherwise>
</c:choose>
</head>
<body style="background:#000;">
    <%@ include file="/WEB-INF/jsp/common/include/loading.jsp"%>
    <%@ include file="/WEB-INF/jsp/common/include/noBack.jsp"%>
    <script type="text/javascript">
        alert("<c:out value="${exception.message}"/>");
        history.go(-1);
    </script>
</body>
</html>
