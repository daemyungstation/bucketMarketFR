<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 팝업 : SNS공유  --%>
<div class="contain-head">
    <p class="text-title-type2">공유하기</p>
</div>
<hr class="divline-type1" >
<div class="contain-body">
    <div class="box-sns-share">
        <span class="sns-kakaotalk common-sns-share" data-type="sns-kakaotalk"><button>카카오톡</button></span>
        <span class="sns-kakaostory common-sns-share" data-type="sns-kakaostory"><button>카카오스토리</button></span>
        <span class="sns-twitter common-sns-share" data-type="sns-twitter"><button>트위터</button></span>
        <span class="sns-blog common-sns-share" data-type="sns-blog"><button>네이버블로그</button></span>
        <span class="sns-facebook common-sns-share" data-type="sns-facebook"><button>페이스북</button></span>
        <span class="sns-copyurl"><button>URL복사</button></span>
    </div>
    <%-- 
    <span class="btn-type-text1"><button>닫기</button></span>
    --%>
</div>
<span class="btn-close"><button>닫기</button></span>
<%-- //팝업 : SNS공유  --%>
<script>
$(function () {
    var $snsMeta = $("head").find("meta[class='meta-sns-share']");
    if ($snsMeta.length > 0) {
        var resources = new Object();
        $snsMeta.each(function () {
            var $this = $(this);
            resources[$this.attr("key")] = $this.attr("content");
        });
        var snsShare = new SnsShare({
            resources : resources,
            kakao : {
                talk : {
                    container : ".sns-kakaotalk"
                }
            }
        });
        var $snsLayerPopup = $(".layer-popup2");
        $snsLayerPopup.off("click", ".common-sns-share").on("click", ".common-sns-share", function () {
            snsShare.share($(this).data("type"));
        });
    }
});
</script>