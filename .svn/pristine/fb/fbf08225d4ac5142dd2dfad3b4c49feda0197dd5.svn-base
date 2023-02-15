<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<c:set var="orderCount" value="${fn:length(info.detailList) }"/>
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/payment.css">
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/mypage.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title|home"/>
        <jsp:param name="headerTitle" value="전자청약 상품가입 신청"/>
    </jsp:include>
    <!-- 본문 -->
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-payment">
                <div class="box-information-appresult">
                    <p class="text-information-type1 notice1"><span class="text-point2"><c:out value="${info.MEM_NM }"/></span> 님, <br >상품가입이 완료되었습니다.</p>
                    <p class="text-information-type2">1~2일 이내 전문 상담원이 해피콜을 드려 <br >최종 가입상담을 안내해 드립니다.</p>
                </div>
                <div class="box-information-type1">
                    <p>신청하신 해피콜 상담시간(<c:out value="${info.HPCALL_TIME_NM }"/>)에 <br >통화 완료 후에 최종가입이 이루어집니다.</p>
                </div>
                <p class="text-normal-type1">가입일 <ui:formatDate value="${info.ORD_MST_REG_DT }" pattern="yyyy.MM.dd"/></p>
                <div class="contain-information-payment">
                    <h3 class="title">가입상품 정보</h3>
                    <c:if test="${orderCount gt 1 }">
                        <p class="information-option"><span class="text-point1">가입 구좌 <c:out value="${orderCount }"/>개</span></p>
                    </c:if>
                    <div class="box-information-product1">
                        <dl>
                            <dt>가입상품명</dt>
                            <dd><c:out value="${info.PRD_MST_NM }"/></dd>
                        </dl>
                        <dl>
                            <dt>모델명</dt>
                            
                            <dd><c:out value="${info.PRD_MST_MD }"/></dd>
                        </dl>
                        <dl>
                            <dt>월 납입금</dt>
                            <dd>
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
                            </dd>
                        </dl>
                        <dl>
                            <dt>만기 회차</dt>
                            <dd><fmt:formatNumber value="${info.EXPR_NO }" type="number"/>회</dd>
                        </dl>
                        <dl>
                            <dt>총 상품금액</dt>
                            <dd><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원</dd>
                        </dl>
                    </div>
                </div>
                <div class="contain-information-payment">
                    <h3 class="title">지원혜택 정보</h3>
                    <div class="box-information-product1">
                        <dl>
                            <dt>지원혜택</dt>
                            <dd><c:out value="${info.PRD_MST_SPL_NM }"/></dd>
                        </dl>
                        <dl>
                            <dt>월 지원금</dt>
                            <dd>
                                <%-- 즉발(채권) --%>
                                <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y' }">
                                    -
                                </c:if>
                                <%-- 월지원형/즉발(비채권)/렌탈/할부지원 --%>
                                <c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') }">
                                    <fmt:formatNumber value="${info.MON_REL_AMT }" type="number"/>원
                                </c:if>
                            </dd>
                        </dl>
                        <dl>
                            <dt>지원 회차</dt>
                            <dd><fmt:formatNumber value="${info.REL_CNT }" type="number"/>회</dd>
                        </dl>
                        <dl>
                            <dt>총 지원금</dt>
                            <dd><fmt:formatNumber value="${info.REL_AMT }" type="number"/>원</dd>
                        </dl>
                    </div>
                </div>
                <div class="contain-information-payment">
                    <h3 class="title">가입자 정보 정보</h3>
                    <!-- 정보 -->
                    <div class="box-information-product2">
                        <dl>
                            <dt>이름</dt>
                            <dd><c:out value="${info.MEM_NM }"/></dd>
                        </dl>
                        <dl>
                            <dt>연락처</dt>
                            <dd><ui:formatPhone value="${info.CELL }"/></dd>
                        </dl>
                        <dl>
                            <dt>생년월일/성별</dt>
                            <dd><c:out value="${info.BRTH_MON_DAY }"/> / <c:out value="${Const.SEX[info.SEX] }"/></dd>
                        </dl>
                        <dl>
                            <dt>주소<br >(증서배송지)</dt>
                            <dd><c:out value="${info.HOME_ADDR }"/> <c:out value="${info.HOME_ADDR2 }"/></dd>
                        </dl>
                        <dl>
                            <dt>비상연락처</dt>
                            <dd>
                                <c:if test="${empty info.HOME_TEL }">-</c:if>
                                <c:if test="${not empty info.HOME_TEL }"><ui:formatPhone value="${info.HOME_TEL }"/></c:if>
                            </dd>
                        </dl>
                        <dl>
                            <dt>이메일 주소</dt>
                            <dd>
                                <c:if test="${empty info.EMAIL }">-</c:if>
                                <c:if test="${not empty info.EMAIL }"><c:out value="${info.EMAIL }"/></c:if>
                            </dd>
                        </dl>
                    </div>
                </div>
                <hr class="divline-type4" >
                
                <c:if test="${info.isMainLifeService }">
                    <div class="contain-information-payment">
                        <dl class="box-payment-card">
                            <dt>라이프 서비스 신청</dt>
                            <dd>
                                <span class="text-point1">
                                    <c:if test="${not empty info.detailList }">
                                        <c:forEach var="row" items="${info.detailList }" varStatus="stat">
                                            <c:out value="${row.MAIN_CONTRACT_NM }"/>
                                            <c:if test="${not stat.last }">, </c:if>
                                        </c:forEach>
                                    </c:if>
                                </span>
                            </dd>
                        </dl>
                    </div>
                    <hr class="divline-type4" >
                </c:if>
                
                <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                    <div class="contain-information-payment">
                        <dl class="box-payment-card">
                            <dt>카드 결제 정보</dt>
                            <dd>
                                <span class="text-point1">
                                    <c:out value="${info.P_FN_NM }"/> / <fmt:formatNumber value="${info.P_AMT }"/>원 / 
                                    <c:if test="${info.P_RMESG2 eq '00' }">(일시불) </c:if>
                                    <c:if test="${info.P_RMESG2 ne '00' }">(<c:out value="${info.P_RMESG2 }"/>개월)</c:if>
                                </span>
                            </dd>
                        </dl>
                    </div>
                    <hr class="divline-type4" >
                </c:if>
                <c:if test="${info.isDelivery }">
                    <div class="contain-information-payment">
                        <h3 class="title">배송/설치 정보</h3>
                        <c:if test="${orderCount gt 1 }">
                            <p class="information-option"><span class="text-point1">배송 주소 <c:out value="${orderCount }"/>개</span></p>
                        </c:if>
                        <c:if test="${not empty info.detailList }">
                            <c:forEach var="row" items="${info.detailList }">
                                <div class="box-information-product2">
                                    <dl>
                                        <dt>상품</dt>
                                        <dd><c:out value="${info.PRD_MST_NM }"/></dd>
                                    </dl>
                                    <dl>
                                        <dt>옵션</dt>
                                        <dd><c:out value="${row.PRD_OPT_DTL }"/></dd>
                                    </dl>
                                    <dl>
                                        <dt>수령인</dt>
                                        <dd><c:out value="${row.INSPL_MEM_NM }"/></dd>
                                    </dl>
                                    <dl>
                                        <dt>연락처</dt>
                                        <dd><ui:formatPhone value="${row.INSPL_CELL }"/></dd>
                                    </dl>
                                    <dl>
                                        <dt>주소</dt>
                                        <dd><c:out value="${row.INSPL_ADDR }"/> <c:out value="${row.INSPL_ADDR2 }"/></dd>
                                    </dl>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <hr class="divline-type4" >
                </c:if>
                <c:if test="${info.isEtc }">
                    <div class="contain-information-payment">
                        <h3 class="title">추가 정보</h3>
                        <c:if test="${orderCount gt 1 }">
                            <p class="information-option"><span class="text-point1"><c:out value="${orderCount }"/>건</span></p>
                        </c:if>
                        <div class="box-information-product1">
                            <dl>
                                <dt><c:out value="${info.PRD_MST_BND_ID }"/></dt>
                                <c:if test="${not empty info.detailList }">
                                    <dd>
                                        <c:forEach var="row" items="${info.detailList }" varStatus="stat">
                                            <c:out value="${row.ORD_MST_VDR_BNF_ID }"/><c:if test="${not stat.last }"><br/></c:if>
                                        </c:forEach>
                                    </dd>
                                </c:if>
                            </dl>
                        </div>
                    </div>
                    <hr class="divline-type4" >
                </c:if>
                <div class="contain-information-payment">
                    <dl class="box-payment-card">
                        <dt>해피콜 상담 시간</dt>
                        <dd><span class="text-point1"><c:out value="${info.HPCALL_TIME_NM }"/></span></dd>
                    </dl>
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
    <!-- //본문 -->
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <script>
        $(function () {
            var $areaContent = $(".area-content"),
                $layerPopup = $(".layer-popup1");
            $areaContent.on("click", ".review", function (e) {
                e.preventDefault();
                $layerPopup.requestLayer($.action.mycontract.info.review.layer(), {ORD_MST_GRP_IDX : "<c:out value="${info.ORD_MST_GRP_IDX }"/>"});
            });
        });
    </script>
</body>
</html>