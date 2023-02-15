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
    <jsp:param name="twoDepth" value="커뮤니티"/>
    <jsp:param name="twoDepthKey" value="myplanner.community.list"/>
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

                <div class="content-community">
                    <div class="box-community-head">
                        <p class="text">레디플래너 활동 노하우와 정보를 함께 공유하는 게시판 입니다.</p>
                        <span class="btn-type-text1"><a href="javascript:;" id="btnNewCommunity">나의 노하우/정보 공유하기</a></span>
                    </div>
            
                    <div class="box-product-search type4">
                        <span class="data-count"><c:out value="${totalCount }" /> 개</span>
                        <div class="box-category-more">
                            <!-- 인기순(디폴트), 등록순, 지원금 높은 순, 지원금 낮은 순 -->
                            <button class="btn-category">
                                <c:if test="${commandMap.searchOrderType ne 2}">
                                    최근등록순
                                </c:if>
                                <c:if test="${commandMap.searchOrderType eq 2}">
                                    조회순
                                </c:if>
                            </button>
                            <div class="box-category-inner">
                                <c:if test="${commandMap.searchOrderType ne 2}">
                                    <span><label class="form-radio-category checked"><input type="radio" name="searchOrderType" value="1" checked="checked">최근등록순</label></span>
                                    <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="2">조회순</label></span>
                                </c:if>
                                <c:if test="${commandMap.searchOrderType eq 2}">
                                    <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="1">최근등록순</label></span>
                                    <span><label class="form-radio-category checked"><input type="radio" name="searchOrderType" value="2" checked="checked">조회순</label></span>
                                </c:if>
                            </div>
                        </div>                
                    </div>
                    
                    <%-- 목록 --%>
                    <c:if test="${totalCount gt 0 }">
            
                        <div class="contain-board2">
                            <ul>
                            
                                <c:forEach var="row" items="${list }" varStatus="status">
                            
                                    <li>
                                        <p class="subject">
                                            <a href="javascript:;" class="detail" data-idx="<c:out value="${row.RDP_BBS_IDX }"/>">
                                                <c:out value="${row.RDP_BBS_TITLE }"/>
                                            </a>
                                        </p>
                                        <p class="count">조회수 <c:out value="${row.RDP_BBS_READ_CNT }"/></p>
                                        <p class="date">작성일 <ui:formatDate value="${row.RDP_BBS_REG_DT }" pattern="yyyy.MM.dd" /></p>
                                        <p class="name woman">
                                            <c:choose>
                                                <c:when test="${not empty row.RDP_MST_PROFILE_IMAGE }">
                                                    <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.RDP_MST_PROFILE_IMAGE }"/>"
                                                         onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile_women.png'"
                                                         alt="프로필사진">
                                                </c:when>
                                                <c:when test="${empty row.RDP_MST_PROFILE_IMAGE }">
                                                    <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile_women.png" alt="프로필사진">
                                                </c:when>
                                            </c:choose>
                                            <span><c:out value="${row.RDP_MST_MEM_NM }"/></span>
                                        </p>
                                        
                                        <%-- 수정/삭제-본인의 게시물인 경우에만 표기 --%>
                                        <c:if test="${planner.RDP_MST_IDX eq row.RDP_MST_IDX}">
                                            <p class="btn">
                                                <span class="btn-mod"><a href="javascript:;" class="edit" data-idx="<c:out value="${row.RDP_BBS_IDX }"/>">수정</a></span>
                                                <span class="btn-del"><button class="delete" data-idx="<c:out value="${row.RDP_BBS_IDX }"/>">삭제</button></span>
                                            </p>
                                        </c:if>
                                        
                                    </li>
                                    
                                </c:forEach>
                                
                            </ul>
                        </div>
                        
                    </c:if>
            
                    <%-- 목록 없음 --%>
                    <c:if test="${totalCount eq 0 }">
                        <p class="text-information-type2">등록된 글이 없습니다.</p>
                    </c:if>

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
            var params = {cPage : cPage, searchOrderType : "<c:out value="${commandMap.searchOrderType }"/>" };
            $.requestPage($.action.myplanner.community.list(), params);
        };
        // 정렬 변경
        $areaContent.on("click", "input[name='searchOrderType']", function() {
            var params = {cPage : 1, searchOrderType : $("input[name='searchOrderType']:checked").val() };
            $.requestPage($.action.myplanner.community.list(), params);
        });
        // 등록
        $areaContent.on("click", "#btnNewCommunity", function() {
            var params = { cPage : "<c:out value="${commandMap.cPage }"/>", RDP_BBS_IDX : $(this).data("idx"), searchOrderType : "<c:out value="${commandMap.searchOrderType }"/>" };
            $.requestPage($.action.myplanner.community.form.page(), params);
        });
        // 수정
        $areaContent.on("click", "a.edit", function() {
            var params = { cPage : "<c:out value="${commandMap.cPage }"/>", RDP_BBS_IDX : $(this).data("idx"), searchOrderType : "<c:out value="${commandMap.searchOrderType }"/>" };
            $.requestPage($.action.myplanner.community.edit.page(), params);
        });
        // 삭제
        $areaContent.on("click", "button.delete", function() {
            if (confirm("작성된 글을 삭제하시겠습니까?")) {
                $.postSyncJsonAjax($.action.myplanner.community.remove.ajax(), { RDP_BBS_IDX : $(this).data("idx") }, function (data) {
                    if (data.isSuccess) {
                        alert("나의 노하우/정보가 삭제되었습니다.");
                        document.location.reload();
                    } else {
                        alert("삭제가 실패하였습니다.");
                    }
                });
            }
        });
        // 상세
        $areaContent.on("click", "a.detail", function () {
            var params = { cPage : "<c:out value="${commandMap.cPage }"/>", RDP_BBS_IDX : $(this).data("idx"), searchOrderType : "<c:out value="${commandMap.searchOrderType }"/>" };
            $.requestPage($.action.myplanner.community.view(), params);
        });
    });
</script>
</body>
</html>