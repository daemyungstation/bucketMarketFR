<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/customer.css">
</head>
<body class="">
    <c:set var="group" value="고객센터"/>
    <c:set var="page" value="베스트 가입후기"/>
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
        <jsp:param name="oneDepth" value="${group }"/>
        <jsp:param name="oneDepthKey" value="board.notice.list"/>
        <jsp:param name="twoDepth" value="${page }"/>
        <jsp:param name="twoDepthKey" value="board.contact.us.form"/>
    </jsp:include>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-inner">
            <div class="wrap">
                <jsp:include page="/WEB-INF/jsp/pc/include/aside.jsp" flush="false">
                    <jsp:param name="asideTitle" value="${group }"/>
                    <jsp:param name="asideGroup" value="board"/>
                </jsp:include>
                <div class="contain-body">
                    <div class="content-header">
                        <h3 class="title"><c:out value="${page }"/></h3>
                    </div>
                    <div class="contain-latter">
                        <div class="box-guide">
                            <p class="guide01"><span>버킷마켓에서 실제 가입하신 분들의 생생한 후기</span></p>
                        </div>
                        <c:if test="${empty list }">
                            <p class="text-empty-data">등록된 베스트 가입후기 없습니다.</p>
                        </c:if>
                        <c:if test="${not empty list }">
                            <div class="box-latter-body">
                                <c:forEach var="row" items="${list }">
                                    <div class="box-latter-view">
                                        <div class="latter-view-profile">
                                            <c:if test="${row.SEX eq Const.FEMALE }">
                                                <p class="latter-profile woman"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile_women.png" alt="프로필 사진"></p>
                                            </c:if>
                                            <c:if test="${row.SEX eq Const.MAN }">
                                                <p class="latter-profile man"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile_men.png" alt="프로필 사진"></p>
                                            </c:if>
                                            <p class="latter-star"><span class="star-gray"><span class="star-red" style="width: <c:out value="${row.PRD_REV_PIT * 20 }"/>%;"></span></span></p>
                                            <p class="latter-name"><c:out value="${row.MEM_NM }"/>, <c:out value="${row.AGE }"/>대</p>
                                        </div>
                                        <div class="latter-view-content">
                                            <p class="latter-content"><c:out value="${fn:replace(row.PRD_REV_CTS, newLineChar, '<br/>') }" escapeXml="false"/></p>
                                            <p class="latter-photo">
                                                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.CMM_FLE_WEB_PATH }"/>" alt="제품 사진"/>
                                            </p>
                                            <p class="latter-product">
                                                <span class="text-point1"><c:out value="${row.PRD_MST_NM }"/></span>
                                                <span class="btn-small-box1">
                                                    <a href="javascript:$.requestPage($.action.product.basic.view(), {PRD_MST_NO : '<c:out value="${row.PRD_MST_NO }"/>'});">상품보러가기</a>
                                                </span>
                                            </p>
                                        </div>
                                        <span class="latter-day"><ui:formatDate value="${row.PRD_REV_REG_DT }" pattern="yyyy.MM.dd"/></span>
                                    </div>
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
                                                            <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_icon_bi.png" alt="버킷마켓" >
                                                        </span>
                                                    </c:if>
                                                </div>
                                                <c:out value="${row.PRD_REV_RPL }" escapeXml="false"/>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="paginate">
                                <ui:paging paging="${paging }" jsFunction="paging"/>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- //Body --%>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/aside.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    <script>
        $(function () {
            <%-- 목록 호출 --%>
            paging = function (cPage) {
                var params = {cPage : cPage};
                $.requestPage($.action.board.notice.list(), params);
            };
        });
    </script>
</body>
</html>