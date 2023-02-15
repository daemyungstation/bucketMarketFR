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

        <div class="contain-login">

            <div class="sub-tab-head">
                <span class="on"><button>아이디 찾기</button></span>
                <span><button onclick="javascript:$.requestPage($.action.planner.find.pw.form());">비밀번호 찾기</button></span>
            </div>
            <div>
                <div class="box-resultid">
                    <p class="text-normal-type1 findid"><span class="text-point2"><c:out value="${info.RDP_MST_MEM_NM }" /></span>님, <br >아이디는 <c:out value="${info.RDP_MST_ID }" />입니다.</p>
                    <div class="table-type1">
                        <table>
                            <colgroup>
                            <col style="width:115px" >
                            <col >
                            </colgroup>
                            <tr>
                                <th>아이디</th>
                                <td><strong><c:out value="${info.RDP_MST_ID }" /></strong></td>
                            </tr>
                            <tr>
                                <th>가입</th>
                                <td><strong><ui:formatDate value="${info.RDP_MST_REG_DT }" pattern="yyyy-MM-dd" /></strong></td>
                            </tr>
                        </table>
                    </div>
                <p class="text-information-type2"><a id="aFindPassword" href="javascript:;">이 아이디로 비밀번호 찾기</a></p>
                </div>

                <!-- 하단 고정버튼 -->
                <div class="fixed-box-button">
                    <span class="btn-type-text1"><button id="btnLogin">로그인</button></span>
                </div>
                <!-- //하단 고정버튼 -->
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
        // 로그인
        $areaContent.on("click", "#btnLogin", function() {
            $.requestPage($.action.planner.login.form());
        });
        // 비밀번호 찾기
        $areaContent.on("click", "#aFindPassword", function() {
            $.requestPage($.action.planner.find.pw.form(), { "RDP_MST_ID" : "<c:out value="${info.RDP_MST_ID }" />" });
        });
    });
</script>
</body>
</html>