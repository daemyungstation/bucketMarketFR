<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/myplanner.css">
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/common/js/lib/pickadate/themes/default.css">
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/common/js/lib/pickadate/themes/default.date.css">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|title-btn|search"/>
    <jsp:param name="headerTitle" value="리워드 실적조회"/>
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
        <!-- 탭 헤더 : 고정 -->
        <div class="box-tab-head">
            <span class="on" data-type="daily"><button>일별</button></span>
            <span class="" data-type="monthly"><button>월별</button></span>
            <span class="" data-type="byProduct"><button>상품별</button></span>
        </div>
        <!-- //탭 헤더 : 고정 -->
        <!-- 탭 내용 -->
        <!-- 일별 -->
        <div class="box-tab-body tab1 on">
            <div class="box-reward-inner">

                <!-- start -->
                <div class="box-reward-search">
                    <h2>조회기간</h2>
                    <span class="form-calendar">
                        <span>
                            <button class="btn-calendar" id="dailySearchStartDateBtn">기간선택</button>
                            <input type="text" id="dailySearchStartDate" value="" readonly="readonly"/>
                            </span><i>~</i><span>
                            <button class="btn-calendar" id="dailySearchEndDateBtn">기간선택</button>
                            <input type="text" id="dailySearchEndDate" value="" readonly="readonly"/>
                        </span>
                    </span>
                </div>

                <div class="box-reward-count">
                    <dl>
                        <dt>접수건수</dt>
                        <dd id="dailyTotalReceipt">0</dd>
                    </dl>
                    <dl>
                        <dt>가입대기건수</dt>
                        <dd id="dailyTotalWaitingToJoin">0</dd>
                    </dl>
                    <dl>
                        <dt>가입건수</dt>
                        <dd id="dailyTotalJoin">0</dd>
                    </dl>                
                </div>
                <div class="box-reward-count re-margin">
                    <dl class="reward-margin">
                        <dt>예상수익</dt>
                        <dd id="dailyTotalExpectedReturn">0원</dd>
                    </dl>
                </div>

                <div id="dailyChartDiv" class="box-reward-graph" style="display: none;">
                    <span class="content-add">
                        <%-- 그래프 --%>
                        <div id="dailyChart" style="height:350px;"></div>
                        <%-- 그래프 --%>
                    </span>
                </div>
                
                <p id="dailyChartNone" class="text-empty-data" style="display: none;">조회 내역이 없습니다.</p>

                <!-- 수정 06/02 -->
                <div class="box-reward-content">                    
                    <p class="text-notice-type1">꼭 확인해 주세요!</p>
                    <p class="text-normal-type4">
                        <span class="text-point3">※ 예상 수익은 조회기간 동안 발생한 <u>가입건수를 기준으로 산정됩니다.</u></span><br>
                        ※ 레디플래너가 모집한 회원의 가입절차는 ①접수 → ②가입대기 → ③가입 순으로 진행됩니다.<br>
                        <span class="text-inner">
                           ① [접수건수]는 모집한 회원이 레디플래너의 고유링크로 버킷마켓 접속 후 상품 상담신청을 한 상태입니다.<br>
                           ② [가입대기건수]는 회원이 상품 가입을 희망하여, 상품 TM녹취계약을 완료한 상태입니다.<br>
                           <strong class="text-point3">③ [가입건수]는 회원이 가입한 상품의 월 납입금을 1회 이상 납입 완료한 상태입니다 <br>
                           (실제 수익발생 기준이며, 수익은 2회 정상납입 유지 조건 하에 지급됩니다.)</strong>
                        </span>
                        <span class="text-point3">※ <u>예상 수익은 총 수익 금액이며, 상품별로 일시 또는 분할 지급될 수 있습니다.</u> 상세 수익 지급기준은 <span class="text-point1"><a href="javascript:;" class="agreement1" data-gbn="<c:out value="${Code.TERM_READY_PLANNER_SERVICE }"/>">레디플래너 운영정책</a></span>을 참고해주세요.</span><br>
                        <span class="text-point3">※ 실제 수익은 예상수익에서 해지(청약철회, 해약)회원에 대한 수익은 제외되고 지급되며, <u>예상 수익과 실제 지급받는 수익이 상이할 수 있습니다.</u></span><br>
                        ※ 상기 수치는 일 1회 업데이트 됩니다. 
                    </p>
                </div>
                <!-- //수정 06/02 -->
                <!-- end -->

            </div>
        </div>
        <!-- //일별 -->

        <!-- 월별 -->
        <div class="box-tab-body tab2">
            <div class="box-reward-inner">
                
                <!-- start -->
                <div class="box-reward-search">
                    <h2>조회년도</h2>
                    <span class="form-select">
                        <c:set var="today" value="<%=new java.util.Date()%>" />
                        <fmt:formatDate value="${today}" pattern="yyyy" var="todayYear"/> 
                        <fmt:parseNumber var="todayYearNum" type="number" value="${todayYear}" />
                        <select id="monthlySearchYear">
                            <c:forEach begin="0" end="${todayYearNum - 2020}" var="idx" step="1">
                                <option value="<c:out value="${2020 + idx}" />">
                                    <c:out value="${2020 + idx}" />년
                                </option>
                            </c:forEach>
                        </select>
                    </span>
                </div>

                <div class="box-reward-count">
                    <dl>
                        <dt>접수건수</dt>
                        <dd id="monthlyTotalReceipt">0</dd>
                    </dl>
                    <dl>
                        <dt>가입대기건수</dt>
                        <dd id="monthlyTotalWaitingToJoin">0</dd>
                    </dl>
                    <dl>
                        <dt>가입건수</dt>
                        <dd id="monthlyTotalJoin">0</dd>
                    </dl>                
                </div>
                <div class="box-reward-count re-margin">
                    <dl class="reward-margin">
                        <dt>예상수익</dt>
                        <dd id="monthlyTotalExpectedReturn">0원</dd>
                    </dl>
                </div>

                <div id="monthlyChartDiv" class="box-reward-graph" style="display: none;">
                    <span class="content-add">
                        <%-- 그래프 --%>
                        <div id="monthlyChart" style="height:350px;"></div>
                        <%-- 그래프 --%>
                    </span>
                </div>
                
                <p id="monthlyChartNone" class="text-empty-data" style="display: none;">조회 내역이 없습니다.</p>

                <!-- 수정 06/02 -->
                <div class="box-reward-content">                    
                    <p class="text-notice-type1">꼭 확인해 주세요!</p>
                    <p class="text-normal-type4">
                        <span class="text-point3">※ 예상 수익은 조회기간 동안 발생한 <u>가입건수를 기준으로 산정됩니다.</u></span><br>
                        ※ 레디플래너가 모집한 회원의 가입절차는 ①접수 → ②가입대기 → ③가입 순으로 진행됩니다.<br>
                        <span class="text-inner">
                           ① [접수건수]는 모집한 회원이 레디플래너의 고유링크로 버킷마켓 접속 후 상품 상담신청을 한 상태입니다.<br>
                           ② [가입대기건수]는 회원이 상품 가입을 희망하여, 상품 TM녹취계약을 완료한 상태입니다.<br>
                           <strong class="text-point3">③ [가입건수]는 회원이 가입한 상품의 월 납입금을 1회 이상 납입 완료한 상태입니다 <br>
                           (실제 수익발생 기준이며, 수익은 2회 정상납입 유지 조건 하에 지급됩니다.)</strong>
                        </span>
                        <span class="text-point3">※ <u>예상 수익은 총 수익 금액이며, 상품별로 일시 또는 분할 지급될 수 있습니다.</u> 상세 수익 지급기준은 <span class="text-point1"><a href="javascript:;" class="agreement1" data-gbn="<c:out value="${Code.TERM_READY_PLANNER_SERVICE }"/>">레디플래너 운영정책</a></span>을 참고해주세요.</span><br>
                        <span class="text-point3">※ 실제 수익은 예상수익에서 해지(청약철회, 해약)회원에 대한 수익은 제외되고 지급되며, <u>예상 수익과 실제 지급받는 수익이 상이할 수 있습니다.</u></span><br>
                        ※ 상기 수치는 일 1회 업데이트 됩니다. 
                    </p>
                </div>
                <!-- //수정 06/02 -->
                <!-- end -->

            </div>
        </div>
        <!-- //월별 -->

        <!-- 상품별 -->
        <div class="box-tab-body tab3">
            <div class="box-reward-inner">
                
                <!-- start -->
                <div class="box-reward-search">
                    <h2>조회기간</h2>
                    <span class="form-calendar">
                        <span>
                            <button class="btn-calendar" id="productSearchStartDateBtn">기간선택</button>
                            <input type="text" id="productSearchStartDate" value="" />
                        </span>
                        <i>~</i>
                        <span>
                            <button class="btn-calendar" id="productSearchEndDateBtn">기간선택</button>
                            <input type="text" id="productSearchEndDate" value="" />
                        </span>
                    </span>
                </div>

                <div class="box-scroll-table table-type3">
                    <table>
                        <colgroup>
                            <col style="width: 50px" />
                            <col style="width: 170px" />
                            <col style="width: 80px" />
                            <col style="width: 110px" />
                            <col style="width: 80px" />
                            <col style="width: 110px" />
                        </colgroup>
                        <tbody id="byProductList">
                            <tr>
                                <th>순번</th>
                                <th>상품명</th>
                                <th>접수건수</th>
                                <th>가입대기건수</th>
                                <th>가입건수</th>
                                <th>예상수익</th>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <p id="byProductListNone" class="text-empty-data" style="display: none;">조회 내역이 없습니다.</p>

                <!-- 수정 06/02 -->
                <div class="box-reward-content">                    
                    <p class="text-notice-type1">꼭 확인해 주세요!</p>
                    <p class="text-normal-type4">
                        <span class="text-point3">※ 예상 수익은 조회기간 동안 발생한 <u>가입건수를 기준으로 산정됩니다.</u></span><br>
                        ※ 레디플래너가 모집한 회원의 가입절차는 ①접수 → ②가입대기 → ③가입 순으로 진행됩니다.<br>
                        <span class="text-inner">
                           ① [접수건수]는 모집한 회원이 레디플래너의 고유링크로 버킷마켓 접속 후 상품 상담신청을 한 상태입니다.<br>
                           ② [가입대기건수]는 회원이 상품 가입을 희망하여, 상품 TM녹취계약을 완료한 상태입니다.<br>
                           <strong class="text-point3">③ [가입건수]는 회원이 가입한 상품의 월 납입금을 1회 이상 납입 완료한 상태입니다 <br>
                           (실제 수익발생 기준이며, 수익은 2회 정상납입 유지 조건 하에 지급됩니다.)</strong>
                        </span>
                        <span class="text-point3">※ <u>예상 수익은 총 수익 금액이며, 상품별로 일시 또는 분할 지급될 수 있습니다.</u> 상세 수익 지급기준은 <span class="text-point1"><a href="javascript:;" class="agreement1" data-gbn="<c:out value="${Code.TERM_READY_PLANNER_SERVICE }"/>">레디플래너 운영정책</a></span>을 참고해주세요.</span><br>
                        <span class="text-point3">※ 실제 수익은 예상수익에서 해지(청약철회, 해약)회원에 대한 수익은 제외되고 지급되며, <u>예상 수익과 실제 지급받는 수익이 상이할 수 있습니다.</u></span><br>
                        ※ 상기 수치는 일 1회 업데이트 됩니다. 
                    </p>
                </div>
                <!-- //수정 06/02 -->
                <!-- end -->

            </div>
        </div>
        <!-- //상품별 -->
    </div>

    </div>
