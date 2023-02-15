<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 로딩 상품 이미지 --%>
<c:set var="loadingProductImage" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA+gAAAPoCAIAAADCwUOzAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDAyIDc5LjE2NDQ2MCwgMjAyMC8wNS8xMi0xNjowNDoxNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RDZGNDA5RjlDRkM3MTFFQTkwNDdDMTE3M0I3MTA2RTAiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RDZGNDA5RjhDRkM3MTFFQTkwNDdDMTE3M0I3MTA2RTAiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIxLjEgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NkNDMjQ0N0Q5RUYwMTFFQTg3N0RCMDEyMzM3QjRCODEiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NkNDMjQ0N0U5RUYwMTFFQTg3N0RCMDEyMzM3QjRCODEiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4QDQySAAAqtElEQVR42uzd63LaWNqwYcdgwBu8S9ypmjn/U5vq6iS28RYwxt/zsr5oNGBAEgKDc10/UjTNRmgR55YsLX0Zj8d7AADAdtu3CgAAQLgDAADCHQAAhDsAACDcAQAA4Q4AAMIdAAAQ7gAAgHAHAADhDgAACHcAABDuAACAcAcAAIQ7AAAIdwAAQLgDAADCHQAAhDsAACDcAQAA4Q4AAMIdAAAQ7gAAINwBAADhDgAACHcAABDuAACAcAcAAIQ7AAAIdwAAQLgDAIBwBwAAhDsAACDcAQBAuAMAAMIdAAAQ7gAAINwBAADhDgAACHcAABDuAACAcAcAAOEOAAAIdwAAQLgDAIBwBwAAhDsAACDcAQBAuAMAAMIdAACEOwAAINwBAADhDgAAwh0AABDuAACAcAcAAOEOAAAIdwAAQLgDAIBwBwAAhDsAAAh3AABAuAMAAMIdAACEOwAAINwBAADhDgAAwh0AABDuAAAg3AEAAOEOAAAIdwAAEO4AAIBwBwAAhDsAAAh3AABAuAMAAMIdAACEOwAAINwBAEC4AwAAwh0AABDuAAAg3AEAAOEOAAAIdwAAEO4AAIBwBwAA4Q4AAAh3AABAuAMAgHAHAACEOwAAINwBAEC4AwAAwh0AABDuAAAg3AEAAOEOAADCHQAAEO4AAIBwBwAA4Q4AAAh3AABAuAMAgHAHAACEOwAACHcAAEC4AwAAwh0AAIQ7AAAg3AEAAOEOAADCHQAAEO4AAIBwBwAA4Q4AAAh3AAAQ7gAAgHAHAACEOwAACHcAAEC4AwAAwh0AAIQ7AAAg3AEAQLgDAADCHQAAEO4AACDcAQAA4Q4AAAh3AAAQ7gAAgHAHAACEOwAACHcAAEC4AwCAcAcAAIQ7AAAg3AEAQLgDAADCHQAAEO4AACDcAQAA4Q4AAMIdAAAQ7gAAgHAHAADhDgAACHcAAEC4AwCAcAcAAIQ7AAAg3AEAQLgDAADCHQAAhDsAACDcAQAA4Q4AAMIdAAAQ7gAAgHAHAADhDgAACHcAABDuAACAcAcAAIQ7AAAIdwAAQLgDAADCHQAAhDsAACDcAQAA4Q4AAMIdAAAQ7gAAINwBAADhDgAACHcAABDuAACAcAcAAIQ7AAAIdwAAQLgDAIBwBwAAhDsAACDcAQBAuAMAAMIdAAAQ7gAAINwBAADhDgAACHcAABDuAACAcAcAAOEOAAAIdwAAQLgDAIBwBwAAhDsAACDcAQBAuAMAAMIdAACEOwAAINwBAADhDgAAwh0AABDuAACAcAcAAOEOAAAIdwAAQLgDAIBwBwAAhDsAAAh3AABAuAMAAMIdAACEOwAAINwBAADhDgAAwh0AABDuAAAg3AEAAOEOAAAIdwAAEO4AAIBwBwAAhDsAAAh3AABAuAMAAMIdAACEOwAAINwBAEC4AwAAwh0AABDuAAAg3AEAAOEOAAAIdwAAEO4AAIBwBwAA4Q4AAAh3AABAuAMAgHAHAACEOwAAINwBAEC4AwAAwh0AABDuAAAg3AEAAOEOAADCHQAAEO4AAIBwBwAA4Q4AAAh3AABAuAMAgHAHAACEOwAACHerAAAAhDsAACDcAQBAuAMAAMIdAAAQ7gAAINwBAADhDgAACHcAABDuAACAcAcAAOEOAAAIdwAAQLgDAIBwBwAAhDsAACDcAQBAuAMAAMIdAAAQ7gAAINwBAADhDgAAwh0AABDuAACAcAcAAOEOAAAIdwAAQLgDAIBwBwAAhDsAAAh3AABAuAMAAMIdAACEOwAAINwBAADhDgAAwh0AABDuAACAcAcAAOEOAAAIdwAAEO4AAIBwBwAAhDsAAAh3AABAuAMAAMIdAACEOwAAINwBAEC4AwAAwh0AABDuAAAg3AEAAOEOAAAIdwAAEO4AAIBwBwAAhDsAAAh3AABAuAMAgHAHAACEOwAAINwBAEC4AwAAwh0AABDuAAAg3AEAAOEOAADCHQAAEO4AAIBwBwAA4Q4AAAh3AABAuAMAgHAHAACEOwAAINwBAEC4AwAAwh0AAIQ7AAAg3AEAAOEOAADCHQAAEO4AAIBwBwAA4Q4AAAh3AAAQ7gAAgHAHAACEOwAACHcAAEC4AwAAwh0AAIQ7AAAg3AEAAOEOAADCHQAAEO4AACDcAQAA4Q4AAAh3AAAQ7gAAgHAHAACEOwAACHcAAEC4AwCAcAcAAIQ7AAAg3AEAQLgDAADCHQAAEO4AACDcAQAA4Q4AAAh3AAAQ7gAAgHAHAADhDgAACHcAAEC4AwCAcAcAAIQ7AAAg3AEAQLgDAADCHQAAhDsAACDcAQAA4Q4AAMIdAAAQ7gAAgHAHAADhDgAACHcAAEC4AwCAcAcAAIQ7AAAIdwAAQLgDAADCHQAAhDsAACDcAQAA4Q4AAMIdAAAQ7gAAINwBAADhDgAACHcAABDuAACA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AwCAcAcAAIQ7AAAIdwAAQLgDAADCHQAAhDsAACDcAQAA4Q4AAMIdAAAQ7gAAINwBAADhDgAACHcAABDuAACAcAcAAIQ7AAAIdwAAQLgDAADCHQAAhDsAACDcAQBAuAMAAMIdAAAQ7gAAINwBAADhDgAACHcAABDuAACAcAcAAOEOAAAIdwAAQLgDAIBwBwAAhDsAACDcAQBAuAMAAMIdAAAQ7gAAINwBAADhDgAAwh0AABDuAACAcAcAAOEOAAAIdwAAQLgDAIBwBwAAhDsAAAh3AABAuAMAAMIdAACEOwAAINwBAADhDgAAwh0AABDuAACAcAcAAOEOAAAIdwAAEO4AAIBwBwAAhDsAAAh3AABAuAMAAMIdAACEOwAAINwBAEC4WwUAACDcAQAA4Q4AAMIdAAAQ7gAAgHAHAADhDgAACHcAAEC4AwCAcAcAAIQ7AAAIdwAAQLgDAADCHQAAhDsAACDcAQAA4Q4AAMIdAAAQ7gAAgHAHAADhDgAACHcAABDuAACAcAcAAIQ7AAAIdwAAQLgDAADCHQAAhDsAACDcAQBAuAMAAMIdAAAQ7gAAINwBAADhDgAACHcAABDuAACAcAcAAIQ7AAAIdwAAQLgDAIBwBwAAhDsAACDcAQBAuAMAAMIdAAAQ7gAAINwBAADhDgAAwh0AABDuAACAcAcAAOEOAAAIdwAAQLgDAIBwBwAAhDsAACDcAQBAuAMAAMIdAACEOwAAINwBAADhDgAAwh0AABDuAACAcAcAAOEOAAAIdwAAEO4AAIBwBwAAhDsAAAh3AABAuAMAAMIdAACEOwAAINwBAADhDgAAwh0AABDuAAAg3AEAAOEOAAAIdwAAEO4AAIBwBwAAhDsAAAh3AABAuAMAgHAHAACEOwAAINwBAEC4AwAAwh0AABDuAAAg3AEAAOEOAAAIdwAAEO4AAIBwBwAA4Q4AAAh3AABAuAMAgHAHAACEOwAAINwBAEC4AwAAwh0AAIQ7AAAg3AEAAOEOAADCHQAAEO4AAIBwBwAA4Q4AAAh3AABAuAMAgHAHAACEOwAACHcAAEC4AwAAwh0AAIQ7AAAg3AEAAOEOAADCHQAAEO4AACDcAQAA4Q4AAAh3AAAQ7gAAgHAHAACEOwAACHcAAEC4AwAAwh0AAIQ7AAAg3AEAQLgDAADCHQAAEO4AACDcAQAA4Q4AAAh3AAAQ7gAAgHAHAADhDgAACHcAAEC4AwCAcAcAAIQ7AAAg3AEAQLgDAADCHQAAEO4AACDcAQAA4Q4AAMIdAAAQ7gAAgHAHAADhDgAACHcAAEC4AwCAcAcAAIQ7AAAIdwAAQLgDAADCHQAAhDsAACDcAQAA4Q4AAJ/D/xNgAE7KYgnOKD16AAAAAElFTkSuQmCC"/>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta property="og:site_name" key="site_name" content="<spring:eval expression="@resource['project.title']"/>" class="meta-sns-share">
    <meta property="og:url" key="url" content="<spring:eval expression="@resource['front.ssl.domain']"/><c:out value="${requestURI }"/><c:out value="${paramsQueryString }"/>" class="meta-sns-share"/>
    <meta property="og:type" key="type" content="article"  class="meta-sns-share"/>
    <meta property="og:title" key="title" content="<c:out value="${info.PRD_MST_NM}"/>" class="meta-sns-share"/>
    <meta property="og:description" key="description" content="<c:out value="${info.PRD_MST_SPT_TXT}"/>"  class="meta-sns-share"/>
    <meta property="og:image" key="image" content="<spring:eval expression="@resource['front.ssl.domain']"/><ui:productImage prdMstCd="${info.PRD_MST_CD }" thubnailSize="750" tagYn="N"/>" class="meta-sns-share"/>
    <meta property="og:image:width" key="image_width" content="750" class="meta-sns-share"/>
    <meta property="og:image:height" key="image_height" content="750" class="meta-sns-share"/>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/goods.css">
