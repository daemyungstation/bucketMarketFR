<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 로딩 프로모션 이미지 --%>
<c:set var="loadingPromotionImage" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABQAAAAKACAIAAABMkUL2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDAyIDc5LjE2NDQ2MCwgMjAyMC8wNS8xMi0xNjowNDoxNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIxLjIgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjI2QTAwNzI0RDEzODExRUFBRTZCODA0RjkxQzNEQkYyIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjI2QTAwNzI1RDEzODExRUFBRTZCODA0RjkxQzNEQkYyIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MjZBMDA3MjJEMTM4MTFFQUFFNkI4MDRGOTFDM0RCRjIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MjZBMDA3MjNEMTM4MTFFQUFFNkI4MDRGOTFDM0RCRjIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6xYjG1AAAnG0lEQVR42uzdaVMi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DAAAAAIYAAAABDAAAAACGAAAAAQwAAAACGAAAAAQwAAAACCAAQAAQAADAACAAAYAAAABDAAAAAIYAAAAAQwAAAACGAAAAAQwAAAACGAAAAAQwAAAACCAAQAAQAADAACAAAYAAAABDAAAgAAGAAAAAQwAAAACGAAAAAQwAAAACGAAAAAQwAAAACCAAQAAQAADAACAAAYAAEAAAwAAgAAGAAAAAQwAAAACGAAAAAQwAAAACGAAAAAQwAAAACCAAQAAQAADAAAggAEAAEAAAwAAgAAGAAAAAQwAAAACGAAAAAQwAAAACGAAAAAQwAAAACCAAQAAEMAAAAAggAEAAEAAAwAAgAAGAAAAAQwAAAACGAAAAAQwAAAACGAAAAAEsE0AAACAAAYAAAABDAAAAAIYAAAABDAAAAAIYAAAABDAAAAAIIABAABAAAMAACCAAQAAQAADAACAAAYAAAABDAAAAAIYAAAABDAAAAAIYAAAABDAAAAAIIABAAAQwAAAACCAAQAAQAADAACAAAYAAAABDAAAAAIYAAAABDAAAAAIYAAAABDAAAAACGAAAAAQwAAAACCAAQAAQAADAACAAAYAAAABDAAAAAIYAAAABDAAAAAIYAAAAAQwAAAACGAAAAAQwAAAACCAAQAAQAADAACAAAYAAAABDAAAAAIYAAAABDAAAAACGAAAAAQwAAAACGAAAAAQwAAAACCAAQAAQAADAACAAAYAAAABDAAAAAIYAAAAAQwAAAACGAAAAAQwAAAACGAAAAAQwAAAACCAAQAAQAADAACAAAYAAAABDAAAgAAGAAAAAQwAAAACGAAAAAQwAAAACGAAAAAQwAAAACCAAQAAQAADAACAAAYAAEAAAwAAgAAGAAAAAQwAAAACGAAAAAQwAAAACGAAAAAQwAAAACCAAQAAQAADAAAggAEAAEAAAwAAgAAGAAAAAQwAAAACGAAAAAQwAAAACGAAAAAQwAAAAAhgAAAAEMAAAAAggAEAAEAAAwAAgAAGAAAAAQwAAAACGAAAAAQwAAAACGAAAAAEMAAAAAhgAAAAEMAAAAAggAEAAEAAAwAAgAAGAAAAAQwAAAACGAAAAAQwAAAAAhgAAAAEMAAAAAhgAAAAEMAAAAAggAEAAEAAAwAAgAAGAAAAAQwAAAACGAAAAAEMAAAAAhgAAAAEMAAAAAhgAAAAEMAAAAAggAEAAEAAAwAAgAAGAAAAAQwAAIAABgAAAAEMAAAAAhgAAAAEMAAAAAhgAAAAEMAAAAAggAEAAEAAAwAAgAAGAABAAAMAAIAABgAAAAEMAAAAAhgAAAAEMAAAAGzb/xNgAIrwbkiEa45QAAAAAElFTkSuQmCC"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/main.css">
</head>

