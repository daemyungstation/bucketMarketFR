<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/payment.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title"/>
        <jsp:param name="headerTitle" value="간편 상담 신청"/>
    </jsp:include>
    <%-- 데이드 기획 요청. 2022-06-14 --%>
    <script type="text/javascript" src="//s3-ap-northeast-1.amazonaws.com/tradingworks-scripts/js/igw_tw_script_v2.js"></script>
    <%-- 데이드 기획 요청. 2022-06-14 --%>
    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-contract-title">
              <!-- 마지막 단계입니다.<br /> 약관 동의 후, 본인인증을 완료해주세요. -->
                        혜택 제공에 필요한 약관 동의 후,<br />본인 인증을 완료해주세요
            </div>
            
            <%-- 약관 동의 --%>
            <div class="contain-product11">
                <div class="contain-inner">
                    <div class="contain-step on">
                        <form name="contractForm" id="contractForm">
                            <dl class="box-form" style="margin:0;padding:10px 35px 0px 35px;box-sizing:border-box;">
                                <dt>본인인증 (2/2)</dt>
                            </dl>
                            <div class="box-inner" style="padding:10px 35px 0px 35px;">
                                <span class="btn-type-allagree" data-agr_mst_title="전자청약 약관 설명서"><button>상품약관에 모두 동의합니다</button></span>
                                <div class="box-agreement">
                                    <c:forEach var="row" items="${termList }" varStatus="stat">
                                        <span class="act-agreement" data-cmn_com_idx="<c:out value="${row.CMN_COM_IDX }"/>" data-agr_mst_title="<c:out value="${row.CMN_COM_ETC3 }"/>">
                                            <label class="form-checkbox">
                                                <c:choose>
                                                    <c:when test="${row.CMN_COM_IDX eq Code.TERM_MARKETING }">
                                                        <input type="checkbox" name="MEM_AGR_TRM_CD<c:out value="${stat.index }"/>" class="terms" value="<c:out value="${row.CMN_COM_IDX }"/>"/>
                                                        <i>(선택)</i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="checkbox" name="MEM_AGR_TRM_CD<c:out value="${stat.index }"/>" class="terms required" value="<c:out value="${row.CMN_COM_IDX }"/>"/>
                                                        <i class="necessary">(필수)</i>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:out value="${row.CMN_COM_ETC3 }"/>
                                            </label>
                                        </span>
                                    </c:forEach>
                                </div>
                            </div>
                            <%-- 하단 고정버튼 --%>
                            <div class="fixed-box-button">
                                <span class="btn-type-text1 disabled"><button>본인인증</button></span>
                            </div>
                            <%-- //하단 고정버튼 --%>
                        </form>
                    </div>
                </div>
            </div>
            <%-- //가입결제 --%>
            <hr class="divline-type2" >
            <div class="contain-contract-desc">
              <!-- 상품 신청 및 가입을 위한 자필서명은<br />휴대폰 본인인증으로 대체됩니다. -->
                        본인인증만 완료하시면,<br />전문상담사가 전화를 드립니다.
            </div>
        </div>
    </div>
    <%-- //본문 --%>
    <form name="termsForm" id="termsForm"></form>
    <form name="joinStepForm" id="joinStepForm">
        <input type="hidden" name="PRD_MST_NO" value="<c:out value="${commandMap.PRD_MST_NO }"/>"/>
        <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">
            <c:forEach var="PRD_OPT_IDX" items="${commandMap.PRD_OPT_IDXs }">
                <input type="hidden" name="PRD_OPT_IDXs" value="<c:out value="${PRD_OPT_IDX }"/>"/>
            </c:forEach>
        </c:if>
        <input type="hidden" name="ORD_MST_CNT" value="<c:out value="${commandMap.ORD_MST_CNT }"/>"/>
    </form>
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
    <script id="cancellationTemplate" type="text/x-jquery-tmpl">
        <c:if test="${not empty cancellationAmountList }">
            <h2 class="table-title"><c:out value="${info.PRD_MST_NM }"/> 해약환급금 및 환급율</h2>
            <div class="box-scroll-table2">
                <c:set var="index" value="0"/>
                <c:forEach var="row" items="${cancellationAmountList }" varStatus="stat">
                    <c:if test="${stat.index mod 30 eq 0}">
                        <table>
                        <tbody>
                            <tr>
                                <th>회차</th>
                                <th>환급금</th>
                            </tr>
                    </c:if>
                    <tr>
                        <th><c:out value="${row.NO}"/></th>
                        <td><fmt:formatNumber value="${row.RESN_AMT}" type="number"/></td>
                    </tr>
                    <c:set var="index" value="${index + 1}"/>
                    <c:if test="${(index gt 0 and index mod 30 eq 0) or stat.last}">
                        </tbody>
                        </table>
                        <c:set var="index" value="0"/>
                    </c:if>
                </c:forEach>
            </div>
        </c:if>
    </script>
    <script id="termsTemplate" type="text/x-jquery-tmpl">
        <header class="area-header-layer">
            <div class="area-inner">
                <h1 class="title">\${AGR_MST_TITLE}</h1>
                <span class="btn-close"><button>닫기</button></span>
            </div>
        </header>
        <div class="area-content-layer bt50">
            <div class="area-inner">
                <div class="contain-agreement type2">
                    {{if CMN_COM_IDX == ""}}
                        <c:forEach var="row" items="${termList}">
                            <h2 class="title"><c:out value="${row.CMN_COM_ETC3 }"/></h2>
                            <div class="box-agreement scroll type2">
                                <div class="box-inner">
                                    <c:out value="${row.AGR_MST_CONTENTS}" escapeXml="false"/>
                                </div>
                            </div>
                        </c:forEach>
                    {{else CMN_COM_IDX != ""}}
                        <c:forEach var="row" items="${termList}">
                            {{if CMN_COM_IDX == "<c:out value="${row.CMN_COM_IDX}"/>"}}
                                <h2 class="title"><c:out value="${row.CMN_COM_ETC3 }"/></h2>
                                <div class="box-agreement scroll type2">
                                    <div class="box-inner">
                                        <c:out value="${row.AGR_MST_CONTENTS}" escapeXml="false"/>
                                    </div>
                                </div>
                            {{/if}}
                        </c:forEach>
                    {{/if}}
                    {{if CMN_COM_IDX == ""}}
                        <c:forEach var="row" items="${termList}">
                            <c:if test="${row.AGR_MST_CFM_FRT_YN eq 'Y' }">
                                <h2 class="title">추가 안내사항</h2>
                                <div class="box-agreement scroll type2">
                                <div class="box-inner">
                                <div class="content-terms">
                                    <div class="box-privacy">
                                        <dl>
                                            <dt>부가서비스</dt>
                                            <dd>
                                                - 부가서비스로 제공되는 멤버십혜택 중 가장 대표적인 리조트는 가입 후 연 10박씩, 무기명 회원가에 1~2만원 추가한 금액으로 우대 혜택을 드리며, 관광진흥법 등 관련 법령에 의한 리조트 정회원 우선 예약 제도에 따라 주말, 성수기, 연휴, 공휴일 전일은 이용이 제한됩니다.<br>
                                                - 멤버십서비스는 당사 또는 제휴사 사정에 따라 언제든지 축소 또는 변경될 수 있는 부가서비스입니다.<br>
                                                - 리조트는 예약 후 본인이 직접 방문해야 이용이 가능하며, 상황에 따라 5일에서 60일 이내에 예약을 하셔야 합니다.<br>
                                                - 이용 시 필요한 멤버십 카드는 모바일로 제공되며, 모바일 멤버쉽카드 이용방법은 통화종료 후 발송되는 문자메세지를 통해 확인해주시기 바랍니다.<br>
                                                - 기타 부가서비스 혜택에 대한 자세한 사항과 이용조건은 대명아임레디 홈페이지 통해 확인 가능합니다.
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="box-privacy">
                                        <dl>
                                            <dt>환급의무액</dt>
                                            <dd>
                                                - 2021년 12월 말 기준으로 (주)대명스테이션의 총 고객환급의무액은 약 663,443,044천원이며, 상조 관련 자산은 약 741,108,264천원입니다.<br>
                                                - (주)대명스테이션은 인덕회계법인의 공인회계사를 통해 회계감사를 받고 있습니다.
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="box-privacy">
                                        <dl>
                                            <dt>소비자피해보상 계약</dt>
                                            <dd>
                                                - 소비자 피해를 막기 위해 ㈜대명스테이션은 상조보증공제조합과 공제 계약을 체결하였습니다.<br>
                                                - 이의 계약기간은 2021.01.01.부터 12.31.까지로 특별한 사정이 없는 한 자동연장됩니다.<br>
                                                - 소비자피해보상금은 고객불입금인 실 서비스 납입금의 50%이며, 지급의무자는 상조보증공제조합입니다.<br>
                                                - 피해보상금은 할부거래에 관한 법률 제27조 제4항에 해당하는 폐업, 등록 취소 등의 사유 발생 시 지급됩니다.
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                                </div>
                                </div>
                                {{tmpl '#cancellationTemplate'}}
                            </c:if>
                        </c:forEach>
                    {{else CMN_COM_IDX != ""}}
                        <c:forEach var="row" items="${termList}">
                            {{if CMN_COM_IDX == "<c:out value="${row.CMN_COM_IDX}"/>"}}
                                <c:if test="${row.AGR_MST_CFM_FRT_YN eq 'Y' }">
                                    <h2 class="title">추가 안내사항</h2>
                                    <div class="box-agreement scroll type2">
                                    <div class="box-inner">
                                    <div class="content-terms">
                                        <div class="box-privacy">
                                            <dl>
                                                <dt>부가서비스</dt>
                                                <dd>
                                                    - 부가서비스로 제공되는 멤버십혜택 중 가장 대표적인 리조트는 가입 후 연 10박씩, 무기명 회원가에 1~2만원 추가한 금액으로 우대 혜택을 드리며, 관광진흥법 등 관련 법령에 의한 리조트 정회원 우선 예약 제도에 따라 주말, 성수기, 연휴, 공휴일 전일은 이용이 제한됩니다.<br>
                                                    - 멤버십서비스는 당사 또는 제휴사 사정에 따라 언제든지 축소 또는 변경될 수 있는 부가서비스입니다.<br>
                                                    - 리조트는 예약 후 본인이 직접 방문해야 이용이 가능하며, 상황에 따라 5일에서 60일 이내에 예약을 하셔야 합니다.<br>
                                                    - 이용 시 필요한 멤버십 카드는 모바일로 제공되며, 모바일 멤버쉽카드 이용방법은 통화종료 후 발송되는 문자메세지를 통해 확인해주시기 바랍니다.<br>
                                                    - 기타 부가서비스 혜택에 대한 자세한 사항과 이용조건은 대명아임레디 홈페이지 통해 확인 가능합니다.
                                                </dd>
                                            </dl>
                                        </div>
                                        <div class="box-privacy">
                                            <dl>
                                                <dt>환급의무액</dt>
                                                <dd>
                                                    - 2021년 12월 말 기준으로 (주)대명스테이션의 총 고객환급의무액은 약 663,443,044천원이며, 상조 관련 자산은 약 741,108,264천원입니다.
                                                    - (주)대명스테이션은 인덕회계법인의 공인회계사를 통해 회계감사를 받고 있습니다.
                                                </dd>
                                            </dl>
                                        </div>
                                        <div class="box-privacy">
                                            <dl>
                                                <dt>소비자피해보상 계약</dt>
                                                <dd>
                                                    - 소비자 피해를 막기 위해 ㈜대명스테이션은 상조보증공제조합과 공제 계약을 체결하였습니다.<br>
                                                    - 이의 계약기간은 2021.01.01.부터 12.31.까지로 특별한 사정이 없는 한 자동연장됩니다.<br>
                                                    - 소비자피해보상금은 고객불입금인 실 서비스 납입금의 50%이며, 지급의무자는 상조보증공제조합입니다.<br>
                                                    - 피해보상금은 할부거래에 관한 법률 제27조 제4항에 해당하는 폐업, 등록 취소 등의 사유 발생 시 지급됩니다.
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                    </div>
                                    </div>
                                    {{tmpl '#cancellationTemplate'}}
                                </c:if>
                            {{/if}}
                        </c:forEach>
                    {{/if}}
                </div>
            </div>
        </div>
        <div><button class="btn-close btn-footer">확인</button></div>
    </script>
    <script>
        $(function () {
            var $areaContent = $(".area-content"),
                $layerPopup = $(".layer-popup1"),
                $contractForm = $areaContent.find("#contractForm"),
                $joinStepForm = $("#joinStepForm"),
                $termsForm = $("#termsForm");
            var $termsTemplate = $("#termsTemplate");
            <%-- 약관 전체동의 버튼 클릭 이벤트 --%>
            $areaContent.on("click", ".btn-type-allagree", function (e) {
                e.preventDefault();
                $(this).toggleClass("checked");
                if ($(this).hasClass("checked")) {
                    openTermsLayer("", $(this).data("agr_mst_title"), function () {
                        checkboxToggle(true);
                        $contractForm.valid();
                    });
                } else {
                    checkboxToggle(false);
                    $contractForm.valid();
                }
            });
            <%-- 약관 개별동의 버튼 클릭 이벤트 --%>
            $areaContent.on("change", ".terms", function () {
                var $checkbox = $(this);
                var checked = $checkbox.is(":checked");
                if (checked) {
                    var $span = $checkbox.closest(".act-agreement")
                    openTermsLayer($span.data("cmn_com_idx"), $span.data("agr_mst_title"));
                }
                $contractForm.valid();
            });
            <%-- 약관 레이어 호출 --%>
            function openTermsLayer (cmnComIdx, agrMstTitle, callback) {
                $layerPopup.requestLayerByTemplate($termsTemplate.tmpl({CMN_COM_IDX : cmnComIdx, AGR_MST_TITLE : agrMstTitle}), null, callback);
            }
            <%-- 체크박스 토글 --%>
            function checkboxToggle (checked) {
                var $checkboxs = $areaContent.find(".form-checkbox");
                $checkboxs.each(function () {
                    var $this = $(this);
                    if (checked) {
                        $this.addClass("checked");
                    } else {
                        $this.removeClass("checked");
                    }
                    $this.find("input[type='checkbox']").attr("checked", checked);
                });
            }
            <%-- 본인확인 버튼 클릭 이벤트 --%>
            $contractForm.validate({
                submitHandler : function(form) {
                    if ($.resources.isApp && $.resources.isAndroid) {    
                        $.common.check.oneself("", function (data) {
                            if (data.isSuccess) {
                                var params = new Array();
                                $(form).find(".terms:checked").each(function () {
                                    params.push(TagUtil.createDynamicInput("hidden", "MEM_AGR_TRM_CD", this.value));
                                });
                                $termsForm.append(params);
                                $.postSyncJsonAjax($.action.contract.join.form.save.ajax(), $termsForm.serialize(), function () {
                                    fbq('track', 'InitiateCheckout');
                                    var _nao={};
                                    _nao["cnv"] = wcs.cnv("3","10");
                                    wcs_do(_nao);
                                    <%-- 데이드 기획 요청. 2022-03-16 --%>
                                    kakaoPixel('4921613175266887595').purchase('conversion');
                                    <%-- 데이드 기획 요청. 2022-06-14 --%>
                                    IGATrackingGet({tw_type : "purchase", revenue : 1000});
                                    <%-- 데이드 기획 요청. 2022-06-14 --%>
                                    gtag('event', 'conversion', {
                                        'send_to': 'AW-316241620/wvR7CLCUn6gDENTt5ZYB',
                                        'transaction_id': ''
                                    });
                                    <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                                    $.ajax({
                                        url : "https://mobile.midas-i.com/roianal.mezzo/tracking?cmp_no=2212&depth=3",
                                        dataType : "jsonp",
                                        async : true, 
                                        timeout: 500,
                                        success: function(data) { $.requestPage($.action.contract.join.step3.form(), $joinStepForm.serializeObject()); }, 
                                        error : function(e) { $.requestPage($.action.contract.join.step3.form(), $joinStepForm.serializeObject()); }
                                    });
                                    
                                    </c:if>
                                    
                                    <c:if test="${info.PRD_MST_TYPE ne Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                                    $.postSyncJsonAjax($.action.contract.join.data.exists.ajax(), null, function (data) {
                                        if (data.isLogin && data.isDataExists) {
                                            var _nao={};
                                            _nao["cnv"] = wcs.cnv("5","1000");
                                            wcs_do(_nao);
                                            
                                            $.ajax({
                                                url : "https://mobile.midas-i.com/roianal.mezzo/tracking?cmp_no=2212&depth=3",
                                                dataType : "jsonp",
                                                async : true, 
                                                timeout: 500,
                                                success: function(data) { $joinStepForm.postSubmit($.action.contract.join.regist()); }, 
                                                error : function(e) { $joinStepForm.postSubmit($.action.contract.join.regist()); }
                                            });
                                            
                                        } else {
                                            $joinStepForm.getSubmit($.action.contract.join.step1.form());
                                        }
                                    });
                                    </c:if>
                                });
                            } else {
                                alert(data.resultMessage + "\n" + "[" + data.resultCode + "]");
                            }
                        });
                    }else{
                        var redirect = $.action.contract.join.step2.complete();
                        var params = new Array();
                        $(form).find(".terms:checked").each(function () {
                            params.push(TagUtil.createDynamicInput("hidden", "MEM_AGR_TRM_CD", this.value));
                        });
                        $joinStepForm.find("input").each(function () {
                            params.push(TagUtil.createDynamicInput("hidden", $(this).attr("name"), this.value));
                        });
                        $termsForm.append(params);
                        $.postSyncJsonAjax($.action.contract.join.form.save.ajax(), $termsForm.serialize(), function () {
                            fbq('track', 'InitiateCheckout');
                            <%-- 데이드 기획 요청. 2022-03-16 --%>
                            kakaoPixel('4921613175266887595').purchase('conversion');
                            <%-- 데이드 기획 요청. 2022-06-14 --%>
                            IGATrackingGet({tw_type : "purchase", revenue : 1000});
                            <%-- 데이드 기획 요청. 2022-06-14 --%>
                            gtag('event', 'conversion', {
                                'send_to': 'AW-316241620/wvR7CLCUn6gDENTt5ZYB',
                                'transaction_id': ''
                            });
                            $.common.check.oneselfMove(redirect);                        
                        });
                    }
                    
                }
            });
        });
    </script>
</body>
</html>