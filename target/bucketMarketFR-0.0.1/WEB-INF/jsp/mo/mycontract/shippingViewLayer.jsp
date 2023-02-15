<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="layer-inner">
    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">배송현황 정보</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">

            <div class="contain-history-subscripton1 type3">
                <dl>
                    <dt><span class="num-member"><c:out value="${info.MEM_NM }"/>&nbsp/&nbsp회원번호 <c:out value="${info.ACCNT_NO }"/></span>
                    <c:out value="${info.PRD_MST_NM }"/></dt>
                    <dd class="date"><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" /></dd>
                    <dd class="stat"><c:out value="${info.ORD_MST_DLV_STATE_NM }"/></dd>
                </dl>
            </div>

            <hr class="divline-type2" >

            <div class="contain-information-payment">
                <h3 class="title">배송상태</h3>

                <!-- 정보 -->
                <div class="box-information-product2">
                    <dl>
                        <dt>배송 예정일</dt>
                        <dd><ui:formatDate value="${info.ORD_MST_DLV_ING_DT }" pattern="yyyy.MM.dd" /></dd>
                    </dl>
                    <dl>
                        <dt>배송 완료일</dt>
                        <dd><ui:formatDate value="${info.ORD_MST_DLV_CPL_DT }" pattern="yyyy.MM.dd" /></dd>
                    </dl>
                    <dl>
                        <dt>배송 보류일</dt>
                        <dd><ui:formatDate value="${info.ORD_MST_DLV_WAT_DT }" pattern="yyyy.MM.dd" /></dd>
                    </dl>
                </div>
                <!-- //정보 -->
            </div>

            <div class="contain-information-payment">
                <h3 class="title">배송/설치 정보</h3>

                <!-- 정보 -->
                <div class="box-information-product2">
                    <dl>
                        <dt>상품</dt>
                        <dd><c:out value="${info.MODEL_NM }"/></dd>
                    </dl>
                    <dl>
                        <dt>옵션</dt>
                        <dd><c:out value="${info.PRD_OPT_DTL }"/></dd>
                    </dl>
                    <dl>
                        <dt>수령인</dt>
                        <dd><c:out value="${info.INSPL_MEM_NM }"/></dd>
                    </dl>
                    <dl>
                        <dt>연락처</dt>
                        <dd><ui:formatPhone value="${info.INSPL_CELL }"/></dd>
                    </dl>
                    <dl>
                        <dt>주소</dt>
                        <dd><c:out value="${info.INSPL_ADDR }"/>&nbsp<c:out value="${info.INSPL_ADDR2 }"/></dd>
                    </dl>
                </div>
                <!-- //정보 -->

            </div>

        </div>
    </div>
    <!-- //본문 -->
</div>

<script>
$(function () {
    var $layerPopup = $(".layer-popup1");
});
</script>