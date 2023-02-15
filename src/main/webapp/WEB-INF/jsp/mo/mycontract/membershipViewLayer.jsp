<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="layer-inner">
    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">맴버십 카드 정보</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">

            <div class="contain-information-card1">

                <p class="text-membership"><c:out value="${info.MEM_NM }"/>(<i><c:out value="${info.ACCNT_NO }"/></i>)님<br ><span>(최종발급일자 : <ui:formatDate value="${info.JOIN_DT }" pattern="yyyy년 MM월 dd일"/>)</span></p>

                <div class="box-card1">
                    <span class="detail"><c:out value="${info.MEM_NM }"/><br ><c:out value="${info.ACCNT_NO }"/></span>
                </div>

                <div class="contain-card1">
                    <div class="box-card2">리조트 우대번호<span class="detail"><c:out value="${info.RESORT_NO }"/></span></div><!-- 우대번호 -->
                    <div class="box-button">
                        <span class="btn-type-text7"><button class="detail">멤버십 혜택 상세보기</button></span>
                    </div>
                </div>

            </div>

            <hr class="divline-type2" >
            
            <!-- 수정 06/02 -->
            <div class="contain-information-card2">
                <p class="text-notice-type1">안내사항</p>
                <p class="text-normal-type1">
                    1. 멤버십 카드와 함께 신분증 지참은 필수 이며, 미 지참 시 우대 혜택이 적용되지 않습니다.<br>
                    2. 회원님의 멤버십카드 내에 기재된 회원번호와 리조트 우대번호 (바코드)확인이 가능합니다.<br>
                    3. 상단의 멤버십카드와 리조트 우대번호 (바코드)로 이용이 가능한 서비스 항목을 안내드립니다.<br>
                    4. 본 모바일 카드는 2016년 5월 자로 리뉴얼된 카드 이미지를 담고 있습니다. 실제 사용에는 리뉴얼 전 카드와 병행 사용이 가능합니다.<br>
                    5. 카드와 함께 신분증 지참은 필수이며, 미지참 시, 우대 혜택이 적용되지 않습니다.<br>
                    6. 대명리조트 예약의 경우, 개인정보 제3자 제공에 미동의 시 리조트 서비스 이용에 제한이 있을 수 있습니다.
                </p>

                <dl class="box-information" style="margin-top:20px;">
                    <dt>멤버십카드</dt>
                    <dd>- 대명리조트의 전국 리조트 객실 입실</dd>
                    <dd>- 오션월드, 아쿠아월드, 오션베이, 스키월드 등의 부대시설 매표 시 이용</dd>
                </dl>
            </div>
            <!-- //수정 06/02 -->

            <!-- 하단 고정버튼 -->
            <div class="fixed-box-button">
                <span class="btn-type-text1"><button class="reservation">대명리조트 예약하기</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
            </div>
            <!-- //하단 고정버튼 -->

        </div>
    </div>
    <!-- //본문 -->
</div>

<script>
$(function () {
    var $layerPopup = $(".layer-popup1");
    // 맴버십 혜택 상세보기
    $layerPopup.off("click", "button.detail").on("click", "button.detail", function() {
        $.outlink("https://www.daemyungimready.com/membership-service/contentsid/227/index.do");
    });
    // 대명리조트 예약하기
    $layerPopup.off("click", "button.reservation").on("click", "button.reservation", function() {
        $.outlink("https://www.daemyungresort.com/mv.dp/dmparse.dm?menuCd=5560000");
    });
});
</script>