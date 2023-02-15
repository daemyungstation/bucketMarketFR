<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">배송현황 조회</h1>
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
                            <col style="width: 160px">
                            <col style="width: auto">
                            <col style="width: 110px">
                            <col style="width: 110px">
                            <col style="width: 120px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>회원번호</th>
                                <th>가입상품명</th>
                                <th>가입일자</th>
                                <th>회원상태</th>
                                <th>현황</th>
                            </tr>
                            <tr>
                                <td class="member-num"><a href="javascript:;"><c:out value="${info.ACCNT_NO }"/></a></td>
                                <td class="member-product"><a href="javascript:;"><c:out value="${info.PRD_MST_NM }"/></a></td>
                                <td><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" /></td>
                                <td class="member-state">가입</td>
                                <td class="deliver-state"><c:out value="${info.ORD_MST_DLV_STATE_NM }"/></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <h2 class="title-paymentdetail type2">배송상태</h2>
                <div class="table-type1 type2">
                    <table>
                        <colgroup>
                        <col style="width:220px">
                        <col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>배송예정일</th>
                            <td><ui:formatDate value="${info.ORD_MST_DLV_ING_DT }" pattern="yyyy.MM.dd" /></td>
                        </tr>
                        <tr>
                            <th>배송완료일</th>
                            <td><ui:formatDate value="${info.ORD_MST_DLV_CPL_DT }" pattern="yyyy.MM.dd" /></td>
                        </tr>
                        <tr>
                            <th>배송보류일</th>
                            <td><ui:formatDate value="${info.ORD_MST_DLV_WAT_DT }" pattern="yyyy.MM.dd" /></td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <h2 class="title-paymentdetail type2">배송/설치 정보</h2>
                <div class="table-type1 type2">
                    <table>
                        <colgroup>
                        <col style="width:220px">
                        <col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>상품</th>
                            <td><c:out value="${info.MODEL_NM }"/></td>
                        </tr>
                        <tr>
                            <th>옵션</th>
                            <td><c:out value="${info.PRD_OPT_DTL }"/></td>
                        </tr>
                        <tr>
                            <th>수령인</th>
                            <td><c:out value="${info.INSPL_MEM_NM }"/></td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td><ui:formatPhone value="${info.INSPL_CELL }"/></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><c:out value="${info.INSPL_ADDR }"/>&nbsp<c:out value="${info.INSPL_ADDR2 }"/></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                
            </div>                    

        </div>
    </div>
    <!-- //본문 -->

<script>
$(function () {
    var $layerPopup = $(".layer-popup1");
});
</script>