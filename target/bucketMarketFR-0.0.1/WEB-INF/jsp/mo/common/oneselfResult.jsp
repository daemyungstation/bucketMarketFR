<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
    <%@ include file="/WEB-INF/jsp/mo/include/head.jsp"%>
    <%@ include file="/WEB-INF/jsp/mo/include/script.jsp"%>
</head>
<body style="background:#000;">
    <%@ include file="/WEB-INF/jsp/common/include/loading.jsp"%>
    <%@ include file="/WEB-INF/jsp/common/include/noBack.jsp"%>
    <script>
    $(function () {
        if ($.resources.isApp && $.resources.isAndroid) {
            bucketmarketApp.authResultJS("oneself", "<c:out value="${commandMap.retInfo}"/>");
        } else {
            window.opener.windowPopupCallback("oneself", "<c:out value="${commandMap.retInfo}"/>");
            window.self.close();
        }
    });
    </script>
</body>
</html>