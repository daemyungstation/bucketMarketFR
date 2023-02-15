<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/join.css">
</head>
<body class="">

<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>

<jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
    <jsp:param name="oneDepth" value="로그인"/>
    <jsp:param name="oneDepthKey" value="planner.login.form"/>
</jsp:include>

<!-- Body -->
<div class="area-body">
    <div class="area-inner">

        <%-- 심사 중 --%>
        <c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_APPLY }">
        
            <div class="contain-login">
    
                <h3 class="title">심사결과</h3>
    
                <div class="box-information-appresult">
                    <p class="text-information-type1 notice1"><span class="text-point2"><c:out value="${info.RDP_MST_MEM_NM }"/></span> 님, <br >레디플래너 신청 정보는 <br ><strong class="text-point1">심사 중</strong>에 있습니다.</p>
                    <p class="text-information-type2">심사 결과는 입력해 주신 휴대폰 번호로 통보됩니다.</p>
                </div>
    
                <div class="fixed-box-button">
                    <span class="btn-type-text1"><button id="btnMain">메인으로 이동</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
                </div>
    
            </div>
            
        </c:if>
        <%-- //심사 중 --%>
        
        <%-- 반려 --%>
        <c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_REJECT }">

            <div class="contain-login">
    
                <h3 class="title">심사결과</h3>
    
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
                
                <%-- 다시 신청하기 --%>
                <form id="frm">
                    <input type="hidden" name="RDP_MST_NO" value="<c:out value="${info.RDP_MST_NO }"/>" />
                </form>
                <%-- //다시 신청하기 --%>
    
                <div class="fixed-box-button">
                    <span class="btn-type-text1"><a href="javascript:;" id="btnReapply">다시 신청하기</a></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
                </div>
    
            </div>

        </c:if>
        <%-- //반려 --%>
        
    </div>
</div>
<!-- //Body -->

<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    
<script>
    $(function () {
        var $areaContent = $(".area-body"),
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