</div>
<!-- //본문 -->

<%-- 상품별 아이템 --%>
<script id="productItemTemplate" type="text/x-jquery-tmpl">
    <tr class="row">
        <td>{{= index }}</td>
        <td class="product">{{= PRD_MST_NM }}</td>
        <td>{{= StringUtil.setComma(TOTAL_RECEIPT) }}</td>
        <td>{{= StringUtil.setComma(TOTAL_WAITING_TO_JOIN) }}</td>
        <td>{{= StringUtil.setComma(TOTAL_JOIN) }}</td>
        <td>{{= StringUtil.setComma(TOTAL_EXPECTED_RETURN) }}</td>
    </tr>
</script>

<!-- 팝업 : 기간 선택  -->
<div id="popupDate" class="layer-popup2">
    <div class="layer-inner">
        <div class="contain-head">
            <p class="text-title-type2">기간 선택</p>
        </div>
        <hr class="divline-type1" >
        <div class="contain-body">            
            <div class="box-btn-form">
                <button onclick="javascript:DateUtil.fnDateSet('popupEndDate', 'popupStartDate', 0, 0, 0, 0, 0, 0,  '-');">오늘</button>
                <button onclick="javascript:DateUtil.fnDateSet('popupEndDate', 'popupStartDate', 0, 0, 0, 0, 0, -7,  '-');">일주일</button>
                <button onclick="javascript:DateUtil.fnDateSet('popupEndDate', 'popupStartDate', 0, 0, 0, 0, 0, -15,  '-');">15일</button>
                <button onclick="javascript:DateUtil.fnDateSet('popupEndDate', 'popupStartDate', 0, 0, 0, 0, -1, 0,  '-');">30일</button>
                <button class="on">직접선택</button>
            </div>
            <div class="box-reward-period">
                <dl class="form-period">
                    <dt>시작일</dt>
                    <dd><input type="text" id="popupStartDate" class="pickadate"><button class="btn-calendar" id="popupStartDateBtn">기간선택</button></dd>
                </dl>
                <dl class="form-period">
                    <dt>종료일</dt>
                    <dd><input type="text" id="popupEndDate" class="pickadate"><button class="btn-calendar" id="popupEndDateBtn">기간선택</button></dd>
                </dl>
            </div>
            <div class="btn-layer-type1">
                <span class="btn-type-text1"><button id="btnDateSave">저장</button></span>
            </div>
        </div>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</div>
