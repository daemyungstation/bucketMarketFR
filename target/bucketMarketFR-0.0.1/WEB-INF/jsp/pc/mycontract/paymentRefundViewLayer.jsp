<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/mypage.css">
    
    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">환급금 조회</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">

            <div class="box-member-payment">
                <div class="box-member-note type2">
                    <span>현재 가입중인 상품의 <span class="text-point2">해약환급금 정책</span>을 확인할 수 있습니다.</span>
                    <ul class="text-information-list1">
                        <li>대명아임레디의 만기 환급금은 납입 금액의 100% 입니다. (만기 납입 완료 후 익월 해약 신청 시)</li>
                        <li>중도해약에 대한 환급 기준은 상조 서비스 약관 규정에 의해 환금 됩니다.<br />(결합 상품 가입의 경우, 지원 혜택은 상조서비스 이용 또는 만기 납입 완료 시에만 제공되며, 중도 해약 시 결합 상품 지원금액은 본인 부담입니다.)</li>
                        <li>이미 해약했거나, 행사(서비스 이용 완료) 내역은 표시되지 않습니다.</li>
                    </ul>
                </div>

                <div class="table-type2 type2">
                    <table>
                        <colgroup>
                            <col style="width: 200px">
                            <col style="width: auto">
                            <col style="width: 120px">
                            <col style="width: 110px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>회원번호</th>
                                <th>가입상품명</th>
                                <th>가입일자</th>
                                <th>회원상태</th>
                            </tr>
                            <tr>
                                <td class="member-num"><a href="javascript:;"><c:out value="${info.ACCNT_NO }"/></a></td>
                                <td class="member-product"><a href="javascript:;"><c:out value="${info.PRD_MST_NM }"/></a></td>
                                <td><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" /></td>
                                <td class="member-state">가입</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table-type2">
                    <table>
                        <colgroup>
                            <col style="width: auto">
                            <col style="width: 130px">
                            <col style="width: 130px">
                            <col style="width: 130px">
                            <col style="width: 130px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>상품금액</th>
                                <th>만기회차</th>
                                <th>만기환급율</th>
                                <th>납입회차</th>
                                <th>납입금액</th>
                            </tr>
                            <tr>
                                <td><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원</td>
                                <td><c:out value="${info.EXPR_NO }"/>회</td>
                                <td>100%</td>
                                <td><c:out value="${info.PAY_NO }"/>회</td>
                                <td><fmt:formatNumber value="${info.PAY_SUM }" type="number"/>원</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <h2 class="title-paymentdetail type2">회차별 환급금 상세내역</h2>
                <div class="table-type3 type2">
                    <table>
                        <colgroup>
                        <col width="10%">
                        <col width="15%">
                        <col width="10%">
                        <col width="15%">
                        <col width="10%">
                        <col width="15%">
                        <col width="10%">
                        <col width="15%">
                        </colgroup>
                        <tbody>
                        
                        <tr>
                            <th>회차</th>
                            <th>해약금</th>
                            <th>회차</th>
                            <th>해약금</th>
                            <th>회차</th>
                            <th>해약금</th>
                            <th>회차</th>
                            <th>해약금</th>
                        </tr>
                        
                        <c:if test="${fn:length(info.paymentList) > 0 }">
                        
                            <c:set var="columnCount" value="4" />
                        
                            <%-- 환급금 목록 row 수 --%>
                            <fmt:parseNumber var="rowCount" value="${fn:length(info.paymentList) / columnCount }" integerOnly="true"/>
                        
                            <%-- row --%>
                            <c:forEach var="row" begin="0" end="${rowCount }">
                                
                                <tr>
                                    
                                    <%-- column --%>
                                    <c:forEach var="column" begin="0" end="${columnCount - 1 }">
                        
                                        <c:set var="itemIndex" value="${row * columnCount + column }" />
                                    
                                        <c:choose>
                                        
                                            <%-- 마지막 회차 --%>
                                            <c:when test="${fn:length(info.paymentList) eq itemIndex + 1 }">
                                                <td class="on"><c:out value="${itemIndex + 1 }"/></td>
                                                <td class="on"><fmt:formatNumber value="${info.paymentList[ itemIndex ].RESN_AMT }" type="number"/></td>
                                            </c:when>
                                            
                                            <%-- 일반 회차 --%>
                                            <c:when test="${fn:length(info.paymentList) gt itemIndex + 1 }">
                                                <td><c:out value="${itemIndex + 1 }"/></td>
                                                <td><fmt:formatNumber value="${info.paymentList[ itemIndex ].RESN_AMT }" type="number"/></td>
                                            </c:when>
                                            
                                            <%-- 공백 --%>
                                            <c:otherwise>
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

                <div class="box-information-mypage">
                    <p class="text-normal-type2"><strong>상조부금 납입금이란?</strong></p>
                    <p class="text-normal-type1">결합 상품의 경우, 만기 환급 시에만 결합상품 지원 할부금을 포함 하여 100% 환급이 되며, 
                        중도해약 시 해약 환급금은 결합 상품 금액을 제외한 상조부금 납입금에서만 책정됩니다.</p>

                    <hr class="divline-type3">

                    <p class="text-normal-type3">※ 회원 약관 ‘상조서비스 약관 제15조 계약의 해지 및 해약환급금’의 산식 관련 내용입니다.</p>
                    <hr class="divline-type5">

                    <p class="text-normal-type3">
                        ① 회원이 상조서비스를 이용할 의사가 없을 경우 계약을 해지할 수 있다.<br />
                        ② 회원의 사정으로 해지된 경우 회사는 회원의 납입금에서 모집수당, 기타 관리비 등을 공제한 아래 산식에 따른 해약환급금을 회원의 신청완료일로부터 3영업일 이내에 회원에게 환급하여야 한다.<br />
                        단, 납입금의 범위 내에서 회원이 다른 서비스를 이용하였을 경우 해약환급금은 산식에 따른 환급금에서 회원이 이용한 서비스의 상품금액을 공제하여 환급한다. 
                    </p>
                    <hr class="divline-type5">
                    <p class="text-normal-type3">
                        [해약환급금 산식]<br>
                        정기형<br />
                        - 해약환급금 = 납입금 – 관리비 누계 – 모집수당 공제액<br />
                        - 모집수당 공제액 = 모집수당 Ⅹ 0.75 + 모집수당 Ⅹ 0.25 Ⅹ (기 납입 월수 / 총 납입기간 월수)<br />
                        - 관리비 = 납입금의 5%(총 관리비 상한 50만원) <br />
                        - 모집수당 = 계약대금의 10%(상한 50만원) <br />
                        납입금 누계가 관리 누계와 모집수당 공제액의 합보다 적은 경우에는 해약환급금을 0으로 한다. <br />
                        모집수당은 총 계약대금 대비 10%로 하되, 500,000원을 초과할 수 없음. <br /><br />

                        부정기형 <br />
                        - 해약환급금 = 납입금 누계 Ⅹ 0.85
                    </p>
                    <hr class="divline-type5">
                    <p class="text-normal-type3">
                        ※ 중도 해약 시 해약환급금은 정해진 산식에 따라 산정되며, 별도 신청절차를 거쳐, 최종 해약처리 이후 3영업일 이내 환급함.<br/>(최종 만기 시에는 만기 익월부터 100% 환급)<br />
                        ※ 정기형이란, 총 계약대금을 1년 이상의 기간을 두고 월별로 균분하여, 납입하는 선불식 할부계약 형태를 말한다.<br />
                        ※ 부정기형이란, 정기형을 제외한 선불식 할부계약 형태를 말한다.<br />
                        ※ 위의 산식은 공정거래위원회 ‘상조해약환급금 산정기준 고시’을 준수하고 있으며, 상품 및 회차에 따른 해약환급률은 홈페이지(<a href="https://www.daemyungimready.com" title="새창열림" target="_blank">https://www.daemyungimready.com</a>)를 통하여 확인 가능합니다.
                    </p>
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