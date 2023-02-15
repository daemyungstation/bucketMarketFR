<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/payment.css"> 
</head>
<body class="">
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-top-type3">
            <div class="area-inner">
                <div class="contain-order-top<c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') and info.PRD_MST_IRG_YN eq 'Y' }"> contain-order-irregular</c:if>">
                    <div class="box-order-inner">
                        <div class="box-order-title">
                            <span class="order-title"><c:out value="${info.PRD_MST_NM }"/></span>
                            <p class="text-account"><span><fmt:formatNumber value="${commandMap.ORD_MST_CNT }" type="number"/></span>개의 가입구좌</p>
                        </div>
                        <div class="box-order-details array4">
                            <ul>
                                <%-- 즉발(채권) --%>
                                <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y' }">
                                    <li><p class="details-title">총 지원혜택</p><span class="text-point1"><c:out value="${info.PRD_MST_SPT_TXT }"/></li>
                                    <li><p class="details-title">즉시 지원혜택</p><span class="text-point1"><fmt:formatNumber value="${info.REL_AMT }" type="number"/></span> 원</li>
                                    <li><p class="details-title">상품금액</p><span class="text-point1"><fmt:formatNumber value="${info.PROD_AMT }" type="number"/></span> 원</li>
                                    <li><p class="details-title">납부회차</p><span class="text-point1"><fmt:formatNumber value="${info.EXPR_NO }" type="number"/></span> 원</li>
                                </c:if>
                                <%-- 월지원형/즉발(비채권)/렌탈/할부지원 --%>
                                <c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') }">
                                    <li><p class="details-title">월지원금</p><span class="text-point1"><fmt:formatNumber value="${info.MON_REL_AMT }" type="number"/></span> 원</li>
                                    <li><p class="details-title">지원회차</p><span class="text-point1"><fmt:formatNumber value="${info.REL_CNT }" type="number"/></span> 회</li>
                                    <%-- 정기형 --%>
                                    <c:if test="${info.PRD_MST_IRG_YN ne 'Y' }">
                                        <li><p class="details-title">월납부금</p><span class="text-point1"><fmt:formatNumber value="${info.MON_PAY_AMT }" type="number"/></span> 원</li>
                                        <li><p class="details-title">납부회차</p><span class="text-point1"><fmt:formatNumber value="${info.EXPR_NO }" type="number"/></span> 회</li>
                                    </c:if>
                                    <%-- 비정기형 --%>
                                    <c:if test="${info.PRD_MST_IRG_YN eq 'Y' }">
                                        <li>
                                            <p class="details-title">월납부금</p>
                                            <c:if test="${not empty info.PRD_MST_PAY_AMT1 }">
                                                <span class="text-point1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT1 }" type="number"/></span> 원<br/>
                                            </c:if>
                                            <c:if test="${not empty info.PRD_MST_PAY_AMT2 }">
                                                <span class="text-point1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT2 }" type="number"/></span> 원<br/>
                                            </c:if>
                                            <c:if test="${not empty info.PRD_MST_PAY_AMT3 }">
                                                <span class="text-point1"><fmt:formatNumber value="${info.PRD_MST_PAY_AMT3 }" type="number"/></span> 원
                                            </c:if>
                                            
                                        </li>
                                        <li>
                                            <p class="details-title">납부회차</p>
                                            <c:if test="${not empty info.PRD_MST_PAY_CNT1 }">
                                                <span class="text-point1"><c:out value="${info.PRD_MST_PAY_CNT1 }"/></span> 회<br/>
                                            </c:if>
                                            <c:if test="${not empty info.PRD_MST_PAY_CNT2 }">
                                                <span class="text-point1"><c:out value="${info.PRD_MST_PAY_CNT2 }"/></span> 회<br/>
                                            </c:if>
                                            <c:if test="${not empty info.PRD_MST_PAY_CNT3 }">
                                                <span class="text-point1"><c:out value="${info.PRD_MST_PAY_CNT3 }"/></span> 회<br/>
                                            </c:if>
                                            
                                        </li>
                                    </c:if>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="contain-order-inner">
                    <h3 class="title">전자청약 상품가입 신청</h3>
                    <div class="contain-step">
                        <form name="contractForm" id="contractForm">
                            <div class="box-title-step">
                                <p class="step-num on"><span>1</span>약관동의 및 본인확인</p>
                                <p class="step-num"><span>2</span>가입정보입력</p>
                                <p class="step-num"><span>3</span>가입완료</p>
                            </div>
                            <div class="box-inner">
                                <span class="btn-type-allagree">
                                    <label class="form-checkbox all-agreement" data-agr_mst_title="전자청약 약관 설명서"><input type="checkbox" class="check-all"> 전자청약 상품 가입약관에 모두 동의합니다</label>
                                </span>
                                <div class="box-agreement">
                                    <c:forEach var="row" items="${termList }" varStatus="stat">
                                        <span class="act-agreement">
                                            <label class="form-checkbox row-agreement" data-cmn_com_idx="<c:out value="${row.CMN_COM_IDX }"/>" data-agr_mst_title="<c:out value="${row.CMN_COM_ETC3 }"/>">
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
                                            </label><span class="btn-agree-check" data-cmn_com_idx="<c:out value="${row.CMN_COM_IDX }"/>" data-agr_mst_title="<c:out value="${row.CMN_COM_ETC3 }"/>"><button>내용확인</button></span>
                                        </span>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="fixed-box-button">
                                <span class="btn-type-text1 disabled"><button>본인확인</button></span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- //Body --%>
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
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
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
        <div class="area-content-layer">
            <div class="area-inner">
                <div class="contain-agreement type2">
                    {{if CMN_COM_IDX == ""}}
                        <c:forEach var="row" items="${termList}">
                            <span class="head-title"><c:out value="${row.CMN_COM_ETC3 }"/></span>
                            <div class="box-agreement scroll type2">
                                <div class="box-inner">
                                    <c:out value="${row.AGR_MST_CONTENTS}" escapeXml="false"/>
                                </div>
                            </div>
                            <c:if test="${row.AGR_MST_CFM_FRT_YN eq 'Y' }">
                                {{tmpl '#cancellationTemplate'}}
                            </c:if>
                        </c:forEach>
                    {{else CMN_COM_IDX != ""}}
                        <c:forEach var="row" items="${termList}">
                            {{if CMN_COM_IDX == "<c:out value="${row.CMN_COM_IDX}"/>"}}
                                <span class="head-title"><c:out value="${row.CMN_COM_ETC3 }"/></span>
                                <div class="box-agreement scroll type2 full">
                                    <div class="box-inner">
                                        <c:out value="${row.AGR_MST_CONTENTS}" escapeXml="false"/>
                                    </div>
                                </div>
                                <c:if test="${row.AGR_MST_CFM_FRT_YN eq 'Y' }">
                                    {{tmpl '#cancellationTemplate'}}
                                </c:if>
                            {{/if}}
                        </c:forEach>
                    {{/if}}
                </div>
            </div>
        </div>
    </script>
    <script>
        $(function () {
            var $areaBody = $(".area-body"),
                $layerPopup = $(".layer-popup1"),
                $contractForm = $areaBody.find("#contractForm"),
                $joinStepForm = $("#joinStepForm"),
                $termsForm = $("#termsForm");
            var $termsTemplate = $("#termsTemplate");
            <%-- 약관 전체동의 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".all-agreement", function (e) {
                e.preventDefault();
                var $checkbox = $(this).find("input[type='checkbox']");
                var checked = !$checkbox.is(":checked");
                if (checked) {
                    openTermsLayer("", $(this).data("agr_mst_title"), function () {
                        checkboxToggle(checked);
                    });
                } else {
                    checkboxToggle(checked);
                }
            });
            <%-- 약관 개별동의 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".row-agreement", function (e) {
                e.preventDefault();
                var $this = $(this),
                    $checkbox = $this.find("input[type='checkbox']");
                var checked = !$checkbox.is(":checked");
                if (checked) {
                    openTermsLayer($this.data("cmn_com_idx"), $this.data("agr_mst_title"), function () {
                        $this.toggleClass("checked");
                        $checkbox.attr("checked", checked);
                    });
                } else {
                    $this.toggleClass("checked");
                    $checkbox.attr("checked", checked);
                }
                $contractForm.valid();
            });
            
            <%-- 내용 확인 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".btn-agree-check", function (e) {
                e.preventDefault();
                var $this = $(this),
                    $span = $this.prev(".row-agreement");
                openTermsLayer($this.data("cmn_com_idx"), $this.data("agr_mst_title"));
                $span.addClass("checked");
                $span.find("input[type='checkbox']").attr("checked", true);
                $contractForm.valid();
            });
            
            <%-- 약관 레이어 호출 --%>
            function openTermsLayer (cmnComIdx, agrMstTitle, callback) {
                $layerPopup.requestLayerByTemplate($termsTemplate.tmpl({CMN_COM_IDX : cmnComIdx, AGR_MST_TITLE : agrMstTitle}), "layer-agreement2", callback);
            }
            <%-- 체크박스 토글 --%>
            function checkboxToggle(checked) {
                var $checkboxs = $areaBody.find(".form-checkbox").not(".check-all");
                $checkboxs.each(function () {
                    var $this = $(this);
                    if (checked) {
                        $this.addClass("checked");
                    } else {
                        $this.removeClass("checked");
                    }
                    $this.find("input[type='checkbox']").attr("checked", checked);
                });
                $contractForm.valid();
            }
            <%-- 본인확인 버튼 클릭 이벤트 --%>
            $contractForm.validate({
                submitHandler : function(form) {
                    $.common.check.oneself("", function (data) {
                        if (data.isSuccess) {
                            var params = new Array();
                            $(form).find(".terms:checked").each(function () {
                                params.push(TagUtil.createDynamicInput("hidden", "MEM_AGR_TRM_CD", this.value));
                            });
                            $termsForm.append(params);
                            $.postSyncJsonAjax($.action.contract.join.form.save.ajax(), $termsForm.serialize(), function () {
                                $.requestPage($.action.contract.join.step2.form(), $joinStepForm.serializeObject());
                            });
                        } else {
                            alert(data.resultMessage + "\n" + "[" + data.resultCode + "]");
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>