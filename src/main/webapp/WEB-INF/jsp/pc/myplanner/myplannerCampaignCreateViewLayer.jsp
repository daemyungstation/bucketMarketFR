<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">캠페인 생성</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    
    <input type="hidden" id="PRD_MST_RDP_TXT" value="<c:out value="${info.PRD_MST_RDP_TXT }"/>">
    <input type="hidden" id="PRD_MST_NO" value="<c:out value="${commandMap.PRD_MST_NO }"/>">
    
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">
    
        <!-- 팝업본문 -->
        <div class="content-rdmember-layer02">
    
            <div class="box-campaign-product">
                <dl class="detail-product-type1 type2">
                    <dd class="image">
                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png"
                             onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                             alt="">          
                    </dd>
                    <dt>
                        <span class="catchphrase2"><c:out value="${info.PRD_MST_NM }"/></span>
                        <%-- 
                        <span class="reward">리워드 : <strong class="text-point2"><fmt:formatNumber value="${info.PRD_MST_RDP_CMS }" type="number"/>원</strong></span>
                        <span class="reward-count">(<fmt:formatNumber value="${info.PRD_MST_RDP_DVD_PAY }" type="number"/>원 * <c:out value="${info.PRD_MST_RDP_DVD_CNT }"/>회)</span>
                        --%>
                        <span class="reward">리워드 : <strong class="text-point2">별도안내</strong></span>
                    </dt>
                </dl>
                <!-- <div class="box-sns-share">
                    <span class="sns-kakaotalk common-sns-share" data-type="sns-kakaotalk"><button>카카오톡</button></span>
                    <span class="sns-kakaostory common-sns-share" data-type="sns-kakaostory"><button>카카오스토리</button></span>
                    <span class="sns-twitter common-sns-share" data-type="sns-twitter"><button>트위터</button></span>
                    <span class="sns-blog common-sns-share" data-type="sns-blog"><button>네이버블로그</button></span>
                    <span class="sns-facebook common-sns-share" data-type="sns-facebook"><button>페이스북</button></span>
                </div> -->
            </div>
    
            <%-- <hr class="divline-type2">
    
            <div class="box-campaign-url">
                <h2 class="title">캠페인 단축URL</h2>
                <p class="text-normal-type1">캠페인 단축URL을 복사하여 나만의 홍보 방식으로 활용하세요.</p>
                <p class="url"><c:out value="${info.CAMPAIGN_SHORTEN_URL }"/></p>
                <span class="btn-type-text4"><button class="url-copy" data-clipboard-text="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>">복사</button></span>
            </div> --%>
            
            <div class="box-campaign-url" id="kakao-url">
                <div class="readyplannerImg1">
                    <img src="<spring:eval expression="@resource['mobile.ssl.domain']"/>/resources/mo/images/readyPlanner_top.png"
                             onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                             alt="">
                </div>
                <div class="readyplannerImg2">
                    <div class="readyPlanner-method1">
                        <div class="inner-readyPlanner-method1">
                            <img src="<spring:eval expression="@resource['mobile.ssl.domain']"/>/resources/mo/images/readyPlanner1.png"
                             onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                             alt="">
                            <div class="box-sns-share2 ">
                                <span class="sns-kakaotalk common-sns-share" data-type="sns-kakaotalk"><button></button></span>
                                <span class="sns-kakaostory common-sns-share" data-type="sns-kakaostory"><button></button></span>
                                <span class="sns-twitter common-sns-share" data-type="sns-twitter"><button></button></span>
                                <span class="sns-blog common-sns-share" data-type="sns-blog"><button></button></span>
                                <span class="sns-facebook common-sns-share" data-type="sns-facebook"><button></button></span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class= "readyPlanner-hr">
                </div>
                <div class="readyplannerImg3">
                     <div class="readyPlanner-method2">
                        <div class="inner-readyPlanner-method2">
                            <img src="<spring:eval expression="@resource['mobile.ssl.domain']"/>/resources/mo/images/readyPlanner2.png"
                             onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                             alt="">
                            <div class="readyplannerImg4">
                                <p class="url-new"><c:out value="${info.CAMPAIGN_SHORTEN_URL }"/></p>
                            </div>
                            <div class="inner-readyPlanner-copy" style="margin-top: 4%; text-align: center;">
                                <button class="url-copy" data-clipboard-text="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>">
                                    <img src="<spring:eval expression="@resource['mobile.ssl.domain']"/>/resources/mo/images/readyPlanner_copyButton.png"
                                     onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                                     alt="" style="width: 100%">
                                </button>
                            </div>
                            <p class="seller-url"><span class="url-new sellerShortUrl btn-seller-short-url"><button class="sellerShortUrl url-new">※ 복수 레디플래너 캠페인 URL 생성
                            </button></span></p>
                            <span class="text-point3">복수 URL이 필요한 경우 클릭해주세요. (영업채널용)</span>
                        </div>
                    </div>
                </div>
            </div>
    
            <hr class="divline-type2">
    
            <div class="box-campaign-url">
                <!-- campaign-tab -->
                <div class="sub-tab-head">
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
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
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
                                </a>
                            </div>
                            
                            <h3 class="title">큰 배너 HTML</h3>
                            <p class="url2"><span class="btn-url-guide"><button class="bannerGuide">html 배너 등록 가이드</button></span>를 확인하세요.</p>
                            <span class="box-content" id="copyBigBannerHtml">
                            <!-- 큰배너-url -->
                            <!-- //큰배너-url -->
                            </span>

