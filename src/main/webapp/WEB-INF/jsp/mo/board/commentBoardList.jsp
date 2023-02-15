<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/customer.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title-btn|search"/>
        <jsp:param name="headerTitle" value="상품후기"/>
    </jsp:include>
    <jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
        <jsp:param name="navGroup" value="board"/>
    </jsp:include>
    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
    
            <div class="contain-latter">
                <div class="box-latter-head">
                    <h2 class="title">베스트상품후기</h2>
                    <p class="text-normal-type1">상품을 가입하신 분들이 작성하신 실제 후기 입니다.</p>
                </div>
                <hr class="box-customer-underline">
    
                <div class="box-latter-body">
                    <c:if test="${empty list }">
                        <p class="text-empty-data">등록된 베스트 상품후기가 없습니다.</p>
                    </c:if>
                    <c:if test="${not empty list }">
                        <c:forEach var="row" items="${list }">
                            <div class="box-latter-view">
                                <span class="latter-best">BEST</span>
                                <c:if test="${row.SEX eq Const.FEMALE }">
                                    <p class="latter-profile woman"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_profile_women.png" alt="프로필 사진"></p>
                                </c:if>
                                <c:if test="${row.SEX eq Const.MAN }">
                                    <p class="latter-profile man"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_profile_men.png" alt="프로필 사진"></p>
                                </c:if>
                                <p class="latter-star"><span class="star-gray"><span class="star-red" style="width: <c:out value="${row.PRD_REV_PIT * 20 }"/>%;"></span></span></p>
                                <p class="latter-name">
                                    <span class="latter-name2"><c:out value="${row.MEM_NM }"/>, <c:out value="${row.AGE }"/>대</span>
                                    <span class="latter-day"><ui:formatDate value="${row.PRD_REV_REG_DT }" pattern="yyyy.MM.dd"/></span>
                                </p>
                                <p class="latter-content"><c:out value="${fn:replace(row.PRD_REV_CTS, newLineChar, '<br/>') }" escapeXml="false"/></p>
                                <p class="latter-product">
                                    <span class="text-point1"><c:out value="${row.PRD_MST_NM }"/></span>
                                    <span class="btn-small-box1">
                                        <a href="javascript:$.requestPage($.action.product.basic.view(), {PRD_MST_NO : '<c:out value="${row.PRD_MST_NO }"/>'});">상품보러가기</a>
                                    </span>
                                </p>
                                <c:if test="${not empty row.CMM_FLE_WEB_PATH }">
                                    <p class="latter-photo">
                                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.CMM_FLE_WEB_PATH }"/>" alt="제품 사진"/>
                                    </p>
                                </c:if>
                                <c:if test="${not empty row.PRD_REV_RPL }">
                                    <div class="box-latter-answer">
                                        <div class="box-answer">
                                            <div class="title">
                                                A.
                                                <c:if test="${row.AUT_MST_VDR_YN eq 'Y' }">
                                                    <span class="icon-partner">파트너</span>
                                                </c:if>
                                                <c:if test="${row.AUT_MST_VDR_YN eq 'N' }">
                                                    <span class="icon-bucketmarket">
                                                        <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_icon_bi.png" alt="버킷마켓" >
                                                    </span>
                                                </c:if>
                                            </div>
                                            <c:out value="${row.PRD_REV_RPL }" escapeXml="false"/>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <%-- 페이징 --%>
                <div class="paginate">
                    <ui:paging paging="${paging }" jsFunction="paging"/>
                </div>
                <%-- //페이징 --%>
            </div>
        </div>
    </div>
    <%-- //본문 --%>
    <%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <script>
        $(function () {
            var $areaContent = $(".area-content");
            <%-- 목록 호출 --%>
            paging = function (cPage) {
                var params = {cPage : cPage};
                $.requestPage($.action.board.notice.list(), params);
            };
        });
    </script>
</body>
</html>