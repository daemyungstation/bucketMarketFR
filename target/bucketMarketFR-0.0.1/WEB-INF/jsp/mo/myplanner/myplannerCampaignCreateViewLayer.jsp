<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="layer-inner">
    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">캠페인 생성</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    
    <input type="hidden" id="PRD_MST_RDP_TXT" value="<c:out value="${info.PRD_MST_RDP_TXT }"/>">

    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">
            <!-- 팝업본문 -->
            <div class="content-rdmember-layer02">
            <div class="box-campaign-product">
                <dl class="detail-product-type1 type2">
                    <dd class="image">
                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png"
                             onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'"
                             alt="">                           
                    </dd>
                    <dt>
                        <span class="catchphrase2"><c:out value="${info.PRD_MST_NM }"/></span>
                        <span class="reward">리워드 : <strong class="text-point2"><fmt:formatNumber value="${info.PRD_MST_RDP_CMS }" type="number"/>원</strong></span>
                        <span class="reward-count">(<fmt:formatNumber value="${info.PRD_MST_RDP_DVD_PAY }" type="number"/>원 * <c:out value="${info.PRD_MST_RDP_DVD_CNT }"/>회)</span>
                    </dt>
                </dl>
                <div class="box-sns-share">
                    <span class="sns-kakaotalk common-sns-share" data-type="sns-kakaotalk"><button>카카오톡</button></span>
                    <span class="sns-kakaostory common-sns-share" data-type="sns-kakaostory"><button>카카오스토리</button></span>
                    <span class="sns-twitter common-sns-share" data-type="sns-twitter"><button>트위터</button></span>
                    <span class="sns-blog common-sns-share" data-type="sns-blog"><button>네이버블로그</button></span>
                    <span class="sns-facebook common-sns-share" data-type="sns-facebook"><button>페이스북</button></span>
                </div>
            </div>

            <hr class="divline-type2">

            <div class="box-campaign-url">
                <h2 class="title">캠페인 단축URL</h2>
                <p class="text-normal-type1">캠페인 단축URL을 복사하여 나만의 홍보 방식으로 활용하세요.</p>
                <p class="url"><c:out value="${info.CAMPAIGN_SHORTEN_URL }"/></p>
                <span class="btn-type-text4"><button class="url-copy" data-clipboard-text="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>">복사</button></span>
            </div>

            <hr class="divline-type2">

            <div class="box-campaign-url">
                <h2 class="title">캠페인 배너</h2>
                <p class="text-normal-type1">다양한 크기에 캠페인 배너로 블로그나 SNS에 홍보하세요.</p>

            <!-- campaign-tab -->
            <div class="box-campaign-tab">
                <div class="box-tab-head">
                    <span class="on"><button>큰 배너</button></span>
                    <span><button>카드 배너</button></span>
                    <span><button>리스트배너</button></span>
                </div>

                <div class="box-tab-body tab1 on">
                    <!-- 큰배너 -->
                    <div class="campaign-tab-inner">
                        <div class="box-inner">    
                            <div class="box-campaign">
                                <h3 class="title">미리보기</h3>
                                <dl class="detail-product-type1">
                                    <dd class="image">
                                        <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png"
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'"
                                                 alt=""> 
                                        </a>
                                    </dd>
                                    <dt>
                                        <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                            <span class="catchphrase"><c:out value="${info.PRD_MST_NM }"/></span>
                                            <span class="content"><c:out value="${fn:replace(info.PRD_MST_RDP_TXT, newLineChar, '<br/>')}" escapeXml="false"/></span>
                                        </a>
                                    </dt>
                                </dl>
                            </div>
                            
                            <h3 class="title">큰 배너 HTML</h3>
                            <p class="url2"><span class="btn-url-guide"><button class="bannerGuide">html 배너 등록 가이드</button></span>를 확인하세요.</p>
                            <span class="box-content" id="copyBigBannerHtml">
                            <!-- 큰 배너-url -->
                            <!-- // 큰배너-url -->
                            </span>
