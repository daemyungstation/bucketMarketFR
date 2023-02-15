<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                    <dd class="image mainImage">
                        <img src="<spring:eval expression="@resource['front.ssl.domain']"/>/resources/pc/images/preview.png"
                             onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                             alt="">          
                    </dd>
                    <%-- <dt>
                        <span class="catchphrase2"><c:out value="${info.PRD_MST_NM }"/></span>
                        <span class="reward">리워드 : <strong class="text-point2">별도안내</strong></span>
                    </dt> --%>
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
                        </div>
                    </div>
                </div>
            </div>
    
            <hr class="divline-type2">
    
            
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
    // 공유하기 초기화
    //Kakao.init("<spring:eval expression="@resource['kakao.api.javascript.key']"/>");
    // 공유하기
    var resources = new Object();
    resources["site_name"] = "<spring:eval expression="@resource['project.title']"/>";
    resources["url"] = "<c:out value="${info.CAMPAIGN_SHORTEN_URL }"/>";
    resources["type"] = "article";
    resources["title"] = "꿈꾸던 삶을 담다.생활혜택 지원으로 일상의 부담은 덜고 맞춤 라이프 서비스로 미래를 준비합니다.";
    resources["description"] = $layerPopup.find("#PRD_MST_RDP_TXT").val();
    resources["image"] = "<spring:eval expression="@resource['front.ssl.domain']"/>/resources/mo/images/preview.png";
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
});
</script>