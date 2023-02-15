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
    <c:set var="page" value="자주묻는질문(FAQ)"/>
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
        <jsp:param name="oneDepth" value="${group }"/>
        <jsp:param name="oneDepthKey" value="board.notice.list"/>
        <jsp:param name="twoDepth" value="${page }"/>
        <jsp:param name="twoDepthKey" value="board.faq.list"/>
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
                    <div class="contain-faq"> 
                        <div class="box-faq-head">
                            <div class="box-faq-search">
                                <form name="searchForm" id="searchForm">
                                    <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
                                    <label for="searchWord" class="form-faq-search">
                                        <input type="text" name="searchWord" id="searchWord" value="<c:out value="${commandMap.searchWord }"/>" placeholder="궁금한 사항을 입력해 주세요" title="검색어 입력"/>
                                    </label>
                                    <button type="submit">검색</button>
                                </form>
                            </div>
                        </div>
                        <div class="faq-tab-head">
                            <span <c:if test="${empty commandMap.searchBrdCmnComIdx }">class="on"</c:if>><button class="button-tab">전체</button></span>
                            <c:if test="${not empty codeList }">
                                <c:forEach var="row" items="${codeList }">
                                    <span <c:if test="${row.CMN_COM_IDX eq commandMap.searchBrdCmnComIdx }">class="on"</c:if>>
                                        <button class="button-tab" data-key="<c:out value="${row.CMN_COM_IDX }"/>"><c:out value="${row.CMN_COM_NM }"/></button>
                                    </span>
                                </c:forEach>
                            </c:if>
                        </div>
                        <c:if test="${empty list }">
                            <p class="text-empty-data">검색 결과가 없습니다.</p>
                        </c:if>
                        <c:if test="${not empty list }">
                            <div class="faq-tab-body tab1 on">
                                <span class="faq-number"><span>전체</span> FAQ (<span> <fmt:formatNumber value="${totalCount }" type="number"/> </span>건)</span>
                                <div class="box-faq ui-accordion type2">
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
                                </div>
                                <div class="paginate">
                                    <ui:paging paging="${paging }" jsFunction="paging"/>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- //Body --%>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    <script>
        $(function () {
            var $areaBody = $(".area-body"),
                $searchForm = $areaBody.find("#searchForm")
                $accordion = $areaBody.find(".ui-accordion");
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
            <%-- 탭 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".button-tab", function () {
                $.requestPage($.action.board.faq.list(), {searchBrdCmnComIdx : $(this).data("key")});
            });
            <%-- 목록 호출 --%>
            paging = function (cPage, searchBrdCmnComIdx) {
                var params = {
                    cPage : cPage,
                    searchWord : "<c:out value="${commandMap.searchWord}"/>",
                    searchBrdCmnComIdx : "<c:out value="${commandMap.searchBrdCmnComIdx}"/>"
                };
                $.requestPage($.action.board.faq.list(), params);
            };
            <%-- 상세보기 클릭 이벤트 --%>
            $accordion.on("click", "dt", function () {
                var $this = $(this)
                if ($this.closest("dl").hasClass("on")) {
                    $.postSyncJsonAjax($.action.board.faq.readcnt.modify.ajax(), {BRD_FAQ_IDX : $this.data("key")});
                }
            });
        });
    </script>
</body>
</html>