<!-- //팝업 : 기간 선택 -->

<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/echart/echarts.min.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>

<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/pickadate/picker.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/pickadate/picker.date.js"></script>

<%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
    
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script>
    $(function () {
        var $areaContent = $(".area-content"),
            $dailyChartDiv = $areaContent.find("#dailyChartDiv"),
            $dailyChartNone = $areaContent.find("#dailyChartNone"),
            $monthlyChartDiv = $areaContent.find("#monthlyChartDiv"),
            $monthlyChartNone = $areaContent.find("#monthlyChartNone"),
            $byProductListNone = $areaContent.find("#byProductListNone"),
            $byProductList = $areaContent.find("#byProductList");
        var $productItemTemplate = $("#productItemTemplate");
        // 레이어 - 약관
        $areaContent.on("click", "a.agreement1", function() {
            $.common.layer.term($(this).attr("data-type"), $(this).attr("data-gbn"));
        });
        // 기간 선택 팝업
        var $popupDate = $("#popupDate"),
            $popupStartDate = $popupDate.find("#popupStartDate"),
            $popupEndDate = $popupDate.find("#popupEndDate"),
            fnOnPopupDateSelected;
        // pickadate
        $popupStartDate.pickadate();
        $popupEndDate.pickadate();
        $popupDate.on("click", "#popupStartDateBtn", function() {
            $popupStartDate.focus();
        })
        $popupDate.on("click", "#popupEndDateBtn", function() {
            $popupEndDate.focus();
        })
        // 기간 선택 완료
        $popupDate.off("click", ".btn-close");
        $popupDate.on("click", "#btnDateSave", function() {
            if (fnOnPopupDateSelected) {
                fnOnPopupDateSelected.apply();
            }
        });
        
        // 탭 선택
        $('.box-tab-head button').on('click',function(){
            var type = $(this).parent().attr("data-type");
            if (type == "daily") {
                searchDaily();
            } else if (type == "monthly") {
                searchMonthly();
            } else if (type == "byProduct") {
                searchProduct();
            }
        });
            
        // 일별
        var $dailySearchStartDate = $areaContent.find("#dailySearchStartDate");
        var $dailySearchEndDate = $areaContent.find("#dailySearchEndDate");
        // 일별 초기값 - 1주일
        DateUtil.fnDateSet("dailySearchEndDate", "dailySearchStartDate", 0, 0, 0, 0, 0, -7,  "-");
        // 일별 검색 기간 팝업
        $areaContent.on("click", "#dailySearchStartDate, #dailySearchEndDate, #dailySearchStartDateBtn, #dailySearchEndDateBtn", function() {
            $popupStartDate.val($dailySearchStartDate.val());
            $popupEndDate.val($dailySearchEndDate.val());
            fnOnPopupDateSelected = saveDailySearchDate;
            $.common.layer.open($popupDate);
        });
        // 일별 검색 기간 저장
        function saveDailySearchDate() {
            $dailySearchStartDate.val($popupStartDate.val());
            $dailySearchEndDate.val($popupEndDate.val());
            $.common.layer.hide($popupDate);
            searchDaily();
        }
        // 일별 조회
        function searchDaily() {
            var param = {
                searchStartDate : $dailySearchStartDate.val(),
                searchEndDate : $dailySearchEndDate.val()
            };
            $.postJsonAjax($.action.myplanner.performance.daily.list.ajax(), param, function (data) {

                if (data.data.xAxis.length > 0) {

                    $dailyChartDiv.show();
                    $dailyChartNone.hide();

                    // 일별 차트
                    var dailyChart = echarts.init(document.getElementById("dailyChart"));
                    var dailyChartOption = {
                        tooltip: {
                            trigger: "axis"
                        },
                        legend: {
                            data:[ "접수", "가입대기", "가입" ]
                        }
                    };
                
                    // 접수건수
                    $areaContent.find("#dailyTotalReceipt").text(StringUtil.setComma(data.dailyTotalReceipt));
                    // 가입대기건수
                    $areaContent.find("#dailyTotalWaitingToJoin").text(StringUtil.setComma(data.dailyTotalWaitingToJoin));
                    // 가입건수
                    $areaContent.find("#dailyTotalJoin").text(StringUtil.setComma(data.dailyTotalJoin));
                    // 예상수익
                    $areaContent.find("#dailyTotalExpectedReturn").text(StringUtil.setComma(data.dailyTotalExpectedReturn) + "원");
                    // 차트
                    $.extend(dailyChartOption, {
                        xAxis : {
                            data : data.data.xAxis
                        },
                        yAxis : {
                            
                        },
                        series : [
                            {
                                name : "접수",
                                type : "line",
                                data : data.data.receipt
                            },
                            {
                                name : "가입대기",
                                type : "line",
                                data : data.data.waitingToJoin
                            },
                            {
                                name : "가입",
                                type : "line",
                                data : data.data.join
                            }
                        ],
                        dataZoom: [
                            {
                                startValue: data.data.xAxis[0],
                                endValue: (data.data.xAxis.length > 8)? data.data.xAxis[6] : data.data.xAxis[data.data.xAxis.length - 1] 
                            }, {
                                type: "inside"
                            }
                        ]
                    });
                    dailyChart.setOption(dailyChartOption);
                    
                } else {

                    $dailyChartDiv.hide();
                    $dailyChartNone.show();
                    
                }
            });   
        }
        // 일별 차트 조회
        searchDaily();

        // 월별
        var $monthlySearchYear = $areaContent.find("#monthlySearchYear");
        $monthlySearchYear.on("change", function() {
            searchMonthly();
        });
        // 월별 조회
        function searchMonthly() {
            var param = {
                searchYear : $monthlySearchYear.val(),
            };
            $.postJsonAjax($.action.myplanner.performance.monthly.list.ajax(), param, function (data) {

                if (data.data.xAxis.length > 0) {

                    $monthlyChartDiv.show();
                    $monthlyChartNone.hide();

                    var monthlyChart = echarts.init(document.getElementById("monthlyChart"));
                    var monthlyChartOption = {
                        tooltip: {
                            trigger: "axis"
                        },
                        legend: {
                            data:[ "접수", "가입대기", "가입" ]
                        }
                    };
                    
                    // 접수건수
                    $areaContent.find("#monthlyTotalReceipt").text(StringUtil.setComma(data.monthlyTotalReceipt));
                    // 가입대기건수
                    $areaContent.find("#monthlyTotalWaitingToJoin").text(StringUtil.setComma(data.monthlyTotalWaitingToJoin));
                    // 가입건수
                    $areaContent.find("#monthlyTotalJoin").text(StringUtil.setComma(data.monthlyTotalJoin));
                    // 예상수익
                    $areaContent.find("#monthlyTotalExpectedReturn").text(StringUtil.setComma(data.monthlyTotalExpectedReturn) + "원");
                    // 차트
                    $.extend(monthlyChartOption, {
                        xAxis : {
                            data : data.data.xAxis
                        },
                        yAxis : {
                            
                        },
                        series : [
                            {
                                name : "접수",
                                type : "line",
                                data : data.data.receipt
                            },
                            {
                                name : "가입대기",
                                type : "line",
                                data : data.data.waitingToJoin
                            },
                            {
                                name : "가입",
                                type : "line",
                                data : data.data.join
                            }
                        ],
                        dataZoom: [
                            {
                                startValue: data.data.xAxis[0],
                                endValue: data.data.xAxis[11] 
                            }, {
                                type: "inside"
                            }
                        ]
                    });
                    monthlyChart.setOption(monthlyChartOption);
                    
                } else {

                    $monthlyChartDiv.hide();
                    $monthlyChartNone.show();
                    
                }
            });   
        }
        
        // 상품별
        var $productSearchStartDate = $areaContent.find("#productSearchStartDate");
        var $productSearchEndDate = $areaContent.find("#productSearchEndDate");
        // 상품별 초기값 - 1주일
        DateUtil.fnDateSet("productSearchEndDate", "productSearchStartDate", 0, 0, 0, 0, 0, -7,  "-");
        // 상품별 검색 기간 팝업
        $areaContent.on("click", "#productSearchStartDate, #productSearchEndDate, #productSearchStartDateBtn, #productSearchEndDateBtn", function() {
            $popupStartDate.val($productSearchStartDate.val());
            $popupEndDate.val($productSearchEndDate.val());
            fnOnPopupDateSelected = saveByProductSearchDate;
            $.common.layer.open($popupDate);
        });
        // 상품별검색 기간 저장
        function saveByProductSearchDate() {
            $productSearchStartDate.val($popupStartDate.val());
            $productSearchEndDate.val($popupEndDate.val());
            $.common.layer.hide($popupDate);
            searchProduct();
        }
        // 상품별 조회
        function searchProduct() {
            var param = {
                searchStartDate : $productSearchStartDate.val(),
                searchEndDate : $productSearchEndDate.val()
            };
            $.postJsonAjax($.action.myplanner.performance.product.list.ajax(), param, function (data) {
                if (data.list && data.list.length > 0) {
                    $byProductListNone.hide();
                    $byProductList.find("tr.row").remove();
                    $.each(data.list, function(i, row) {
                       row["index"] = i + 1;
                       $byProductList.append($productItemTemplate.tmpl(row)); 
                    });
                } else {
                    $byProductListNone.show();
                }
            });   
        }
    });
</script>

</body>
</html>