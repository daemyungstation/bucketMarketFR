<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">지급상세내역</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer layer-button">
        <div class="area-inner">

            <!-- 팝업본문 -->
            <div class="box-reward-provide">
                <h2><ui:formatDate value="${summary.ALOW_DT }${'01' }" pattern="yyyy년 MM월" /></h2>
                <div class="table-type1">
                    <table>
                        <colgroup>
                        <col style="width:115px">
                        <col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>지급금액</th>
                            <td>
                                <strong>
                                    <c:choose>
                                        <c:when test="${not empty summary.TOTAL_ALOW_AMT }"><fmt:formatNumber value="${summary.TOTAL_ALOW_AMT }" type="number"/></c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </strong>
                            </td>
                        </tr>
                        <tr>
                            <th>입금은행</th>
                            <td>
                                <strong>
                                    <c:choose>
                                        <c:when test="${not empty list[0].RDP_MST_BNK_CD_NM }"><c:out value="${list[0].RDP_MST_BNK_CD_NM }"/></c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </strong>
                            </td>
                        </tr>
                        <tr>
                            <th>계좌번호</th>
                            <td>
                                <strong>
                                    <c:choose>
                                        <c:when test="${not empty list[0].RDP_MST_BNK_ACT }"><ui:formatBankAccount value="${list[0].RDP_MST_BNK_ACT }"/></c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </strong>
                            </td>
                        </tr>
                        <tr>
                            <th>지급일시</th>
                            <td>
                                <strong>
                                    <c:choose>
                                        <c:when test="${not empty summary.RMT_ORD_PAY_DT }"><ui:formatDate value="${summary.RMT_ORD_PAY_DT }" pattern="yyyy-MM-dd" /></c:when>
                                        <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                </strong>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="box-reward-inner">
                
                <c:if test="${not empty list }">
                    <h3 class="reward-title">지급 상세내역</h3>
                    <div class="box-scroll-table table-type3">
                        <table>
                            <colgroup>
                                <col style="width: 90px">
                                <col style="width: 150px">
                                <col style="width: 90px">
                                <col style="width: 90px">
                                <col style="width: 90px">
                                <col style="width: 80px">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>가입자명</th>
                                    <th>온라인 상품명</th>
                                    <th>접수일자</th>
                                    <th>가입일자</th>
                                    <th>가입상태</th>
                                    <th>수당</th>
                                </tr>
                                
                                <c:forEach var="item" items="${list }">
                                
                                    <tr>
                                        <td><c:out value="${item.MEM_NM }"/></td>
                                        <td><c:out value="${item.PRD_MST_NM }"/></td>
                                        <td><ui:formatDate value="${item.RECEIPT_DT }" pattern="yyyy-MM-dd" /></td>
                                        <td><ui:formatDate value="${item.JOIN_DT }" pattern="yyyy-MM-dd" /></td>
                                        <td><c:out value="${Dlcc.JOIN_STATE[item.KSTBIT] }"/></td>
                                        <td><fmt:formatNumber value="${item.ALOW_AMT }" type="number"/></td>
                                    </tr>
                                    
                                </c:forEach>
                                
                            </tbody>
                        </table>
                    </div>
                </c:if>
                
                <c:if test="${empty list }">
                    <p class="text-empty-data">지급내역이 없습니다.</p>
                </c:if>
                 
            </div>
            <!-- //팝업본문 -->

            <!-- 하단 고정버튼 -->
            <div class="fixed-box-button">
                <span class="btn-type-text1"><button id="btnClose">확인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
            </div>
            <!-- //하단 고정버튼 -->

        </div>
    </div>
    <!-- //본문 -->

<script>
$(function () {
    var $layerPopup = $(".layer-popup1");
    // 닫기
    $layerPopup.on("click", "#btnClose", function() {
        $.common.layer.close($layerPopup);    
    });
});
</script>