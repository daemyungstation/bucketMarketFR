<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/mypage.css">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|title-btn|search"/>
    <jsp:param name="headerTitle" value="가입상세"/>
</jsp:include>
<!-- //헤더 -->
<!-- 카테고리 -->
<jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
    <jsp:param name="navGroup" value="mycontract"/>
</jsp:include>
<!-- //카테고리 -->

<!-- 본문 -->
<div class="area-content"> <!-- 하단 탭바일때 aside-tabbar 클래스 추가 -->
    <div class="area-inner">

        <div class="area-mypage contain-payment">
        
            <input type="hidden" id="ORD_MST_IDX" value="<c:out value="${info.ORD_MST_IDX }"/>">

            <div class="contain-history-subscripton1 type2">
                <dl>
                    <%-- 계약 상태 별 분기 --%>
                    <c:choose>
                        <%-- 접수 --%>
                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_RECEIPT }">
                            <dt><span class="num-member"><c:out value="${info.MEM_NM }"/>&nbsp/&nbsp해피콜 상담 대기</span><c:out value="${info.PRD_MST_NM }"/></dt>
                            <dd class="date"></dd>
                            <dd class="stat">접수</dd>
                        </c:when>
                        <%-- 가입대기 --%>
                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_WAITING_TO_JOIN }">
                            <dt><span class="num-member"><c:out value="${info.MEM_NM }"/>&nbsp/&nbsp회원번호 <c:out value="${info.ACCNT_NO }"/></span><c:out value="${info.PRD_MST_NM }"/></dt>
                            <dd class="date"></dd>
                            <dd class="stat">가입대기</dd>
                        </c:when>
                        <%-- 가입 --%>
                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                            <dt><span class="num-member"><c:out value="${info.MEM_NM }"/>&nbsp/&nbsp회원번호 <c:out value="${info.ACCNT_NO }"/></span><c:out value="${info.PRD_MST_NM }"/></dt>
                            <dd class="date"><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" /></dd>
                            <dd class="stat">가입</dd>
                        </c:when>
                    </c:choose>
                </dl>
            </div>

            <hr class="divline-type6">

            <div class="contain-information-payment">
                <h3 class="title">가입상품 정보</h3>

                <!-- 정보 -->
                <div class="box-information-product1">
                    <dl>
                        <dt>가입상품명</dt>
                        <dd><c:out value="${info.PRD_MST_NM }"/></dd>
                    </dl>
                    <dl>
                        <dt>모델명</dt>
                        <dd><c:out value="${info.MODEL_CL_NM }"/></dd>
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
                        <dd><c:out value="${info.EXPR_NO }"/>회</dd>
                    </dl>
                    <dl>
                        <dt>총 상품금액</dt>
                        <dd><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원</dd>
                    </dl>
                </div>
                <!-- //정보 -->

            </div>

            <div class="contain-information-payment">
                <h3 class="title">지원혜택 정보</h3>

                <!-- 정보 -->
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
                                <fmt:formatNumber value="${info.REL_AMT }" type="number"/>원
                            </c:if>
                        </dd>
                    </dl>
                    <dl>
                        <dt>지원 회차</dt>
                        <dd><c:out value="${info.REL_CNT }"/>회</dd>
                    </dl>
                    <dl>
                        <dt>총 지원금</dt>
                        <dd><fmt:formatNumber value="${info.REL_AMT * info.REL_CNT }" type="number"/>원</dd>
                    </dl>
                </div>
                <!-- //정보 -->

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
                        <dd><ui:formatDate value="${info.BRTH_MON_DAY }" pattern="yyyy-MM-dd"/> / <c:if test="${info.SEX eq '0001' }">남자</c:if><c:if test="${info.SEX eq '0002' }">여자</c:if></dd>
                    </dl>
                    <dl>
                        <dt>주소<br >(증서배송지)</dt>
                        <dd><c:out value="${info.HOME_ADDR }"/>&nbsp<c:out value="${info.HOME_ADDR2 }"/></dd>
                    </dl>
                    <dl>
                        <dt>비상연락처</dt>
                        <dd>
                            <c:if test="${not empty info.HOME_TEL }">
                                <ui:formatPhone value="${info.HOME_TEL }"/>
                            </c:if>
                            <c:if test="${empty info.HOME_TEL }">
                                -
                            </c:if>
                        </dd>
                    </dl>
                    <dl>
                        <dt>이메일 주소</dt>
                        <dd>
                            <c:if test="${not empty info.EMAIL }">
                                <c:out value="${info.EMAIL }"/>
                            </c:if>
                            <c:if test="${empty info.EMAIL }">
                                -
                            </c:if>
                        </dd>
                    </dl>
                </div>
                <!-- //정보 -->

            </div>

            <%-- 라이프서비스 : 월지원형, 렌탈, 할부지원형 --%>
            <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT or 
                          info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL or 
                          info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">

                <hr class="divline-type4" >
    
                <div class="contain-information-payment">
                    <dl class="box-apply-liftservice">
                        <dt>라이프 서비스 신청 확인</dt>
                        <dd><span class="text-point1"><c:out value="${info.MAIN_CONTRACT_NM }"/></span></dd>
                    </dl>
                </div>
            
            </c:if>
            
            <%-- 결제 정보 : 할부지원형 --%>
            <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">

                <hr class="divline-type4" >

                <div class="contain-information-payment">
                    <dl class="box-payment-card">
                        <dt>카드 결제 정보</dt>
                        <dd>
                            <span class="text-point1">
                                <c:out value="${info.P_FN_NM }"/> / <fmt:formatNumber value="${info.P_AMT }" type="number"/>원 / 
                                <c:if test="${info.P_RMESG2 eq '00' }">
                                    일시불
                                </c:if>
                                <c:if test="${info.P_RMESG2 ne '00' }">
                                    <c:out value="${info.P_RMESG2 }"/>개월
                                </c:if>
                        </span></dd>
                    </dl>
                </div>
                
            </c:if>
            
            <%-- 배송/설치 정보 : 즉발, 렌탈 --%>
            <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE or 
                          info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL }">
                          
                <c:if test="${not empty info.INSPL_CELL }">

                    <hr class="divline-type4" >
        
                    <div class="contain-information-payment">
                        <h3 class="title">배송/설치 정보</h3>
        
                        <!-- 정보 -->
                        <div class="box-information-product2">
                            <dl>
                                <dt>상품</dt>
                                <dd><c:out value="${info.MODEL_NM }"/></dd>
                            </dl>
                            <dl>
                                <dt>옵션</dt>
                                <dd><c:out value="${info.PRD_OPT_DTL }"/></dd>
                            </dl>
                            <dl>
                                <dt>수령인</dt>
                                <dd><c:out value="${info.INSPL_MEM_NM }"/></dd>
                            </dl>
                            <dl>
                                <dt>연락처</dt>
                                <dd><ui:formatPhone value="${info.INSPL_CELL }"/></dd>
                            </dl>
                            <dl>
                                <dt>주소</dt>
                                <dd><c:out value="${info.INSPL_ADDR }"/>&nbsp<c:out value="${info.INSPL_ADDR2 }"/></dd>
                            </dl>
                        </div>
                        <!-- //정보 -->
        
                    </div>
                
                </c:if>
                
            </c:if>
            
            <%-- 추가정보 : 월지원형, 즉발 --%>
            <c:if test="${(info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT or 
                           info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE)
                          and not empty info.PRD_MST_BND_ID }">

                <hr class="divline-type4" >
    
                <div class="contain-information-payment">
                    <h3 class="title">추가 정보</h3>
                    <!-- 정보 -->
                    <div class="box-information-product1">
                        <dl>
                            <dt><c:out value="${info.PRD_MST_BND_ID }"/></dt>
                            <dd><c:out value="${info.ORD_MST_VDR_BNF_ID }"/></dd>
                        </dl>
                    </div>
                    <!-- //정보 -->
                </div>
            
            </c:if>

            <hr class="divline-type6" >

            <div class="contain-information-payment">
                <dl class="box-payment-card">
                    <dt>해피콜 상담 시간</dt>
                    <dd><c:out value="${info.HPCALL_TIME }"/></dd>
                </dl>
                
                <%-- 가입 --%>
                <c:if test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                    <div class="box-button">
                        <span class="btn-type-text7"><button class="cancel">해지신청</button></span>
                        <span class="btn-type-text7"><button class="transfer">양도/양수 신청</button></span>
                    </div>
                </c:if>
            </div>

        </div>

    </div>
</div>
<!-- //본문 -->

<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>

<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content");
        // 해지 신청
        $areaContent.on("click", "button.cancel", function() {
            var params = { ORD_MST_IDX : $areaContent.find("#ORD_MST_IDX").val() };
            $(".layer-popup1").requestLayer($.action.mycontract.info.contract.cancel.layer(), params);
        });
        // 양도/양수 신청
        $areaContent.on("click", "button.transfer", function() {
            var params = { ORD_MST_IDX : $areaContent.find("#ORD_MST_IDX").val() };
            $(".layer-popup1").requestLayer($.action.mycontract.info.contract.transfer.layer(), params);
        });
    });
</script>

</body>
</html>