<body class="main <c:if test="${not empty info.top and cookie.topBannerHide.value ne '1'}">active-banner</c:if>">

<%-- TOP 배너 --%>
<c:if test="${not empty info.top }">
    <c:set var="top" value="${info.top[0] }"/>
            
    <div class="area-topbanner">
        <div class="area-inner">
            <a href="javascript:$.requestLink('<c:out value="${top.BNR_MST_URL }"/>', '<c:out value="${top.BNR_MST_TGT }"/>');">
                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${top.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${top.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/none.png'"/>
            </a>
            <span class="btn-close-banner"><button onclick="javascript:$.cookie('topBannerHide', 1, { expires : 1 });">닫기</button></span>
        </div>
    </div>
    
</c:if>
<%-- // TOP 배너 --%>

<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>

<jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
    <jsp:param name="oneDepth" value="My레디플래너"/>
    <jsp:param name="oneDepthKey" value="myplanner.campaign.product.list"/>
</jsp:include>

<!-- Body -->
<div class="area-body">

    <div class="area-inner">
        <!-- Content without LNB  -->
        <div class="contain-body">

            <section class="section-main1">
            
                <%-- 메인 프로모션 배너 --%>
                <c:if test="${not empty info.promotion }">
                
                    <div class="contain-inner">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
    
                                <c:forEach var="promotion" items="${info.promotion }">
                                
                                    <div class="swiper-slide">
                                        <a href="javascript:$.requestLink('<c:out value="${promotion.BNR_MST_URL }"/>', '<c:out value="${promotion.BNR_MST_TGT }"/>');">
                                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${promotion.CMM_FLE_WEB_PATH }"/>" 
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/none.png'"
                                                 alt="<c:out value="${promotion.BNR_MST_TITLE }"/>"/>
                                        </a>
                                    </div>
                                    
                                </c:forEach>
                                
                            </div>
                            
                            <%-- 배너가 1개 이상인 경우에만 인디케이터 표시 --%>
                            <c:if test="${fn:length(info.promotion) gt 1 }">
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-pagination"></div>
                            </c:if>
                            
                        </div>
                    </div>
                    
                </c:if>
                <%-- // 메인 프로모션 배너 --%>
                
                <%-- 퀵 배너 --%>
                <%-- 2개 미만인 경우 출력 안함 --%>
                <c:if test="${not empty info.quick and fn:length(info.quick) gt 1 }">
                
                    <div class="contain-inner">
                        <div class="box-link">
                        
                            <c:forEach var="quick" items="${info.quick }" varStatus="varStatus">
                            
                                <%-- 4개 까지만 표시 --%>
                                <c:if test="${varStatus.count le 4 }">
                                    <span>
                                        <a href="javascript:$.requestLink('<c:out value="${quick.BNR_MST_URL }"/>', '<c:out value="${quick.BNR_MST_TGT }"/>');">
                                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${quick.CMM_FLE_WEB_PATH }"/>" 
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/none.png'"
                                                 alt="<c:out value="${quick.BNR_MST_TITLE }"/>"/>
                                        </a>
                                    </span>
                                </c:if>
                                
                            </c:forEach>
                            
                        </div>
                    </div>
                    
                </c:if>
                <%-- // 퀵 배너 --%>
                
            </section>
            
            <%-- 기획전 배너 --%>
            <c:if test="${not empty info.exhibition }">
            
                <section class="section-main2">
                    <div class="contain-inner">
                        <h2 class="title"><span>꿈꾸던 삶은 위한 <br >특별 기획전.</span></h2>
                        <span class="link-more"><a href="javascript:$.requestPage($.action.marketing.plan.list());">더 보기</a></span>
                        <div class="contain-goods">
                            
                            <c:forEach var="exhibition" items="${info.exhibition }" varStatus="varStatus">
                            
                                <div class="box-detail">
                                    <a href="javascript:$.requestLink('<c:out value="${exhibition.BNR_MST_URL }"/>', '<c:out value="${exhibition.BNR_MST_TGT }"/>');">
                                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${exhibition.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${exhibition.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/none.png'"/>
                                    </a>
                                </div>
                                
                            </c:forEach>
                            
                        </div>
                    </div>
                </section>
                
            </c:if>
            
            <%-- 베스트 상품 --%>
            <c:if test="${not empty info.best and fn:length(info.best) gt 3}">
            
                <section class="section-main3">
                    <div class="contain-inner">
                        <h2 class="title"><span>놓치면 후회 각 <br >베스트 상품.</span></h2>
                        <span class="link-more"><a href="javascript:$.requestPage($.action.display.product.list());">더 보기</a></span>
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                            
                                <c:forEach var="product" items="${info.best }" varStatus="varStatus">
                            
                                    <div class="swiper-slide">
                                        <a href="javascript:$.requestPage($.action.product.basic.view(), { PRD_MST_NO : '<c:out value="${product.PRD_MST_NO }"/>'});">
                                            <dl class="detail-product-type1 type3">
                                                <dd class="image">
                                                    <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${product.PRD_MST_CD }"/>/m_750.png" 
                                                         onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'" 
                                                         alt="">
                                                    <c:if test="${not empty product.PRD_MST_SPT_TXT }">
                                                        <span class="ribbon-type1">
                                                            <c:out value="${product.PRD_MST_SPT_TXT }"/>
                                                        </span>
                                                    </c:if>
                                                </dd>
                                                <dt>
                                                    <span class="brand"><c:out value="${product.VDR_MST_NM }"/></span>
                                                    <span class="catchphrase"><c:out value="${product.PRD_MST_SEL_TXT }"/></span>
                                                    <span class="detail"><c:out value="${product.PRD_MST_NM }"/></span>
                                                </dt>
                                            </dl>
                                        </a>
                                    </div>
                                
                                </c:forEach>
                                
                            </div>
                            
                        </div>
                        
                        <%-- 1 페이지 이상인 경우에만 표시 --%>
                        <c:if test="${fn:length(info.best) gt 4}">
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                        </c:if>
                        
                    </div>
                </section>
                
            </c:if>
            
            <%-- 카테고리 --%>       
            <section class="section-main4">
                <div class="contain-inner">
                
                    <c:forEach var="category" items="${info.categoryList }" varStatus="varStatus">
                        <span class="link${varStatus.count }">
                            <a href="javascript:$.requestPage($.action.product.basic.list(), { PRD_CTG_IDX : '<c:out value="${category.PRD_CTG_IDX }"/>'});">
                                <span class="link-icon">
                                    <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/category/<c:out value="${category.PRD_CTG_IDX }"/>.png" alt="<c:out value="${category.PRD_CTG_NM }"/>" >
                                </span>
                                <c:out value="${category.PRD_CTG_NM }"/>
                            </a>
                        </span>
                    </c:forEach>
                    
                </div>
            </section>
            <%-- // 카테고리 --%>       
            
            <%-- 키워드 상품 --%>
            <c:if test="${not empty info.keyword and fn:length(info.keyword) gt 3}">
            
                <section class="section-main5">
                    <div class="contain-inner">
                        <p class="text">오늘의 버킷리스트</p>
                        <h2 class="title"><span>#냉장고</span></h2>
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                            
                                <c:forEach var="product" items="${info.keyword }" varStatus="varStatus">
                            
                                    <div class="swiper-slide">
                                        <a href="javascript:$.requestPage($.action.product.basic.view(), { PRD_MST_NO : '<c:out value="${product.PRD_MST_NO }"/>'});">
                                            <dl class="detail-product-type1 type3">
                                                <dd class="image">
                                                    <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${product.PRD_MST_CD }"/>/m_750.png" 
                                                         onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'" 
                                                         alt="">
                                                    <c:if test="${not empty product.PRD_MST_SPT_TXT }">
                                                        <span class="ribbon-type1">
                                                            <c:out value="${product.PRD_MST_SPT_TXT }"/>
                                                        </span>
                                                    </c:if>
                                                </dd>
                                                <dt>
                                                    <span class="brand"><c:out value="${product.VDR_MST_NM }"/></span>
                                                    <span class="catchphrase"><c:out value="${product.PRD_MST_SEL_TXT }"/></span>
                                                    <span class="detail"><c:out value="${product.PRD_MST_NM }"/></span>
                                                </dt>
                                            </dl>
                                        </a>
                                    </div>
                                    
                                </c:forEach>
                                
                            </div>
                        </div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                        
                        <%-- 인기 키워드 목록 --%>
                        <c:if test="${not empty info.keywordList }">
                        
                            <div class="box-hotkeyword">
                            
                                <c:forEach var="keyword" items="${info.keywordList }" varStatus="varStatus">
                                    <c:if test="${keyword.PPL_WRD_SCH eq Const.KEYWORD_TYPE_SEARCH }">
                                        <span class="keyword"><a href="javascript:$.requestPage($.action.common.search.list(), { searchPrdMstKwd : '<c:out value="${keyword.PPL_WRD_TEXT }"/>' });">#<c:out value="${keyword.PPL_WRD_TEXT }"/></a></span>
                                    </c:if>
                                    <c:if test="${keyword.PPL_WRD_SCH eq Const.KEYWORD_TYPE_LINK }">
                                        <span class="keyword"><a href="<c:out value="${keyword.PPL_WRD_URL }"/>">#<c:out value="${keyword.PPL_WRD_TEXT }"/></a></span>
                                    </c:if>
                                </c:forEach>
                                
                            </div>
                        
                        </c:if>
                        
                    </div>
                </section>
                
            </c:if>
            
            <%-- 중단 배너 --%>
            <c:if test="${not empty info.middle }">
            
                <section class="section-main6">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            
                            <c:forEach var="middle" items="${info.middle }" varStatus="varStatus">
                            
                                <div class="swiper-slide">
                                    <a href="javascript:$.requestLink('<c:out value="${middle.BNR_MST_URL }"/>', '<c:out value="${middle.BNR_MST_TGT }"/>');">
                                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${middle.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${middle.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/none.png'"/>
                                    </a>
                                </div>
                            
                            </c:forEach>
                        </div>
                        
                        <%-- 배너가 1개 이상인 경우에만 인디케이터 표시 --%>
                        <c:if test="${fn:length(info.middle) gt 1 }">
                            <div class="swiper-pagination"></div>
                        </c:if>
                        
                    </div>
                </section>
                
            </c:if>
            
            <%-- 추천 상품 --%>
            <c:if test="${not empty info.recommendCategoryList }">
            
                <c:set var="firstCategory" value="${info.recommendCategoryList[info.randmoRecommendCategory] }"/>
            
                <section class="section-main7">
                    <div class="contain-inner">
                        <div class="main-category-more">
                            <button class="btn-category" id="recommendCategoryTitle"><c:out value="${firstCategory.CMN_COM_NM }"/></button>
                            <div class="main-category-inner">
                                
                                <c:forEach var="category" items="${info.recommendCategoryList }">
                                    <c:set var="checked" value="${firstCategory.CMN_COM_IDX eq category.CMN_COM_IDX ? 'checked' : '' }"/>
                                    
                                    <span>
                                        <label class="form-radio-category <c:out value="${checked }"/>">
                                            <input type="radio" name="recommendCategory" data-category="<c:out value="${category.CMN_COM_IDX }"/>" data-name="<c:out value="${category.CMN_COM_NM }"/>"><c:out value="${category.CMN_COM_NM }"/>
                                        </label>
                                    </span>
                                    
                                </c:forEach>
                                
                            </div>
                        </div>
                        <div class="swiper-container">
                            <div class="swiper-wrapper" id="recommendProductList">
                            
                                <c:forEach var="product" items="${info.recommendProductList }">
                            
                                    <div class="swiper-slide">
                                        <a href="javascript:$.requestPage($.action.product.basic.view(), { PRD_MST_NO : '<c:out value="${product.PRD_MST_NO }"/>'});">
                                            <dl class="detail-product-type1 type3">
                                                <dd class="image">
                                                    <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${product.PRD_MST_CD }"/>/m_750.png"
                                                         onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'" 
                                                         alt="<c:out value="${product.PRD_MST_NM }"/>" >
                                                    <c:if test="${not empty product.PRD_MST_SPT_TXT }">
                                                        <span class="ribbon-type1"><c:out value="${product.PRD_MST_SPT_TXT }"/></span>
                                                    </c:if>
                                                </dd>
                                                <dt>
                                                    <span class="brand"><c:out value="${product.VDR_MST_NM }"/></span>
                                                    <span class="catchphrase"><c:out value="${product.PRD_MST_SEL_TXT }"/></span>
                                                    <span class="detail"><c:out value="${product.PRD_MST_NM }"/></span>
                                                </dt>
                                            </dl>
                                        </a>
                                    </div>
                                    
                                </c:forEach>
                                
                            </div>
                        </div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                        
                        <span class="btn-more"><a href="javascript:;" id="btnNewRecommendList">새로운 추천 상품 보기</a></span>
                    </div>
                </section>
            
            </c:if>
            
            <%-- 하단 배너 --%>
            <c:if test="${not empty info.bottom }">
            
                <section class="section-main8">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                    
                            <c:forEach var="bottom" items="${info.bottom }" varStatus="varStatus">
                            
                                <div class="swiper-slide">
                                    <a href="javascript:$.requestLink('<c:out value="${bottom.BNR_MST_URL }"/>', '<c:out value="${bottom.BNR_MST_TGT }"/>');">
                                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${bottom.CMM_FLE_WEB_PATH }"/>" 
                                             onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/none.png'"
                                             alt="<c:out value="${bottom.BNR_MST_TITLE }"/>" />
                                    </a>
                                </div>
                                
                            </c:forEach>
                            
                        </div>
                        
                        <%-- 배너가 1개 이상인 경우에만 인디케이터 표시 --%>
                        <c:if test="${fn:length(info.bottom) gt 1 }">
                            <div class="swiper-pagination"></div>
                        </c:if>
                        
                    </div>
                </section>
            
            </c:if>
            <%-- // 하단 배너 --%>
            
            <%-- 공지사항 --%>
            <section class="section-main9">
                <div class="contain-inner">
                    <div class="box-notice">
                        <h2 class="title">공지사항</h2>
                        
                        <c:if test="${not empty info.noticeList }">
                        
                            <ul class="box-list">
                                
                                <c:forEach var="notice" items="${info.noticeList }" varStatus="varStatus">
                                
                                    <li>
                                        <a href="javascript:$.requestPage($.action.board.notice.view(), { BRD_NTS_IDX : '<c:out value="${notice.BRD_NTS_IDX }"/>' });">
                                            <c:out value="${notice.BRD_NTS_TITLE }"/>
                                        </a>
                                    </li>
                                    
                                </c:forEach>
                                
                            </ul>
                            
                        </c:if>
                        
                        <span class="link-more"><a href="javascript:$.requestPage($.action.board.notice.list());">더 보기</a></span>
                    </div>
                    <div class="box-service">
                        <span class="link-service1"><a href="javascript:$.requestPage($.action.board.faq.list());">자주하는 질문 FAQ</a></span>
                        <span class="link-service2"><a href="javascript:$.requestPage($.action.board.inquiry.form());">1:1 문의하기</a></span>
                        <span class="link-service3"><a href="javascript:$.requestPage($.action.board.comment.list());">베스트 가입후기</a></span>
                    </div>
                </div>
            </section>
            <%-- // 공지사항 --%>

        </div>
        <!-- //Content without LNB  -->

    </div>
</div>
<!-- //Body -->

<%-- 팝업 --%>
<c:if test="${not empty info.popupList }">

    <c:forEach var="popup" items="${info.popupList }" varStatus="varStatus">
        
        <c:set var="cookieName" value="popupHide_${popup.POP_MST_IDX }"/>
        
        <c:if test="${cookie[cookieName].value ne '1' }">
    
            <!-- 팝업 : 오늘 하루 동안 띄우지 않기  -->
            <div class="layer-popup3 active">
                <div class="layer-inner" style="left:<c:out value="${popup.POP_MST_X }"/>px; top:<c:out value="${popup.POP_MST_Y }"/>px; width:<c:out value="${popup.POP_MST_W }"/>px;"><!-- style로 팝업width/left/top 조정   -->
                    <div class="contain-body">
                        <a href="javascript:$.requestLink('<c:out value="${popup.POP_MST_LNK }"/>', '<c:out value="${popup.POP_MST_MDE }"/>');">
                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${popup.CMM_FLE_WEB_PATH }"/>" 
                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/none.png'"
                                 alt="<c:out value="${popup.POP_MST_TITLE }"/>">
                        </a> 
                    </div>
                    <div class="contain-bottom">
                        <%-- 오늘 하루만 사용 여부 --%>
                        <c:if test="${popup.POP_MST_DAY_YN eq 'Y' }">
                            <span class="btn-today-close"><button onclick="javascript:$.cookie('popupHide_<c:out value="${popup.POP_MST_IDX }"/>', 1, { expires : 1 });">오늘 하루 동안 띄우지 않기</button></span>
                        </c:if>
                        <span class="btn-close"><button>닫기</button></span>
                    </div>
                </div>
            </div>
            <!-- //팝업 : 오늘 하루 동안 띄우지 않기  -->
        
        </c:if>
        
    </c:forEach>

</c:if>
<%-- // 팝업 --%>

<!-- 제품 템플릿 -->
<script id="recommendProductTemplate" type="text/x-jquery-tmpl">
    {{each(i, row) recommendProductList}}
        <div class="swiper-slide">
            <a href="javascript:$.requestPage($.action.product.basic.view(), { PRD_MST_NO : '{{= row.PRD_MST_NO }}'});">
                <dl class="detail-product-type1 type3">
                    <dd class="image">
                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/{{= row.PRD_MST_CD }}/m_750.png"
                             onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'" 
                             alt="{{= row.PRD_MST_NM }}" >
                        <span class="ribbon-type1">
                            <c:out value="{{= row.PRD_MST_SPT_TXT }}"/>
                        </span>
                    </dd>
                    <dt>
                        <span class="brand">{{= row.VDR_MST_NM }}</span>
                        <span class="catchphrase">{{= row.PRD_MST_SEL_TXT }}</span>
                        <span class="detail">{{= row.PRD_MST_NM }}</span>
                    </dt>
                </dl>
            </a>
        </div>
    {{/each}}
</script>

<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/jquery.cookie.js"></script>

<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    
<script>
    $(function(){
        //메인 인기순 등 정렬 팝업
        if($('.main-category-more').length > 0){
            MainCategoryMore()
        }else{}

        //메인 상품 목록
        if($('.section-main1 .swiper-container').length > 0){
            var letterBestSwiper = new Swiper('.section-main1 .swiper-container', {
                loop:true,
                // 07/02수정
                speed: 500,
                autoplay: {
                    delay: 4000,
                }, // 07/02 여기까지
                pagination: {
                    el: '.section-main1 .swiper-pagination',
                    type: 'fraction',
                },
                navigation: {
                    nextEl: '.section-main1 .swiper-button-next',
                    prevEl: '.section-main1 .swiper-button-prev',
                },

            });
        }else{}

        //베스트 상품 목록
        if($('.section-main3 .swiper-container').length > 0){
            var letterBestSwiper = new Swiper('.section-main3 .swiper-container', {
                spaceBetween: 30,
                slidesPerView: 4,
                //loop:true, - 07/02수정
                navigation: {
                    nextEl: '.section-main3 .swiper-button-next',
                    prevEl: '.section-main3 .swiper-button-prev',
                },

            });
        }else{}

        //지원 상품 목록
        if($('.section-main5 .swiper-container').length > 0){
            var letterBestSwiper = new Swiper('.section-main5 .swiper-container', {
                spaceBetween: 30,
                slidesPerView: 4,
                //loop:true, - 07/02수정
                navigation: {
                    nextEl: '.section-main5 .swiper-button-next',
                    prevEl: '.section-main5 .swiper-button-prev',
                },

            });
        }else{}

        //배너
        if($('.section-main6 .swiper-container').length > 0){
            var letterBestSwiper = new Swiper('.section-main6 .swiper-container', {
                loop:true,
                pagination: {
                el: '.section-main6 .swiper-pagination',
                clickable: true,
                }
            });
        }else{}

        //지원 상품 목록
        if($('.section-main7 .swiper-container').length > 0){
            var letterBestSwiper = new Swiper('.section-main7 .swiper-container', {
                spaceBetween: 30,
                slidesPerView: 4,
                //loop:true, - 07/02수정
                navigation: {
                    nextEl: '.section-main7 .swiper-button-next',
                    prevEl: '.section-main7 .swiper-button-prev',
                },

            });
        }else{}

        //배너
        if($('.section-main8 .swiper-container').length > 0){
            var letterBestSwiper = new Swiper('.section-main8 .swiper-container', {
                loop:true,
                pagination: {
                el: '.section-main8 .swiper-pagination',
                clickable: true,
                }
            });
        }else{}
    
    })
    
    $(function () {
        var $areaContent = $(".area-body"),
            $recommendProductList = $areaContent.find("#recommendProductList"),
            $recommendProductTemplate = $("#recommendProductTemplate");
        // 추천 카테고리
        $areaContent.on("click", "input[name='recommendCategory']", function() {
            $(this).closest(".main-category-inner").removeClass("active");
            var category = $(this).attr("data-category");
            var name = $(this).attr("data-name");
            $areaContent.find("#recommendCategoryTitle").text(name);
            // 상품 목록 갱신
            reloadRecommendProductList(category, false);
        });
        // 추천 상품 보기
        $areaContent.on("click", "#btnNewRecommendList", function() {
            var category = $(".form-radio-category.checked").find("input[name='recommendCategory']").attr("data-category");
            // 상품 목록 갱신
            reloadRecommendProductList(category, true);
        });
        // 추천 카테고리 상품 목록 출력
        function reloadRecommendProductList(category, random) {
            var params = {};
            params.CMN_COM_IDX = category;
            params.random = random;
            $.postSyncJsonAjax($.action.main.reload.recommend.product.ajax(), params, function (data) {
                
                $recommendProductList.height($recommendProductList.height());
                $recommendProductTemplate.tmpl(data).appendTo($recommendProductList.empty());
                
                //지원 상품 목록
                if($('.section-main7 .swiper-container').length > 0){
                    var letterBestSwiper = new Swiper('.section-main7 .swiper-container', {
                        spaceBetween: 30,
                        slidesPerView: 4,
                        loop:true,
                        navigation: {
                            nextEl: '.section-main7 .swiper-button-next',
                            prevEl: '.section-main7 .swiper-button-prev',
                        }
                    });
                }else{}
            });
        }
    });
    
    //메인 인기순 등 정렬 팝업
    function MainCategoryMore(){
        $('.main-category-more > button').on("click", function () {
            $('.main-category-inner').toggleClass('active');
        });
    }
</script>

</body>
</html>