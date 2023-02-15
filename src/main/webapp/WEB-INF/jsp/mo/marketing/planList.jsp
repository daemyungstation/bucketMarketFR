<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/promotion.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title|search"/>
        <jsp:param name="headerTitle" value="기획전"/>
    </jsp:include>
    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-event-basis">
                <c:if test="${empty list }">
                    <p class="text-empty-data">등록된 기획전이 없습니다.</p><%-- 데이터가 없을때 --%>
                </c:if>
                <c:if test="${not empty list }">
                    <c:forEach var="row" items="${list }">
                        <div class="box-basis-list">
                            <a href="javascript:;" class="detail" data-key="<c:out value="${row.PLN_MST_IDX }"/>">
                                <dl>
                                    <dt><c:out value="${row.PLN_MST_TITLE }"/></dt>
                                    <dd class="data"><ui:formatDate value="${row.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${row.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/></dd>
                                </dl>
                                <span class="image"><img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.CMM_FLE_WEB_PATH }"/>" alt="기획전 사진" onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'" /></span>
                            </a>
                        </div>
                    </c:forEach>
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
    <script>
        $(function () {
            var $areaContent = $(".area-content");
            <%-- 상세 호출 --%>
            $areaContent.on("click", "a.detail", function () {
                var params = {PLN_MST_IDX : $(this).data("key")};
                $.requestPage($.action.marketing.plan.view(), params);
            });
        });
    </script>
</body>
</html>