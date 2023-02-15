<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/myplanner.css">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|title-btn|search"/>
    <jsp:param name="headerTitle" value="리워드 지급내역"/>
</jsp:include>
<!-- //헤더 -->
<!-- 카테고리 -->
<jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
    <jsp:param name="navGroup" value="myplanner"/>
</jsp:include>
<!-- //카테고리 -->

<!-- 본문 -->
<div class="area-content"> <!-- 하단 탭바일때 aside-tabbar 클래스 추가 -->
    <div class="area-inner">

    <div class="contain-reward">        
        <div class="box-reward-inner">
                
            <!-- start -->
            <div class="box-reward-search">
                <h2>조회년도</h2>
                <span class="form-select">
                    <c:set var="today" value="<%=new java.util.Date()%>" />
                    <fmt:formatDate value="${today}" pattern="yyyy" var="todayYear"/> 
                    <fmt:parseNumber var="todayYearNum" type="number" value="${todayYear}" />
                    <select id="searchYear">
                        <c:forEach begin="0" end="${todayYearNum - 2020}" var="idx" step="1">
                            <option value="<c:out value="${2020 + idx}" />">
                                <c:out value="${2020 + idx}" />년
                            </option>
                        </c:forEach>
                    </select>
                </span>
            </div>

            <div class="box-scroll-table table-type3">
                <table>
                    <colgroup>
                        <col style="width: 90px" />
                        <col style="width: 100px" />
                        <col style="width: 100px" />
                        <col style="width: 90px" />
                    </colgroup>
                    <tbody id="tbodyList">
                        <tr>
                            <th>정산월</th>
                            <th>지급금액</th>
                            <th>지급일시</th>
                            <th>지급여부</th>
                        </tr>
                    </tbody>
                </table>
            </div>

            <p class="text-empty-data" id="listNone">지급내역이 없습니다.</p>
            
            <!-- 수정 06/02 -->
            <div class="box-reward-content">            
                <p class="text-notice-type1">꼭 확인해 주세요!</p>
                <p class="text-normal-type4">
                    ※ 지급 금액은 해지(청약철회, 회원)건에 대한 수익은 제외된 금액입니다.<br>
                    ※ 지급 여부가 지급완료일 경우 등록한 계좌를 통해 입금을 확인하실 수 있습니다.<br>
                    ※ 지급 금액 클릭 시 [지급상세내역]으로 모집한 회원의 가입 상품을 확인하실 수 있습니다. <br>
                    단, [지급상세내역]에 기재된 수당은 해당상품의 총 수익(리워드)금액으로 분할 지급 될 수 있습니다. <br>
                        분할 지급 시 실제 지급금액에 전체 금액이 포함되지 않을 수 있습니다.  <br>
                        예시) A상품 리워드 수익 : 12만원(4만원x3회) 분할 지급 시, 이달의 지급 금액에는 4만원만 포함  <br>
                    ※ 해당 월의 수익은 회원의 월납입금 정상 납입여부에 따라 발생됩니다.<br>
                    ※ 지급일은 영업일 기준입니다.
                </p>
            </div>
            <!-- //수정 06/02 -->

        </div>        
    </div>

    </div>
</div>
<!-- //본문 -->

<%-- 지급내역 --%>
<script id="paymentItemTemplate" type="text/x-jquery-tmpl">
    <tr class="item" data-alow_dt="{{= ALOW_DT }}">
        <td>{{= StringUtil.formatDate(ALOW_DT + "00000000", "yyyy-MM") }}</td>
        <td><button class="btn-provide">{{= StringUtil.setComma(TOTAL_ALOW_AMT) }}</button></td>
        <td>{{= StringUtil.formatDate(RMT_ORD_PAY_DT, "yyyy-MM-dd") }}</td>
        <td>{{if RMT_ORD_YN == "Y" }} 지급 {{/if}}{{if RMT_ORD_YN != "Y" }} 미지급 {{/if}}</td>
    </tr>
</script>

<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>

<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>

<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content"),
            $searchYear = $areaContent.find("#searchYear"),
            $tbodyList = $areaContent.find("#tbodyList"),
            $listNone = $areaContent.find("#listNone");
        var $paymentItemTemplate = $("#paymentItemTemplate");
        // 년도 변경
        $searchYear.on("change", function() {
            searchPaymentList();
        });
        // 상세조회
        $areaContent.on("click", "button.btn-provide", function() {
            var params = { ALLOW_DT : $(this).closest("tr.item").attr("data-alow_dt") }
            $(".layer-popup1").requestLayer($.action.myplanner.payment.detail.layer(), params);
        });
        // 년도 별 조회
        function searchPaymentList() {
            var param = {
                paymentYear : $searchYear.val(),
            };
            $.postJsonAjax($.action.myplanner.payment.list.ajax(), param, function (data) {
                $tbodyList.find("tr.item").remove();
                if (data.list && data.list.length > 0) {
                    $listNone.hide();
                    $.each(data.list, function(i, row) {
                       row["RMT_ORD_PAY_DT"] = row.RMT_ORD_PAY_DT;
                       $tbodyList.append($paymentItemTemplate.tmpl(row)); 
                    });
                } else {
                    $listNone.show();                    
                }
            })
        }
        // 조회
        searchPaymentList();
    });
</script>

</body>
</html>