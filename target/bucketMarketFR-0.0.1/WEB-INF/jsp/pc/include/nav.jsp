<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${not fn:contains(pageContext.request.requestURI, '/product') and not fn:contains(pageContext.request.requestURI, '/introductionView')}">
    <div class="area-location">
        <div class="area-inner">
            <span class="btn-home"><a href="javascript:$.requestPage($.action.main.index());">HOME</a></span>
            <c:choose>
                <c:when test="${not empty requestScope[param.navListName] }">
                    <c:forEach var="row" items="${requestScope[param.navListName] }">
                        <span>
                            <a href="javascript:$.requestPage($.action.product.basic.list(), {PRD_CTG_IDX : '<c:out value="${row.PRD_CTG_IDX }"/>'});">
                                <c:out value="${row.PRD_CTG_NM }"/>
                            </a>
                        </span>
                    </c:forEach>
                    <c:if test="${not empty param.keyword }">
                        <span><a href="javascript:;"><c:out value="${param.keyword }"/></a></span>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <c:if test="${not empty param.oneDepth }">
                        <span class="navigation" data-key="<c:out value="${param.oneDepthKey }"/>" data-params="<c:out value="${param.oneDepthParams }"/>">
                            <a href="javascript:;"><c:out value="${param.oneDepth }"/></a>
                        </span>
                    </c:if>
                    <c:if test="${not empty param.twoDepth }">
                        <span class="navigation" data-key="<c:out value="${param.twoDepthKey }"/>" data-params="<c:out value="${param.twoDepthParams }"/>">
                            <a href="javascript:;"><c:out value="${param.twoDepth }"/></a>
                        </span>
                    </c:if>
                    <c:if test="${not empty param.threedepth }">
                        <span class="navigation" data-key="<c:out value="${param.threeDepthKey }"/>" data-params="<c:out value="${param.threeDepthParams }"/>">
                            <a href="javascript:;"><c:out value="${param.threedepth }"/></a>
                        </span>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</c:if>
<c:if test="${not fn:contains(pageContext.request.requestURI, '/contract') and not fn:contains(pageContext.request.requestURI, '/introductionView')}">
    <div class="area-sidebar">
        <div class="area-inner">
            <c:if test="${not empty comonLatelyBasicProductList }">
                <div class="viewed-goods">
                    <p class="text">?????? ??? ??????(<c:out value="${fn:length(comonLatelyBasicProductList) }"/>)</p>
                    <div class="contain-viewed">
                        <div class="swiper-button-next"></div>
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <c:forEach var="row" items="${comonLatelyBasicProductList }" varStatus="stat">
                                    <div class="swiper-slide test<c:out value="${stat.index + 1 }"/>">
                                        <a href="javascript:$.requestPage($.action.product.basic.view(), {PRD_MST_NO :'<c:out value="${row.PRD_MST_NO }"/>'});">
                                            <ui:productImage prdMstCd="${row.PRD_MST_CD }" thubnailSize="750"/>
                                            <span class="viewed-detail">
                                                <p class="text-detail1"><c:out value="${row.PRD_MST_NM }"/></p>
                                                <p class="text-detail2">??? <fmt:formatNumber value="${row.MON_REL_AMT }" type="number"/> ??? ?????? X <fmt:formatNumber value="${row.REL_CNT }" type="number"/>???</p>
                                            </span>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="swiper-button-prev"></div>
                    </div>
                </div>
            </c:if>
            <span class="ancher-top"><button>TOP</button></span>
            <c:if test="${not empty commonSkyscraperList }">
                <div class="box-banner">
                    <div class="box-banner">
                        <c:forEach var="row" items="${commonSkyscraperList }">
                            <a href="javascript:$.requestLink('<c:out value="${row.BNR_MST_URL }"/>', '<c:out value="${row.BNR_MST_TGT }"/>');">
                                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${row.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/none.png'"/>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</c:if>
<div class="area-sidebar-guide">
    <span class="btn-chatbot"><button onclick="javascript:happytalk.open();">??????</button></span>
</div>

<script>
    window.__ht_wc = window.__ht_wc || {};
    window.__ht_wc.host = 'design.happytalkio.com';
    window.__ht_wc.site_id = '4000001448'; // site_id
    window.__ht_wc.site_name = '????????????'; // ?????? ??????
    window.__ht_wc.category_id = '116511'; // ????????? id
    window.__ht_wc.division_id = '116512'; // ????????? id
    // ?????? ???  Custom ???????????? ????????????. ??????????????? ???????????? ?????? ,(??????)??? ??????
    // window.__ht_wc.params = 'site_uid=abcd1234,parameter1=param1';
            
    (function() {
        var ht = document.createElement('script');
        ht.type = 'text/javascript';
        ht.async = true;
        ht.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + window.__ht_wc.host + '/web_chatting/tracking.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ht, s);
    })();
</script>