<%-- 큰 배너 --%>
<textarea id="copyBigBanner" style="display: none;">
<div style="display:block; width:100%; text-decoration: none; margin: 10px auto; overflow: hidden;">
    <dl style="width:100%; margin:0px">
        <dd style="margin: 0 0 10px 0; width:100%; text-align: left; display: block;">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration: none;">
                <img src="<spring:eval expression="@resource['mobile.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png" 
                     alt="" 
                     style="margin:0; padding:0; text-align: left; width:100%; height:auto; border: 1px solid #e1e1e1; box-sizing: border-box;">
            </a>
        </dd>
        <dt style="text-align:left;">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration: none;">
                <span style="display:block; width:95%; font-size:14px; font-weight:700; color: #222; margin-bottom:5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"><c:out value="${info.PRD_MST_NM }"/></span> 
                <span style="font-size: 13px; color: #222;"><c:out value="${fn:replace(info.PRD_MST_RDP_TXT, newLineChar, '<br/>')}" escapeXml="false"/></span>
            </a>
        </dt>
    </dl>
</div>
</textarea>
<%-- // 큰 배너 --%>
                            <span class="btn-type-text4"><button class="btn-copy" data-clipboard-target="#copyBigBanner">복사</button></span>
                        </div>
                    </div>
                    <!-- //큰배너 -->
                </div>

                <div class="box-tab-body tab2">
                    <!-- 카드 배너 -->
                    <div class="campaign-tab-inner">
                        <div class="box-inner">
                            
                            <div class="box-campaign type2">
                                <h3 class="title">미리보기</h3>
                                <dl class="detail-product-type1">
                                    <dd class="image">
                                        <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                            <img src="<spring:eval expression="@resource['mobile.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png"
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'"
                                                 alt="">
                                        </a>
                                    </dd>
                                    <dt><a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                        <span class="catchphrase"><c:out value="${info.PRD_MST_NM }"/></span></a>
                                    </dt>
                                </dl>
                                <dl class="detail-product-type1">
                                    <dd class="image">
                                        <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                            <img src="<spring:eval expression="@resource['mobile.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png"
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'"
                                                 alt="">
                                        </a>
                                    </dd>
                                    <dt><a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                        <span class="catchphrase"><c:out value="${info.PRD_MST_NM }"/></span></a>
                                    </dt>
                                </dl>
                            </div>

                            <h3 class="title">카드 배너 HTML</h3>
                            <p class="url2"><span class="btn-url-guide"><button class="bannerGuide">html 배너 등록 가이드</button></span>를 확인하세요.</p>
                            <span class="box-content" id="copyCardBannerHtml">
                            <!-- 카드배너-url -->
                            <!-- //카드배너-url -->
                            </span>
<%-- 카드 배너 --%>
<textarea id="copyCardBanner" style="display: none;">
<div style="display:block; width:100%; min-width:158px; text-decoration: none; margin: 10px auto; overflow: hidden;">
    <dl style="float: left; width: 158px; margin:0px">
        <dd style="margin: 0 0 10px 0;">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration: none;">
                <img src="<spring:eval expression="@resource['mobile.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png" 
                     alt="" 
                     style="width:100%; height: auto; border: 1px solid #e1e1e1; box-sizing: border-box;">
            </a>
        </dd>
        <dt style="text-align:left;">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration: none;">
                <span style="display:block; width:90%; font-size:14px; font-weight:700; color: #222; margin-bottom:5px; overflow: hidden; text-overflow: ellipsis; height: 40px; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2; line-height:1.4;"><c:out value="${info.PRD_MST_NM }"/></span>
            </a>
        </dt>
    </dl>
</div>
</textarea>
<%-- 카드 배너 --%>
                            <span class="btn-type-text4"><button class="btn-copy" data-clipboard-target="#copyCardBanner">복사</button></span>
                        </div>
                    </div>
                    <!-- //카드 배너 -->
                </div>

                <div class="box-tab-body tab3">
                    <!-- 리스트배너 -->
                    <div class="campaign-tab-inner">
                        <div class="box-inner">
                            
                            <div class="box-campaign type3">
                                <h3 class="title">미리보기</h3>
                                <dl class="detail-product-type1">
                                    <dd class="image">
                                        <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png"
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'"
                                                 alt=""> 
                                        </a>
                                    </dd>
                                    <dt>
                                        <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                            <span class="catchphrase"><c:out value="${info.PRD_MST_NM }"/></span>
                                            <span class="content"><c:out value="${fn:replace(info.PRD_MST_RDP_TXT, newLineChar, '<br/>')}" escapeXml="false"/></span>
                                        </a>
                                    </dt>
                                </dl>
                                <dl class="detail-product-type1">
                                    <dd class="image">
                                        <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png"
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'"
                                                 alt=""> 
                                        </a>
                                    </dd>
                                    <dt>
                                        <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                            <span class="catchphrase"><c:out value="${info.PRD_MST_NM }"/></span>
                                            <span class="content"><c:out value="${fn:replace(info.PRD_MST_RDP_TXT, newLineChar, '<br/>')}" escapeXml="false"/></span>
                                        </a>
                                    </dt>
                                </dl>
                            </div>

                            <h3 class="title">리스트 배너 HTML </h3>
                            <p class="url2"><span class="btn-url-guide"><button class="bannerGuide">html 배너 등록 가이드</button></span>를 확인하세요.</p>
                            <span class="box-content" id="copyListBannerHtml">                            
                                <!-- //리스트배너-url -->
                                <!-- //리스트배너-url -->
                            </span>
<%-- 리스트 배너 --%>
<textarea id="copyListBanner" style="display: none;">
<div style="display:block; width: 100%; text-decoration: none; overflow: hidden;">
    <dl style="margin:0px;">
        <dd style="float:left; width:100px; height:100px; margin:0 10px 0 0;">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration: none;">
                <img src="<spring:eval expression="@resource['mobile.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png" 
                     alt="" 
                     style="width:100%; height: auto; border: 1px solid #e1e1e1; box-sizing: border-box;">
            </a>
        </dd>
        <dt style="float: left; width: calc(100% - 115px); margin-bottom: 8px;">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration: none;">
                <span style="display:block; width:95%; font-size:14px; font-weight:700; color: #222; margin: 12px 0 5px 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                    <c:out value="${info.PRD_MST_NM }"/>
                </span>
                <span style="display:block; font-size: 13px; overflow: hidden; text-overflow: ellipsis; width:95%; max-height: 39px; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2; line-height:1.4; color: #222;">
                    <c:out value="${fn:replace(info.PRD_MST_RDP_TXT, newLineChar, '<br/>')}" escapeXml="false"/>
                </span>
            </a>
        </dt>
    </dl>
</div>
</textarea>
<%-- 리스트 배너 --%>
                            <span class="btn-type-text4"><button class="btn-copy" data-clipboard-target="#copyListBanner">복사</button></span>
                        </div>
                    </div>
                    <!-- //리스트배너 -->
                </div>
                
            </div>
            <!-- //campaign-tab -->
            </div>
            
            </div>
            <!-- //팝업본문 -->                

        </div>
    </div>
    <!-- //본문 -->
</div>

<script>
$(function () {
    var $layerPopup = $(".layer-popup1");
    // 탭
    $layerPopup.off("click", ".box-tab-head button").on("click", ".box-tab-head button", function(){
        tabType1($(this));
    });
    // 텍스트
    $("#copyBigBannerHtml").text($("#copyBigBanner").text());
    $("#copyCardBannerHtml").text($("#copyCardBanner").text());
    $("#copyListBannerHtml").text($("#copyListBanner").text());
    // 공유하기 초기화
    Kakao.init("<spring:eval expression="@resource['kakao.api.javascript.key']"/>");
    // 공유하기
    var resources = new Object();
    resources["site_name"] = "<spring:eval expression="@resource['project.title']"/>";
    resources["url"] = "<c:out value="${info.CAMPAIGN_URL }"/>";
    resources["type"] = "article";
    resources["title"] = "<c:out value="${info.PRD_MST_NM }"/>";
    resources["description"] = $layerPopup.find("#PRD_MST_RDP_TXT").val();
    resources["image"] = "<spring:eval expression="@resource['mobile.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png";
    resources["image_width"] = "750";
    resources["image_height"] = "750";
    var snsShare = new SnsShare({
        resources : resources,
        kakao : {
            talk : {
                container : ".sns-kakaotalk"
            }
        }
    });
    $layerPopup.off("click", ".common-sns-share").on("click", ".common-sns-share", function () {
        snsShare.share($(this).data("type"));
    });
    // 배너 가이드
    $layerPopup.off("click", ".bannerGuide").on("click", ".bannerGuide", function() {
        $("#layerBannerGuide").addClass("active");
        posPopup();
    });
});
</script>