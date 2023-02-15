<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:choose>
        <c:when test="${device eq Const.PC }">
            <%@ include file="/WEB-INF/jsp/pc/include/head.jsp"%>
        </c:when>
        <c:otherwise>
            <%@ include file="/WEB-INF/jsp/mo/include/head.jsp"%>
        </c:otherwise>
    </c:choose>
</head>
<body>
    <div class="area-content">
        <div class="area-inner">
            <div class="box-error">
                <c:if test="${device eq Const.PC }">
                    <h1><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_logo.png" alt="버킷마켓 꿈꾸던 삶을 담다" /></h1>
                </c:if>
                <p class="text-empty-data">
                    <span class="text-normal-type2">일시적으로 서비스를 이용할 수 없습니다.</span>서비스 이용에 불편을 드려 죄송합니다.<br /><br />시스템 장애로 인해 정상적인 <br />화면이 호출되지 않고 있습니다. <br />브라우저를 다시 띄우시거나,<br />잠시 후에 이용해 주시기 바랍니다.
                </p>
            </div>
            <div class="fixed-box-button">
                <span class="btn-type-text1"><button onclick="return false;">버킷마켓 홈</button></span>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            var $areaContent = $(".area-content");
            $areaContent.on("click", ".btn-type-text1", function () {
                document.location="/fr/main/index.do";
            });
        });
    </script>
</body>
</html>
