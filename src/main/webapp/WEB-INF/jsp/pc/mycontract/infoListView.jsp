<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/mypage.css">
</head>
<body class="">

<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>

<jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
    <jsp:param name="oneDepth" value="MY계약"/>
    <jsp:param name="oneDepthKey" value="mycontract.info.list.view"/>
    <jsp:param name="twoDepth" value="가입내역 조회"/>
    <jsp:param name="twoDepthKey" value="mycontract.info.list.view"/>
</jsp:include>

<!-- Body -->
<div class="area-body">
    <div class="area-inner">

        <div class="wrap">
        
            <%-- 좌측 메뉴 --%>
            <jsp:include page="/WEB-INF/jsp/pc/include/aside.jsp" flush="false">
                <jsp:param name="asideTitle" value="MY계약"/>
                <jsp:param name="asideGroup" value="mycontract"/>
            </jsp:include>
            <%-- //좌측 메뉴 --%>

            <div class="contain-body">
                <div class="content-header">
                    <h3 class="title">가입내역 조회</h3>
                </div>
                
                <div class="area-mypage">
                    <div class="box-information">
                        <ul class="text-information-list1">
                            <li>회원번호나 상품명을 선택하시면 상세정보를 확인할 수 있으며, 보다 자세한 상품 정보는 회원증서를 참고하시기 바랍니다.</li>
                            <li>회차별 납입 금액에 대한 상세 정보는 <span class="text-point2">[납입/환급금 조회]</span>에서 확인 가능합니다.</li>
                        </ul>
                    </div>

                    <div class="box-mypage-list">
                    
                        <c:choose>
                        
                            <%-- 조회내역 있음 --%>
                            <c:when test="${fn:length(list) gt 0 }">
                        
                                <%-- 가입내역 목록 --%>
                                <c:forEach var="item" items="${list }">
                                
                                    <div class="table-type2 contract" data-idx="<c:out value="${item.ORD_MST_IDX }"/>">
                                        <table>
                                            <colgroup>
                                                <col style="width: 200px">
                                                <col style="width: auto">
                                                <col style="width: 120px">
                                                <col style="width: 120px">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th>회원번호</th>
                                                    <th>가입상품명</th>
                                                    <th>가입일자</th>
                                                    <th>가입상태</th>
                                                </tr>
                                                <tr>
                                                    <td class="member-num">
                                                    
                                                        <%-- 계약 상태 별 분기 --%>
                                                        <c:choose>
                                                            <%-- 접수 --%>
                                                            <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_RECEIPT }">
                                                                <a href="javascript:;"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp해피콜 상담 대기</a>
                                                            </c:when>
                                                            <%-- 가입대기 --%>
                                                            <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_WAITING_TO_JOIN }">
                                                                <a class="detail" href="javascript:;"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp<c:out value="${item.ACCNT_NO }"/></a>
                                                            </c:when>
                                                            <%-- 가입 --%>
                                                            <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                                                                <a class="detail" href="javascript:;"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp<c:out value="${item.ACCNT_NO }"/></a>
                                                            </c:when>
                                                        </c:choose>
                                                        
                                                    </td>
                                                    <td class="member-product">
                                                        <span>
                                                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${item.PRD_MST_CD }"/>/m_750.png"
                                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'" 
                                                                 alt="<c:out value="${item.PRD_MST_NM }"/>" >
                                                        </span>
                                                        <a class="detail" href="javascript:;"><c:out value="${item.PRD_MST_NM }"/></a>
                                                    </td>
                                                    
                                                    <%-- 계약 상태 별 분기 --%>
                                                    <c:choose>
                                                        <%-- 접수 --%>
                                                        <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_RECEIPT }">
                                                            <td></dtdd>
                                                            <td class="join-state">접수</td>
                                                        </c:when>
                                                        <%-- 가입대기 --%>
                                                        <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_WAITING_TO_JOIN }">
                                                            <td></td>
                                                            <td class="join-state">가입대기</td>
                                                        </c:when>
                                                        <%-- 가입 --%>
                                                        <c:when test="${item.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                                                            <td><ui:formatDate value="${item.JOIN_DT }" pattern="yyyy.MM.dd" /></td>
                                                            <td class="join-state">가입</td>
                                                        </c:when>
                                                    </c:choose>
                                                    
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <p class="btn-member contract" data-idx="<c:out value="${item.ORD_MST_IDX }"/>">
                            
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
                                        
                                    </p>
                                    
                                </c:forEach>
                            
                            </c:when>
    
                            <%-- 조회내역 없음 --%>
                            <c:otherwise>
                            
                                <div class="table-type2">
                                    <table>
                                        <colgroup>
                                            <col style="width: 200px">
                                            <col style="width: auto">
                                            <col style="width: 120px">
                                            <col style="width: 120px">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>회원번호</th>
                                                <th>가입상품명</th>
                                                <th>가입일자</th>
                                                <th>가입상태</th>
                                            </tr>
                                            <tr>
                                                <td colspan="4">조회 내역이 없습니다.</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                            </c:otherwise>
                            <%-- 조회내역 없음 --%>
                            
                        </c:choose>
    
                        <div class="box-member-note">
                            <span>유의사항</span>
                            <ul class="text-information-list1">
                                <li>청약철회/행사/해약 상품 내역은 표시 되지 않습니다.</li>
                                <li>일부 서비스 내용은 가입 및 납입상태에 따라 차이가 있을 수 있습니다.  더 자세한 내용은 1:1 상담하기 또는 컨택센터(1588-8511)로 문의 바랍니다.</li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
                
            </div>
        </div>

    </div>
</div>
<!-- //Body -->

<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    
<script>
    $(function () {
        var $areaContent = $(".area-body");
        // 상세
        $areaContent.on("click", "a.detail", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contract").attr("data-idx") }
            $.requestPage($.action.mycontract.info.detail.view, params);
        });
        // 혜택조회
        $areaContent.on("click", "button.benefit", function() {
            var params = { ORD_MST_IDX : $(this).closest("p.contract").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.shipping.benefit.view.layer(), params, "layer-member1");
        });
        // 배송정보
        $areaContent.on("click", "button.shipping", function() {
            var params = { ORD_MST_IDX : $(this).closest("p.contract").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.shipping.shipping.view.layer(), params, "layer-member1");
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
            var params = { ORD_MST_IDX : $(this).closest("p.contract").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.info.review.layer(), params);
        });
    });
</script>
</body>
</html>