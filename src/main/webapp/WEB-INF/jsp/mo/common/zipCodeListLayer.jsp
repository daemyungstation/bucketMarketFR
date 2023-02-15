<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 헤더 --%>
<header class="area-header-layer">
    <div class="area-inner">
        <h1 class="title">주소찾기</h1>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</header>
<%-- //헤더 --%>
<%-- 본문 --%>
<div class="area-content-layer">
    <div class="area-inner">
        <%@include file="/WEB-INF/jsp/common/template/zipCode.jsp" %>
    </div>
</div>
<%-- //본문 --%>
<script>
$(function () {
    <%-- 
    - 사용법
    $.common.layer.zipcode(function (data) {
        console.log(
            "우편번호 : " + data.zipcode + " " +
            "주소 : " + data.addr + " " +
            "지번주소 : " + data.jibunAddress + " " +
            "도로명주소 : " + data.roadAddress + " "
        );
    });
    --%>
    var $layerZipCode = $(".layer-popup1");
    new ZipCode(function () {
        $layerZipCode.find(".btn-close").trigger("click");
    }, $.callback);
});
</script>