<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 푸터 --%>
<footer class="area-footer">
    <div class="area-inner">
        <div class="box-footer-link">
            <span><a href="javascript:alert('서비스 준비중 입니다.');">APP 다운로드</a>
            <!-- 구글 플레이 / 앱스토어 다운로드 추가 -->
            </span>
            <span class="on"><a href="javascript:$.requestLink('https://www.daemyungimready.com/main/index.do', '<c:out value="${Const.LINK_TARGET_WINDOW }"/>');">대명아임레디</a></span>
        </div>
        <div class="box-footer-infolink">
            <span><button onclick="$.common.layer.term('<c:out value="${Code.TERM_IMPORTANT_NOTICE }"/>', '');">중요정보고시사항</button></span>
            <span><button onclick="$.common.layer.term('<c:out value="${Code.TERM_LAW_NOTICE }"/>', '');">법적고시</button></span>
            <span><button onclick="$.common.layer.term('', '<c:out value="${Code.TEMR_PERSONAL_INFORMATION_HANDLING }"/>');"><strong>개인정보처리방침</strong></button></span>
            <span><button onclick="$.common.layer.term('<c:out value="${Code.TERM_BUCKET_MARKET_USE }"/>', '');">이용약관</button></span>
            
            <%-- 
            <span class="btn-business"><button onclick="$.common.layer.ftc();">사업자정보확인</button></span>
            --%>
            <span class="btn-business">
                <a href="tel:16448399" class="btn-customer">버킷마켓 고객센터 1644-8399</a>
                <button onclick="$.requestLink('https://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208809321', '<c:out value="${Const.LINK_TARGET_WINDOW }"/>');">사업자정보확인</button>
            </span>
        </div>
        <div class="box-footer-address">
            <span>서울시 송파구 법원로 135 대명타워</span>
            <span>(주)대명스테이션  대표이사 서준혁, 최성훈</span>
            <span>사업자등록번호 220-88-09321  |  통신판매신고번호  제2016-서울송파-0669호</span>
        </div>
        <p class="text-copryright">COPYRIGHT DAEMYUNGSTATION.CO,.LTD. ALL RIGHTS RESERVED.</p>
    </div>
</footer>
<%--// 푸터 --%>