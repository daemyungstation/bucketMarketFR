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
        <jsp:param name="headerTitle" value="이벤트"/>
    </jsp:include>
    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-event">
                <c:if test="${empty list }">
                    <p class="text-empty-data">등록된 이벤트이 없습니다.</p><%-- 데이터가 없을때 --%>
                </c:if>
                <c:if test="${not empty list }">
                    <c:forEach var="row" items="${list }">
                        <a href="javascript:;" class="detail" data-key="<c:out value="${row.EVT_MST_IDX }"/>">
                            <dl class="box-event-list">
                                <dt>
                                    <c:if test="${row.EVT_MST_ING_YN eq 'Y' }">
                                        <span class="event e-ing">진행중</span>
                                    </c:if>
                                    <c:if test="${row.EVT_MST_ING_YN ne 'Y' }">
                                        <span class="event e-end">종료</span>
                                    </c:if>
                                    <c:out value="${row.EVT_MST_TITLE }"/>
                                </dt>
                                <dd class="data"><ui:formatDate value="${row.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${row.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/></dd>
                                <dd class="image"><img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.CMM_FLE_WEB_PATH }"/>" alt="이벤트 사진" /></dd>
                            </dl>
                        </a>
                    </c:forEach>
                </c:if>
                
                <div class="paginate">
                    <ui:paging paging="${paging }" jsFunction="paging"/>
                </div>
                
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
            <%-- 목록 호출 --%>
            paging = function (cPage) {
                var params = {cPage : cPage};
                $.requestPage($.action.marketing.event.list(), params);
            };
            <%-- 상세 호출 --%>
            $areaContent.on("click", "a.detail", function () {
                var params = {EVT_MST_IDX : $(this).data("key")};
                $.requestPage($.action.marketing.event.view(), params);
            });
        });
    </script>
</body>
</html>