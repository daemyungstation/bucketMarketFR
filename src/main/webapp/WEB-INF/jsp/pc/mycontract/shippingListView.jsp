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
    <jsp:param name="twoDepth" value="배송/지원혜택 조회"/>
    <jsp:param name="twoDepthKey" value="mycontract.shipping.list.view"/>
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
                    <h3 class="title">배송/지원혜택 조회</h3>
                </div>
                
                <div class="area-mypage">
                    <div class="box-information">
                        <ul class="text-information-list1">
                            <li>가입하신 상품의 배송 현황 및 매월 지원혜택 지급내역을 조회 할 수 있습니다.</li>
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
                                                <col style="width: 120px">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th>회원번호</th>
                                                    <th>가입상품명</th>
                                                    <th>가입일자</th>
                                                    <th>가입상태</th>
                                                    <th>현황</th>
                                                </tr>
                                                <tr>
                                                    <td class="member-num">
                                                         <a class="detail" href="javascript:;"><c:out value="${item.MEM_NM }"/>&nbsp/&nbsp<c:out value="${item.ACCNT_NO }"/></a>
                                                    </td>
                                                    <td class="member-product">
                                                        <span>
                                                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${item.PRD_MST_CD }"/>/m_750.png"
                                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'" 
                                                                 alt="<c:out value="${item.PRD_MST_NM }"/>" >
                                                        </span>
                                                        <a class="detail" href="javascript:;"><c:out value="${item.PRD_MST_NM }"/></a>
                                                    </td>
                                                    <td><ui:formatDate value="${item.JOIN_DT }" pattern="yyyy.MM.dd" /></td>
                                                    <td class="join-state">가입</td>
                                                    <td class="deliver-state">
                            
                                                        <%-- 상품유형 별 상태 노출 --%>
                                                        <c:choose>
                                                            <%-- 월지원형 --%>
                                                            <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT }">
                                                                <c:if test="${item.BENEFIT_NO gt 0}">
                                                                    <c:out value="${item.BENEFIT_NO }"/>회 지급완료
                                                                    <span class="btn-type-text7 type3"><button class="benefit">지원혜택 조회</button></span>
                                                                </c:if>
                                                                <c:if test="${item.BENEFIT_NO le 0}">
                                                                                                                        미지급  
                                                                    <span class="btn-type-text7 type3" style="display: none;"><button class="benefit">지원혜택 조회</button></span>                                                      
                                                                </c:if>
                                                            </c:when>
                                                            <%-- 즉발(채권) --%>
                                                            <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and item.PRD_MST_BND_YN eq 'Y'}">
                                                                <c:out value="${item.ORD_MST_DLV_STATE_NM }"/>
                                                                <span class="btn-type-text7 type3"><button class="shipping">배송현황 조회</button></span>
                                                            </c:when>
                                                            <%-- 즉발(비채권) --%>
                                                            <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and item.PRD_MST_BND_YN ne 'Y'}">
                                                                <c:if test="${item.BENEFIT_NO gt 0}">
                                                                    <c:out value="${item.BENEFIT_NO }"/>회 지급완료
                                                                    <span class="btn-type-text7 type3"><button class="benefit">지원혜택 조회</button></span>
                                                                </c:if>
                                                                <c:if test="${item.BENEFIT_NO le 0}">
                                                                                                                        미지급  
                                                                    <span class="btn-type-text7 type3" style="display: none;"><button class="benefit">지원혜택 조회</button></span>                                                      
                                                                </c:if>
                                                            </c:when>
                                                            <%-- 렌탈 --%>
                                                            <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL }">
                                                                <c:if test="${item.BENEFIT_NO gt 0}">
                                                                    <c:out value="${item.BENEFIT_NO }"/>회 지급완료
                                                                    <span class="btn-type-text7 type3"><button class="benefit">지원혜택 조회</button></span>
                                                                </c:if>
                                                                <c:if test="${item.BENEFIT_NO le 0}">
                                                                                                                        미지급  
                                                                    <span class="btn-type-text7 type3" style="display: none;"><button class="benefit">지원혜택 조회</button></span>                                                      
                                                                </c:if>
                                                            </c:when>
                                                            <%-- 할부지원 --%>
                                                            <c:when test="${item.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                                                                <c:out value="${item.ORD_MST_DLV_STATE_NM }"/>
                                                                <span class="btn-type-text7 type3"><button class="shipping">배송현황 조회</button></span>
                                                            </c:when>
                                                        </c:choose>
                                                        
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    
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
                                            <col style="width: 120px">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>회원번호</th>
                                                <th>가입상품명</th>
                                                <th>가입일자</th>
                                                <th>가입상태</th>
                                                <th>현황</th>
                                            </tr>
                                            <tr>
                                                <td colspan="5">조회 내역이 없습니다.</td>
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
        // 지원/혜택 조회
        $areaContent.on("click", "button.benefit", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contract").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.shipping.benefit.view.layer(), params, "layer-member1");
        });
        // 배송현황 조회
        $areaContent.on("click", "button.shipping", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contract").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.shipping.shipping.view.layer(), params, "layer-member1");
        });
    });
</script>
</body>
</html>