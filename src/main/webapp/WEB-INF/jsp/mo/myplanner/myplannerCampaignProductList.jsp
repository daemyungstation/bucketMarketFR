<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/myplanner.css">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|title-btn|search"/>
    <jsp:param name="headerTitle" value="캠페인 생성"/>
</jsp:include>
<!-- //헤더 -->
<!-- 카테고리 -->
<jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
    <jsp:param name="navGroup" value="myplanner"/>
</jsp:include>
<!-- //카테고리 -->

<!-- 본문 -->
<div class="area-content"> <!-- 하단 탭바일때 aside-tabbar 클래스 추가 -->
    <div class="area-inner">

        <div class="contain-campaign">    
        
            <div class="box-campaign-search">
                <h2 class="title">상품검색</h2>
                <span class="form-select">
                    <select id="searchCategoryIdx">
                        <option value="">전체</option>
                        <c:forEach var="category" items="${categoryList }" varStatus="status">
                            <option value="<c:out value="${category.PRD_CTG_IDX }"/>" <c:if test="${commandMap.searchCategoryIdx eq category.PRD_CTG_IDX}">selected="selected"</c:if> >
                                <c:out value="${category.PRD_CTG_NM }"/>
                            </option>
                        </c:forEach>
                    </select>
                </span>
                <div class="box-campaign-form">                
                    <input type="text" id="searchPrdMstNm" placeholder="찾고 싶은 상품을 검색해 보세요" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <span class="btn-search"><button type="button" id="btnSearch">검색</button></span>
                </div>
            </div>
    
            <div class="box-product-search">
                <span class="data-count"><c:out value="${totalCount }"/>개</span>
                <div class="box-category-more">
                    <!-- 인기순(디폴트), 판매순, 최근등록순 -->
                    <c:choose>
                        <c:when test="${commandMap.searchOrderType eq 'bySales' }">
                            <button class="btn-category">판매순</button>
                            <div class="box-category-inner">
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="bySuggest">추천순</label></span>
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="byPopularity">인기순</label></span>
                                <span><label class="form-radio-category checked"><input type="radio" name="searchOrderType" value="bySales" checked="checked">판매순</label></span>
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="byRecently">최근등록순</label></span>
                            </div>
                        </c:when>
                        <c:when test="${commandMap.searchOrderType eq 'byRecently' }">
                            <button class="btn-category">최근등록순</button>
                            <div class="box-category-inner">
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="bySuggest">추천순</label></span>
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="byPopularity">인기순</label></span>
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="bySales">판매순</label></span>
                                <span><label class="form-radio-category checked"><input type="radio" name="searchOrderType" value="byRecently" checked="checked">최근등록순</label></span>
                            </div>
                        </c:when>
                       <c:when test="${commandMap.searchOrderType eq 'byPopularity' }">
                            <button class="btn-category">인기순</button>
                            <div class="box-category-inner">
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="bySuggest">추천순</label></span>
                                <span><label class="form-radio-category checked"><input type="radio" name="searchOrderType" value="byPopularity" checked="checked">인기순</label></span>
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="bySales">판매순</label></span>
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="byRecently">최근등록순</label></span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <button class="btn-category">추천순</button>
                            <div class="box-category-inner">
                                <span><label class="form-radio-category checked"><input type="radio" name="searchOrderType" value="bySuggest"  checked="checked">추천순</label></span>
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="byPopularity">인기순</label></span>
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="bySales">판매순</label></span>
                                <span><label class="form-radio-category"><input type="radio" name="searchOrderType" value="byRecently">최근등록순</label></span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>         
            </div>
    
            <!-- 페이지당 20개 출력 -->
            <div class="box-store-list">
                <dl class="detail-product-type1 type2" style="margin-bottom:0;">
                    <dd class="btn-main-campaign-text">버킷마켓 홈페이지</dd>
                    <dd class="btn-main-campaign btn-main <c:if test="${planner.RDP_MST_STATE ne Code.PLANNER_STATE_ACTIVE }">disabled</c:if>" style="margin-top:0;margin-bottom:0;">
                        <button type="button" class="createMain">캠페인 생성</button>
                    </dd>
                </dl>
                <dl class="detail-product-type1 type2">
                    <dd class="btn-main-campaign-text">버킷마켓 소개 페이지</dd>
                    <dd class="btn-main-campaign btn-intro <c:if test="${planner.RDP_MST_STATE ne Code.PLANNER_STATE_ACTIVE }">disabled</c:if>" style="margin-top:0;">
                        <button type="button" class="createMain">캠페인 생성</button>
                    </dd>
                </dl>
                <%-- 상품 목록 --%>
                <c:forEach var="item" items="${list }" varStatus="status">
                    <a href="javascript:;" class="detail" data-prdMstNo="<c:out value="${item.PRD_MST_NO }"/>" >
                        <dl class="detail-product-type1 type2">
                            <dd class="image">
                                <c:if test="${item.PRD_MST_DPL_YN eq 'S' }">
                                    <span class="soldout"><span>SOLD OUT</span></span>
                                </c:if>
                                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${item.PRD_MST_CD }"/>/m_750.png" 
                                     onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'"
                                     alt="">                        
                            </dd>
                            <dt class="<c:if test="${item.PRD_MST_PRP_YN eq 'Y' }">product-prp-parent</c:if>">
                                <span class="catchphrase2"><c:out value="${item.PRD_MST_NM }"/></span>
                                <c:if test="${item.PRD_MST_PRP_YN eq 'Y' }">
                                <span class="product-prp-text" >전용상품</span>
                                </c:if>
                                <%-- <span class="reward">리워드 : <fmt:formatNumber value="${item.PRD_MST_RDP_CMS }" type="number"/>원</span> --%>
                            </dt>
                            <%-- 자격 정지 일 때, 버튼 선택 불가 --%>
                            <dd class="btn-campaign <c:if test="${planner.RDP_MST_STATE ne Code.PLANNER_STATE_ACTIVE }">disabled</c:if>">
                                <button type="button" class="create" data-prdMstNo="<c:out value="${item.PRD_MST_NO }"/>">캠페인 생성</button>
                            </dd>
                        </dl>
                    </a>
                </c:forEach>
                
            </div>
            
            <%--상품 없음 --%>
            <c:if test="${empty list }">
                <p class="text-empty-data">상품을 준비중입니다.</p>
            </c:if>
            
            <%-- 페이징 --%>
            <div class="paginate">
                <ui:paging paging="${paging }" jsFunction="paging"/>
            </div>
            <%-- //페이징 --%>
    
        </div>

    </div>