</head>
<body class="">
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/nav.jsp" %>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-inner">
            <div class="contain-body">
                <div class="contain-product1">
                    <c:if test="${not empty imageList }">
                        <div class="wrap-image">
                            <c:forEach begin="1" end="2" varStatus="stat">
                                <div class="box-image-product1-<c:out value="${stat.index }"/> swiper-container">
                                    <c:if test="${not empty fileInfo and stat.first }">
                                        <span class="btn-audio">
                                            <button>오디오로<br />상품안내 듣기</button>
                                            <audio controls src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${fileInfo.CMM_FLE_WEB_PATH }"/>"></audio>
                                        </span>
                                    </c:if>
                                    <div class="swiper-wrapper">
                                        <c:forEach var="row" items="${imageList }">
                                            <div class="swiper-slide">
                                                <c:set var="PRD_IMG_URL_PATH" value="${row.PRD_IMG_URL_PATH }"/>
                                                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.PRD_IMG_URL_PATH }"/>" 
                                                     onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/none.png'" 
                                                     alt="" >
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                    </c:if>
                    <div class="box-detail-product1">
                        <span class="detail1"><c:out value="${info.PRD_MST_NM }"/></span>
                        <span class="detail2">
                            <c:out value="${info.PRD_MST_SPT_TXT }"/>
                            <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL }"><%-- 상품유형 > 렌탈 --%>
                                <del>(기본 월 <fmt:formatNumber value="${info.PRD_MST_RTL_PAY }"/>원)</del>
                            </c:if>
                        </span>
                    </div>
                    <%-- 즉발(채권) --%>
                    <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y' }">
                        <div class="box-detail-product2">
                            <dl>
                                <dt>즉시 지원 혜택 <span class="btn-help"><button class="help3">도움말</button></span></dt>
                                <dd class="detail1"><span class="point1"><fmt:formatNumber value="${info.REL_AMT }" type="number"/></span>원</dd>
                            </dl>
                        </div>
                        <div class="box-detail-product3">
                            <dl>
                                <dt>만기 혜택 <span class="btn-help"><button class="help2">도움말</button></span></dt>
                                <dd class="detail1"><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원 <span>(만기 100%환급)</span></dd>
                            </dl>
                        </div>
                    </c:if>
                    <%-- 월지원형/즉발(비채권)/렌탈/할부지원 --%>
                    <c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') }">
                        <div class="box-detail-product2">
                            <dl>
                                <dt>매월 지원 혜택 <span class="btn-help"><button class="help1">도움말</button></span></dt>
                                <dd class="detail1"><span class="point1"><fmt:formatNumber value="${info.MON_REL_AMT }" type="number"/></span>원 X <span class="point1"><fmt:formatNumber value="${info.REL_CNT }" type="number"/></span>회 지원</dd>
                                <dd class="detail2">(총 지원혜택 <fmt:formatNumber value="${info.REL_AMT }" type="number"/>원)</dd>
                            </dl>
                        </div>
                        <div class="box-detail-product3">
                            <dl>
                                <dt>만기 혜택 <span class="btn-help"><button class="help2">도움말</button></span></dt>
                                <dd class="detail1"><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원 <span>(만기 100%환급)</span></dd>
                            </dl>
                            <dl>
                                <dt>월 납입안내 <span class="btn-help"><button class="help5">도움말</button></span></dt>
                                <%-- 정기형 --%>
                                <c:if test="${info.PRD_MST_IRG_YN ne 'Y' }">
                                    <dd class="detail1"><fmt:formatNumber value="${info.MON_PAY_AMT }"/>원 × <fmt:formatNumber value="${info.EXPR_NO }"/>회 납입 </dd>
                                </c:if>
                                <%-- 비정기형 --%>
                                <c:if test="${info.PRD_MST_IRG_YN eq 'Y' }">
                                    <dd class="detail1">
                                        <table class="mon-payment">
                                            <tbody>
                                                <c:if test="${not empty info.PRD_MST_PAY_AMT1 and not empty info.PRD_MST_PAY_CNT1 }">
                                                    <tr>
                                                        <td class="mon-pay1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT1 }"/></td>
                                                        <td class="mon-pay2">원 x</td>
                                                        <td class="mon-pay3"><c:out value="${info.PRD_MST_PAY_CNT1 }"/></td>
                                                        <td class="mon-pay4">회 납입</td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${not empty info.PRD_MST_PAY_AMT2 and not empty info.PRD_MST_PAY_CNT2 }">
                                                    <tr>
                                                        <td class="mon-pay1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT2 }"/></td>
                                                        <td class="mon-pay2">원 x</td>
                                                        <td class="mon-pay3"><c:out value="${info.PRD_MST_PAY_CNT2 }"/></td>
                                                        <td class="mon-pay4">회 납입</td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${not empty info.PRD_MST_PAY_AMT3 and not empty info.PRD_MST_PAY_CNT3 }">
                                                    <tr>
                                                        <td class="mon-pay1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT3 }"/></td>
                                                        <td class="mon-pay2">원 x</td>
                                                        <td class="mon-pay3"><c:out value="${info.PRD_MST_PAY_CNT3 }"/></td>
                                                        <td class="mon-pay4">회 납입</td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${not empty info.PRD_MST_PAY_AMT4 and not empty info.PRD_MST_PAY_CNT4 }">
                                                    <tr>
                                                        <td class="mon-pay1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT4 }"/></td>
                                                        <td class="mon-pay2">원 x</td>
                                                        <td class="mon-pay3"><c:out value="${info.PRD_MST_PAY_CNT4 }"/></td>
                                                        <td class="mon-pay4">회 납입</td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </dd>
                                </c:if>
                            </dl>
                        </div>
                    </c:if>
                    <c:if test="${(info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT or info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE) and info.PRD_MST_JOIN_LMT gt 1 }">
                        <%-- 상품유형이 월지원/즉발 일 경우에만 복수 구좌 허용 --%>
                        <div class="box-detail-product5">
                            <p class="text-normal-type1">가입 구좌를 선택해 주세요.</p>
                            <div class="box-radio-type1">
                                <c:forEach begin="1" end="${info.PRD_MST_JOIN_LMT }" varStatus="stat">
                                    <span class="form-radio radio-order-count temp<c:if test="${stat.first }"> checked</c:if>">
                                        <input type="radio" name="ORD_MST_CNT_TMP" value="<c:out value="${stat.index }"/>" <c:if test="${stat.first }">checked="checked"</c:if>/>
                                        <c:out value="${stat.index }"/>개
                                    </span>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${info.PRD_MST_OPT_YN eq 'Y' and not empty optionList }">
                        <span class="product-option-temp-box">
                            <div class="box-detail-product5">
                                <div class="box-inner">
                                    <p class="text-normal-type1"><c:out value="${info.PRD_MST_OPT_NM }"/></p>
                                    <div class="box-radio-type1">
                                        <c:forEach var="row" items="${optionList }">
                                            <span class="form-radio radio-product-option temp">
                                                <input type="radio" name="PRD_OPT_IDX_TMP_1" value="<c:out value="${row.PRD_OPT_IDX }"/>"/><c:out value="${row.PRD_OPT_DTL }"/>
                                            </span>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </span>
                    </c:if>
                    <div class="box-button">
                        <c:if test="${info.PRD_MST_DPL_YN eq  Product.DISPLAY_SHOW }">
                            <span class="btn-apply-join button-join-contract <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">disabled</c:if>"><button>간편 가입 신청</button></span>
                        </c:if>
                        <c:if test="${info.PRD_MST_DPL_YN eq  Product.DISPLAY_SOLDOUT }">
                            <span class="btn-apply-join disabled"><button disabled="disabled" onclick="return false;">일시품절</button></span>
                        </c:if>
                        <span class="btn-share-detail"><button class="call-sns-layer">상품정보 공유</button></span>
                    </div>
                </div>
                <c:if test="${not empty typeInfo.PRD_TPL_PC_DTL_DSC}">
                    <div class="contain-category-banner">
                        <c:out value="${typeInfo.PRD_TPL_PC_DTL_DSC }" escapeXml="false"/>
                    </div>
                </c:if>
                <c:if test="${not empty bannerList }">
                    <div class="contain-banner">
                        <c:forEach var="row" items="${bannerList }" begin="0" end="0">
                            <a href="javascript:$.requestLink('<c:out value="${row.BNR_MST_URL }"/>', '<c:out value="${row.BNR_MST_TGT }"/>');">
                                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${row.BNR_MST_TITLE }"/>" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/none.png'"/>
                            </a>
                        </c:forEach>
                    </div>
                </c:if>
                <div class="contain-product2">
                    <div class="contain-inner">
                        <div class="contain-option">
                            <div class="contain-inner">
                                <div class="box-option1">
                                    <div class="box-inner">
                                        <p class="text1"><c:out value="${info.PRD_MST_NM }"/></p>
                                        <p class="text2"><c:out value="${info.PRD_MST_SPT_TXT }"/></p>
                                    </div>
                                </div>
                                <%-- 즉발(채권) --%>
                                <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y' }">
                                    <div class="box-option4">
                                        <dl>
                                            <dt>즉시 지원 혜택 <span class="btn-help"><button class="help3">도움말</button></span></dt>
                                            <dd class="detail1"><span class="point1"><fmt:formatNumber value="${info.REL_AMT }" type="number"/></span>원</dd>
                                        </dl>
                                    </div>
                                    <div class="box-option5">
                                        <dl>
                                            <dt>만기 혜택 <span class="btn-help"><button class="help2">도움말</button></span></dt>
                                            <dd class="detail1"><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원</dd>
                                        </dl>
                                    </div>
                                </c:if>
                                <%-- 월지원형/즉발(비채권)/렌탈/할부지원 --%>
                                <c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') }">
                                    <div class="box-option4">
                                        <dl>
                                            <dt>매월 지원 혜택 <span class="btn-help"><button class="help1">도움말</button></span></dt>
                                            <dd class="detail1"><span class="point1"><fmt:formatNumber value="${info.MON_REL_AMT }" type="number"/></span>원 X <span class="point1"><fmt:formatNumber value="${info.REL_CNT }" type="number"/></span>회 지원</dd>
                                        <dd class="detail2">(총 지원혜택 <fmt:formatNumber value="${info.REL_AMT }" type="number"/>원)</dd>
                                        </dl>
                                    </div>
                                    <div class="box-option5">
                                        <dl>
                                            <dt>만기 혜택 <span class="btn-help"><button class="help2">도움말</button></span></dt>
                                            <dd class="detail1"><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원 <span>(만기 100%환급)</span></dd>
                                        </dl>
                                        <dl>
                                            <dt>월 납입안내 <span class="btn-help"><button class="help5">도움말</button></span></dt>
                                            <%-- 정기형 --%>
                                            <c:if test="${info.PRD_MST_IRG_YN ne 'Y' }">
                                                <dd class="detail1"><fmt:formatNumber value="${info.MON_PAY_AMT }"/>원 × <fmt:formatNumber value="${info.EXPR_NO }"/>회 납입 </dd>
                                            </c:if>
                                            <%-- 비정기형 --%>
                                            <c:if test="${info.PRD_MST_IRG_YN eq 'Y' }">
                                                <dd class="detail1">
                                                    <table class="mon-payment">
                                                        <tbody>
                                                            <c:if test="${not empty info.PRD_MST_PAY_AMT1 and not empty info.PRD_MST_PAY_CNT1 }">
                                                                <tr>
                                                                    <td class="mon-pay1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT1 }"/></td>
                                                                    <td class="mon-pay2">원 x</td>
                                                                    <td class="mon-pay3"><c:out value="${info.PRD_MST_PAY_CNT1 }"/></td>
                                                                    <td class="mon-pay4">회 납입</td>
                                                                </tr>
                                                            </c:if>
                                                            <c:if test="${not empty info.PRD_MST_PAY_AMT2 and not empty info.PRD_MST_PAY_CNT2 }">
                                                                <tr>
                                                                    <td class="mon-pay1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT2 }"/></td>
                                                                    <td class="mon-pay2">원 x</td>
                                                                    <td class="mon-pay3"><c:out value="${info.PRD_MST_PAY_CNT2 }"/></td>
                                                                    <td class="mon-pay4">회 납입</td>
                                                                </tr>
                                                            </c:if>
                                                            <c:if test="${not empty info.PRD_MST_PAY_AMT3 and not empty info.PRD_MST_PAY_CNT3 }">
                                                                <tr>
                                                                    <td class="mon-pay1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT3 }"/></td>
                                                                    <td class="mon-pay2">원 x</td>
                                                                    <td class="mon-pay3"><c:out value="${info.PRD_MST_PAY_CNT3 }"/></td>
                                                                    <td class="mon-pay4">회 납입</td>
                                                                </tr>
                                                            </c:if>
                                                            <c:if test="${not empty info.PRD_MST_PAY_AMT4 and not empty info.PRD_MST_PAY_CNT4 }">
                                                                <tr>
                                                                    <td class="mon-pay1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT4 }"/></td>
                                                                    <td class="mon-pay2">원 x</td>
                                                                    <td class="mon-pay3"><c:out value="${info.PRD_MST_PAY_CNT4 }"/></td>
                                                                    <td class="mon-pay4">회 납입</td>
                                                                </tr>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                </dd>
                                            </c:if>
                                        </dl>
                                    </div>
                                </c:if>
                                <c:if test="${(info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT or info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE) and info.PRD_MST_JOIN_LMT gt 1 }">
                                    <div class="box-option2">
                                        <div class="box-inner">
                                            <p class="text-normal-type1">가입 구좌</p>
                                            <div class="box-radio-type1">
                                                <c:forEach begin="1" end="${info.PRD_MST_JOIN_LMT }" varStatus="stat">
                                                    <span class="form-radio radio-order-count<c:if test="${stat.first }"> checked</c:if>">
                                                        <input type="radio" name="ORD_MST_CNT" value="<c:out value="${stat.index }"/>" <c:if test="${stat.first }">checked="checked"</c:if>/>
                                                        <c:out value="${stat.index }"/>개
                                                    </span>
                                                </c:forEach>
                                            </div>
                                            <c:if test="${info.PRD_MST_OPT_YN eq 'Y' and not empty optionList }">
                                                <p class="text-notice-type3">* 가입 구좌 수 만큼 옵션을 선택해 주세요.</p>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${info.PRD_MST_OPT_YN eq 'Y' and not empty optionList }">
                                    <div class="box-option3 product-option-box">
                                        <div class="box-inner">
                                            <p class="text-normal-type1"><c:out value="${info.PRD_MST_OPT_NM }"/></p>
                                            <div class="box-radio-type1">
                                                <c:forEach var="row" items="${optionList }">
                                                    <span class="form-radio radio-product-option">
                                                        <input type="radio" name="PRD_OPT_IDX_1" value="<c:out value="${row.PRD_OPT_IDX }"/>"/><c:out value="${row.PRD_OPT_DTL }"/>
                                                    </span>
                                                </c:forEach>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <c:if test="${info.PRD_MST_DPL_YN eq  Product.DISPLAY_SHOW }">
                                <span class="btn-type1 button-join-contract disabled"><button>간편 가입 신청</button></span>
                            </c:if>
                            <c:if test="${info.PRD_MST_DPL_YN eq  Product.DISPLAY_SOLDOUT }">
                                <span class="btn-type-text1 disabled"><button disabled="disabled" onclick="return false;">일시품절</button></span>
                            </c:if>
                        </div>
                        <div class="box-tab-head">
                            <span class="on"><button>지원혜택</button></span>
                            <span><button>라이프서비스</button></span>
                            <span><button>멤버십혜택</button></span>
                        </div>
                        <div class="box-tab-body tab1 on">
                            <div class="box-inner">
                                <c:if test="${not empty info.PRD_MST_PC_YTB }">
                                    <c:out value="${info.PRD_MST_PC_YTB }" escapeXml="false"/>
                                </c:if>
                                <p>
                                    <c:out value="${info.PRD_MST_PC_DTL_DSC }" escapeXml="false"/>
                                </p>
                            </div>
                        </div>
                        <c:if test="${not empty lifeServiceList }">
                            <div class="box-tab-body tab2">
                                <div class="box-tab-sub-head">
                                    <c:forEach var="row" items="${lifeServiceList }" varStatus="stat">
                                        <span <c:if test="${stat.first }">class="on"</c:if>><button><c:out value="${row.PRD_TPL_SVC_NM }"/></button></span>
                                    </c:forEach>
                                </div>
                                <c:forEach var="row" items="${lifeServiceList }" varStatus="stat">
                                <div class="box-tab-sub-body subtab<c:out value="${stat.index + 1 }"/><c:if test="${stat.first }"> on</c:if>">
                                    <div class="box-inner">
                                        <c:out value="${row.PRD_TPL_PC_DTL_DSC }" escapeXml="false"/>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </c:if>
                        <div class="box-tab-body tab3">
                            <div class="box-inner">
                                <c:out value="${membershipInfo.PRD_TPL_PC_DTL_DSC }" escapeXml="false"/>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${not empty info.PRD_MST_NTC_DSC and info.PRD_MST_NTC_DSC ne '<p>&nbsp;</p>' }">
                    <div class="contain-product3">
                        <div class="contain-inner">
                            <h3 class="title">유의사항</h3>
                            <div class="box-inner">
                                <c:out value="${info.PRD_MST_NTC_DSC }" escapeXml="false"/>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty info.PRD_MST_DLV_DSC and info.PRD_MST_DLV_DSC ne '<p>&nbsp;</p>' }">
                    <div class="contain-product4">
                        <div class="contain-inner">
                            <h3 class="title">배송정보</h3>
                            <div class="box-inner">
                                <c:out value="${info.PRD_MST_DLV_DSC }" escapeXml="false"/>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty notificationInfoList }">
                    <div class="contain-product8">
                        <div class="contain-inner">
                            <h3 class="title">상품정보고시</h3>
                            <div class="box-inner">
                                <div class="table-type1">
                                    <table>
                                        <colgroup>
                                            <col style="width:25%">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                            <c:forEach var="row" items="${notificationInfoList }" varStatus="stat">
                                                <c:set var="notificationColNm" value="PRD_MST_NFI_INF${stat.index + 1 }"/>
                                                <tr>
                                                    <th><c:out value="${row.PRD_NFI_INFO }"/></th>
                                                    <td><c:out value="${info[notificationColNm] }"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${info.PRD_MST_QNA_YN eq 'Y' }">
                    <div class="contain-product5 product-qna-box">
                        <div class="box-inner">
                            <h3 class="title">상품 Q&amp;A (<span class="list-total-count"></span>)</h3>
                            <div class="box-notice-type1">
                                <ul>
                                    <li>가입하시려는 상품에 대해 궁금하신 점이 있으신 경우 문의해 주세요.</li>
                                    <li>상품문의 이 외에 가입/철회/해약/배송 관련문의 1:1 문의하기를 이용해 주시기 바랍니다.</li>
                                </ul>
                            </div>
                            <div class="contain-tab-qna">
                                <div class="box-inner">
                                    <span class="btn-tab on"><button class="call-list-search" data-type="all">전체</button></span>
                                    <span class="btn-tab"><button class="call-list-search" data-type="answer">답변완료(<span class="list-answer-count">0</span>)</button></span>
                                </div>
                                <label class="form-checkbox"><input type="checkbox" class="call-my-qna-list">나의 Q&ampA</label>
                            </div>
                            <div class="list-area"></div>
                            <div class="paginate"></div>
                            <span class="btn-type-text5"><button class="call-product-qna-form-layer">상품 Q&amp;A 작성</button></span>
                        </div>
                    </div>
                </c:if>
                <c:if test="${info.PRD_MST_REV_YN eq 'Y' }">
                    <div class="contain-product6 product-review-box">
                        <div class="box-inner">
                            <h3 class="title">가입후기 (<fmt:formatNumber value="${commentBoardBestCount + commentBoardCount }" type="number"/>)</h3>
                            <p class="text-normal-type1">이 상품을 가입하신 분들이 작성하신 실제 후기입니다.</p>
                            <c:if test="${not empty commentBoardBestList }">
                                <div class="box-latter-best swiper-container">
                                    <h4 class="title">BEST 후기</h4>
                                    <div class="swiper-wrapper">
                                        <c:forEach var="row" items="${commentBoardBestList }">
                                            <div class="swiper-slide">
                                                <div class="box-latter-view">
                                                    <button class="call-list-layer" data-type="comment-board-best">
                                                        <p class="latter-profile <c:out value="${row.SEX eq Const.FEMALE ? 'woman' : 'man' }"/>">
                                                            <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile_<c:out value="${row.SEX eq Const.FEMALE ? 'women' : 'men' }"/>.png" alt="프로필 사진">
                                                        </p>
                                                        <p class="latter-star"><span class="star-gray"><span class="star-red" style="width: <c:out value="${row.PRD_REV_PIT * 20 }"/>%;"></span></span></p>
                                                        <p class="latter-name">
                                                            <c:out value="${row.MEM_NM }"/>, <c:out value="${row.AGE }"/>대
                                                            <span class="latter-day"><ui:formatDate value="${row.PRD_REV_REG_DT }" pattern="yyyy.MM.dd"/></span>
                                                        </p>
                                                        <p class="latter-content"><c:out value="${fn:replace(row.PRD_REV_CTS, newLineChar, '<br/>') }" escapeXml="false"/></p>
                                                    </button>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="swiper-button-prev"></div>
                                    <div class="swiper-button-next"></div>
                                    <c:if test="${commentBoardBestCount gt 1 }">
                                        <div class="swiper-pagination"></div>
                                    </c:if>
                                </div>
                            </c:if>
                            <div class="box-latter-body list-area"></div>
                            <div class="paginate"></div>
                            <span class="btn-type-text4"><button onclick="$.requestPage($.action.board.comment.list());">모든 상품의 BEST 후기 보기</button></span>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty relationList }">
                    <div class="contain-product7">
                        <div class="box-inner">
                            <h3 class="title">다른 고객님들이 본 상품</h3>
                            <div class="box-othercustomer swiper-container">
                                <div class="swiper-wrapper">
                                    <c:forEach var="row" items="${relationList }" >
                                        <div class="swiper-slide">
                                            <ui:productList info="${row }" thubnailSize="750"/>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <%-- //Body --%>
    <%-- 도움말 --%>
    <div class="box-help help1">
        <div class="box-inner">상품 가입을 통해 매월 제공되는 지원 혜택입니다.</div>
    </div>
    <div class="box-help help2">
        <div class="box-inner">납입 하는 총 상품 금액으로 만기 후 100% 전액 환급 혹은 총 상품금액 상당의 라이프서비스 이용이 가능합니다.</div>
    </div>
    <div class="box-help help3">
        <div class="box-inner">상품 가입과 동시에 지금 바로 제공되는 지원 혜택입니다.</div>
    </div>
    <div class="box-help help4">
        <div class="box-inner">납입 하는 총 상품 금액으로, 총 상품 금액 상당의 라이프서비스가 제공됩니다.</div>
    </div>
    <div class="box-help help5">
        <div class="box-inner">상품가입 후 매월 납입하는 금액과 총 회차입니다.(라이프서비스 미사용 시, 만기에 전액환급 가능)</div>
    </div>
    <%-- //도움말 --%>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/paging.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
    <script id="productQnAListTemplate" type="text/x-jquery-tmpl">
        {{if StringUtil.getInt(totalCount) == 0}}
            <p class="text-empty-data">등록된 상품 Q&amp;A가 없습니다.</p>
        {{else}}
            <div class="contain-qna">
                {{each(i, row) list}}
                    <dl class="box-qna{{if row.PRD_QNA_RPL_YN == "Y"}} completed{{/if}}" data-index="\${i}">
                        <dt>
                            <span class="stat">[{{if row.PRD_QNA_RPL_YN == "Y"}}답변완료{{else}}답변대기{{/if}}]</span>
                            <span class="name">\${row.PRD_QNA_MEM_NM}</span>
                            <span class="date">\${StringUtil.formatDate(row.PRD_QNA_REG_DT, "yyyy.MM.dd")}</span>
                            {{if row.PRD_QNA_DSP_YN == "Y"}}
                                <span class="title">{{html StringUtil.replaceEnterToBr(row.PRD_QNA_CTS)}}</span>
                            {{else}}
                                <span class="title"><button class="private">비공개로 작성된 글입니다.</button></span>
                            {{/if}}
                        </dt>
                        {{if row.PRD_QNA_DSP_YN == "Y" && row.PRD_QNA_RPL_YN == "Y"}}
                            {{tmpl({info : row}) "#productQnAAnswerTemplate"}}
                        {{/if}}
                    </dl>
                {{/each}}
            </div>
        {{/if}}
    </script>
    <script id="productQnAAnswerTemplate" type="text/x-jquery-tmpl">
        <dd>
            <div class="box-answer">
                <div class="title">
                    A.
                    {{if info.AUT_MST_VDR_YN == "Y"}}
                        <span class="icon-partner">파트너</span>
                    {{else}}
                        <span class="icon-bucketmarket">
                            <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_icon_bi.png" alt="버킷마켓" >
                        </span>
                    {{/if}}
                </div>
                {{html info.PRD_QNA_RPL_CTS}}
            </div>
        </dd>
    </script>
    <script id="commentBoardListTemplate" type="text/x-jquery-tmpl">
        {{if StringUtil.getInt(totalCount) == 0}}
            <p class="text-empty-data">등록된 가입후기가 없습니다.</p>
        {{else}}
            {{each(i, row) list}}
                <div class="box-latter-view">
                    {{if row.SEX == "<c:out value="${Const.FEMALE }"/>"}}
                        <p class="latter-profile woman"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile_women.png" alt="프로필 사진"></p>
                    {{else}}
                        <p class="latter-profile man"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile_men.png" alt="프로필 사진"></p>
                    {{/if}}
                    <p class="latter-star"><span class="star-gray"><span class="star-red" style="width: \${row.PRD_REV_PIT * 20}%;"></span></span></p>
                    <p class="latter-name">
                        \${row.MEM_NM}, \${row.AGE}대
                        <span class="latter-day">\${StringUtil.formatDate(row.PRD_REV_REG_DT, "yyyy.MM.dd")}</span>
                    </p>
                    <p class="latter-content">{{html StringUtil.replaceEnterToBr(row.PRD_REV_CTS)}}</p>
                    {{if row.CMM_FLE_WEB_PATH != "" && row.CMM_FLE_WEB_PATH != null}}
                        <p class="latter-photo">
                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/>\${row.CMM_FLE_WEB_PATH}" alt="제품 사진">
                        </p>
                    {{/if}}
                    {{if row.PRD_REV_RPL}}
                        <div class="box-latter-answer">
                            <div class="box-answer">
                                <div class="title">
                                    A.
                                    {{if row.AUT_MST_VDR_YN == "Y"}}
                                        <span class="icon-partner">파트너</span>
                                    {{/if}}
                                    {{if row.AUT_MST_VDR_YN == "N"}}
                                        <span class="icon-bucketmarket">
                                            <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_icon_bi.png" alt="버킷마켓" >
                                        </span>
                                    {{/if}}
                                </div>
                                {{html row.PRD_REV_RPL}}
                            </div>
                        </div>
                    {{/if}}
                </div>
            {{/each}}
        {{/if}}
    </script>
    <script id="productOptionTemplate" type="text/x-jquery-tmpl">
        {{if TEMP_YN == "Y"}}<div class="box-detail-product5">{{/if}}
        <div class="box-inner">
            <p class="text-normal-type1"><c:out value="${info.PRD_MST_OPT_NM }"/></p>
            <div class="box-radio-type1">
                <c:forEach var="row" items="${optionList }">
                    {{if TEMP_YN == "Y"}}
                        <span class="form-radio radio-product-option temp">
                            <input type="radio" name="PRD_OPT_IDX_TMP_\${NUM}" value="<c:out value="${row.PRD_OPT_IDX }"/>"/><c:out value="${row.PRD_OPT_DTL }"/>
                        </span>
                    {{else}}
                        <span class="form-radio radio-product-option">
                            <input type="radio" name="PRD_OPT_IDX_\${NUM}" value="<c:out value="${row.PRD_OPT_IDX }"/>"/><c:out value="${row.PRD_OPT_DTL }"/>
                        </span>
                    {{/if}}
                </c:forEach>
            </div>
        </div>
        {{if TEMP_YN == "Y"}}</div>{{/if}}
    </script>
    <script id="productInfoTemplate" type="text/x-jquery-tmpl">
        <div class="contain-head">
            <p class="text-title-type2">사전 결제 안내</p>
        </div>
        <hr class="divline-type1" >
        <div class="contain-body">
            <div class="list-type1">
                <ul>
                    <li>선택하신 상품은 사전결제가 필요한 상품입니다. <br >지원혜택 제품가격 <span class="text-point2"><fmt:formatNumber value="${info.PRD_MST_ISTM_SPT_PAY}" type="number"/>원</span>에 대한 결제 진행</li>
                    <li>상조부금에서 <span class="text-point2"><fmt:formatNumber value="${info.PRD_MST_ISTM_SPT_PAY}" type="number"/>원</span> 할인</li>
                    <li>만기 시엔 결제하신 금액을 포함하여 납입 하신 <span class="text-point2"><fmt:formatNumber value="${info.PROD_AMT}" type="number"/>원</span> 전액 환급 확인 시 상품가입 페이지로 이동합니다.</li>
                </ul>
            </div>
            <div class="fixed-box-button">
                <span class="btn-type-text1 payment-confirm"><button>확인</button></span>
            </div>
        </div>
        <span class="btn-close"><button>닫기</button></span>
    </script>
    <script>
        $(function () {
            var prdMstNo = "<c:out value="${info.PRD_MST_NO}"/>",
                prdMstJoinLmt = StringUtil.getInt("<c:out value="${info.PRD_MST_JOIN_LMT}"/>", 1),
                prdMstOptYn = "<c:out value="${info.PRD_MST_OPT_YN }"/>",
                prdMstType = "<c:out value="${info.PRD_MST_TYPE}"/>",
                defaultParams = {PRD_MST_NO : prdMstNo};
            var $areaBody = $(".area-body"),
                $layerPopup = $(".layer-popup1"),
                $containInfo = $areaBody.find(".contain-product1"),
                $containOption = $areaBody.find(".contain-option"),
                $productOptionTempBox = $containInfo.find(".product-option-temp-box"),
                $productOptionBox = $containOption.find(".product-option-box");
            var $productOptionTemplate = $("#productOptionTemplate"),
                $productInfoTemplate = $("#productInfoTemplate");
            var productQnADataList;
            var $productQnABox = $areaBody.find(".product-qna-box")
                $productQnAtotalCount = $productQnABox.find(".list-total-count"),
                $productQnAAnswerCount = $productQnABox.find(".list-answer-count"),
                $productQnAListArea = $productQnABox.find(".list-area"),
                $productQnAPaginate = $productQnABox.find(".paginate"),
                $productQnAListTemplate = $("#productQnAListTemplate"),
                $productQnAAnswerTemplate = $("#productQnAAnswerTemplate");
            var $productReviewBox = $areaBody.find(".product-review-box")
                $productReviewListArea = $productReviewBox.find(".list-area"),
                $productReviewPaginate = $productReviewBox.find(".paginate"),
                $commentBoardListTemplate = $("#commentBoardListTemplate");
            <%-- SNS 공유 --%>
            $areaBody.on("click", ".call-sns-layer", function () {
                $.common.layer.sns();
            });
            <%-- 상품 Q&A 등록 버튼 클릭이벤트 --%>
            $areaBody.on("click", ".call-product-qna-form-layer", function () {
                $layerPopup.requestLayer($.action.product.qna.form.layer(), defaultParams);
                $.callback = function () {
                    requestProductQnAList(1);
                }
            });
            <%-- 상품 Q&A 검색(전체, 답변완료) 버튼 클릭 이벤트 --%>
            $productQnABox.on("click", ".call-list-search", function () {
                var $this = $(this),
                    $span = $this.closest(".btn-tab");
                $span.addClass("on");
                $span.siblings(".btn-tab").removeClass("on");
                requestProductQnAList(1);
            });
            <%-- 상품 Q&A 검색(나의 Q&A) 버튼 변경 이벤트 --%>
            $productQnABox.on("change", ".call-my-qna-list", function () {
                var $this = $(this);
                if ($this.is(":checked")) {
                    openQnALoginFormLayer (function () {
                        requestProductQnAList(1);
                    }, "Y");
                } else {
                    $.postSyncJsonAjax($.action.common.board.logout.ajax(), null, function (data) {
                        if (data.isSuccess) {
                            requestProductQnAList(1);
                        }
                    });
                }
            });
            <%-- 상품 Q&A 비공개 글 버튼 클릭 이벤트 --%>
            $productQnABox.on("click", ".private", function () {
                var $this = $(this);
                openQnALoginFormLayer (function (prdQnAMemNm, prdQnAMemPw) {
                    var params = {
                        searchPrdMstNo : defaultParams.PRD_MST_NO,
                        searchPrdQnAMemNm : prdQnAMemNm,
                        searchPrdQnAMemPw : prdQnAMemPw
                    };
                    $.postSyncJsonAjax($.action.product.qna.login.ajax(), params, function (data) {
                        if (data.isSuccess) {
                            var $span = $this.closest(".title"),
                                $dl = $span.closest(".box-qna");
                            var info = productQnADataList[$dl.data("index")];
                            $span.empty().html(StringUtil.replaceEnterToBr(info.PRD_QNA_CTS));
                            if (info.PRD_QNA_RPL_YN == "Y") {
                                $productQnAAnswerTemplate.tmpl({info : info}).appendTo($dl);
                            }
                        } else {
                            alert("이름 또는 비밀번호가 일치하지 않습니다.");
                        }
                    });
                }, "N");
            });
            <%-- 상품 Q&A 목록 호출 --%>
            requestProductQnAList = function (cPage) {
                var type = $productQnABox.find(".btn-tab").filter(".on").children("button.call-list-search").data("type"),
                    params = {
                        cPage : cPage,
                        searchPrdMstNo : defaultParams.PRD_MST_NO,
                        searchPrdQnARplYn : type == "answer" ? "Y" : ""
                    };
                $.postSyncJsonAjax($.action.product.qna.list.ajax(), params, function (data) {
                    data.type = type;
                    productQnADataList = data.list;
                    $productQnAtotalCount.text(StringUtil.setComma(data.totalCount));
                    $productQnAAnswerCount.text(StringUtil.setComma(data.answerCount));
                    $productQnAListArea.empty();
                    $productQnAListTemplate.tmpl(data).appendTo($productQnAListArea);
                    $productQnAPaginate.paging(data.paging, requestProductQnAList);
                });
            };
            <%-- 상품 Q&A 로그인 폼 레이어 열기 --%>
            openQnALoginFormLayer = function (callback, sessionYn) {
                var $loginFormLayer = $(".layer-popup2");
                $loginFormLayer.requestLayer($.action.common.login.form.layer(), {title : "문의 등록 시 입력한 정보를\n입력해 주세요.", sessionYn : sessionYn});
                $loginFormLayer.off("click", ".btn-layer-close").on("click", ".btn-layer-close", function () {
                    var $checkbox = $productQnABox.find(".call-my-qna-list");
                    $checkbox.removeClass("checked");
                    $checkbox.prop("checked", false);
                    $checkbox.closest(".form-checkbox").removeClass("checked");
                });
                $.callback = function (prdQnAMemNm, prdQnAMemPw) {
                    callback(prdQnAMemNm, prdQnAMemPw);
                }
            }
            <%-- 상품 리뷰 목록 호출 --%>
            requestProductReviewList = function (cPage) {
                var params = {
                    cPage : cPage,
                    searchPrdMstNo : defaultParams.PRD_MST_NO,
                    searchPrdRevBstYn : "N"
                };
                $.postSyncJsonAjax($.action.board.comment.list.ajax(), params, function (data) {
                    $productReviewListArea.empty();
                    $commentBoardListTemplate.tmpl(data).appendTo($productReviewListArea);
                    $productReviewPaginate.paging(data.paging, requestProductReviewList);
                });
            };
            <%-- 가입후기 더보기 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".call-list-layer", function () {
                var $this = $(this);
                var type = $this.data("type");
                if (type == "comment-board-best") {
                    $layerPopup.requestLayer($.action.board.comment.list.layer(), $.extend({searchPrdRevBstYn : "Y"}, defaultParams));
                }
            });
            <%-- 가입구좌 라디오 버튼 변경 이벤트 --%>
            $areaBody.on("click", ".radio-order-count", function () {
                var $this = $(this),
                    $span = $containInfo.find(".radio-order-count");
                if ($this.hasClass("temp")) {
                    $span = $containOption.find(".radio-order-count");
                }
                var $target = $span.eq($this.index());
                $span.removeClass("checked");
                $span.find("input[type='radio']").attr("checked", false);
                $target.addClass("checked")
                $target.find("input[type='radio']").attr("checked", true);
                var ordMstCnt = $this.find("input[type='radio']").val();
                setProductOption(ordMstCnt);
                toggleJoinButton();
            });
            <%-- 상품 옵션 라디오 버튼 변경 이벤트 --%>
            $areaBody.on("click", ".radio-product-option", function () {
                var $this = $(this),
                    $span = $productOptionTempBox.find(".box-inner");
                var index = $this.closest(".box-inner").index();
                if ($this.hasClass("temp")) {
                    $span = $productOptionBox.find(".box-inner");
                    index = $this.closest(".box-detail-product5").index();
                }
                var $productOption = $span.eq(index).find(".radio-product-option"),
                    $target = $productOption.eq($this.index());
                $productOption.removeClass("checked");
                $productOption.find("input[type='radio']").attr("checked", false);
                $target.addClass("checked")
                $target.find("input[type='radio']").attr("checked", true);
                toggleJoinButton();
            });
            <%-- 상품 옵션 추가/삭제 --%>
            function setProductOption (ordMstCnt) {
                if (prdMstOptYn == "Y") {
                    var optionCount = $productOptionBox.children(".box-inner").length;
                    if (ordMstCnt > optionCount && ordMstCnt <= prdMstJoinLmt) {
                        var optionTempArray = new Array();
                        var optionArray = new Array();
                        if (typeof(ordMstCnt) != "undefined") {
                            for (var i = optionCount; i < ordMstCnt; i++) {
                                optionTempArray.push($productOptionTemplate.tmpl({TEMP_YN : "Y", NUM : i + 1}));
                                optionArray.push($productOptionTemplate.tmpl({TEMP_YN : "N", NUM : i + 1}));
                            }
                        }
                        $productOptionTempBox.append(optionTempArray);
                        $productOptionBox.append(optionArray);
                        $areaBody.find(".button-join-contract").addClass("disabled");
                        radioBtn_Ck();
                    }
                    $productOptionTempBox.find(".box-detail-product5:gt(" + (ordMstCnt - 1) + ")").remove();
                    $productOptionBox.children(".box-inner:gt(" + (ordMstCnt - 1) + ")").remove();
                }
                toggleJoinButton();
            }
            <%-- 간편가입신청 버튼 활성화/비활성화 --%>
            function toggleJoinButton() {
                if (orderValid()) {
                    $areaBody.find(".button-join-contract").removeClass("disabled");
                } else {
                    $areaBody.find(".button-join-contract").addClass("disabled");
                }
            }
            <%-- 간편가입신청 유효성 검증 --%>
            function orderValid () {
                var valid = false,
                    ordMstCnt = StringUtil.getInt($containOption.find("input[name='ORD_MST_CNT']:checked").val(), 1);
                valid = $productOptionBox.find(".box-inner").length == $productOptionBox.find(".checked").length;
                if (valid) {
                    valid = ordMstCnt > 0 && ordMstCnt <= prdMstJoinLmt;
                }
                return valid;
            }
            <%-- 간편가입신청 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".button-join-contract", function () {
                var $this = $(this);
                if (orderValid() && !$this.hasClass("disabled")) {
                    if (prdMstType == "<c:out value="${Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }"/>") {
                        $(".layer-popup2").requestLayerByTemplate($productInfoTemplate.tmpl(), "infor1", function ($inner) {
                            $inner.off("click", ".payment-confirm").on("click", ".payment-confirm", function () {
                                redirectContractPage();
                            });
                        });
                    } else {
                        redirectContractPage();
                    }
                } else {
                    alert("옵션을 선택해 주세요");
                    $productOptionBox.find(".box-inner:first").find("input[type='radio']:first").focus();
                }
            });
            <%-- 간편가입신청 페이지 이동 --%>
            function redirectContractPage () {
                if (orderValid()) {
                    var params = new Object(),
                        ordMstCnt = StringUtil.getInt($containOption.find("input[name='ORD_MST_CNT']:checked").val(), 1);
                    if (prdMstOptYn == "Y") {
                        var prdOptIdxs = new Array();
                        $productOptionBox.find(".checked").each(function () {
                            prdOptIdxs.push($(this).find("input[type='radio']").val());
                        });
                        params.PRD_OPT_IDXs = prdOptIdxs;
                    }
                    params.ORD_MST_CNT = ordMstCnt;
                    $.requestPage($.action.contract.join.step1.form(), $.extend(params, defaultParams));
                }
            }
            requestProductQnAList(1);
            requestProductReviewList(1);
            toggleJoinButton();
        });
    </script>
    <script>
     var tabPos = $('.box-tab-head').offset().top - 50
     </script>
</body>
</html>