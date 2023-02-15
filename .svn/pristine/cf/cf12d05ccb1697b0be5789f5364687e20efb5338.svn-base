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
    <jsp:param name="headerTitle" value="가입내역 조회"/>
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
    
        <c:choose>
        
            <%-- 조회내역 있음 --%>
            <c:when test="${fn:length(list) gt 0 }">
            
                <div class="area-mypage">
        
                    <p class="text-information-type2">* 회원상태가 '가입' 인 상품만 신청이 가능합니다. 행사/해약처리 완료된 상품 내역은 표시되지 않습니다.</p>
                    <p class="text-information-type2">* 상조 서비스 미 사용 고객에 한하여 제공되는 서비스 입니다.  제공되는 서비스 중 하나를 선택하여 이용하실 수 있습니다.</p>
        
                    <hr class="divline-type5">
                    
                    <%-- 가입내역 목록 --%>
                    <c:forEach var="item" items="${list }">
        
                        <div class="contain-history-subscripton1" data-idx="<c:out value="${item.ORD_MST_IDX }"/>">
                            <button class="info">
                            <dl>
                                <%-- 계약 상태 별 분기 --%>
                                <c:choose>
                                    <%-- 접수 --%>
                                    <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_RECEIPT }">
                                        <dt><span class="num-member"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp해피콜 상담 대기</span><c:out value="${item.PRD_MST_NM }"/></dt>
                                        <dd class="date"></dd>
                                        <dd class="stat">접수</dd>
                                    </c:when>
                                    <%-- 가입대기 --%>
                                    <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_WAITING_TO_JOIN }">
                                        <dt><span class="num-member"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp회원번호 <c:out value="${item.ACCNT_NO }"/></span><c:out value="${item.PRD_MST_NM }"/></dt>
                                        <dd class="date"></dd>
                                        <dd class="stat">가입대기</dd>
                                    </c:when>
                                    <%-- 가입 --%>
                                    <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                                        <dt><span class="num-member"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp회원번호 <c:out value="${item.ACCNT_NO }"/></span><c:out value="${item.PRD_MST_NM }"/></dt>
                                        <dd class="date"><ui:formatDate value="${item.JOIN_DT }" pattern="yyyy.MM.dd" /></dd>
                                        <dd class="stat">가입</dd>
                                    </c:when>
                                </c:choose>
                            </dl>
                            </button>
                            
                            <%-- 가입 상태에서만 출력 --%>
                            <c:if test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                            
                                <%-- 상품유형 별 버튼 노출 --%>
                                <c:choose>
                                    <%-- 월지원형 --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT }">
                                        <span class="btn-type-text7" style="display: none;"><button class="benefit">혜택조회</button></span>
                                    </c:when>
                                    <%-- 즉발(채권) --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and item.PRD_MST_BND_YN eq 'Y'}">
                                        <span class="btn-type-text7"><button class="shipping">배송정보</button></span>
                                    </c:when>
                                    <%-- 즉발(비채권) --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and item.PRD_MST_BND_YN ne 'Y'}">
                                        <span class="btn-type-text7" style="display: none;"><button class="benefit">혜택조회</button></span>
                                    </c:when>
                                    <%-- 렌탈 --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL }">
                                        <span class="btn-type-text7" style="display: none;"><button class="benefit">혜택조회</button></span>
                                    </c:when>
                                    <%-- 할부지원 --%>
                                    <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                                        <span class="btn-type-text7"><button class="shipping">배송정보</button></span>
                                    </c:when>
                                </c:choose>
                                
                                <c:if test="${!empty item.encAccntNo }">
                                <span class="btn-type-text7"><button class="certificate" data-no="<c:out value="${item.encAccntNo }"/>">회원증서</button></span>
                                </c:if>
                                
                            </c:if>
                            
                            <%-- 상품유형 별 약관 노출 --%>
                            <c:choose>
                                <%-- 월지원형 --%>
                                <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT }">
                                    <span class="btn-type-text7"><button class="term" data-gbn="<c:out value="${Code.TERM_CONTRACT_POINT1 }"/>">계약안내</button></span>
                                </c:when>
                                <%-- 즉발(채권) --%>
                                <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and item.PRD_MST_BND_YN eq 'Y'}">
                                    <span class="btn-type-text7"><button class="term" data-gbn="<c:out value="${Code.TERM_CONTRACT_HOME_APPLIANCES }"/>">계약안내</button></span>
                                </c:when>
                                <%-- 즉발(비채권) --%>
                                <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and item.PRD_MST_BND_YN ne 'Y'}">
                                    <span class="btn-type-text7"><button class="term" data-gbn="<c:out value="${Code.TERM_CONTRACT_POINT1 }"/>">계약안내</button></span>
                                </c:when>
                                <%-- 렌탈 --%>
                                <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL }">
                                    <span class="btn-type-text7"><button class="term" data-gbn="<c:out value="${Code.TERM_CONTRACT_POINT1 }"/>">계약안내</button></span>
                                </c:when>
                                <%-- 할부지원 --%>
                                <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                                    <span class="btn-type-text7"><button class="term" data-gbn="<c:out value="${Code.TERM_CONTRACT_POINT2 }"/>">계약안내</button></span>
                                </c:when>
                            </c:choose>
                            
                            <!-- 
                            <span class="btn-type-text7"><button class="term" data-gbn="3185">회원약관</button></span>
                             -->
                             
                            <%-- 후기 작성하지 않은 경우에만 출력 --%>
                            <c:if test="${empty item.PRD_REV_IDX }">
                                <span class="btn-type-text7"><button class="review">상품후기작성</button></span>
                            </c:if>
                        </div>
                    
                    </c:forEach>
                    
                    <div class="contain-information-card2">

                        <p class="text-notice-type1">꼭 확인해 주세요.</p>
                        <ul class="list-type2">
                            <li>전환서비스는 상조계약을 종료하고 선택하신 전환서비스를 이용할 수 있는 서비스이며, 잔여금을 일시로 완납 후 이용이 가능합니다.</li>
                            <li>아래의 페이지에서 확인하신 내용 외에는 별도의 상품 변경은 어려우시며, 만약 제공 서비스 외 추가 서비스를 원하실 경우, 신청 접수 이후 제공업체 담당자와 상담 시 진행해 주시면 됩니다.</li>
                            <li>제공서비스 업체 및 서비스의 내용이 변경될 수 있으며, 제휴사의 사정에 따라 제공이 어려울 수 있습니다.</li>
                        </ul>
                        
                    </div>
        
                </div>
            
            </c:when>
            <%-- 조회내역 있음 --%>
            
            <%-- 조회내역 없음 --%>
            <c:otherwise>
            
                <div class="area-mypage">
        
                    <p class="text-information-type2">* 청약철회/행사/해약 상품 내역은 표시 되지 않습니다.</p>
                    <p class="text-information-type2">* 일부 서비스 내용은 가입 및 납입상태에 따라 차이가 있을 수 있습니다. <br >더 자세한 내용은 1:1 상담하기 또는 컨택센터(1588-8511)로 문의 바랍니다.</p>
        
                    <hr class="divline-type5">
        
                    <p class="text-noresult">조회 내역이 없습니다.</p>
        
                </div>
                
            </c:otherwise>
            <%-- 조회내역 없음 --%>
            
        </c:choose>

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
        // 상세
        $areaContent.on("click", "button.info", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contain-history-subscripton1").attr("data-idx") }
            $.requestPage($.action.mycontract.info.detail.view, params);
        });
        // 혜택조회
        $areaContent.on("click", "button.benefit", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contain-history-subscripton1").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.shipping.benefit.view.layer(), params);
        });
        // 배송정보
        $areaContent.on("click", "button.shipping", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contain-history-subscripton1").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.shipping.shipping.view.layer(), params);
        });
        // 회원증서
        $areaContent.on("click", "button.certificate", function() {
            var no = $(this).data("no"); 
            window.open('https://www.daemyungimready.com/bucketmarket/printCert.do?no='+no, '출력', 'width=1250, height=900, scrollbars=yes');
        });
        // 약관
        $areaContent.on("click", "button.term", function() {
            $.common.layer.term($(this).attr("data-type"), $(this).attr("data-gbn"), true);
        });
        // 가입후기작성
        $areaContent.on("click", "button.review", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contain-history-subscripton1").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.info.review.layer(), params);
        });
    });
</script>

</body>
</html>