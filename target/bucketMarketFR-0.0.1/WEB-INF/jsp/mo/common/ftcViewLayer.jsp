<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 -->
<header class="area-header-layer">
    <div class="area-inner">
        <h1 class="title">사업자번호 확인</h1>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</header>
<!-- //헤더 -->
<!-- 본문 -->
<div class="area-content-layer">
    <div class="area-inner" style="height: 100%;">
        <form name="oneSelfForm" id="oneSelfForm">
            <input type="hidden" name="reqInfo" value="<c:out value="${params.reqInfo }"/>"/>
            <input type="hidden" name="retUrl" value="32<spring:eval expression="@resource['mobile.ssl.domain']"/><spring:eval expression="@url['common.oneself.result']"/>"/>
            <input type="hidden" name="verSion" value="2"/>
        </form>
        <iframe src="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208809321" width="100%" height="100%" frameborder="no" border="0" style="display:block; width:100vw; height: 100vh"></iframe>
    </div>
</div>
<!-- //본문 -->