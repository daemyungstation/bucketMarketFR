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
    <jsp:param name="headerTitle" value="커뮤니티"/>
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
                <h2 class="subject line2"><c:out value="${info.RDP_BBS_TITLE }"/></h2>
                <span class="count"><c:out value="${info.RDP_BBS_READ_CNT }"/></span>
                <span class="date"><ui:formatDate value="${info.RDP_BBS_REG_DT }" pattern="yyyy.MM.dd"/></span>    
                <span class="name women">
                    <c:choose>
                        <c:when test="${not empty info.RDP_MST_PROFILE_IMAGE }">
                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${info.RDP_MST_PROFILE_IMAGE }"/>" alt="프로필사진">
                        </c:when>
                        <c:when test="${empty info.RDP_MST_PROFILE_IMAGE }">
                            <img src="<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>" alt="프로필사진">
                        </c:when>
                    </c:choose>
                    <c:out value="${info.RDP_MST_MEM_NM }"/>
                </span>
            </div>
            <div class="box-view-content">
                <div class="content">
                    <c:out value="${fn:replace(info.RDP_BBS_CONTENTS, newLineChar, '<br/>') }" escapeXml="false"/>
                </div>
                <hr class="divline-type1">
            </div>

            <!-- 본인이 작성한 게시물인 경우에만 수정/삭제 버튼 출력 -->
            <c:if test="${planner.RDP_MST_IDX eq info.RDP_MST_IDX}">
                <div class="box-board-btn">
                    <span class="btn-type-text7"><button id="btnEdit" data-idx="<c:out value="${info.RDP_BBS_IDX }"/>">수정</button></span>
                    <span class="btn-type-text7"><button id="btnDelete" data-idx="<c:out value="${info.RDP_BBS_IDX }"/>">삭제</button></span>    
                </div>
            </c:if>  
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