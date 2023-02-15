<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/myplanner.css">
    <link rel="stylesheet" type="text/css" href="https://bo.bucketmarket.co.kr/resources/css/style.css">
</head>
<style>
table th, table td { font-weight: 400;}
</style>
<body class="popup page-popup" data-menu_group="planner" data-menu_subclass="plannerStatus">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <h3 class="title">
                    <span><b>상담현황</b></span>
                </h3>
                
                <table cellspacing="0" class="table-col table-b">
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 20%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>상담사</th>
                            <th>상담내용</th>
                            <th>등록시간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty list}">
                                <c:forEach var="row" items="${list }" varStatus="i">
                                    <tr>
                                        <td>
                                            <c:out value="${row.ACTP_ID }" />
                                        </td>
                                        <td>
                                            <c:out value="${row.COUNSELL_MEMO }" />
                                        </td>
                                        <td>
                                            <ui:formatDate value="${row.REG_DM }" pattern="yyyy.MM.dd HH:MM:SS"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="3">상담내역이 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                
                <%-- 저장/닫기 --%>
                <div class="grid section-button-search">
                    <a href="javascript:self.close();" class="button small">
                        <span>닫기</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
</body>
</html>