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
    <jsp:param name="headerTitle" value="로그인"/>
</jsp:include>
<!-- //헤더 -->

<!-- 본문 -->
<div class="area-content">
    <div class="area-inner">

        <%-- 심사 중 --%>
        <c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_APPLY }">
            <div class="contain-login">
    
                <div class="box-information-appresult">
                    <p class="text-information-type1 notice1"><span class="text-point2"><c:out value="${info.RDP_MST_MEM_NM }"/></span> 님, <br >레디플래너 신청 정보는 <br ><strong class="text-point1">심사 중</strong>에 있습니다.</p>
                    <p class="text-information-type2">심사 결과는 입력해 주신 휴대폰 번호로 통보됩니다.</p>
                </div>
    
            </div>
            
            <!-- 하단 고정버튼 -->
            <div class="fixed-box-button">
                <span class="btn-type-text1"><button id="btnMain">메인으로 이동</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
            </div>
            <!-- //하단 고정버튼 -->
            
        </c:if>
        <%-- //심사 중 --%>
        
        <%-- 반려 --%>
        <c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_REJECT }">
            <div class="contain-login">
    
                <div class="box-information-appresult">
                    <p class="text-information-type1 notice1"><span class="text-point2"><c:out value="${info.RDP_MST_MEM_NM }"/></span> 님, <br >레디플래너 <strong class="text-point1">신청이 반려</strong> 되었습니다.</p>
                    <p class="text-information-type2">반려사유는 다음과 같습니다.</p>
                </div>
                <div class="contain-reject">
                    <div class="contain-scroll">
                        <div class="box-inner">
                            <c:out value="${fn:replace(info.RDP_MST_RJT_RSN, newLineChar, '<br/>') }" escapeXml="false"/>
                        </div>
                    </div>
                </div>
    
            </div>
            
            <%-- 다시 신청하기 --%>
            <form id="frm">
                <input type="hidden" name="RDP_MST_NO" value="<c:out value="${info.RDP_MST_NO }"/>" />
            </form>
            <%-- //다시 신청하기 --%>
            
            <!-- 하단 고정버튼 -->
            <div class="fixed-box-button">
                <span class="btn-type-text1"><button id="btnReapply">다시 신청하기</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
            </div>
            <!-- //하단 고정버튼 -->
            
        </c:if>
        <%-- //반려 --%>

    </div>
</div>
<!-- //본문 -->
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content"),
            $frm = $areaContent.find("#frm");
        // 메인으로
        $areaContent.on("click", "#btnMain", function() {
            $.requestPage($.action.main.index());
        });
        // 다시 신청하기
        $areaContent.on("click", "#btnReapply", function() {
            $frm.postSubmit($.action.planner.join.step2.reapply());
        });
    });
</script>

</body>
</html>