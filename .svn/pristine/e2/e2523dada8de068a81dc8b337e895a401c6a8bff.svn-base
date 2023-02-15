<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<spring:eval var="main" expression="@resource['mobile.ssl.domain']"/>
<aside class="area-aside left">
    <div class="area-inner">
        <header class="contain-header">
            <h1 class="title">버킷마켓</h1>
            <span class="btn-link-home"><a href="javascript:$.requestPage($.action.main.index());">HOME</a></span>
            <span class="btn-sidebar-close"><button>닫기</button></span>
        </header>
        <div class="box-side1">
            <dl>
                <dt>CATEGORY</dt>
                <dd class="category-area"></dd>
            </dl>
        </div>
        <div class="box-side2">
            <span class="link1"><a href="javascript:$.requestPage($.action.marketing.plan.list());">기획전</a></span>
            <span class="link2"><a href="javascript:$.requestPage($.action.marketing.event.list());">이벤트</a></span>
            <span class="link3"><a href="javascript:$.requestPage($.action.display.product.list());">베스트랭킹</a></span>
            <span class="link4"><a href="javascript:$.requestPage($.action.board.comment.list());">가입후기</a></span>
        </div>
        <div class="box-side3">
            <span class="link1"><a href="javascript:$.requestPage($.action.common.search.list(), {latelyYn : 'Y'});">최근본상품</a></span>
            <span class="link2"><a href="javascript:$.requestPage($.action.board.faq.list());">고객센터</a></span>
        </div>
    </div>
</aside>
<%-- 하단 탭바 --%>
<aside class="area-aside bottom">
    <div class="area-inner">
        <div class="contain-tabbar">
            <span class="btn-tabbar1"><button class="navi-button">카테고리</button></span>
            <span class="btn-tabbar2 <c:if test="${fn:contains(pageContext.request.requestURI, 'curation') }">on</c:if>">
                <a href="javascript:$.requestPage($.action.display.curation.list());">추천</a>
            </span>
            <span class="btn-tabbar3 <c:if test="${pageContext.request.requestURL eq main or fn:contains(pageContext.request.requestURI, 'main') }">on</c:if>">
                <a href="javascript:$.requestPage($.action.main.index());">홈</a>
            </span>
            <!-- 
            <span class="btn-tabbar4 <c:if test="${fn:contains(pageContext.request.requestURI, 'myplanner') }">on</c:if>">
                <a href="javascript:$.requestPage($.action.myplanner.main.view());">레디플래너</a>
            </span>
             -->
            <span class="btn-tabbar5 <c:if test="${fn:contains(pageContext.request.requestURI, 'mycontract') }">on</c:if>">
                <a href="javascript:$.requestPage($.action.mycontract.index());">My계약</a>
            </span> 
        </div>
    </div>
</aside>
<%-- //하단 탭바 --%>