<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/myplanner.css">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|title-btn|search"/>
    <jsp:param name="headerTitle" value="공지사항"/>
</jsp:include>
<!-- //헤더 -->
<!-- 카테고리 -->
<jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
    <jsp:param name="navGroup" value="myplanner"/>
</jsp:include>
<!-- //카테고리 -->

<!-- 본문 -->
<div class="area-content"> <!-- 하단 탭바일때 aside-tabbar 클래스 추가 -->
    <div class="area-inner">    
        
        <div class="contain-board">
            <ul>
                        
                <%-- 상단 공지 --%>
                <c:forEach var="row" items="${topList }" varStatus="i">
                
                    <li class="notice">
                        <a href="javascript:;" class="detail" data-key="<c:out value="${row.RDP_NTS_IDX }"/>">
                            <p class="subject"><span>[공지]</span><c:out value="${row.RDP_NTS_TITLE }"/></p>
                            <p class="date"><ui:formatDate value="${row.RDP_NTS_REG_DT }" pattern="yyyy.MM.dd" /></p>
                        </a>
                    </li>
                    
                </c:forEach>
                
                <%-- 공지 --%>
                <c:forEach var="row" items="${list }" varStatus="i">
                
                    <li>
                        <a href="javascript:;" class="detail" data-key="<c:out value="${row.RDP_NTS_IDX }"/>">
                            <p class="subject"><span>[공지]</span><c:out value="${row.RDP_NTS_TITLE }"/></p>
                            <p class="date"><ui:formatDate value="${row.RDP_NTS_REG_DT }" pattern="yyyy.MM.dd" /></p>
                        </a>
                    </li>
                    
                </c:forEach>
                
            </ul>

            <%-- 페이징 --%>
            <div class="paginate">
                <ui:paging paging="${paging }" jsFunction="paging"/>
            </div>
            <%-- //페이징 --%>
            
        </div>

    </div>
</div>
<!-- //본문 -->

<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>

<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content");
        // 목록 조회
        paging = function (cPage) {
            var params = {cPage : cPage};
            $.requestPage($.action.myplanner.notice.list(), params);
        };
        // 상세
        $areaContent.on("click", "a.detail", function () {
            var params = { cPage : "<c:out value="${commandMap.cPage}"/>", RDP_NTS_IDX : $(this).data("key") };
            $.requestPage($.action.myplanner.notice.view(), params);
        });
    });
</script>

</body>
</html>