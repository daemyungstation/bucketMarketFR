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
    <c:choose>
        <c:when test="${empty historyBack }">
            <%@ include file="/WEB-INF/jsp/common/include/noBack.jsp"%>
            <c:choose>
                <c:when test="${not empty closeMsg}">
                    <script type="text/javascript">
                        $(function () {
                            alert("${closeMsg }");
                            <c:if test="${!empty parentReload}">
                                <c:choose>
                                    <c:when test="${!empty returnUrl}">
                                        $(opener).attr({name : "parentPage"});
                                        $("#frmExec").getSubmit("<c:out value="${returnUrl}"/>", "parentPage");
                                    </c:when>
                                    <c:otherwise>
                                        parent.opener.location.reload();
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                            <c:if test="${!empty parentFunction}">
                                parent.opener.parentFunction();
                            </c:if>
                            window.close();
                        });
                    </script>
                </c:when>
                <c:otherwise>
                    <script type="text/javascript">
                        $(function () {
                            <c:if test="${not empty alertMsg}">
                                alert("<c:out value="${alertMsg }"/>");
                            </c:if>
                            <c:if test="${not empty messages}">
                                alert("<c:out value="${messages}"/>");
                            </c:if>
                            <c:if test="${not empty script}">
                                <c:out value="${script}" escapeXml="false"/>
                            </c:if>
                            $("#frmExec").getSubmit("<c:out value="${returnUrl}"/>");
                        });
                    </script>
                </c:otherwise>
            </c:choose>
            <form id="frmExec" name="frmExec">
                <div style="display: none;">
                    <c:forEach items="${commandMap}" var="item">
                        <c:set var="arrayCnt" value="${fn:indexOf(item.value, 'Ljava.lang.String')}" />
                        <c:choose>
                            <c:when test="${arrayCnt > 0}">
                                <c:forEach items="${item.value}" var="val">
                                    <input type="hidden" id="${item.key }" name="${item.key}" value="<c:out value="${fn:trim(val)}" escapeXml="true"/>" />
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" id="${item.key }" name="${item.key}" value="<c:out value="${fn:trim(item.value)}" escapeXml="true"/>" />
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </form>
        </c:when>
        <c:otherwise>
            <script type="text/javascript">
                $(function () {
                    alert("<c:out value="${alertMsg }"/>");
                    history.go(-1);
                });
            </script>
        </c:otherwise>
    </c:choose>
</body>
</html>