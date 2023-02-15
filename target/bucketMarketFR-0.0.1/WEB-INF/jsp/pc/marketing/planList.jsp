<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/promotion.css">
</head>
<body class="">
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
        <jsp:param name="oneDepth" value="기획전"/>
        <jsp:param name="oneDepthKey" value="marketing.plan.list"/>
    </jsp:include>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-inner">
            <div class="contain-event-box">
                <h3 class="title">기획전</h3>
                <c:if test="${empty list }">
                    <p class="text-empty-data">등록된 기획전이 없습니다.</p>
                </c:if>
                <c:if test="${not empty list }">
                    <div class="box-event">
                        <c:forEach var="row" items="${list }">
                            <a href="javascript:;" class="detail" data-key="<c:out value="${row.PLN_MST_IDX }"/>">
                                <dl class="box-event-list">
                                    <dd class="image"><img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.CMM_FLE_WEB_PATH }"/>" alt="기획전 사진" onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"/></dd>
                                    <dt>
                                        <span class="subject"><c:out value="${row.PLN_MST_TITLE }"/></span>
                                    </dt>
                                    <dd class="data"><ui:formatDate value="${row.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${row.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/></dd>
                                </dl>
                            </a>
                        </c:forEach>
                    </div>
                    <%-- 페이징 --%>
                    <div class="paginate">
                        <ui:paging paging="${paging }" jsFunction="paging"/>
                    </div>
                    <%-- //페이징 --%>
                </c:if>
            </div>
        </div>
    </div>
    <%-- //Body --%>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    <script>
        $(function () {
            var $areaBody = $(".area-body");
            <%-- 목록 호출 --%>
            paging = function (cPage) {
                var params = {cPage : cPage};
                $.requestPage($.action.marketing.plan.list(), params);
            };
            <%-- 상세 호출 --%>
            $areaBody.on("click", "a.detail", function () {
                var params = {PLN_MST_IDX : $(this).data("key")};
                $.requestPage($.action.marketing.plan.view(), params);
            });
        });
    </script>
</body>
</html>