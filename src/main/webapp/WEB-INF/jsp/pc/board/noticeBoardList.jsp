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
                    <div class="contain-board">
                        <table class="table-board">
                            <colgroup>
                                <col style="width: 130px" />
                                <col style="width: auto" />
                                <col style="width: 130px" />
                                <col style="width: 130px" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>제목</th>
                                    <th>등록일</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="types" value="topList|list"/>
                                <c:forTokens var="type" items="${types }" delims="|">
                                    <c:if test="${not empty requestScope[type] }">
                                        <c:forEach var="row" items="${requestScope[type] }" varStatus="stat">
                                            <tr <c:if test="${type eq 'topList' }">class="notice"</c:if>>
                                                <th><c:out value="${type eq 'topList' ? '공지' : paging.listNum - stat.index }"/></th>
                                                <td class="subject">
                                                    <a href="javascript:;" class="detail" data-key="<c:out value="${row.BRD_NTS_IDX }"/>">
                                                        <span>[<c:out value="${row.BRD_CMN_COM_NM }"/>]</span>
                                                        <c:out value="${row.BRD_NTS_TITLE }"/>
                                                    </a>
                                                </td>
                                                <td><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy.MM.dd" /></td>
                                                <td><fmt:formatNumber value="${row.BRD_NTS_READ_CNT }" type="number"/></td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </c:forTokens>
                            </tbody>
                        </table>
                        <div class="paginate">
                            <ui:paging paging="${paging }" jsFunction="paging"/>
                        </div>
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
            paging = function (cPage) {
                var params = {cPage : cPage};
                $.requestPage($.action.board.notice.list(), params);
            };
            <%-- 상세 호출 --%>
            $areaBody.on("click", "a.detail", function () {
                var params = {BRD_NTS_IDX : $(this).data("key")};
                $.requestPage($.action.board.notice.view(), params);
            });
        });
    </script>
</body>
</html>