</div>
<!-- //본문 -->

<%-- 앱 푸시 --%>
<c:if test="${not empty planner.RDP_MST_IDX }">

    <script type="text/javascript">
        $(document).ready(function(){
            
            var ua = navigator.userAgent;
            if (ua.indexOf("bucketmarketApp") > -1) {
                if ($.resources.isAndroid) {
                    bucketmarketApp.setIdentity("<c:out value="${planner.RDP_MST_NO }"/>");
                    bucketmarketApp.setTag("planner");
                } else if ($.resources.isIos) {
                    window.webkit.messageHandlers.setIdentity.postMessage("<c:out value="${planner.RDP_MST_NO }"/>");
                    window.webkit.messageHandlers.setTag.postMessage("planner");
                }
            };
        });
    </script>
    
</c:if>
<c:if test="${ empty planner.RDP_MST_IDX }">

    <script type="text/javascript">
        $(document).ready(function(){
            
            var ua = navigator.userAgent;
            if (ua.indexOf("bucketmarketApp") > -1) {
                if ($.resources.isAndroid) {
                    bucketmarketApp.removeIdentity();
                } else if ($.resources.isIos) {
                    window.webkit.messageHandlers.removeIdentity.postMessage("");
                }
            };
        });
    </script>
    
</c:if>
<%-- // 앱 푸시 --%>

<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>

<%-- 배너 등록 가이드 --%>
<div class="layer-popup2 layer-url-guide" id="layerBannerGuide">
    <div class="layer-inner">
        <div class="contain-head">
            <p class="text-title-type2">HTML 배너 등록 가이드</p>
        </div>
        <hr class="divline-type1">
        <div class="contain-body">            
            <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_url_guide.png" alt="HTML 배너 등록 가이드">
        </div>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</div>
<%-- // 배너 등록 가이드 --%>

<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>

<script>
    $(function () {
        var $areaContent = $(".area-content");
        // 목록 조회 - 페이징
        paging = function (cPage) {
            var params = { 
                cPage : cPage,
                searchPrdMstNm : "<c:out value="${commandMap.searchPrdMstNm }"/>",
                searchCategoryIdx : "<c:out value="${commandMap.searchCategoryIdx }"/>",
                searchOrderType : "<c:out value="${commandMap.searchOrderType }"/>"
            };
            $.requestPage($.action.myplanner.campaign.product.list(), params);
        };
        // 조회
        $areaContent.on("change", "#searchCategoryIdx", function() {
            search();
        });
        $areaContent.on("click", "#btnSearch, input[name='searchOrderType']", function() {
            search();
        });
        /* // 상세
        $areaContent.on("click", "a.detail", function () {
            $.requestPage($.action.product.basic.view(), { PRD_MST_NO : $(this).attr("data-prdMstNo") } );
        }); */
        // 캠페인 생성
        $areaContent.on("click", "button.create", function (e) {
            e.stopPropagation();
            if ($(this).parent("dd.btn-campaign").hasClass("disabled") == false) {
                $(".layer-popup1").requestLayer($.action.myplanner.campaign.create.view.layer(), { PRD_MST_NO : $(this).attr("data-prdMstNo") } );
            }
        });
        // 메인 캠페인 생성
        $areaContent.on("click", ".btn-main-campaign.btn-main", function (e) {
            e.stopPropagation();
            if ($(this).parent("dd.btn-main-campaign.btn-main").hasClass("disabled") == false) {
                $(".layer-popup1").requestLayer($.action.myplanner.campaign.create.main.view.layer(), { } );
            }
        });   
        // 소개 캠페인 생성
        $areaContent.on("click", ".btn-main-campaign.btn-intro", function (e) {
            e.stopPropagation();
            if ($(this).parent("dd.btn-main-campaign.btn-intro").hasClass("disabled") == false) {
                $(".layer-popup1").requestLayer($.action.myplanner.campaign.create.intro.view.layer(), { } );
            }
        }); 
        // 검색
        function search() {
            var params = {
                cPage : 1,
                searchPrdMstNm : $areaContent.find("#searchPrdMstNm").val(),
                searchCategoryIdx : $areaContent.find("#searchCategoryIdx").val(),
                searchOrderType : $areaContent.find("input[name='searchOrderType']:checked").val()
            };
            $.requestPage($.action.myplanner.campaign.product.list(), params);
        }
        // 클립보드로 복사
        new ClipboardJS(".btn-copy", {
            text : function(trigger) {
                return $($(trigger).attr("data-clipboard-target")).text();
            }
        }).on("success", function(e) {
            alert("복사되었습니다. 홍보할 곳에 붙여넣기 해주세요.");
        });
        new ClipboardJS(".url-copy").on("success", function(e) {
            alert("복사되었습니다. 홍보할 곳에 붙여넣기 해주세요.");
        });
    });
</script>

</body>
</html>