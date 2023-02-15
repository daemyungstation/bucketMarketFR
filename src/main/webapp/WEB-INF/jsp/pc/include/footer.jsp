<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Enliple Tracker Start -->
<script type="text/javascript">
(function(a,g,e,n,t){a.enp=a.enp||function(){(a.enp.q=a.enp.q||[]).push(arguments)};n=g.createElement(e);n.async=!0;n.defer=!0;n.src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";t=g.getElementsByTagName(e)[0];t.parentNode.insertBefore(n,t)})(window,document,"script");
enp('create', 'common', 'bucketmarket', { device: 'W' }); // W:웹, M: 모바일, B: 반응형
enp('send', 'common', 'bucketmarket');
</script>
<!-- Enliple Tracker End -->

<footer class="area-footer">
    <div class="contain-links">
        <div class="area-inner">
            <span><a href="javascript:$.common.layer.term('', '<c:out value="${Code.TEMR_PERSONAL_INFORMATION_HANDLING }"/>');">개인정보처리방침</a></span>
            <span><a href="javascript:$.common.layer.term('<c:out value="${Code.TERM_BUCKET_MARKET_USE }"/>', '');">이용약관</a></span>
            <span><a href="javascript:$.common.layer.term('<c:out value="${Code.TERM_IMPORTANT_NOTICE }"/>', '');">중요정보 고시사항</a></span>
            <!-- <span><a href="javascript:$.common.layer.term('<c:out value="${Code.TERM_LAW_NOTICE }"/>', '');">법적고시</a></span> -->
            <span><a href="javascript:$.requestPage($.action.board.faq.list());">고객센터</a></span>
            <span class="customer-number">버킷마켓 고객센터 1644-8399</span>
            <%-- 
            <span><a href="javascript:$.common.layer.ftc();">사업자정보확인</a></span>
            --%>
            <span><a href="javascript:$.requestLink('https://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208809321', '<c:out value="${Const.LINK_TARGET_WINDOW }"/>');">사업자정보확인</a></span>
        </div>
    </div>
    <div class="contain-footer">
        <div class="area-inner">
            <p class="text-address">
                        서울지점(우편수신처) : 서울시 강남구 강남대로 624, 14층(신사동, 아이씨티타워) <br>
                        본점 : 강원도 홍천군 서면 한치골길 262 (소노호텔앤리조트, 비발디파크) <br>
                        사업자등록번호 220-88-09321 | 대표자 (주)대명스테이션 대표이사 최성훈 |  통신판매신고번호 제 2021-강원홍천-0050호</p>
            <p class="text-copyright">COPYRIGHT DAEMYUNGSTATION.CO,.LTD. ALL RIGHTS RESERVED.</p>
            <div class="contain-util">
                <p>내 폰에 버킷마켓 담기</p>
                <span class="btn-link-google"><a href="https://play.google.com/store/apps/details?id=kr.co.bucketmarket.android" target="_blank">구글 플레이</a></span>
                <span class="btn-link-apple"><a href="https://apps.apple.com/kr/app/id1518205038" target="_blank">앱스토어</a></span>
            </div>
        </div>
    </div>
</footer>
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "b712445bd65bd8";
if(window.wcs) {
wcs_do();
}
</script>