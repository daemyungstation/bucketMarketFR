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
        
        <div class="contain-board-view">
            <div class="box-view-title">
                <h2 class="subject"><span>[공지]</span><c:out value="${info.RDP_NTS_TITLE }"/></h2>
                <span class="date"><ui:formatDate value="${info.RDP_NTS_REG_DT }" pattern="yyyy.MM.dd" /></span>
            </div>
            <div class="box-view-content">
            
                <c:if test="${not empty fileList }">
                    <c:forEach var="row" items="${fileList }" varStatus="i">
                        <p class="file">
                            <a href="javascript:;" class="download" data-idx="<c:out value="${row.CMM_FLE_IDX }"/>">
                                <c:out value="${row.CMM_FLE_ORG_NM }"/>
                            </a>
                        </p>
                    </c:forEach>
                </c:if>
                
                <%-- 유튜브 링크 --%>
                <c:if test="${not empty info.RDP_NTS_YTB_URL }">
                    <p class="file">
                        <a href="<c:out value="${info.RDP_NTS_YTB_URL }"/>">
                            <c:out value="${info.RDP_NTS_YTB_URL }"/>
                        </a>
                    </p>
                </c:if>
                <%-- // 유튜브 링크 --%>
                
                <div class="content">
                    <c:out value="${info.RDP_NTS_CONTENTS }" escapeXml="false"/>
                </div>
            </div>
        </div>
        
        <!-- 하단 고정버튼 -->
        <div class="fixed-box-button">
            <span class="btn-type-text1"><button class="list">목록</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
        </div>
        <!-- //하단 고정버튼 -->  

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
        // 목록
        $areaContent.on("click", "button.list", function () {
            var params = {cPage : "<c:out value="${commandMap.cPage }"/>"};
            $.requestPage($.action.myplanner.notice.list(), params);
        });
        // 첨부파일
        $areaContent.on("click", "a.download", function () {
            $.common.file.download($(this).attr("data-idx"));
        });
    });
</script>

</body>
</html>