<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">조회기간 : 
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
            </h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    
    
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">
            <!-- 팝업본문 -->
            <div class="box-tab-body tab3 on">
                <div class="box-reward-inner">
                    <form id="frm" name="frm" method="get">
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
                        <input type="hidden" name="searchContractType" value="<c:out value="${commandMap.searchContractType }"/>" />
                        <input type="hidden" name="ordMstIdx" value="" />
                        <div class="box-reward-search" style="margin: 20px 15px 0px 15px;">
                            <div style="text-align:right;">
                                <select class="select" id="selectContractType" name="selectContractType" style="width: 100px; height: 40px;" >
                                    <option value="<c:out value="${Code.CONTRACT_STATUS_RECEIPT }"/>" <c:if test="${Code.CONTRACT_STATUS_RECEIPT eq commandMap.searchContractType }">selected</c:if>>접수</option>
                                    <option value="<c:out value="${Code.CONTRACT_STATUS_WAITING_TO_JOIN }"/>" <c:if test="${Code.CONTRACT_STATUS_WAITING_TO_JOIN eq commandMap.searchContractType }">selected</c:if>>가입대기</option>
                                    <option value="<c:out value="${Code.CONTRACT_STATUS_JOIN }"/>" <c:if test="${Code.CONTRACT_STATUS_JOIN eq commandMap.searchContractType }">selected</c:if>>가입</option>
                                    <option value="<c:out value="${Code.CONTRACT_STATUS_CANCEL }"/>" <c:if test="${Code.CONTRACT_STATUS_CANCEL eq commandMap.searchContractType }">selected</c:if>>해약</option>
                                </select>
                            </div>
                        </div>
                    </form>
                    <div class="box-scroll-table table-type3">
                        <table>
                            <colgroup>
                                <col style="width: 50px;" />
                                <col style="width: 100px;" />
                                <col style="width: 100px;" />
                                <col style="width: 200px;" />
                                <col style="width: 100px;" />
                                <col style="width: 100px;" />
                                <col style="width: 100px;" />
                                <col style="width: 100px;" />
                                <col style="width: 100px;" />
                                <col style="width: 200px;" />
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
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty list}">
                                        <c:forEach var="row" items="${list }" varStatus="i">
                                            <tr class="list-counsel-detail" data-ordmstidx="<c:out value="${row.ORD_MST_IDX }" />">
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
                    </div>
                </div>
            </div>
            <!-- //팝업본문 -->                
        </div>
    </div>
    <!-- //본문 -->
    <script>
        $(function () {
            $("#selectContractType").change(function(){
                var param = {
                        searchStartDate : document.frm.searchStartDate.value,
                        searchEndDate : document.frm.searchEndDate.value,
                        searchContractType : $("#selectContractType").val(),
                        searchPrdMstNm : document.frm.searchPrdMstNm.value
                    };
                $(".layer-popup1").requestLayer($.action.myplanner.performance.product.history(), param );
            });
            $(".list-counsel-detail").click(function(){
                $("input[name='ordMstIdx']").val($(this).data("ordmstidx"));
                
                $(".layer-popup2").requestLayer($.action.myplanner.performance.product.counsel(), {ordMstIdx:$(this).data("ordmstidx")} );
            });
            
        });
    </script>

