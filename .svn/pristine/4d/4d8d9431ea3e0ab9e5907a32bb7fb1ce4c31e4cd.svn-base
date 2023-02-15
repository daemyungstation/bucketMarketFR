<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="layer-inner">
    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">납입상세</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">

            <h2 class="title-paymentdetail"><c:out value="${info.PRD_MST_NM }"/></h2>

            <div class="box-scroll-paymenttable">
                <div class="table-type3">
                    <table>
                        <colgroup>
                        <col width="60px">
                        <col width="100px">
                        <col width="100px">
                        <col width="150px">
                        <col width="150px">
                        <col width="180px">
                        <col width="150px">
                        <col width="120px">
                        <col width="120px">
                        </colgroup>
                        
                        <tr>
                            <th>회차</th>
                            <th>월분</th>
                            <th>납입일자</th>
                            <th>상조부금 납입금</th>
                            <th>결합상품 납입금</th>
                            <th>결합상품 추가 납입금</th>
                            <th>월 납입금 총액</th>
                            <th>납입방법</th>
                            <th>상태</th>
                        </tr>
                        
                        <%-- 납입 목록 --%>
                        <c:forEach var="item" items="${info.paymentList }">
                        
                            <tr>
                                <td><c:out value="${item.PAY_NO }"/></td>
                                <td><ui:formatDate value="${item.PAY_DAY }" pattern="yyyy-MM"/></td>
                                <td><ui:formatDate value="${item.PAY_DAY }" pattern="yyyy-MM-dd"/></td>
                                <td><fmt:formatNumber value="${item.PAY_AMT }" type="number"/></td>
                                <td><fmt:formatNumber value="${item.PAY_AMT1 }" type="number"/></td>
                                <td><fmt:formatNumber value="${item.PAY_AMT2 }" type="number"/></td>
                                <td><fmt:formatNumber value="${item.PAY_SUM }" type="number"/></td>
                                <td><c:out value="${item.PAY_MTHD_NM }"/></td>
                                <td>정상</td>
                            </tr>
                            
                        </c:forEach>
                         
                    </table>
                </div>
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