<%-- 큰 배너 --%>
<textarea id="copyBigBanner" style="display: none;">
<div style="display:block; width:100%; margin: 10px auto; overflow: hidden;">
    <dl style="width:100%; margin:0px">
        <dt style="margin: 0 0 10px 0; width:100%; text-align: left; display: block;">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration: none;">
                <img src="<spring:eval expression="@resource['front.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png" 
                     alt="" 
                     style="margin:0; padding:0; text-align: left; width:100%; height: auto; border: 1px solid #e1e1e1; box-sizing: border-box;">
            </a>
        </dt>
        <dd style="text-align:left; margin:0px;">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration: none;">
                <span style="display:block; font-size:18px; font-weight:700; color: #222; margin-bottom:5px; width:95%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
                    <c:out value="${info.PRD_MST_NM }"/>
                </span> 
                <span style="font-size: 16px; color: #222;">
                    <c:out value="${fn:replace(info.PRD_MST_RDP_TXT, newLineChar, '<br/>')}" escapeXml="false"/>
                </span>
            </a>
        </dd>
    </dl>
</div>
</textarea>
<%-- 큰 배너 --%>

                            <span class="btn-type-text4"><button class="btn-copy" data-clipboard-target="#copyBigBanner">복사</button></span>
                        </div>
                    </div>
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
                                            <img src="<spring:eval expression="@resource['front.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png" 
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                                                 alt="">
                                        </a>
                                    </dd>
                                    <dt><a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                        <span class="catchphrase"><c:out value="${info.PRD_MST_NM }"/></span></a>
                                    </dt>
                                </dl>
                                <!-- 
                                <dl class="detail-product-type1">
                                    <dd class="image">
                                        <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                            <img src="<spring:eval expression="@resource['front.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png" 
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                                                 alt="">
                                         </a>
                                    <dt><a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                        <span class="catchphrase"><c:out value="${info.PRD_MST_NM }"/></span></a>
                                    </dt>
                                </dl>
                                 -->
                            </div>
    
                            <h3 class="title">카드 배너 HTML</h3>
                            <p class="url2"><span class="btn-url-guide"><button class="bannerGuide">html 배너 등록 가이드</button></span>를 확인하세요.</p>
                            <span class="box-content" id="copyCardBannerHtml">
                            <!-- 카드배너-url -->
                            <!-- //카드배너-url -->
                            </span>
                            
<%-- 카드 배너 --%>
<textarea id="copyCardBanner" style="display: none;">
<div style="display:block; width:238px; text-decoration: none; overflow: hidden;">
    <dl style="float: left; width: 238px; margin:0px">
        <dt style="margin: 0 0 10px 0;">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration:none;">
                <img src="<spring:eval expression="@resource['front.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png" 
                     alt="" 
                     style="width:100%; height: auto; border: 1px solid #e1e1e1; box-sizing: border-box;">
            </a>
        </dt>
        <dd style="text-align:left; margin:0px">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration:none;">
                <span style="font-size:16px; font-weight:700; color: #222; margin-bottom:5px; width:95%; height: 45px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;">
                    <c:out value="${info.PRD_MST_NM }"/>
                </span>
            </a>
        </dd>
    </dl>
</div>
</textarea>
<%-- 카드 배너 --%>

                            <span class="btn-type-text4"><button class="btn-copy" data-clipboard-target="#copyCardBanner">복사</button></span>
                        </div>
                    </div>         
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
                                            <img src="<spring:eval expression="@resource['front.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png"
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                                                 alt="사진">
                                        </a>
                                    </dd>
                                    <dt><a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                        <span class="catchphrase"><c:out value="${info.PRD_MST_NM }"/></span>
                                        <span class="content"><c:out value="${fn:replace(info.PRD_MST_RDP_TXT, newLineChar, '<br/>')}" escapeXml="false"/></span></a>
                                    </dt>
                                </dl>
                                <!-- 
                                <dl class="detail-product-type1">
                                    <dd class="image">
                                        <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                            <img src="<spring:eval expression="@resource['front.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png"
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                                                 alt="사진">
                                        </a>
                                    </dd>
                                    <dt><a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank">
                                        <span class="catchphrase"><c:out value="${info.PRD_MST_NM }"/></span>
                                        <span class="content"><c:out value="${fn:replace(info.PRD_MST_RDP_TXT, newLineChar, '<br/>')}" escapeXml="false"/></span></a>
                                    </dt>
                                </dl>
                                 -->
                            </div>
    
                            <h3 class="title">리스트 배너 HTML </h3>
                            <p class="url2"><span class="btn-url-guide"><button class="bannerGuide">html 배너 등록 가이드</button></span>를 확인하세요.</p>
                            <span class="box-content" id="copyListBannerHtml">
                            <!-- 리스트배너-url -->
                            <!-- //리스트배너-url -->
                            </span>
                            
<%-- 리스트 배너 --%>
<textarea id="copyListBanner" style="display: none;">
<div style="display:block; width:100%; text-decoration: none; overflow: hidden;">
    <dl style="margin:0px;">
        <dt style="float:left; width:150px; height:150px; margin:0px;">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration: none;">
                <img src="<spring:eval expression="@resource['front.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png" 
                     alt="" 
                     style="width:150px; height:150px; border: 1px solid #e1e1e1; box-sizing: border-box;">
            </a>
        </dt>
        <dd style="float: left; width: calc(100% - 165px); margin: 0 0 8px 15px;">
            <a href="<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>" title="<c:out value="${info.PRD_MST_NM }"/>" target="_blank" style="text-decoration: none;">
                <span style="display:block; width:95%; font-size:16px; font-weight:700; color: #222; margin: 35px 0 10px 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                    <c:out value="${info.PRD_MST_NM }"/>
                </span> 
                <span style="font-size: 16px; overflow: hidden; text-overflow: ellipsis; width:95%; height: 45px; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2; color: #222;">
                    <c:out value="${fn:replace(info.PRD_MST_RDP_TXT, newLineChar, '<br/>')}" escapeXml="false"/>
                </span>
            </a>
        </dd>
    </dl>
</div>
</textarea>
<%-- 리스트 배너 --%>

                            <span class="btn-type-text4"><button class="btn-copy" data-clipboard-target="#copyListBanner">복사</button></span>
                        </div>
                    </div>                            
                </div>
                <!-- //campaign-tab -->
            </div>
            
        </div>
        <!-- //팝업본문 -->                
    
        </div>
    </div>
    <!-- //본문 -->

<script>
$(function () {
    var $layerPopup = $(".layer-popup1");
    // 탭
    $layerPopup.on("click", ".sub-tab-head button", function(){
        subTab($(this));
    });
    // 텍스트
    $("#copyBigBannerHtml").text($("#copyBigBanner").text());
    $("#copyCardBannerHtml").text($("#copyCardBanner").text());
    $("#copyListBannerHtml").text($("#copyListBanner").text());
    // 공유하기 초기화
    //Kakao.init("<spring:eval expression="@resource['kakao.api.javascript.key']"/>");
    // 공유하기
    var resources = new Object();
    resources["site_name"] = "<spring:eval expression="@resource['project.title']"/>";
    resources["url"] = "<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>"; 
    resources["type"] = "article";
    resources["title"] = "<c:out value="${info.PRD_MST_NM }"/>";
    resources["description"] = $layerPopup.find("#PRD_MST_RDP_TXT").val();
    resources["image"] = "<spring:eval expression="@resource['front.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png";
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
    $layerPopup.on("click", ".bannerGuide", function() {
        $("#layerBannerGuide").addClass("active");
        posPopup();
    });

    // 영업사원별 소개 캠페인 생성
    $layerPopup.on("click", ".sellerShortUrl", function (e) {
        e.stopPropagation();
        $(".layer-popup5").requestLayer($.action.myplanner.campaign.create.seller.view.layer(),
            { PRD_MST_NO : $("#PRD_MST_NO").val() } );
    });
});
</script>