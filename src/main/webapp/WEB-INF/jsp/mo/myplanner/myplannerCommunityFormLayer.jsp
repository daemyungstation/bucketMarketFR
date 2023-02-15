<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<spring:eval var="fileAllows" expression="@file['file.allowed.extensions.image']" />
<spring:eval var="fileMaxSize" expression="@file['file.max.byte.size.image']" />

<div class="layer-inner">
    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">나의 노하우/정보 공유하기</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">
        
            <%-- 등록 --%>
            <form id="communityForm" name="communityForm"> 

                <!-- 팝업본문 -->
                <!-- 나의 노하우/정보 공유하기 등록/수정 페이지-->
                <div class="content-rdmember-layer01">
                <div class="box-profile-layer">                       
                    <span class="profile women">
                        <c:choose>
                            <c:when test="${not empty planner.RDP_MST_PROFILE_IMAGE }">
                                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${planner.RDP_MST_PROFILE_IMAGE }"/>"
                                     onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'" 
                                     alt="프로필사진">
                            </c:when>
                            <c:when test="${empty planner.RDP_MST_PROFILE_IMAGE }">
                                <img src="<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>" alt="프로필사진">
                            </c:when>
                        </c:choose>
                        <span class="name"><c:out value="${planner.RDP_MST_MEM_NM }"/></span>
                    </span>
                    <span class="date"><fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy.MM.dd" /></span> 
    
                    <!-- 최대 40자-->
                    <input type="text" name="RDP_BBS_TITLE" placeholder="제목을 입력해 주세요" maxlength="40">
                    <!-- 최대 2000자-->
                    <span class="form-textarea">
                        <textarea name="RDP_BBS_CONTENTS" placeholder="내용을 입력해 주세요" onkeyup="StringUtil.getStrLength(this, '.byte', 2000);" maxlength="2000"></textarea>
                        <i><span class="byte">0</span>/2,000</i>
                    </span>
                </div>
                <!-- //팝업본문 -->
                </div>
    
                <!-- 하단 고정버튼 -->
                <div class="fixed-box-button">
                    <span class="btn-type-text1"><button type="button" id="btnSave">저장</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
                </div>
                <!-- //하단 고정버튼 -->
            
            </form>

        </div>
    </div>
    <!-- //본문 -->
</div>

<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $communityForm = $layerPopup.find("#communityForm");
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
            $.postSyncJsonAjax($.action.myplanner.community.form.ajax(), $communityForm.serializeObject(), function (data) {
                if (data.isSuccess) {
                    alert("나의 노하우/정보가 등록되었습니다.");
                    $.common.layer.close($layerPopup);
                    document.location.reload();
                } else {
                    alert("등록이 실패하였습니다.");
                }
            });
        }
    });
});
</script>