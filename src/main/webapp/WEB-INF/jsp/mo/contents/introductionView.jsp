<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/fullpage.css">
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/promotion.css">
</head>
<body>
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|title|search"/>
    <jsp:param name="headerTitle" value="버킷마켓 소개"/>
</jsp:include>
<div class="area-content">
    <%-- <c:if test="${not empty productList }">
    <div class="area-inner" style="margin:0 auto;">
        <div class="contain-event-basis">
            <div class="box-detail-product4">
                <div class="box-product4-inner">
                    <ul class="brand-list">
                        <c:forEach var="dtlRow" items="${productList_top }">
                            <li>
                                <ui:productList info="${dtlRow.product_top.info }" thubnailSize="750"/>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </c:if> --%>
    <div class="area-inner">
        <div class="box-bucket-intro">
            <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_01_01.jpg" alt="버킷마켓 소개" />
            <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_01_02.jpg" alt="버킷마켓 소개" />
            <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_01_03.jpg" alt="버킷마켓 소개" />

            <br style="clear:both;">
            <a target="_blank" href="https://www.bucketmarket.co.kr/fr/product/basicProductView.do?PRD_MST_NO=DMBK2020073000760147">
                <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_02.png" alt="버킷마켓 소개" /><br style="clear:both;">
            </a>
            <a target="_blank" href="https://www.bucketmarket.co.kr/fr/product/basicProductView.do?PRD_MST_NO=DMBK2021070502550256">
                <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_03.png" alt="버킷마켓 소개" /><br style="clear:both;">
            </a>
            <a target="_blank" href="https://www.bucketmarket.co.kr/fr/product/basicProductView.do?PRD_MST_NO=DMBK2020072900630069">
                <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_04.png" alt="버킷마켓 소개" /><br style="clear:both;">
            </a>
            <a target="_blank" href="https://www.bucketmarket.co.kr/fr/product/basicProductView.do?PRD_MST_NO=DMBK2020121401630165">
                <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_05.png" alt="버킷마켓 소개" /><br style="clear:both;">
            </a>
            <a target="_blank" href="https://www.bucketmarket.co.kr/fr/product/basicProductView.do?PRD_MST_NO=DMBK2021102702570258">
                <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_06.png" alt="버킷마켓 소개" /><br style="clear:both;">
            </a>
            <a target="_blank" href="https://www.bucketmarket.co.kr/fr/product/basicProductView.do?PRD_MST_NO=DMBK2021070202530254">
                <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_07.png" alt="버킷마켓 소개" /><br style="clear:both;">
            </a>
            <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_08_01.jpg" alt="버킷마켓 소개" />
            <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_08_02.jpg" alt="버킷마켓 소개" />
            <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_08_03.jpg" alt="버킷마켓 소개" />
            <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_08_04.jpg" alt="버킷마켓 소개" />
            <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_08_05.jpg" alt="버킷마켓 소개" />
            <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_08_06.jpg" alt="버킷마켓 소개" />
            <img src="<spring:eval expression="@resource['image.ssl.domain']"/>/resources/mo/images/img_bucket_intro_main_mo_08_07.jpg" alt="버킷마켓 소개" />
            <br style="clear:both;">
            
        </div>
    </div>
    <c:if test="${not empty productList }">
    <div class="area-inner" style="margin:0 auto;">
        <div class="contain-event-basis">
            <div class="box-detail-product4">
                <div class="box-product4-inner">
                    <ul class="brand-list">
                        <c:forEach var="dtlRow" items="${productList }">
                            <li>
                                <ui:productList info="${dtlRow.product.info }" thubnailSize="750"/>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </c:if>
</div>
<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content");
    });
</script>
</body>
</html>