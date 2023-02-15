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
    <jsp:param name="twoDepth" value="라이프서비스 신청"/>
    <jsp:param name="twoDepthKey" value="mycontract.lifeservice.list.view"/>
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
                    <h3 class="title">라이프서비스 신청</h3>
                </div>
                
                <div class="area-mypage">
                    <div class="box-information">
                        <ul class="text-information-list1">
                            <li>회원상태가 '가입' 인 상품만 신청이 가능합니다. 행사/해약처리 완료된 상품 내역은 표시되지 않습니다.</li>
                            <li>제공되는 서비스 중 하나를 선택하여 이용하실 수 있습니다. 상품별 라이프서비스는 1개 제공됩니다.</li>
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
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <p class="btn-member contract" data-idx="<c:out value="${item.ORD_MST_IDX }"/>">
                                        <span class="btn-type-text7 type2"><button class="lifeservice">라이프 서비스 신청</button></span>
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

<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-body");
        // 상세
        $areaContent.on("click", "a.detail", function() {
            var params = { ORD_MST_IDX : $(this).closest("div.contract").attr("data-idx") }
            $.requestPage($.action.mycontract.info.detail.view, params);
        });
        // 라이프서비스 신청
        $areaContent.on("click", "button.lifeservice", function() {
            var params = { ORD_MST_IDX : $(this).closest("p.contract").attr("data-idx") }
            $(".layer-popup1").requestLayer($.action.mycontract.lifeservice.apply.layer(), params, "layer-member3");
        });
    });
</script>

</body>
</html>