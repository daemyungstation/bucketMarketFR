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
            <h2 class="title-step">약관 동의 및 본인 확인</h2>
            <div class="box-step">
                <span class="on">01</span>
                <span>02</span>
                <span>03</span>
            </div>
        </div>
        
        <%-- 약관동의 및 본인확인 폼 --%>
        <form id="frm" name="frm">
            <input type="hidden" name="RDP_MST_CI" />
            <input type="hidden" name="RDP_MST_MEM_NM" />
            <input type="hidden" name="RDP_MST_HP1" />
            <input type="hidden" name="RDP_MST_HP2" />
            <input type="hidden" name="RDP_MST_HP3" />
                    
            <div class="contain-join-body">
    
                <p class="text-information-type1">버킷마켓 상품을 <br ><span class="text-point1">본인의 SNS, 블로그, 사이트<br >등에 홍보하고</span><br >리워드 수익을 받으세요.</p>
                <p class="text-notice-type1 notice-center">이용약관과 운영정책을 꼭 확인해주세요.</p>
                <hr class="divline-type1" >
    
                <p class="text-agreement">
                    <label class="form-checkbox">
                        <input type="checkbox" name="AGREEMENT1_YN" value="Y">
                    </label>
                    본인은 만 14세 이상이며, 
                    <button type="button" class="agreement1" data-type="<c:out value="${Code.TERM_BUCKET_MARKET_USE }"/>">버킷마켓 이용약관</button>, 
                    <button type="button" class="agreement2" data-gbn="<c:out value="${Code.TERM_READY_PLANNER_USE }"/>">레디플래너 이용약관</button>, 
                    <button type="button" class="agreement3" data-gbn="<c:out value="${Code.TERM_READY_PLANNER_SERVICE }"/>">레디플래너 운영정책</button> 
                    내용을 확인하였으며, 동의합니다.
                </p>
                <p class="text-agreement">
                    <label class="form-checkbox">
                        <input type="checkbox" name="AGREEMENT2_YN" value="Y">
                    </label>
                    <button type="button" class="agreement4" data-gbn="<c:out value="${Code.TERM_READY_PLANNER_PERSONAL_INFORMATION_TRUST }"/>">개인정보 수집 및 이용/제 3자 제공 및 처리위탁</button>
                    내용을 확인하였으며, 동의합니다.
                </p>
    
            </div>

            <!-- 하단 고정버튼 -->
            <div class="fixed-box-button">
                <span id="spanNext" class="btn-type-text1 disabled"><button type="button" id="btnNext">동의 및 본인 확인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
            </div>
            <!-- //하단 고정버튼 -->
        
        </form>
        <%-- //약관동의 및 본인확인 폼 --%>

    </div>
</div>
<!-- //본문 -->
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content"),
            $frm = $areaContent.find("#frm");
        var $tempPopup = $("#popupTemp");
        // 폼
        $frm.validate({
            rules : {
                AGREEMENT1_YN : {
                    required : true
                },
                AGREEMENT2_YN : {
                    required : true
                }
            }
        });
        // 동의 여부
        $areaContent.on("change", "input[name='AGREEMENT1_YN'], input[name='AGREEMENT2_YN']", function() {
            $frm.valid();
        });
        // 레이어 - 약관
        $areaContent.on("click", "p.text-agreement button", function() {
            $.common.layer.term($(this).attr("data-type"), $(this).attr("data-gbn"));
        });
        // 동의 및 본인확인
        $areaContent.on("click", "#btnNext", function() {
            if ($frm.valid()) {
                // # 서비스 번호 - 플래너 가입(약관동의)
                $.common.check.oneself("", function (data) {
                    if (data.isSuccess) {
                        $frm.postSubmit($.action.planner.join.step2.form());
                    } else {
                        alert(data.resultMessage);
                    }
                });
            }
        });
    });
</script>

</body>
</html>