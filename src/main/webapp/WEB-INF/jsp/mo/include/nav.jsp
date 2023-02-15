<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 하위 카테고리 --%>
<nav class="area-category">
    <div class="area-inner">
        <ui:menu group="${param.navGroup }" categoryList="${requestScope[param.categoryListName]}"/>
    </div>
</nav>
<%--// 하위 카테고리 --%>