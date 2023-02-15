<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<c:set var="orderCount" value="${fn:length(info.detailList) }"/>
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/payment.css">
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/mypage.css">
</head>
<body class="">
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-top-type3">
            <div class="area-inner">
                <div class="contain-order-inner">
                    <div class="contain-step">
                        <div class="box-information-appresult">
                            <p class="text-information-type1 notice2"><span class="text-point2"><c:out value="${info.MEM_NM }"/></span> 님, <br>전자청약 상품가입 신청이 완료되었습니다.</p>
                            <p class="text-information-type2">1~2일 이내 전문 상담원이 해피콜을 드려 최종 가입상담을 안내드립니다.<br />신청하신 해피콜 상담시간 <span class="text-point1">(<c:out value="${info.HPCALL_TIME_NM }"/>)</span>에 통화 완료 후에 최종 가입이 이루어집니다.</p>
                        </div>
                        <div class="box-join-day">가입신청일 <ui:formatDate value="${info.ORD_MST_REG_DT }" pattern="yyyy.MM.dd"/></div>
                        <div class="box-appresult-table">
                            <h4>가입상품 정보</h4>
                            <p class="text-notice-type2 form2">가입 구좌 <c:out value="${orderCount }"/>개</p>
                            <div class="table-type1">
                                <table>
                                    <colgroup>
                                        <col style="width:320px">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>가입상품명</th>
                                        <td><c:out value="${info.PRD_MST_NM }"/></td>
                                    </tr>
                                    <tr>
                                        <th>모델명</th>
                                        <td><c:out value="${info.PRD_MST_MD }"/></td>
                                    </tr>
                                    <tr>
                                        <th>월 납입금</th>
                                        <td>
                                            <%-- 즉발(채권) --%>
                                            <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y' }">
                                                -
                                            </c:if>
                                            <%-- 월지원형/즉발(비채권)/렌탈/할부지원 --%>
                                            <c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') }">
                                                <%-- 정기형 --%>
                                                <c:if test="${info.PRD_MST_IRG_YN ne 'Y' }">
                                                    <fmt:formatNumber value="${info.MON_PAY_AMT }" type="number"/>원
                                                </c:if>
                                                <%-- 비정기형 --%>
                                                <c:if test="${info.PRD_MST_IRG_YN eq 'Y' }">
                                                    <c:if test="${not empty info.PRD_MST_PAY_AMT1 and not empty info.PRD_MST_PAY_CNT1 }">
                                                        <fmt:formatNumber value="${info.PRD_MST_PAY_AMT1 }"/>원 × <c:out value="${info.PRD_MST_PAY_CNT1 }"/>회 납입<br/>
                                                    </c:if>
                                                    <c:if test="${not empty info.PRD_MST_PAY_AMT2 and not empty info.PRD_MST_PAY_CNT2 }">
                                                        <fmt:formatNumber value="${info.PRD_MST_PAY_AMT2 }"/>원 × <c:out value="${info.PRD_MST_PAY_CNT2 }"/>회 납입<br/>
                                                    </c:if>
                                                    <c:if test="${not empty info.PRD_MST_PAY_AMT3 and not empty info.PRD_MST_PAY_CNT3 }">
                                                        <fmt:formatNumber value="${info.PRD_MST_PAY_AMT3 }"/>원 × <c:out value="${info.PRD_MST_PAY_CNT3 }"/>회 납입
                                                    </c:if>
                                                </c:if>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>만기 회차</th>
                                        <td><fmt:formatNumber value="${info.EXPR_NO }" type="number"/>회</td>
                                    </tr>
                                    <tr>
                                        <th>총 상품금액</th>
                                        <td><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <h4>지원혜택 정보</h4>
                            <div class="table-type1">
                                <table>
                                    <colgroup>
                                        <col style="width:320px">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>지원혜택</th>
                                        <td><c:out value="${info.PRD_MST_SPL_NM }"/></td>
                                    </tr>
                                    <tr>
                                        <th>월 지원금</th>
                                        <td>
                                            <%-- 즉발(채권) --%>
                                            <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y' }">
                                                -
                                            </c:if>
                                            <%-- 월지원형/즉발(비채권)/렌탈/할부지원 --%>
                                            <c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') }">
                                                <fmt:formatNumber value="${info.MON_REL_AMT }" type="number"/>원
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>지원 회차</th>
                                        <td><fmt:formatNumber value="${info.REL_CNT }" type="number"/>회</td>
                                    </tr>
                                    <tr>
                                        <th>총 지원금</th>
                                        <td><fmt:formatNumber value="${info.REL_AMT }" type="number"/>원</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <h4>가입자 정보</h4>
                            <div class="table-type1">
                                <table>
                                    <colgroup>
                                        <col style="width:320px">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>이름</th>
                                        <td><c:out value="${info.MEM_NM }"/></td>
                                    </tr>
                                    <tr>
                                        <th>연락처</th>
                                        <td><ui:formatPhone value="${info.CELL }"/></td>
                                    </tr>
                                    <tr>
                                        <th>생년월일 / 성별</th>
                                        <td><c:out value="${info.BRTH_MON_DAY }"/> / <c:out value="${Const.SEX[info.SEX] }"/></td>
                                    </tr>
                                    <tr>
                                        <th>주소(증서배송지)</th>
                                        <td><c:out value="${info.HOME_ADDR }"/> <c:out value="${info.HOME_ADDR2 }"/></td>
                                    </tr>
                                    <tr>
                                        <th>비상연락처</th>
                                        <td>
                                            <c:if test="${empty info.HOME_TEL }">-</c:if>
                                            <c:if test="${not empty info.HOME_TEL }"><ui:formatPhone value="${info.HOME_TEL }"/></c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이메일주소</th>
                                        <td>
                                            <c:if test="${empty info.EMAIL }">-</c:if>
                                            <c:if test="${not empty info.EMAIL }"><c:out value="${info.EMAIL }"/></c:if>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <c:if test="${info.isMainLifeService }">
                                <h4>라이프 서비스 신청</h4>
                                <div class="table-type1">
                                    <table>
                                        <colgroup>
                                            <col style="width:320px">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>서비스</th>
                                            <td>
                                                <c:if test="${not empty info.detailList }">
                                                    <c:forEach var="row" items="${info.detailList }" varStatus="stat">
                                                        <c:out value="${row.MAIN_CONTRACT_NM }"/>
                                                        <c:if test="${not stat.last }">, </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                            <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                                <h4>카드결제 정보</h4>
                                <div class="table-type1">
                                    <table>
                                        <colgroup>
                                            <col style="width:320px">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>결제수단</th>
                                            <td><c:out value="${info.P_FN_NM }"/></td>
                                        </tr>
                                        <tr>
                                            <th>결제금액</th>
                                            <td>
                                                <fmt:formatNumber value="${info.P_AMT }"/>원
                                                <c:if test="${info.P_RMESG2 eq '00' }">(일시불) </c:if>
                                                <c:if test="${info.P_RMESG2 ne '00' }">(<c:out value="${info.P_RMESG2 }"/>개월)</c:if>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                            <c:if test="${info.isDelivery }">
                                <h4>배송/설치 정보</h4>
                                <div class="table-type1">
                                    <c:if test="${not empty info.detailList }">
                                        <c:forEach var="row" items="${info.detailList }" varStatus="stat">
                                            <table>
                                                <colgroup>
                                                    <col style="width:320px">
                                                    <col>
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th>상품<c:out value="${stat.index + 1 }"/></th>
                                                    <td><c:out value="${info.PRD_MST_NM }"/></td>
                                                </tr>
                                                <tr>
                                                    <th>옵션</th>
                                                    <td><c:out value="${row.PRD_OPT_DTL }"/></td>
                                                </tr>
                                                <tr>
                                                    <th>수령인</th>
                                                    <td><c:out value="${row.INSPL_MEM_NM }"/></td>
                                                </tr>
                                                <tr>
                                                    <th>연락처</th>
                                                    <td><ui:formatPhone value="${row.INSPL_CELL }"/></td>
                                                </tr>
                                                <tr>
                                                    <th>주소</th>
                                                    <td><c:out value="${row.INSPL_ADDR }"/> <c:out value="${row.INSPL_ADDR2 }"/></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </c:if>
                            <c:if test="${info.isEtc }">
                                <h4>추가정보</h4>
                                <p class="text-notice-type2 form2"><c:out value="${info.PRD_MST_BND_ID }"/></p>
                                <div class="table-type1">
                                    <table>
                                        <colgroup>
                                            <col style="width:320px">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                            <c:if test="${not empty info.detailList }">
                                                <c:forEach var="row" items="${info.detailList }" varStatus="stat">
                                                    <tr>
                                                        <th>추가정보 <c:out value="${stat.index + 1 }"/></th>
                                                        <td><c:out value="${row.ORD_MST_VDR_BNF_ID }"/></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                            <h4>해피콜 상담시간</h4>
                            <div class="table-type1">
                                <table>
                                    <colgroup>
                                        <col style="width:320px">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>상담시간</th>
                                        <td><c:out value="${info.HPCALL_TIME_NM }"/></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="fixed-box-button">
                            <c:if test="${reviewCount eq 0 }">
                                <span class="btn-type-text1 review"><button>가입후기 작성</button></span>
                            </c:if>
                            <c:if test="${reviewCount gt 0 }">
                                <span class="btn-type-text1"><button onclick="$.requestPage($.action.main.index());">버킷마켓 홈</button></span>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    <script>
        $(function () {
            var $areaBody = $(".area-body"),
                $layerPopup = $(".layer-popup1");
            $areaBody.on("click", ".review", function (e) {
                e.preventDefault();
                $layerPopup.requestLayer($.action.mycontract.info.review.layer(), {ORD_MST_GRP_IDX : "<c:out value="${info.ORD_MST_GRP_IDX }"/>"});
            });
        });
    </script>
</body>
</html>