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
    <jsp:param name="twoDepth" value=""/>
    <jsp:param name="twoDepthKey" value=""/>
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
                    <h3 class="title">커뮤니티</h3>
                </div>

                <div class="contain-board-view2">
                    <div class="box-view-title">
                        <h2 class="subject"><c:out value="${info.RDP_BBS_TITLE }"/></h2>
                        <span class="count"><c:out value="${info.RDP_BBS_READ_CNT }"/></span>
                        <span class="date"><ui:formatDate value="${info.RDP_BBS_REG_DT }" pattern="yyyy.MM.dd"/></span>    
                        <p class="name woman">
                            <c:choose>
                                <c:when test="${not empty info.RDP_MST_PROFILE_IMAGE }">
                                    <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${info.RDP_MST_PROFILE_IMAGE }"/>" 
                                         onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile_women.png'"
                                         alt="프로필사진">
                                </c:when>
                                <c:when test="${empty info.RDP_MST_PROFILE_IMAGE }">
                                    <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile_women.png" alt="프로필사진">
                                </c:when>
                            </c:choose>
                            <span><c:out value="${info.RDP_MST_MEM_NM }"/></span>
                        </p>
                    </div>
                    <div class="box-view-content">
                        <div class="content">
                            <c:out value="${fn:replace(info.RDP_BBS_CONTENTS, newLineChar, '<br/>') }" escapeXml="false"/>              
                        </div>
                    </div>
        
                    <div class="box-board-btn">
                        <!-- 본인이 작성한 게시물인 경우에만 수정/삭제 버튼 출력 -->
                        <c:if test="${planner.RDP_MST_IDX eq info.RDP_MST_IDX}">
                            <span class="btn-type-text7"><a href="javascript:;" id="btnEdit" data-idx="<c:out value="${info.RDP_BBS_IDX }"/>">수정</a></span>
                            <span class="btn-type-text7"><button id="btnDelete" data-idx="<c:out value="${info.RDP_BBS_IDX }"/>">삭제</button></span>    
                        </c:if>
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
        // 수정
        $areaContent.on("click", "#btnEdit", function() {
            $(".layer-popup1").requestLayer($.action.myplanner.community.edit.layer(), { RDP_BBS_IDX : $(this).data("idx") });
        });
        // 삭제
        $areaContent.on("click", "#btnDelete", function() {
            if (confirm("작성된 글을 삭제하시겠습니까?")) {
                $.postSyncJsonAjax($.action.myplanner.community.remove.ajax(), { RDP_BBS_IDX : $(this).data("idx") }, function (data) {
                    if (data.isSuccess) {
                        alert("나의 노하우/정보가 삭제되었습니다.");
                        $.requestPage($.action.myplanner.community.list(), {cPage : "<c:out value="${commandMap.cPage }"/>"});
                    } else {
                        alert("삭제가 실패하였습니다.");
                    }
                });
            }
        });
        // 목록
        $areaContent.on("click", "button.list", function () {
            $.requestPage($.action.myplanner.community.list(), { cPage : "<c:out value="${commandMap.cPage }"/>", searchOrderType : "<c:out value="${commandMap.searchOrderType }"/>" });
        });
    });
</script>
</body>
</html>