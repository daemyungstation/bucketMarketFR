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

        <div class="contain-commen-head">
            <p class="text-normal-type1">레디플래너 활동 노하우와 정보를 함께<br />공유하는 게시판 입니다.</p>
            <span class="btn-type-text1 btn-arrow-type1"><button id="btnNewCommunity">나의 노하우/정보 공유하기</button></span>
        </div>

        <hr class="divline-type2">

        <div class="contain-commentlist">
            <div class="box-product-search">
                <span class="data-count"><c:out value="${totalCount }" /> 개</span>
                <div class="box-category-more">
                    <!-- 최근등록순(디폴트), 판매순 -->
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
                <ul class="box-comment">
                
                    <c:forEach var="row" items="${list }" varStatus="status">
                        <li>
                            <a href="javascript:;" class="detail" data-idx="<c:out value="${row.RDP_BBS_IDX }"/>">
                            <span class="count"><c:out value="${row.RDP_BBS_READ_CNT }"/></span>
                            <span class="date"><ui:formatDate value="${row.RDP_BBS_REG_DT }" pattern="yyyy-MM-dd" /></span>  
                            <span class="title"><c:out value="${row.RDP_BBS_TITLE }"/></span></a>
                            
                            <%-- 프로필 이미지 & 이름 --%>
                            <span class="name women">
                                <c:choose>
                                    <c:when test="${not empty row.RDP_MST_PROFILE_IMAGE }">
                                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.RDP_MST_PROFILE_IMAGE }"/>"
                                             onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'"
                                             alt="프로필사진">
                                    </c:when>
                                    <c:when test="${empty row.RDP_MST_PROFILE_IMAGE }">
                                        <img src="<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>" alt="프로필사진">
                                    </c:when>
                                </c:choose>
                                <c:out value="${row.RDP_MST_MEM_NM }"/>
                            </span>
                            
                            <%-- 수정/삭제-본인의 게시물인 경우에만 표기 --%>
                            <c:if test="${planner.RDP_MST_IDX eq row.RDP_MST_IDX}">
                                <div class="box-comment-more">
                                    <button class="btn-comment">더보기</button>
                                    <div class="box-comment-inner">
                                        <span><button class="edit" data-idx="<c:out value="${row.RDP_BBS_IDX }"/>">수정</button></span>
                                        <span><button class="delete" data-idx="<c:out value="${row.RDP_BBS_IDX }"/>">삭제</button></span>
                                    </div>
                                </div>
                            </c:if>
                        </li>
                    </c:forEach>
                    
                </ul>
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
            $(".layer-popup1").requestLayer($.action.myplanner.community.form.layer());
        });
        // 수정
        $areaContent.on("click", "button.edit", function() {
            $(".layer-popup1").requestLayer($.action.myplanner.community.edit.layer(), { RDP_BBS_IDX : $(this).data("idx") });
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