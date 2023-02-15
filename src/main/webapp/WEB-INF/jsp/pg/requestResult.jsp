<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
    <c:choose>
        <c:when test="${result.isSuccess }">
            <script>
                $(function () {
                    parent.payment("<c:out value="${result.ordMstIdx }"/>");
                });
            </script>
        </c:when>
        <c:otherwise>
            <script>
                alert("<c:out value="${result.resultMsg }"/>");
                <c:if test="${device ne Const.PC }">
                    parent.layerClose();
                </c:if>
            </script>
            <c:if test="${device eq Const.PC }">
                <script language="javascript" type="text/javascript" src="<spring:eval expression="@pg['pg.script.close.url']"/>" charset="UTF-8"></script>
            </c:if>
        </c:otherwise>
    </c:choose>
</body>
</html>

