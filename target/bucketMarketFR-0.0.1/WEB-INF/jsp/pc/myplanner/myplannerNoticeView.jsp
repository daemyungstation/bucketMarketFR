<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/myplanner.css">
</head>
<body class="">

<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>

<jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
    <jsp:param name="oneDepth" value="My레디플래너"/>
    <jsp:param name="oneDepthKey" value="myplanner.campaign.product.list"/>
    <jsp:param name="twoDepth" value="공지사항"/>
    <jsp:param name="twoDepthKey" value="myplanner.notice.list"/>
</jsp:include>

<!-- Body -->
<div class="area-body">
    <div class="area-inner">

        <div class="wrap">

            <%-- 좌측 메뉴 --%>
            <jsp:include page="/WEB-INF/jsp/pc/include/aside.jsp" flush="false">
                <jsp:param name="asideTitle" value="My 레디플래너"/>
                <jsp:param name="asideGroup" value="myplanner_pc"/>
            </jsp:include>
            <%-- 정지 상태 안내 --%>

            <div class="contain-body">
                <div class="content-header">
                    <h3 class="title">공지사항</h3>
                </div>

                <div class="contain-board-view2">
                    <div class="box-view-title">
                        <h2 class="subject"><c:out value="${info.RDP_NTS_TITLE }"/></h2>
                        <span class="count"><fmt:formatNumber value="${info.RDP_NTS_READ_CNT }" type="number"/></span>
                        <span class="date"><ui:formatDate value="${info.RDP_NTS_REG_DT }" pattern="yyyy.MM.dd" /></span>    
                    </div>
                    <div class="box-view-content">
                    
                        <c:if test="${not empty fileList }">
                            <c:forEach var="row" items="${fileList }" varStatus="i">
                                <span class="file">
                                    <a href="javascript:;" class="download" data-idx="<c:out value="${row.CMM_FLE_IDX }"/>">
                                        <c:out value="${row.CMM_FLE_ORG_NM }"/>
                                    </a>
                                </span>
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
        
                    <div class="box-board-btn">  
                        <span class="btn-type-text1"><button class="list">목록</button></span>    
                    </div>  
                </div>
                
            </div>
        </div>

    </div>
</div>
<!-- //Body -->

<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    
<script>
    $(function () {
        var $areaContent = $(".area-body");
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