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
    <jsp:param name="headerGroup" value="logo|search"/>
    <jsp:param name="headerTitle" value=""/>
</jsp:include>
<!-- //헤더 -->
<!-- 카테고리 -->
<jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
    <jsp:param name="navGroup" value="myplanner"/>
</jsp:include>
<!-- //카테고리 -->

<!-- 본문 -->
<div class="area-content">
    <div class="area-inner">

        <!-- 본문 내용 -->  
        <div class="box-tab-head2">
            <span><button onclick="javascript:$.requestPage($.action.main.index());">버킷마켓</button></span>
            <span class="on"><button>레디플래너</button></span>
        </div>

        <div class="box-tab-body tab1 tab2 on">
        
            <c:choose>
                
                <%-- 로그인 필요 --%>
                <c:when test="${empty planner.RDP_MST_IDX }">
                
                    <div class="box-rdmember-head">
                        <p class="text-information-type1"><span class="text-point2"><u>레디플래너 로그인</u></span>이 필요합니다.</p>
                        <p class="text-information-type2">버킷마켓과 함께 수익을 창출하세요.<br />레디플래너 가입하고  본인의 SNS, 블로그에 홍보만 하면 리워드를 받을 수 있습니다.</p>
                    </div>
        
                    <span class="btn-type-text6 btn-arrow-type3"><button onclick="javascript:$.requestPage($.action.planner.login.form());">레디플래너 로그인</button></span>
                    
                    <span class="btn-type-text6 btn-arrow-type3"><button onclick="javascript:$.requestPage($.action.planner.join.step1.form());">레디플래너 가입 신청하러 가기</button></span>
        
                    <!-- 
                    <div class="box-rdmember-intro">
                        <span class="content-add">레디플래너 소개 영역 / 컨텐츠 필요</span>                
                    </div>
                     -->
                    
                </c:when>
                <%-- 로그인 필요 --%>
                
                <%-- 로그인 --%>
                <c:when test="${not empty planner.RDP_MST_IDX }">
                
                    <%-- 정지 상태 안내 --%>
                    <c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_STOP or info.RDP_MST_STATE eq Code.PLANNER_STATE_REQUEST_RELEASE }">
                    
                        <div class="box-rdmember-login">
                            <p class="text-empty-data">현재 회원님의 아이디는 이용이 제한되어<br />캠페인 생성 불가 및 생성된 캠페인에<br />실적 수익이 발생하지 않습니다.</p>
                            <p class="text-normal-type1">정지일시 : <ui:formatDate value="${info.RDP_MST_UPD_DT }" pattern="yyyy-MM-dd" /><br />정지사유 : <c:out value="${info.RDP_MST_STP_RSN }"/></p>
                            <span class="btn-type-text4"><button id="btnReleaseRequest">해제요청하기</button></span>
                        </div>
                        
                    </c:if>
                
                    <div class="box-rdmember-profile">
                        <div class="box-profile">
                            <p class="profile-img women">
                                <c:choose>
                                    <c:when test="${not empty planner.RDP_MST_PROFILE_IMAGE }">
                                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${planner.RDP_MST_PROFILE_IMAGE }"/>" 
                                             onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'"
                                             alt="프로필사진">
                                    </c:when>
                                    <c:when test="${empty planner.RDP_MST_PROFILE_IMAGE }">
                                        <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_profile.png" alt="프로필사진">
                                    </c:when>
                                </c:choose>
                            </p>
                            <p class="profile-name">행복한 하루 되세요<span><span class="text-point2"><c:out value="${planner.RDP_MST_MEM_NM }" /></span>님</span></p>
                            <span class="btn-logout"><button id="btnLogout">로그아웃</button></span>
                        </div>
                        <p class="box-margin">
                            <a href="javascript:$.requestPage($.action.myplanner.performance.view());">이달의 예상수익
                                <span><span class="text-point1"><fmt:formatNumber value="${expectedIncomingProfits }" type="number"/></span>원</span>
                            </a>
                        </p>
                        <!-- 공지 없을 때 미출력 -->
                        <c:if test="${fn:length(noticeList) gt 0 }">
                            <span class="box-notice">
                                <a href="javascript:$.requestPage($.action.myplanner.notice.view(), { RDP_NTS_IDX : '<c:out value="${noticeList[0].RDP_NTS_IDX }"/>' });">[공지] <c:out value="${noticeList[0].RDP_NTS_TITLE }"/></a>
                            </span>
                        </c:if>
                    </div>
                    
                </c:when>
                <%-- 로그인 --%>
                
            </c:choose>
            
            <hr class="divline-type2">
            
            <c:choose>
                
                <%-- 로그인 필요 --%>
                <c:when test="${empty planner.RDP_MST_IDX }">
            
                    <div class="box-rdmember-menu">  
                        <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_readyplanner_intro.png" alt="레디플래너 소개" />
                    </div>
                    
                </c:when>
                <%-- // 로그인 필요 --%>

                <%-- 로그인 --%>
                <c:when test="${not empty planner.RDP_MST_IDX }">
            
                    <div class="box-rdmember-menu">
                        <ul>
                            <li><a href="javascript:$.requestPage($.action.myplanner.campaign.product.list());"><span>캠페인 생성</span>캠페인 상품 배너, 링크 생성</a></li>
                            <li><a href="javascript:$.requestPage($.action.myplanner.performance.view());"><span>리워드 실적조회</span>생성된 캠페인별 실적조회</a></li>
                            <li><a href="javascript:$.requestPage($.action.myplanner.payment.view());"><span>리워드 지급내역</span>발생 수익에 대한 정산 및 지급내역조회</a></li>
                            <li><a href="javascript:$.requestPage($.action.myplanner.community.list());"><span>커뮤니티</span>수익창출 툴팁 자료 공유 게시판</a></li>
                            <li><a href="javascript:$.requestPage($.action.myplanner.profile.edit());"><span>프로필 관리</span>정산계좌 및 연락처, 비밀번호 변경</a></li>
                        </ul>   
                        <hr class="divline-type3">             
                    </div>
                
                </c:when>
                
            </c:choose>
            
            <div class="box-rdmember-link">
                <ul>
                    <li><a href="javascript:$.requestPage($.action.myplanner.introduce.view());">레디플래너 소개</a></li>
                    <li><a href="javascript:$.requestPage($.action.myplanner.application.guide.view());">이용가이드</a></li>
                    <li><a href="javascript:$.requestPage($.action.board.faq.list(), {searchBrdCmnComIdx : '<c:out value="${Code.QUESTION_TYPE_PLANNER }"/>'});">레디플래너 FAQ</a></li>
                    <li><a href="javascript:;" class="agreement1" data-gbn="<c:out value="${Code.TERM_READY_PLANNER_USE }"/>">레디플래너 약관</a></li>
                    <li><a href="javascript:;" class="agreement1" data-gbn="<c:out value="${Code.TERM_READY_PLANNER_SERVICE }"/>">레디플래너 운영정책</a></li>
                    <li><a href="javascript:$.requestPage($.action.myplanner.notice.list());">공지사항</a></li>
                    <!-- <li><a href="#">레디플래너 정책</a></li> -->
                </ul>
            </div>

            <%-- 배너 영역 --%>
            <c:if test="${not empty banner }">
            
                <div class="box-rdmember-banner">
                    <c:set var="banner" value="${banner[0] }"/>
                    <a href="javascript:$.requestLink('<c:out value="${banner.BNR_MST_URL }"/>', '<c:out value="${banner.BNR_MST_TGT }"/>');">
                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${banner.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${banner.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/none.png'"/>
                    </a>
                </div>
                
            </c:if>
            <%-- 배너 영역 --%>
            
        </div>    
        <!-- //본문 내용 -->        

    </div>
</div>
<!-- //본문 -->

<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>

<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>

<%-- 앱 푸시 --%>
<c:if test="${not empty planner.RDP_MST_IDX }">

    <script type="text/javascript">
        $(document).ready(function(){
            
            var ua = navigator.userAgent;
            if (ua.indexOf("bucketmarketApp") > -1) {
                if ($.resources.isAndroid) {
                    bucketmarketApp.setIdentity("<c:out value="${planner.RDP_MST_NO }"/>");
                    bucketmarketApp.setTag("planner");
                } else if ($.resources.isIos) {
                    window.webkit.messageHandlers.setIdentity.postMessage("<c:out value="${planner.RDP_MST_NO }"/>");
                    window.webkit.messageHandlers.setTag.postMessage("planner");
                }
            };
        });
    </script>
    
</c:if>
<c:if test="${ empty planner.RDP_MST_IDX }">

    <script type="text/javascript">
        $(document).ready(function(){
            
            var ua = navigator.userAgent;
            if (ua.indexOf("bucketmarketApp") > -1) {
                if ($.resources.isAndroid) {
                    bucketmarketApp.removeIdentity();
                } else if ($.resources.isIos) {
                    window.webkit.messageHandlers.removeIdentity.postMessage("");
                }
            };
        });
    </script>
    
</c:if>
<%-- // 앱 푸시 --%>

<script>
    $(function () {
        var $areaContent = $(".area-content");
        var $popupReleaseRequest = $("#popupReleaseRequest");
        // 해제 요청하기
        $areaContent.on("click", "#btnReleaseRequest", function() {
            $(".layer-popup1").requestLayer($.action.myplanner.release.request.form.layer());
        });
        // 로그아웃
        $areaContent.on("click", "#btnLogout", function() {
            if (confirm("로그아웃 하시겠습니까?")) {
                alert("로그아웃 되었습니다.");
                // 푸시 삭제
                var ua = navigator.userAgent;
                if (ua.indexOf("bucketmarketApp") > -1) {
                    if ($.resources.isAndroid) {
                        bucketmarketApp.removeIdentity();
                    } else if ($.resources.isIos) {
                        window.webkit.messageHandlers.removeIdentity.postMessage("");
                    }
                };
                $.requestPage($.action.planner.logout());
            }
        });
        // 레이어 - 약관
        $areaContent.on("click", "a.agreement1", function() {
            $.common.layer.term($(this).attr("data-type"), $(this).attr("data-gbn"));
        });
    });
    
    // 탭 이벤트 제거
//     $(document).ready(function(){
//         $(".box-tab-head button").off("click");
//     });
</script>

</body>
</html>