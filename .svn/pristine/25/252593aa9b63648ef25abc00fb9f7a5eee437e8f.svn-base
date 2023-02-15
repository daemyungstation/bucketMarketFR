<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="area-header">
    <div class="contain-util">
        <div class="contain-inner">
            <span><a href="javascript:$.requestPage($.action.board.faq.list());">고객센터</a></span>
            <span><a href="javascript:alert('서비스 준비중 입니다.');">APP 다운로드</a></span>
        </div>
    </div>
    <div class="area-inner">
        <a href="javascript:$.requestPage($.action.main.index());">
            <h1 class="title">버킷마켓</h1>
        </a>
        <div class="contain-search">
            <input type="text" class="searchword" placeholder="검색어를 입력해 주세요" value="<c:out value="${param.searchword }"/>" maxlength="70"/>
            <span class="btn-search"><button>검색</button></span>
            <c:if test="${not empty commonKeywordList }">
                <div class="box-favword">
                    <div class="box-inner">
                        <p class="title">인기 검색어</p>
                        <c:forEach var="row" items="${commonKeywordList }">
                            <span class="tag">
                                <c:if test="${row.PPL_WRD_SCH eq Const.KEYWORD_TYPE_SEARCH }">
                                    <button onclick="$.requestPage($.action.common.search.list(), {searchPrdMstKwd : '<c:out value="${fn:replace(row.PPL_WRD_TEXT, '#', '') }"/>'});">
                                        #<c:out value="${fn:replace(row.PPL_WRD_TEXT, '#', '') }"/>
                                    </button>
                                </c:if>
                                <c:if test="${row.PPL_WRD_SCH eq Const.KEYWORD_TYPE_LINK }">
                                    <button onclick="$.requestLink('<c:out value="${row.PPL_WRD_URL }"/>', '<c:out value="${Const.LINK_TARGET_HREF }"/>');">
                                        #<c:out value="${fn:replace(row.PPL_WRD_TEXT, '#', '') }"/>
                                    </button>
                                </c:if>
                            </span>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </div>
        <c:if test="${not empty commonKeywordList }">
            <div class="contain-word">
                <ul>
                    <c:forEach var="row" items="${commonKeywordList }" varStatus="stat">
                        <li>
                            <c:if test="${row.PPL_WRD_SCH eq Const.KEYWORD_TYPE_SEARCH }">
                                <a href="javascript:$.requestPage($.action.common.search.list(), {searchPrdMstKwd : '<c:out value="${fn:replace(row.PPL_WRD_TEXT, '#', '') }"/>'});">
                                    <c:out value="${stat.index + 1 }"/>. <c:out value="${fn:replace(row.PPL_WRD_TEXT, '#', '') }"/>
                                </a>
                            </c:if>
                            <c:if test="${row.PPL_WRD_SCH eq Const.KEYWORD_TYPE_LINK }">
                                <a href="javascript:$.requestLink('<c:out value="${row.PPL_WRD_URL }"/>', '<c:out value="${Const.LINK_TARGET_HREF }"/>');">
                                    <c:out value="${stat.index + 1 }"/>. <c:out value="${fn:replace(row.PPL_WRD_TEXT, '#', '') }"/>
                                </a>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>
</header>