<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/join.css">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|navigation|title|search|home"/>
    <jsp:param name="headerTitle" value="레디플래너 신청"/>
</jsp:include>
<!-- //헤더 -->

<!-- 본문 -->
<div class="area-content">
    <div class="area-inner">

        <div class="contain-join-head">
            <h2 class="title-step">레디플래너 퀴즈 미션</h2>
            <div class="box-step">
                <span>01</span>
                <span>02</span>
                <span>03</span>
                <span>04</span>
                <span class="on">05</span>
            </div>
        </div>
        <div class="contain-join-body">
            <p class="text-information-type1">레디플래너 학습 동영상을 시청하고 <br >퀴즈를 풀어주세요.</p>
            <p class="text-information-type3">퀴즈의 정답을 모두 맞추셔야 <br >레디플래너 활동이 가능합니다.</p>

            <%-- 퀴즈 --%>
            <c:forEach var="group" items="${groupList }" varStatus="groupStatus">

                <hr class="divline-type0" >
                
                <%-- 동영상 --%>
                <c:forEach var="video" items="${group.videoList }" varStatus="videoStatus">
    
                    <video width="100%" controls preload="none" poster="<spring:eval expression="@resource['doc.ssl.domain']"/><c:out value="${group.mobileThumbnailList[videoStatus.index].CMM_FLE_ATT_PATH }" /><c:out value="${group.mobileThumbnailList[videoStatus.index].CMM_FLE_SYS_NM }" />" >
                        <source src="<spring:eval expression="@resource['doc.ssl.domain']"/><c:out value="${video.CMM_FLE_ATT_PATH }" /><c:out value="${video.CMM_FLE_SYS_NM }" />" type="video/mp4">
                    </video>
                    
                    <hr class="divline-type3" >
                    
                </c:forEach>
                
                <%-- 퀴즈 문항 --%>
                <c:forEach var="quiz" items="${group.QUIZ }" varStatus="quizStatus">
    
                    <dl class="box-quiz">
                        <dt>Quiz <c:out value="${videoStatus.count }"/>. <c:out value="${quiz.RDP_QUIZ_NM }"/></dt>
                        <dd>
                            <%-- 선택 문항 --%>
                            <c:forEach var="item" items="${quiz.ITEM }" varStatus="quizStatus">
                                <label class="form-radio">
                                    <input type="radio" name="RDP_ITEM_<c:out value="${quiz.RDP_QUIZ_IDX }" />" value="<c:out value="${item.RDP_ITEM_IDX }"/>" data-yn="<c:out value="${item.RDP_ITEM_YN }" />">
                                    <c:out value="${item.RDP_ITEM_NM }" />
                                </label>
                            </c:forEach>
                        </dd>
                    </dl>
                
                </c:forEach>
    
                <hr class="divline-type2" >
            
            </c:forEach>

        </div>

        <!-- 하단 고정버튼 -->
        <div class="fixed-box-button">
            <span id="spanNext" class="btn-type-text1 disabled"><button id="btnNext">확인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
        </div>
        <!-- //하단 고정버튼 -->
        
        <%-- 교육이수 완료 폼 --%>
        <form id="frm" name="frm">
            <input type="hidden" name="RDP_MST_NO" value="${info.RDP_MST_NO }">
        </form>
        <%-- 교육이수 완료 폼 --%>

    </div>
</div>
<!-- //본문 -->

<!-- 팝업 : 추가정보 미입력 안내  -->
<div id="informationPopup" class="layer-popup2 active">
    <div class="layer-inner">
        <div class="contain-head">
            <p class="text-title-type1">리워드수익을 위한 마지막 미션!</p>
        </div>
        <hr class="divline-type1" >
        <div class="contain-body">

            <p class="text-normal-type2">레디플래너 활동을 위한 마지막 미션 절차가 <br >남았습니다. 미션페이지로 이동합니다.</p>
            <div class="box-button">
                <span class="btn-type-text1"><button id="popupClose">확인</button></span>
            </div>
        </div>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</div>
<!-- //팝업 : 추가정보 미입력 안내 -->

<!-- 팝업 : 미션수행 안내  -->
<div id="popupFail" class="layer-popup2">
    <div class="layer-inner">
        <div class="contain-head">
            <p class="text-title-type1">아쉽네요.</p>
        </div>
        <hr class="divline-type1" >
        <div class="contain-body">

            <p class="text-normal-type2">미션을 통과하지 못하셨습니다. <br >다시 시도해 주세요.</p>
            <div class="box-button">
                <span class="btn-type-text1"><button id="btnRetry">다시풀기</button></span>
            </div>
        </div>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</div>
<!-- //팝업 : 미션수행 안내  -->

<!-- 팝업 : 미션수행 안내  -->
<div id="popupSuccess" class="layer-popup2">
    <div class="layer-inner">
        <div class="contain-head">
            <p class="text-title-type1">축하합니다.</p>
        </div>
        <hr class="divline-type1" >
        <div class="contain-body">

            <p class="text-normal-type2">미션을 성공적으로 수행하셨습니다. <br >다양한 활동으로 수익창출의 기회를 잡으세요.</p>
            <div class="box-button">
                <span class="btn-type-text1"><button id="btnNext">확인</button></span>
            </div>
        </div>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</div>
<!-- //팝업 : 미션수행 안내  -->
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>

<script>
    $(function () {
        var $areaContent = $(".area-content");
            $frm = $areaContent.find("#frm");
        var $informationPopup = $("#informationPopup"),
            $popupFail = $("#popupFail"),
            $popupSuccess = $("#popupSuccess");
        // 필수
        $areaContent.on("click", "input[name^='RDP_ITEM']", function() {
            var valid = true;   
            var quizNames = $(".box-quiz").find("input[name^='RDP_ITEM']").map(function() {
                return $(this).attr("name");
            }).get();         
            $.each($.unique(quizNames), function(i, name) {
                valid = valid && $areaContent.find("input[name='" + name + "']:checked").val() ? true : false;
            });
            $areaContent.find("#spanNext").toggleClass("disabled", valid == false)
        });
        // 확인
        $areaContent.on("click", "#btnNext", function() {
            if ($areaContent.find("#spanNext").hasClass("disabled") == false) {
                var valid = true;   
                var quizNames = $(".box-quiz").find("input[name^='RDP_ITEM']").map(function() {
                    return $(this).attr("name");
                }).get();         
                $.each($.unique(quizNames), function(i, name) {
                    valid = valid && ($areaContent.find("input[name='" + name + "']:checked").data("yn") == "Y") ? true : false;
                });
                if (valid) {
                    $.common.layer.open($popupSuccess, "");
                } else {
                    $.common.layer.open($popupFail, "");
                }
            }
        });
        // 안내 팝업 닫기
        $informationPopup.on("click", "#popupClose", function() {
            $.common.layer.close($informationPopup);
        });
        // 팝업 - 실패
        $popupFail.on("click", "#btnRetry", function() {
            $.common.layer.hide($popupFail);
            $areaContent.find("label.form-radio").removeClass("checked");
            $areaContent.find("input[name^='RDP_ITEM']").attr("checked", false);
            $areaContent.find("#spanNext").addClass("disabled");
        });
        // 팝업 - 성공
        $popupSuccess.on("click", "#btnNext", function() {
            $frm.postSubmit($.action.planner.join.step5.updateQuiz());
        });
    });
</script>

</body>
</html>