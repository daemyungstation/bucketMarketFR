<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                                <th>회원상태</th>
                            </tr>
                            <tr>
                                <td class="member-num"><a href="javascript:;"><c:out value="${info.ACCNT_NO }"/></a></td>
                                <td class="member-product"><a href="javascript:;"><c:out value="${info.PRD_MST_NM }"/></a></td>
                                <td><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" /></td>
                                <td class="member-state">가입</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table-type2 type2">
                    <table>
                        <colgroup>
                            <col style="width: auto">
                            <col style="width: 130px">
                            <col style="width: 130px">
                            <col style="width: 130px">
                            <col style="width: 130px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>상품금액</th>
                                <th>만기회차</th>
                                <th>만기환급율</th>
                                <th>납입회차</th>
                                <th>납입금액</th>
                            </tr>
                            <tr>
                                <td><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원</td>
                                <td><c:out value="${info.EXPR_NO }"/>회</td>
                                <td>100%</td>
                                <td><c:out value="${info.PAY_NO }"/>회</td>
                                <td><fmt:formatNumber value="${info.PAY_SUM }" type="number"/>원</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <h2 class="title-paymentdetail type2">회차별 납입상세내역</h2>
                <div class="table-type2 type3">
                    <table>
                        <colgroup>
                        <col width="40px">
                        <col width="60px">
                        <col width="75px">
                        <col width="90px">
                        <col width="90px">
                        <col width="auto">
                        <col width="85px">
                        <col width="60px">
                        <col width="50px">
                        </colgroup>
                        <tr>
                            <th>회차</th>
                            <th>월분</th>
                            <th>납입일자</th>
                            <th>상조부금납입금</th>
                            <th>결합상품납입금</th>
                            <th>결합상품추가납입금</th>
                            <th>월납입금총액</th>
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

<script>
$(function () {
    var $layerPopup = $(".layer-popup1");
});
</script>