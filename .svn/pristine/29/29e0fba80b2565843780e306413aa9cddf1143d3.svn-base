<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">지원혜택 조회</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">

            <div class="box-member-payment">

                <div class="table-type2 type2">
                    <table>
                        <colgroup>
                            <col style="width: 160px">
                            <col style="width: auto">
                            <col style="width: 110px">
                            <col style="width: 110px">
                            <col style="width: 120px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>회원번호</th>
                                <th>가입상품명</th>
                                <th>가입일자</th>
                                <th>회원상태</th>
                                <th>현황</th>
                            </tr>
                            <tr>
                                <td class="member-num"><a href="javascript:;"><c:out value="${info.ACCNT_NO }"/></a></td>
                                <td class="member-product"><a href="javascript:;"><c:out value="${info.PRD_MST_NM }"/></a></td>
                                <td><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" /></td>
                                <td class="member-state">가입</td>
                                <c:if test="${info.BENEFIT_NO gt 0}">
                                    <td class="deliver-state"><c:out value="${info.BENEFIT_NO }"/>회 지급완료</td> 
                                </c:if>
                                <c:if test="${info.BENEFIT_NO le 0}">
                                    <td>미지급</td>
                                </c:if>
                                                
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <c:if test="${!empty info.PRD_MST_BND_ID }">
                <h2 class="title-paymentdetail type2">지급대상</h2>
                <div class="box-information-product1">
                    <dl>
                        <dt><c:out value="${info.PRD_MST_BND_ID }"/></dt>
                        <dd><strong><c:out value="${info.ORD_MST_VDR_BNF_ID }"/></strong></dd>
                    </dl>
                </div>
                </c:if>

                <h2 class="title-paymentdetail type2">혜택 지급내역</h2>
                <div class="table-type3 type3">
                    <table>
                        <colgroup>
                        <col width="10%">
                        <col width="20%">
                        <col width="20%">
                        <col width="10%">
                        <col width="20%">
                        <col width="20%">
                        </colgroup>
                        <tbody>
                        
                        <tr>
                            <th>회차</th>
                            <th>지급일</th>
                            <th>지급상태</th>
                            <th>회차</th>
                            <th>지급일</th>
                            <th>지급상태</th>
                        </tr>
                        
                        <c:if test="${fn:length(info.benefitList) > 0 }">
                        
                            <c:set var="columnCount" value="2" />
                            
                            <%-- 목록 row 수 --%>
                            <fmt:parseNumber var="rowCount" value="${fn:length(info.benefitList) / columnCount }" integerOnly="true"/>
                            
                            <%-- row --%>
                            <c:forEach var="row" begin="0" end="${rowCount }">
                                
                                <tr>
                                    
                                    <%-- column --%>
                                    <c:forEach var="column" begin="0" end="${columnCount - 1 }">
                            
                                        <c:set var="itemIndex" value="${row * columnCount + column }" />
                                    
                                        <c:choose>
                                            <c:when test="${fn:length(info.benefitList) ge itemIndex + 1 }">
                                                <c:if test="${info.BENEFIT_NO gt 0}">
                                                    <td><c:out value="${itemIndex + 1 }"/>회차</td>
                                                    <td><ui:formatDate value="${info.benefitList[ itemIndex ].PAY_DAY }" pattern="yyyy.MM.dd" /></td>
                                                    
                                                    <c:if test="${info.ORD_BNF_YN eq 'Y'}">
                                                    <td>지급완료</td>    
                                                    </c:if>
                                                    <c:if test="${info.ORD_BNF_YN eq 'N'}">
                                                    <td>미지급</td>    
                                                    </c:if>                                   
                                                </c:if>
                                                <c:if test="${info.BENEFIT_NO gt 0}">
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </c:otherwise>
                                        
                                        </c:choose>
                                    
                                    </c:forEach>
                                    
                                </tr>
                            
                            </c:forEach>
                            
                        </c:if>
                            
                        </tbody>
                    </table>
                </div>
            </div>                    

        </div>
    </div>
    <!-- //본문 -->

<script>
$(function () {
    var $layerPopup = $(".layer-popup1");
});
</script>