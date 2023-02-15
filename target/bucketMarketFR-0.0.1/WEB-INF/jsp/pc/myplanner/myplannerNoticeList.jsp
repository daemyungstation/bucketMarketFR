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

                <div class="content-notice-box">
                    <div class="contain-board2 type2">
                        <ul>
                        
                            <%-- 상단 공지 --%>
                            <c:forEach var="row" items="${topList }" varStatus="i">
                            
                                <li class="notice">
                                    <p class="subject">
                                        <a href="javascript:;" class="detail" data-key="<c:out value="${row.RDP_NTS_IDX }"/>">
                                            <span>[공지]</span><c:out value="${row.RDP_NTS_TITLE }"/>
                                        </a>
                                    </p>
                                    <p class="count">조회수 <fmt:formatNumber value="${row.RDP_NTS_READ_CNT }" type="number"/></p>
                                    <p class="date">작성일 <ui:formatDate value="${row.RDP_NTS_REG_DT }" pattern="yyyy.MM.dd" /></p> 
                                </li>
                                
                            </c:forEach>
                            
                            <%-- 공지 --%>
                            <c:forEach var="row" items="${list }" varStatus="i">
                            
                                <li>
                                    <p class="subject">
                                        <a href="javascript:;" class="detail" data-key="<c:out value="${row.RDP_NTS_IDX }"/>">
                                            <span>[공지]</span><c:out value="${row.RDP_NTS_TITLE }"/>
                                        </a>
                                    </p>
                                    <p class="count">조회수 <fmt:formatNumber value="${row.RDP_NTS_READ_CNT }" type="number"/></p>
                                    <p class="date">작성일 <ui:formatDate value="${row.RDP_NTS_REG_DT }" pattern="yyyy.MM.dd" /></p> 
                                </li>
                                
                            </c:forEach>

                        </ul>
                    </div>

                    <%-- 페이징 --%>
                    <div class="paginate">
                        <ui:paging paging="${paging }" jsFunction="paging"/>
                    </div>
                    <%-- //페이징 --%>
                    
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