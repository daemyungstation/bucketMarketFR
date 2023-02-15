<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="area-navigation-global">
    <div class="area-inner">
        <div class="contain-category">
            <span class="btn-category"><button class="button-category">전체카테고리</button></span>
            <span class="btn-tag"><a href="javascript:$.requestPage($.action.display.product.list());">베스트</a></span>
            <span class="btn-link"><a href="javascript:$.requestPage($.action.marketing.plan.list());">기획전</a></span>
            <span class="btn-link"><a href="javascript:$.requestPage($.action.marketing.event.list());">이벤트</a></span>
            <span class="btn-link"><a href="javascript:$.requestPage($.action.display.curation.list());">#나만을 위한 추천</a></span>
            <span class="btn-tag"><a href="javascript:$.requestPage($.action.contents.introduction.view());">버킷마켓이란?</a></span>
        </div>
        <div class="box-search">
            <span class="btn-searchbox"><button>검색</button></span>
            <div class="article-search">
                <div class="contain-inner">
                    <div class="contain-search">
                        <input type="text" class="searchword" placeholder="검색어를 입력해 주세요" value="<c:out value="${param.searchword }"/>" maxlength="70"/>
                        <span class="btn-search"><button>검색</button></span>
                    </div>
                    <c:if test="${not empty commonKeywordList }">
                        <div class="contain-favword">
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
            </div>
        </div>
        <div class="contain-myinfor">
            <div class="box-planner">
                <span class="detail-planner"><button onclick="javascript:$.requestPage($.action.mycontract.info.list.view());">MY계약</button></span>
                <div class="detail-planner-links">
                    <ul>
                        <c:if test="${isUserLogin eq true }">
                            <li><a href="javascript:;" id="btnMyContractLogout">로그아웃</a></li>
                        </c:if>
                        <li><a href="javascript:$.requestPage($.action.mycontract.info.list.view());">가입내역 조회</a></li>
                        <li><a href="javascript:$.requestPage($.action.mycontract.paymentrefund.list.view());">납입/환급금 조회</a></li>
                        <!-- <li><a href="javascript:$.requestPage($.action.mycontract.shipping.list.view());">배송/지원혜택 조회</a></li> -->
                        <li><a href="javascript:$.requestPage($.action.mycontract.paymentmethod.list.view());">결제수단변경 신청</a></li>
                        <li><a href="javascript:$.requestPage($.action.mycontract.membership.list.view());">멤버십 카드 조회</a></li>
                        <li><a href="javascript:$.requestPage($.action.mycontract.lifeservice.list.view());">라이프서비스 신청</a></li>
                    </ul>
                </div>
            </div>
            <!-- 
            <div class="box-infor">
                <div class="box-detail">
                
                    <%-- 로그인 전 --%>
                    <c:if test="${isPlannerLogin ne true }">
                        <span class="name"><button onclick="javascript:$.requestPage($.action.myplanner.main.view());">레디플래너</button></span>
                    </c:if>
                    
                    <%-- 로그인 후 --%>
                    <c:if test="${isPlannerLogin eq true }">
                        <span class="photo">
                            <c:choose>
                                <c:when test="${not empty SessionsPlanner.RDP_MST_PROFILE_IMAGE }">
                                    <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${SessionsPlanner.RDP_MST_PROFILE_IMAGE }"/>" 
                                         onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                                         alt="프로필사진">
                                </c:when>
                                <c:when test="${empty SessionsPlanner.RDP_MST_PROFILE_IMAGE }">
                                    <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile.png" alt="프로필사진">
                                </c:when>
                            </c:choose>
                        </span>
                        <span class="name">
                            <button>레디플래너, <i><c:out value="${SessionsPlanner.RDP_MST_MEM_NM }"/></i></button>
                        </span>
                    </c:if>
                </div>
                <div class="box-detail-links">
                    <ul>
                        <c:if test="${isPlannerLogin eq true }">
                            <li><a href="javascript:;" id="btnMyPlannerLogout">로그아웃</a></li>
                        </c:if>
                        <li><a href="javascript:$.requestPage($.action.myplanner.introduce.view());">레디플래너 소개</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.application.guide.view());">이용가이드</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.use.term.view());">이용약관</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.manage.term.view());">운영정책</a></li>
                        <li><a href="javascript:$.requestPage($.action.board.faq.list(), {searchBrdCmnComIdx : '<c:out value="${Code.QUESTION_TYPE_PLANNER }"/>'});">레디플래너 FAQ</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.campaign.product.list());">캠페인 생성</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.performance.view());">리워드 실적조회</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.payment.view());">리워드 지급내역</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.community.list());">커뮤니티</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.profile.edit());">프로필 관리</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.notice.list());">공지사항</a></li>
                    </ul>
                </div>
            </div>
            -->
            <c:if test="${isPlannerLogin eq true }">
            <div class="box-infor">
                <div class="box-detail">
                    <span class="photo">
                        <c:choose>
                            <c:when test="${not empty SessionsPlanner.RDP_MST_PROFILE_IMAGE }">
                                <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${SessionsPlanner.RDP_MST_PROFILE_IMAGE }"/>" 
                                     onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                                     alt="프로필사진">
                            </c:when>
                            <c:when test="${empty SessionsPlanner.RDP_MST_PROFILE_IMAGE }">
                                <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc/images/img_profile.png" alt="프로필사진">
                            </c:when>
                        </c:choose>
                    </span>
                    <span class="name">
                        <button>레디플래너, <i><c:out value="${SessionsPlanner.RDP_MST_MEM_NM }"/></i></button>
                    </span>
                </div>
                <div class="box-detail-links">
                    <ul>
                        <c:if test="${isPlannerLogin eq true }">
                            <li><a href="javascript:;" id="btnMyPlannerLogout">로그아웃</a></li>
                        </c:if>
                        <li><a href="javascript:$.requestPage($.action.myplanner.introduce.view());">레디플래너 소개</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.application.guide.view());">이용가이드</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.use.term.view());">이용약관</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.manage.term.view());">운영정책</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.campaign.product.list());">캠페인 생성</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.performance.view());">실적현황조회</a></li>
                        <li><a href="javascript:$.requestPage($.action.board.faq.list(), {searchBrdCmnComIdx : '<c:out value="${Code.QUESTION_TYPE_PLANNER }"/>'});">레디플래너 FAQ</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.community.list());">커뮤니티</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.profile.edit());">프로필 관리</a></li>
                        <li><a href="javascript:$.requestPage($.action.myplanner.notice.list());">공지사항</a></li>
                    </ul>
                </div>
            </div>
            </c:if>
        </div>
    </div>
</section>
<div class="area-category">
    <div class="area-inner category-area">
    </div>
</div>
<script>
    $(function () {
        var $gnb = $(".area-navigation-global");
        // 로그아웃
        $gnb.on("click", "#btnMyPlannerLogout", function() {
            if (confirm("로그아웃 하시겠습니까?")) {
                alert("로그아웃 되었습니다.");
                $.requestPage($.action.planner.logout());
            }
        });
        $gnb.on("click", "#btnMyContractLogout", function() {
            if (confirm("로그아웃 하시겠습니까?")) {
                alert("로그아웃 되었습니다.");
                $.requestPage($.action.mycontract.logout());
            }
        });
    });
</script>