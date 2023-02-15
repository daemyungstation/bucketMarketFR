<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">멤버십 카드 정보</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">

        <div class="box-member-payment">
            <div class="table-type2 type2">
                <table>
                    <colgroup>
                        <col style="width: 200px">
                        <col style="width: auto">
                        <col style="width: 120px">
                        <col style="width: 110px">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>회원번호</th>
                            <th>가입상품명</th>
                            <th>가입일자</th>
                            <th>발급일자</th>
                        </tr>
                        <tr>
                            <td class="member-num"><a href="javascript:;"><c:out value="${info.ACCNT_NO }"/></a></td>
                            <td class="member-product"><a href="javascript;"><c:out value="${info.PRD_MST_NM }"/></a></td>
                            <td><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy-MM-dd" /></td>
                            <td><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="contain-information-card1">
                <div class="box-card1">
                    <span class="detail"><c:out value="${info.MEM_NM }"/> <br><c:out value="${info.ACCNT_NO }"/></span>
                </div>

                <div class="contain-card1">
                    <div class="box-card2">리조트 우대번호<span class="detail"><c:out value="${info.RESORT_NO }"/></span></div><!-- 우대번호 -->                        
                </div>
                <div class="box-button">
                    <span class="btn-type-text7"><button class="detail">멤버십 혜택 상세보기</button></span>
                    <span class="btn-type-text7 type2"><button class="reservation">대명리조트 예약하기</button></span>
                </div>
            </div>

            <p class="text-notice-type1" style="margin:30px 0 10px 0;">안내사항</p>
            <ul class="text-information-list1 type3">
                <li>1. 멤버십 카드와 함께 신분증 지참은 필수 이며, 미 지참 시 우대 혜택이 적용되지 않습니다.</li>
                <li>2 .회원님의 멤버십카드 내에 기재된 회원번호와 리조트 우대번호 (바코드)확인이 가능합니다.</li>
                <li>3 .상단의 멤버십카드와 리조트 우대번호 (바코드)로 이용이 가능한 서비스 항목을 안내드립니다.</li>
                <li>4 .본 모바일 카드는 2016년 5월 자로 리뉴얼된 카드 이미지를 담고 있습니다. <br />실제 사용에는 리뉴얼 전 카드와 병행 사용이 가능합니다.</li>
                <li>5 .카드와 함께 신분증 지참은 필수이며, 미지참 시, 우대 혜택이 적용되지 않습니다.</li>
                <li>6 .대명리조트 예약의 경우, 개인정보 제3자 제공에 미동의 시 리조트 서비스 이용에 제한이 있을 수 있습니다.</li>
                <li style="margin-top:20px;">
                    <span class="text-point3">멤버십카드</span><br />
                    - 대명리조트의 전국 리조트 객실 입실<br />
                    - 오션월드, 아쿠아월드, 오션베이, 스키월드 등의 부대시설 매표 시 이용
                </li>
            </ul>
        </div>

        </div>
    </div>
    <!-- //본문 -->

<script>
$(function () {
    var $layerPopup = $(".layer-popup1");
    // 맴버십 혜택 상세보기
    $layerPopup.off("click", "button.detail").on("click", "button.detail", function() {
        var url = "https://www.daemyungimready.com/membership-service/contentsid/227/index.do";
        window.open(url, "_blank");
        // TODO 김혁 - 앱/웹 처리 분기 구현
    });
    // 대명리조트 예약하기
    $layerPopup.off("click", "button.reservation").on("click", "button.reservation", function() {
        var url = "https://www.daemyungresort.com/mv.dp/dmparse.dm?menuCd=5560000";
        window.open(url, "_blank");
        // TODO 김혁 - 앱/웹 처리 분기 구현
    });
});
</script>