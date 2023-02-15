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
        
                <%-- 등록 --%>
                <form id="communityForm" name="communityForm"> 
                    <input type="hidden" name="RDP_BBS_IDX" value="<c:out value="${info.RDP_BBS_IDX }"/>">

                    <div class="contain-board-write">
                        <div class="box-write-title">
                            <input type="text" name="RDP_BBS_TITLE" placeholder="제목을 입력해 주세요" class="subject" maxlength="40" value="<c:out value="${info.RDP_BBS_TITLE }"/>">
                            <span class="date"><fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy.MM.dd" /></span>    
                            <p class="name woman">
                                <c:choose>
                                    <c:when test="${not empty planner.RDP_MST_PROFILE_IMAGE }">
                                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${planner.RDP_MST_PROFILE_IMAGE }"/>" 
                                             onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile_women.png'"
                                             alt="프로필사진">
                                    </c:when>
                                    <c:when test="${empty planner.RDP_MST_PROFILE_IMAGE }">
                                        <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile_women.png" alt="프로필사진">
                                    </c:when>
                                </c:choose>
                                <span><c:out value="${planner.RDP_MST_MEM_NM }"/></span>
                            </p>
                        </div>
                        <div class="box-write-content">
                            <span class="form-textarea">
                                <textarea name="RDP_BBS_CONTENTS" placeholder="내용을 입력해 주세요" onkeyup="StringUtil.getStrLength(this, '.byte', 2000);" maxlength="2000"><c:out value="${info.RDP_BBS_CONTENTS }"/></textarea>
                                <i><span class="byte">0</span>/2,000</i>
                            </span>
                        </div>
            
                        <!-- 본인이 작성한 게시물인 경우에만 수정/삭제 버튼 출력 -->
                        <div class="box-board-btn">
                            <span class="btn-type-text7"><button type="button" id="btnCancel">취소</button></span>   
                            <span class="btn-type-text1 disabled"><!-- 비활성화 시 disabled 클래스 추가 --><button type="button" id="btnSave">저장</button></span>    
                        </div>  
                    </div>
                    
                </form>
                
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
        $communityForm = $areaContent.find("#communityForm");
        // 폼
        $communityForm.validate({
            rules : {
                RDP_BBS_TITLE : { required : true, maxlength : 40 },
                RDP_BBS_CONTENTS : { required : true, maxlength : 2000 },
            }
        });
        // 유효성 검사
        $communityForm.valid();
        // 확인
        $communityForm.on("click", "#btnSave", function() {
            if ($communityForm.valid()) {
                $.postSyncJsonAjax($.action.myplanner.community.edit.ajax(), $communityForm.serializeObject(), function (data) {
                    if (data.isSuccess) {
                        alert("나의 노하우/정보가 수정되었습니다.");
                        goList();
                    } else {
                        alert("수정이 실패하였습니다.");
                    }
                });
            }
        });
        // 취소
        $areaContent.on("click", "#btnCancel", function () {
            goList();
        });
        // 목록 페이지로
        function goList() {
            $.requestPage($.action.myplanner.community.list(), { cPage : "<c:out value="${commandMap.cPage }"/>", searchOrderType : "<c:out value="${commandMap.searchOrderType }"/>" });
        }
    });
</script>
</body>
</html>