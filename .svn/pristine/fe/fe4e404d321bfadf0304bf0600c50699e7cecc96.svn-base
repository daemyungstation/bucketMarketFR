<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="area-navigation-local">
    <div class="area-inner">
        <h2 class="title"><c:out value="${param.asideTitle }"/></h2>
        <ul>
            <ui:menu group="${param.asideGroup }" categoryList="${requestScope[param.categoryListName]}"/>
        </ul>
        
        <!-- 배너 -->
        <c:if test="${param.asideGroup eq 'myplanner_pc' and not empty banner }">
            <c:set var="banner" value="${banner[0] }"/>
            <div class="box-banner">
                <a href="javascript:$.requestLink('<c:out value="${banner.BNR_MST_URL }"/>', '<c:out value="${banner.BNR_MST_TGT }"/>');">
                    <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${banner.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${banner.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/none.png'"/>
                </a>
            </div>
        </c:if>
        
        <!-- 배너 -->
        <c:if test="${param.asideGroup eq 'mycontract' and not empty banner }">
            <c:set var="banner" value="${banner[0] }"/>
            <div class="box-banner">
                <a href="javascript:$.requestLink('<c:out value="${banner.BNR_MST_URL }"/>', '<c:out value="${banner.BNR_MST_TGT }"/>');">
                    <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${banner.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${banner.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/none.png'"/>
                </a>
            </div>
        </c:if>
    </div>
</div>