<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/customer.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
</head>
<body>

    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title-btn|search"/>
        <jsp:param name="headerTitle" value="FAQ"/>
    </jsp:include>
    <jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
        <jsp:param name="navGroup" value="board"/>
    </jsp:include>

    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-faq-head">
                <h2>자주하는 질문(FAQ)</h2>
                <div class="box-faq-search">
                    <form name="searchForm" id="searchForm">
                        <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${searchBrdCmnComIdx }"/>"/>
                        <label for="searchWord" class="form-faq-search">
                            <input type="text" name="searchWord" id="searchWord" value="<c:out value="${commandMap.searchWord }"/>" placeholder="궁금한 사항을 입력해 주세요" title="검색어 입력"/>
                        </label>
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>
    
            <div class="box-tab-head swiper-container col7">
                <div class="swiper-wrapper">
                    <div class="swiper-slide <c:if test="${empty searchBrdCmnComIdx }">on</c:if>" ><button>전체</button></div>
                    <c:if test="${not empty codeList }">
                        <c:forEach var="row" items="${codeList }">
                            <div class="swiper-slide <c:if test="${row.CMN_COM_IDX eq searchBrdCmnComIdx }">on</c:if>" code="<c:out value="${row.CMN_COM_IDX }"/>"><button><c:out value="${row.CMN_COM_NM }"/></button></div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
    
            <div class="box-tab-body tab1 on">
                <div class="box-faq ui-accordion">
                    <c:if test="${empty list }">
                        <p class="text-empty-data">검색 결과가 없습니다.</p>
                    </c:if>
                    <c:if test="${not empty list }">
                        <c:forEach var="row" items="${list }">
                            <dl>
                                <dt data-key="<c:out value="${row.BRD_FAQ_IDX }"/>">
                                    <div class="box-faq-question"><c:out value="${row.BRD_FAQ_TITLE }"/></div>
                                </dt>
                                <dd>
                                    <div class="box-faq-content">
                                        <c:out value="${row.BRD_FAQ_CONTENTS }" escapeXml="false"/>
                                    </div>
                                </dd>
                            </dl>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <c:if test="${not empty codeList }">
                <c:forEach var="codeRow" items="${codeList }" varStatus="codeStat">
                    <c:set var="typeCount" value="0"/>
                    <div class="box-tab-body tab<c:out value="${codeStat.index + 2 }"/>">
                        <div class="box-faq ui-accordion">
                            <c:forEach var="row" items="${list }">
                                <c:if test="${codeRow.CMN_COM_IDX eq row.BRD_CMN_COM_IDX }">
                                    <dl>
                                        <dt data-key="<c:out value="${row.BRD_FAQ_IDX }"/>">
                                            <div class="box-faq-question"><c:out value="${row.BRD_FAQ_TITLE }"/></div>
                                        </dt>
                                        <dd>
                                            <div class="box-faq-content">
                                                <c:out value="${row.BRD_FAQ_CONTENTS }" escapeXml="false"/>
                                            </div>
                                        </dd>
                                    </dl>
                                    <c:set var="typeCount" value="${typeCount + 1 }"/>
                                </c:if>
                            </c:forEach>
                            <c:if test="${typeCount eq 0 }">
                                <p class="text-empty-data">검색 결과가 없습니다.</p>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
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
            var $areaContent = $(".area-content"),
                $searchForm = $areaContent.find("#searchForm")
                $accordion = $areaContent.find(".ui-accordion");
            <%-- 검색버튼 클릭 이벤트 --%>
            $searchForm.on("click", ".submit", function () {
                $searchForm.getSubmit($.action.board.faq.list());
            });
            <%-- 검색 엔터 이벤트 --%>
            $searchForm.on("keyup", "input[type='text']", function (e) {
                if (e.keyCode == 13) {
                    $searchForm.find(".submit").trigger("click");
                }
                return false;
            });
            <%-- 상세보기 클릭 이벤트 --%>
            $accordion.on("click", "dt", function () {
                var $this = $(this)
                if ($this.closest("dl").hasClass("on")) {
                    $.postSyncJsonAjax($.action.board.faq.readcnt.modify.ajax(), {BRD_FAQ_IDX : $this.data("key")});
                }
            });
            <%-- --%>
            setTimeout(function () {
                $(".swiper-slide.on > button").trigger("click").focus();
            });
        });
    </script>
</body>
</html>