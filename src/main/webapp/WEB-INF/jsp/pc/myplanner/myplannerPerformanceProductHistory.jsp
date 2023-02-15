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
                    <span><b>조회기간 : 
                        <c:choose>
                            <c:when test="${not empty commandMap.searchStartDate }">
                                <c:out value="${commandMap.searchStartDate }"/>
                            </c:when>
                            <c:otherwise>
                                
                            </c:otherwise>
                        </c:choose>
                        ~
                        <c:choose>
                            <c:when test="${not empty commandMap.searchEndDate }">
                                <c:out value="${commandMap.searchEndDate }"/>
                            </c:when>
                            <c:otherwise>
                                
                            </c:otherwise>
                        </c:choose>
                    </b></span>
                </h3>
                <form id="frm" name="frm" method="get">
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
                    <input type="hidden" name="searchContractType" value="<c:out value="${commandMap.searchContractType }"/>" />
                    <input type="hidden" name="ordMstIdx" value="" />
                    <div class="grid section-button-list">
                        <div class="text-right">
                            <select class="select" id="selectContractType" name="selectContractType" >
                                <option value="<c:out value="${Code.CONTRACT_STATUS_RECEIPT }"/>" <c:if test="${Code.CONTRACT_STATUS_RECEIPT eq commandMap.searchContractType }">selected</c:if>>접수</option>
                                <option value="<c:out value="${Code.CONTRACT_STATUS_WAITING_TO_JOIN }"/>" <c:if test="${Code.CONTRACT_STATUS_WAITING_TO_JOIN eq commandMap.searchContractType }">selected</c:if>>가입대기</option>
                                <option value="<c:out value="${Code.CONTRACT_STATUS_JOIN }"/>" <c:if test="${Code.CONTRACT_STATUS_JOIN eq commandMap.searchContractType }">selected</c:if>>가입</option>
                                <option value="<c:out value="${Code.CONTRACT_STATUS_CANCEL }"/>" <c:if test="${Code.CONTRACT_STATUS_CANCEL eq commandMap.searchContractType }">selected</c:if>>해약</option>
                            </select>
                        </div>
                    </div>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 4%;" />
                            <col style="width: 8%;" />
                            <col style="width: 10%;" />
                            <col style="width: 20%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 8%;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>가입자명</th>
                                <th>연락처</th>
                                <th>온라인 상품명</th>
                                <th>접수일자</th>
                                <th>가입대기일자</th>
                                <th>가입일자</th>
                                <th>해약일자</th>
                                <th>가입상태</th>
                                <th>상담메모</th>
                                <th>영업사원</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list}">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr class="list-detail" data-ordmstidx="<c:out value="${row.ORD_MST_IDX }" />">
                                            <td>
                                                <c:out value="${fn:length(list) - i.index }" />
                                            </td>
                                            <td style="color:#fd5490; cursor:pointer;">
                                                <c:out value="${row.MEM_NM }" />
                                            </td>
                                            <td style="color:#fd5490; cursor:pointer;">
                                                <c:out value="${row.CELL }" />
                                            </td>
                                            <td style="color:#fd5490; cursor:pointer;">
                                                <c:out value="${row.PRD_MST_NM }" />
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.RECEIPT_DT }" pattern="yyyy.MM.dd"/>
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.WAITING_TO_JOIN_DT }" pattern="yyyy.MM.dd"/>
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.JOIN_DT }" pattern="yyyy.MM.dd"/>
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.CANCEL_DT }" pattern="yyyy.MM.dd"/>
                                            </td>
                                            <td>
                                                <c:out value="${row.JOIN_STATE_NM }" />
                                            </td>
                                            <td style="text-decoration:underline; color:#fd5490; cursor:pointer;">
                                                <c:out value="${row.COUNSELL_MEMO }" />
                                            </td>
                                            <td style="text-decoration:underline; color:#fd5490; cursor:pointer;">
                                                <c:out value="${row.SELLER_NAME }" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="10">실적현황이 없습니다.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </form>
                
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
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm");
            $("#selectContractType").change(function(){
                $("input[name='searchContractType']").val($("#selectContractType").val());
                $frm.attr('action', $.action.myplanner.performance.product.history());
                $frm.submit();
            });
            $popup.on("click", ".list-detail", function(){
                $("input[name='ordMstIdx']").val($(this).data("ordmstidx"));
                $frm.postPop($.action.myplanner.performance.product.counsel(), "plannerStatusCouselPopup", "width=1600,height=800,left=50,top=50");
            });
            
        });
    </script>
</body>
</html>