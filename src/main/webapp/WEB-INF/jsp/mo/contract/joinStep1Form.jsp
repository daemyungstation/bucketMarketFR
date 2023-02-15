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
            <div class="contain-contract-title2">
                        누적 100만 회원이 이용한 혜택<br>
                        부담없이 상담 먼저 받아보세요.
            </div>
            <div class="contain-product11">
                <div class="contain-inner">
                    <div class="contain-step on border">
                        <form name="contractForm" id="contractForm">
                            <input type="hidden" name="PRD_MST_NO" value="<c:out value="${commandMap.PRD_MST_NO }"/>"/>
                            <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">
                                <c:forEach var="PRD_OPT_IDX" items="${commandMap.PRD_OPT_IDXs }">
                                    <input type="hidden" name="PRD_OPT_IDXs" value="<c:out value="${PRD_OPT_IDX }"/>"/>
                                </c:forEach>
                            </c:if>
                            <input type="hidden" name="ORD_MST_CNT" value="<c:out value="${commandMap.ORD_MST_CNT }"/>"/>
                            
                            <div class="box-inner box-inner2">
                                <dl class="box-form">
                                    <dt><i>(필수)</i>희망 상담 시간</dt>
                                    <dd>
                                        <span class="form-select">
                                            <select name="HPCALL_TIME">
                                                <option value="">상담시간 선택</option>
                                                <c:forEach var="row" items="${happCallList }">
                                                    <option value="<c:out value="${row.CMN_COM_ETC1 }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
                                                </c:forEach>
                                            </select>
                                        </span>
                                        <label class="form-alert" message-target="HPCALL_TIME" data-name="해피콜 상담시간"></label>
                                    </dd>
                                </dl>
                                <c:if test="${isDelivery }">
                                    <dl class="box-form">
                                        <dt>
                                            <i>(필수)</i>배송/설치 정보
                                            <c:if test="${commandMap.ORD_MST_CNT gt 1 }">
                                                <span class="select"><fmt:formatNumber value="${commandMap.ORD_MST_CNT }" type="number"/>개 선택 가능</span>
                                            </c:if>
                                            <input type="hidden" name="INSPL_VALID"/>
                                        </dt>
                                        <dd>
                                            <!-- <label class="form-checkbox"><input type="checkbox" class="contractor-same-add">가입자 주소와 동일</label> -->
                                            <c:if test="${commandMap.ORD_MST_CNT gt 1 }">
                                                <label class="form-checkbox"><input type="checkbox" class="delivery-all-add" >배송지 일괄입력</label>
                                            </c:if>
                                        </dd>
                                        <dd>
                                            <c:forEach begin="1" end="${commandMap.ORD_MST_CNT }" varStatus="stat">
                                                <div class="box-order">
                                                    <span class="product"><c:out value="${info.PRD_MST_SPL_NM }"/></span>
                                                    <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">
                                                        <span class="option">
                                                            <c:forEach var="row" items="${optionList }">
                                                                <c:if test="${commandMap.PRD_OPT_IDXs[stat.index - 1] eq row.PRD_OPT_IDX }">
                                                                    <c:out value="${row.PRD_OPT_DTL }"/>
                                                                </c:if>
                                                            </c:forEach>
                                                        </span>
                                                    </c:if>
                                                    <span class="delivery-area"></span>
                                                    <span class="btn-type-text5 delivery-row-add"><button>배송지 등록</button></span>
                                                </div>
                                            </c:forEach>
                                        </dd>
                                        <dd class="form-alert" message-target="INSPL_VALID" data-name="배송/설치 주소"></dd>
                                    </dl>
                                </c:if>
                                <c:if test="${isEtc }">
                                    <dl class="box-form">
                                        <dt>
                                            <i>(필수)</i>추가정보
                                            <c:if test="${commandMap.ORD_MST_CNT gt 1 }">
                                                <span class="select"><fmt:formatNumber value="${commandMap.ORD_MST_CNT }" type="number"/>개 선택 가능</span>
                                            </c:if>
                                        </dt>
                                        <dd>
                                            <dl class="box-form">
                                                <dt>
                                                    <c:out value="${info.PRD_MST_BND_ID }"/>
                                                    <c:if test="${commandMap.ORD_MST_CNT gt 1 }">
                                                        <span class="select"><label class="form-checkbox"><input type="checkbox" class="etc-all-add">추가정보 일괄입력</label></span>
                                                    </c:if>
                                                </dt>
                                                <c:forEach begin="1" end="${commandMap.ORD_MST_CNT }" varStatus="stat">
                                                    <dd>
                                                        <input type="text" name="ORD_MST_VDR_BNF_ID" value="" maxlength="20"/>
                                                        <label class="form-alert" message-target="ORD_MST_VDR_BNF_ID" data-name="추가정보"></label>
                                                    </dd>
                                                </c:forEach>
                                            </dl>
                                        </dd>
                                    </dl>
                                </c:if>
                            </div>
                            
                            <div class="box-inner box-inner2" style="margin-bottom:120px;">
                                <span class="">
                                    <button type="button" class="btn-agree-txt">상품 약관 및 개인정보 이용 동의
                                </button></span>
                                <div class="box-agreement" id="box-agreement">
                                    <c:set var="term_group" value="" />
                                    <c:forEach var="row" items="${termList }" varStatus="stat">
                                        <c:choose>
                                            <c:when test="${row.CMN_COM_UP_IDX ne term_group }">
                                                <c:set var="term_group" value="${row.CMN_COM_UP_IDX}" />
                                                <span class="act-agreement">
                                                    <div class="act-agreement-inner">
                                                        <label class="form-checkbox row-agreement" data-cmn_com_idx="<c:out value="${row.CMN_COM_IDX }"/>" data-agr_mst_title="<c:out value="${row.CMN_COM_ETC3 }"/>">
                                                            <c:choose>
                                                                <c:when test="${row.CMN_COM_IDX eq Code.TERM_MARKETING }">
                                                                    <input type="checkbox" name="MEM_AGR_TRM_CD<c:out value="${stat.index }"/>" class="terms" data-CMN_COM_UP_IDX="${row.CMN_COM_UP_IDX}" value="<c:out value="${row.CMN_COM_IDX }"/>"/>
                                                                    <i>(선택)</i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="checkbox" name="MEM_AGR_TRM_CD<c:out value="${stat.index }"/>" class="terms required" data-CMN_COM_UP_IDX="${row.CMN_COM_UP_IDX}" value="<c:out value="${row.CMN_COM_IDX }"/>"/>
                                                                    <i class="necessary">(필수)</i>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:out value="${row.CMN_COM_ETC3 }"/>
                                                        </label>
                                                        <span class="btn-agree-check" data-cmn_com_idx="<c:out value="${row.CMN_COM_IDX }"/>" data-cmn_com_up_idx="<c:out value="${row.CMN_COM_UP_IDX }"/>" data-agr_mst_title="<c:out value="${row.CMN_COM_ETC3 }"/>"><button type="button"><span></span></button></span>
                                                    </div>
                                                    <!-- 약관 -->
                                                    <div class="term-area-content-layer" id="term-area-<c:out value="${row.CMN_COM_IDX }"/>">
                                                        <div class="area-content-layer term-area-inner">
                                                            <div class="contain-agreement type2">
                                                                <span class="head-title"><c:out value="${row.CMN_COM_ETC3 }"/></span>
                                                                <div class="box-agreement">
                                                                    <c:out value="${row.AGR_MST_CONTENTS}" escapeXml="false"/>
                                                                </div>
                                                                
                                                                
                                                                <c:forEach var="srow" items="${termList }">
                                                                    <c:if test="${srow.CMN_COM_UP_IDX eq term_group && srow.AGR_MST_IDX ne row.AGR_MST_IDX}">
                                                                    <span class="head-title"><c:out value="${srow.CMN_COM_ETC3 }"/></span>
                                                                    <div class="box-agreement">
                                                                        <c:out value="${srow.AGR_MST_CONTENTS}" escapeXml="false"/>
                                                                    </div>
                                                                    </c:if>
                                                                </c:forEach>
                                                                
                                                                
                                                                <c:if test="${row.AGR_MST_CFM_FRT_YN eq 'Y' }">
                                                                    <span class="head-title">추가 안내사항</span>
                                                                    <div class="box-agreement">
                                                                        <c:out value="${srow.AGR_MST_CONTENTS}" escapeXml="false"/>

<%--                                                                        <div class="content-terms">--%>
<%--                                                                            <div class="box-privacy">--%>
<%--                                                                                <dl>--%>
<%--                                                                                    <dt>부가서비스</dt>--%>
<%--                                                                                    <dd>--%>
<%--                                                                                        - 부가서비스로 제공되는 멤버십혜택 중 가장 대표적인 리조트는 가입 후 연 10박씩, 무기명 회원가에 1~2만원 추가한 금액으로 우대 혜택을 드리며, 관광진흥법 등 관련 법령에 의한 리조트 정회원 우선 예약 제도에 따라 주말, 성수기, 연휴, 공휴일 전일은 이용이 제한됩니다.<br>--%>
<%--                                                                                        - 멤버십서비스는 당사 또는 제휴사 사정에 따라 언제든지 축소 또는 변경될 수 있는 부가서비스입니다.<br>--%>
<%--                                                                                        - 리조트는 예약 후 본인이 직접 방문해야 이용이 가능하며, 상황에 따라 5일에서 60일 이내에 예약을 하셔야 합니다.<br>--%>
<%--                                                                                        - 이용 시 필요한 멤버십 카드는 모바일로 제공되며, 모바일 멤버쉽카드 이용방법은 통화종료 후 발송되는 문자메세지를 통해 확인해주시기 바랍니다.<br>--%>
<%--                                                                                        - 기타 부가서비스 혜택에 대한 자세한 사항과 이용조건은 대명아임레디 홈페이지 통해 확인 가능합니다.--%>
<%--                                                                                    </dd>--%>
<%--                                                                                </dl>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="box-privacy">--%>
<%--                                                                                <dl>--%>
<%--                                                                                    <dt>환급의무액</dt>--%>
<%--                                                                                    <dd>--%>
<%--                                                                                        - 2021년 12월 말 기준으로 (주)대명스테이션의 총 고객환급의무액은 약 663,443,044천원이며, 상조 관련 자산은 약 741,108,264천원입니다.<br>--%>
<%--                                                                                        - (주)대명스테이션은 인덕회계법인의 공인회계사를 통해 회계감사를 받고 있습니다.--%>
<%--                                                                                    </dd>--%>
<%--                                                                                </dl>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="box-privacy">--%>
<%--                                                                                <dl>--%>
<%--                                                                                    <dt>소비자피해보상 계약</dt>--%>
<%--                                                                                    <dd>--%>
<%--                                                                                        - 소비자 피해를 막기 위해 ㈜대명스테이션은 상조보증공제조합과 공제 계약을 체결하였습니다.<br>--%>
<%--                                                                                        - 이의 계약기간은 2021.01.01.부터 12.31.까지로 특별한 사정이 없는 한 자동연장됩니다.<br>--%>
<%--                                                                                        - 소비자피해보상금은 고객불입금인 실 서비스 납입금의 50%이며, 지급의무자는 상조보증공제조합입니다.<br>--%>
<%--                                                                                        - 피해보상금은 할부거래에 관한 법률 제27조 제4항에 해당하는 폐업, 등록 취소 등의 사유 발생 시 지급됩니다.--%>
<%--                                                                                    </dd>--%>
<%--                                                                                </dl>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
                                                                    </div>
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
                                                            </div>
                                                        </div>
                                                    </div>
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <label class="form-checkbox" style="display:none;">
                                                    <input type="checkbox" class="terms2 terms-hidden-<c:out value="${row.CMN_COM_UP_IDX}"/> required" name="MEM_AGR_TRM_CD<c:out value="${stat.index }"/>" value="<c:out value="${row.CMN_COM_IDX }"/>"/>
                                                </label>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
                            </div>
                            
                            <%-- 하단 고정버튼 --%>
                            <div class="fixed-box-button">
                                <span class="btn-type-text1 disabled"><button>신청하기</button></span>
                            </div>
                            <%-- //하단 고정버튼 --%>
                        </form>
                    </div>
                </div>
            </div>
            <hr class="divline-type2" >
            <div class="contain-contract-desc2">
                * 본인인증 후 신청이 완료됩니다
            </div>
        </div>
    </div>
    <%-- //본문 --%>
    
    <%-- 도움말 --%>
    <div class="box-help help1">
        <div class="box-inner">상담받으실 전화번호를 정확하게 기입해주세요.</div>
    </div>
    <div class="box-help help2">
        <div class="box-inner">해피콜 미 진행 시, 상품 가입이 되지 않습니다. 해피콜은 약 5분 정도 소요 되며, 고객님께서 원하시는 시간에 연락 드리겠습니다.</div>
    </div>
    <%-- //도움말 --%>
    
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
    <script id="deliveryAddButtonTemplate" type="text/x-jquery-tmpl">
        <span class="btn-type-text5 delivery-row-add"><button>배송지 등록</button></span>
    </script>
    <script id="deliveryTemplate" type="text/x-jquery-tmpl">
        <span class="infor">
            \${INSPL_MEM_NM} \${StringUtil.formatPhone(INSPL_CELL, "-")}
        </span>
        <span class="address">
            \${INSPL_ADDR} \${INSPL_ADDR2}
        </span>
        <span class="data">
            <input type="hidden" name="INSPL_MEM_NM" value="\${INSPL_MEM_NM}"/>
            <input type="hidden" name="INSPL_CELL" value="\${INSPL_CELL}"/>
            <input type="hidden" name="INSPL_ZIP" value="\${INSPL_ZIP}"/>
            <input type="hidden" name="INSPL_ADDR" value="\${INSPL_ADDR}"/>
            <input type="hidden" name="INSPL_ADDR2" value="\${INSPL_ADDR2}"/>
        </span>
        <span class="btn-type-text5 delivery-row-mod"><button>배송지 수정</button></span>
    </script>
    <script id="deliveryFormLayerTemplate" type="text/x-jquery-tmpl">
        <header class="area-header-layer">
            <div class="area-inner">
                <h1 class="title">배송(설치)주소</h1>
                <span class="btn-close"><button>닫기</button></span>
            </div>
        </header>
        <div class="area-content-layer">
            <div class="area-inner">
                <form name="deliveryForm" id="deliveryForm">
                    <div class="contain-information-payment-layer">
                        <p class="text-normal-type1">* 배송/설치를 위한 수령인 정보를 입력해 주세요.</p>
                        <hr class="divline-type3" >
                        {{if MODE == "regist"}}
                            <div class="box-form">
                                <input type="text" name="INSPL_MEM_NM" placeholder="수령인 이름" maxlength="30"/>
                                <label class="form-alert" message-target="INSPL_MEM_NM" data-name="수령인 이름"></label>
                                <input type="text" name="INSPL_CELL" placeholder="수령인 연락처" maxlength="11"/>
                                <label class="form-alert" message-target="INSPL_CELL" data-name="수령인 연락처"></label>
                                <span class="form-addbutton">
                                    <input type="hidden" name="INSPL_ZIP" value="" maxlength="5"/>
                                    <input type="text" name="INSPL_ADDR" placeholder="주소 선택" readonly="readonly" maxlength="70"/>
                                    <span class="btn-type-text1 zipcode" data-type="inspl"><button>주소찾기</button></span>
                                </span>
                                <label class="form-alert" message-target="INSPL_ADDR" data-name="주소"></label>
                                <input type="text" name="INSPL_ADDR2" placeholder="상세주소 입력"  maxlength="70"/>
                                <label class="form-alert" message-target="INSPL_ADDR2" data-name="상세주소 입력"></label>
                            </div>
                        {{else}}
                            <div class="box-form">
                                <input type="text" name="INSPL_MEM_NM" value="\${INSPL_MEM_NM}" placeholder="수령인 이름" maxlength="30"/>
                                <label class="form-alert" message-target="INSPL_MEM_NM" data-name="수령인 이름"></label>
                                <input type="text" name="INSPL_CELL" value="\${INSPL_CELL}" placeholder="수령인 연락처" maxlength="11"/>
                                <label class="form-alert" message-target="INSPL_CELL" data-name="수령인 연락처"></label>
                                <span class="form-addbutton">
                                    <input type="hidden" name="INSPL_ZIP" value="\${INSPL_ZIP}" maxlength="5"/>
                                    <input type="text" name="INSPL_ADDR" value="\${INSPL_ADDR}" placeholder="주소 선택" readonly="readonly" maxlength="70"/>
                                    <span class="btn-type-text1 zipcode" data-type="inspl"><button>주소찾기</button></span>
                                </span>
                                <label class="form-alert" message-target="INSPL_ADDR" data-name="주소"></label>
                                <input type="text" name="INSPL_ADDR2" value="\${INSPL_ADDR2}" placeholder="상세주소 입력" maxlength="70"/>
                                <label class="form-alert" message-target="INSPL_ADDR2" data-name="상세주소 입력"></label>
                            </div>
                        {{/if}}
                    </div>
                    <div class="fixed-box-button">
                        <span class="btn-type-text1 {{if MODE == "regist"}}disabled{{/if}}"><button>저장</button></span>
                    </div>
                </form>
            </div>
        </div>
    </script>
    <script id="etcFormLayerTemplate" type="text/x-jquery-tmpl">
        <header class="area-header-layer">
            <div class="area-inner">
                <h1 class="title">추가정보</h1>
                <span class="btn-close"><button>닫기</button></span>
            </div>
        </header>
        <div class="area-content-layer">
            <div class="area-inner">
                <form name="etcForm" id="etcForm">
                    <div class="contain-information-payment-layer">
                        <p class="text-normal-type1">* 지원혜택을 받을 추가 정보를 입력해 주세요.</p>
                        <hr class="divline-type3" >
                        <dl class="box-form">
                            <dt><c:out value="${info.PRD_MST_BND_ID }"/></dt>
                            <dd>
                                <input type="text" name="ORD_MST_VDR_BNF_ID" placeholder="추가정보를 입력해주세요." maxlength="20"/>
                                <label class="form-alert" message-target="ORD_MST_VDR_BNF_ID" data-name="추가정보"></label>
                            </dd>
                        </dl>
                    </div>
                    <div class="fixed-box-button">
                        <span class="btn-type-text1 disabled"><button>저장</button></span>
                    </div>
                </form>
            </div>
        </div>
    </script>
    <script>
        $(function () {
            var $areaContent = $(".area-content"),
                $layerPopup = $(".layer-popup1"),
                $contractForm = $areaContent.find("#contractForm"),
                $joinStepForm = $("#joinStepForm"),
                $termsForm = $("#termsForm");
            var $deliveryAddButtonTemplate = $("#deliveryAddButtonTemplate"),
                $deliveryTemplate = $("#deliveryTemplate"),
                $deliveryFormLayerTemplate = $("#deliveryFormLayerTemplate"),
                $etcFormLayerTemplate = $("#etcFormLayerTemplate");
            <%-- 우편번호 검색 버튼 클릭 이벤트 --%>
            $(document).on("click", ".zipcode", function (e) {
                e.preventDefault();
                var type = $(this).data("type");
                var deliveryFormArray = new Array();
                if (type == "inspl") {
                    deliveryFormArray.push($layerPopup.find(".area-header-layer").detach());
                    deliveryFormArray.push($layerPopup.find(".area-content-layer").detach());
                }
                $.common.layer.zipcode(function (data) {
                    if (type == "home") {
                        $contractForm.find("input[name='HOME_ZIP']").val(data.zipcode);
                        $contractForm.find("input[name='HOME_ADDR']").val(data.roadAddress);
                        buttonDisabledToggle();
                    } else if (type == "inspl") {
                        $layerPopup.requestLayerByTemplate(deliveryFormArray);
                        $layerPopup.find("input[name='INSPL_ZIP']").val(data.zipcode);
                        $layerPopup.find("input[name='INSPL_ADDR']").val(data.roadAddress);
                    }
                });
            });
            <%-- 가입자 주소와 동일 체크박스 변경 이벤트 --%>
            $contractForm.on("change", ".contractor-same-add", function (e) {
                e.preventDefault();
                var $this = $(this),
                    $boxOrder = $this.closest(".box-form").find(".box-order"),
                    $deliveryArea = $boxOrder.find(".delivery-area");
                if ($this.is(":checked")) {
                    var data = {
                        INSPL_MEM_NM : "<c:out value="${SessionsUser.USER_NM }"/>",
                        INSPL_CELL : "<c:out value="${SessionsUser.USER_HP }"/>",
                        INSPL_ZIP : $contractForm.find("input[name='HOME_ZIP']").val(),
                        INSPL_ADDR : $contractForm.find("input[name='HOME_ADDR']").val(),
                        INSPL_ADDR2 : $contractForm.find("input[name='HOME_ADDR2']").val()
                    };
                    appendDeliveryInfo(data, $boxOrder, $deliveryArea);
                } else {
                    $deliveryArea.empty();
                    $deliveryAddButtonTemplate.tmpl().appendTo($deliveryArea);
                }
                buttonDisabledToggle();
            });
            <%-- 배송지 일괄 입력 체크박스 변경 이벤트 --%>
            $contractForm.on("change", ".delivery-all-add", function (e) {
                e.preventDefault();
                var $this = $(this),
                    $boxOrder = $this.closest(".box-form").find(".box-order"),
                    $deliveryArea = $boxOrder.find(".delivery-area");
                if ($this.is(":checked")) {
                    openDeliveryLayer(function (data) {
                        appendDeliveryInfo(data, $boxOrder, $deliveryArea);
                        buttonDisabledToggle();
                    }, "regist");
                } else {
                    $deliveryArea.empty();
                    $deliveryAddButtonTemplate.tmpl().appendTo($deliveryArea);
                    buttonDisabledToggle();
                }
            });
            <%-- 배송지 등록/수정 버튼 클릭 이벤트 --%>
            $contractForm.on("click", ".delivery-row-add, .delivery-row-mod", function (e) {
                e.preventDefault();
                var $this = $(this),
                    $boxOrder = $this.closest(".box-order"),
                    $deliveryArea = $boxOrder.find(".delivery-area");
                var params = new Object(),
                    mode = "regist";
                if ($this.hasClass("delivery-row-mod")) {
                    mode = "modify";
                    var $input = $deliveryArea.find(".data").children("input");
                    $input.each(function (key, value) {
                        params[this.name] = this.value;
                    });
                }
                openDeliveryLayer(function (data) {
                    appendDeliveryInfo(data, $boxOrder, $deliveryArea);
                    buttonDisabledToggle();
                }, mode, params);
            });
            <%-- 배송지 정보 추가 --%>
            function appendDeliveryInfo (data, $boxOrder, $deliveryArea) {
                $deliveryArea.empty();
                $boxOrder.find(".delivery-row-add").remove();
                $deliveryTemplate.tmpl(data).appendTo($deliveryArea);
            }
            <%-- 배송지 입력 폼 레이어 호출 --%>
            function openDeliveryLayer(callback, mode, params) {
                params = typeof(params) != "undefined" ? params : new Object();
                params.MODE = mode;
                $layerPopup.requestLayerByTemplate($deliveryFormLayerTemplate.tmpl(params), "", function () {
                    var $deliveryForm = $(this).find("#deliveryForm");
                    $deliveryForm.validate({
                        ignore : [],
                        rules : {
                            INSPL_MEM_NM : {
                                required : true,
                                maxlength : 30
                            },
                            INSPL_CELL : {
                                required : true,
                                number : true,
                                rangelength : [9, 11]
                            },
                            INSPL_ADDR : {
                                required : true,
                                maxlength : 70
                            },
                            INSPL_ADDR2 : {
                                required : true,
                                maxlength : 70
                            }
                        },
                        submitHandler : function(form) {
                            var $form = $(form);
                            var data = $form.serializeObject();
                            data.INSPL_ADDR = $form.find("input[name='INSPL_ADDR']").val();
                            callback.call(this, data);
                            $.common.layer.close($layerPopup);
                        }
                    });
                });
            }
            <%-- 추가정보 일괄 입력 체크박스 변경 이벤트--%>
            $contractForm.on("change", ".etc-all-add", function () {
                var $this = $(this),
                    $boxForm = $this.closest(".box-form");
                if ($this.is(":checked")) {
                    openEtcLayer(function (data) {
                        $boxForm.find("input[name='ORD_MST_VDR_BNF_ID']").val(data.ORD_MST_VDR_BNF_ID);
                        if (data.ORD_MST_VDR_BNF_ID != "") {
                            $contractForm.find(".form-alert[message-target='ORD_MST_VDR_BNF_ID']").removeClass(["ver2", "on"]);
                        }
                        buttonDisabledToggle();
                    });
                } else {
                    $boxForm.find("input[name='ORD_MST_VDR_BNF_ID']").val("");
                    $contractForm.find(".btn-type-text1").filter(":not(.zipcode)").addClass("disabled");
                    buttonDisabledToggle();
                }
            });
            <%-- 추가정보 입력 폼 레이어 호출 --%>
            function openEtcLayer(callback) {
                $layerPopup.requestLayerByTemplate($etcFormLayerTemplate.tmpl(), "", function () {
                    var $etcForm = $(this).find("#etcForm");
                    $etcForm.validate({
                        rules : {
                            ORD_MST_VDR_BNF_ID : {
                                required : true,
                                engOrNum : false,
                                maxlength : 20
                            }
                        },
                        submitHandler : function(form) {
                            callback.call(this, $(form).serializeObject());
                            $.common.layer.close($layerPopup);
                        }
                    });
                });
            }
            <%-- 약관 전체동의 펼쳐보기 클릭 이벤트 --%>
            $areaContent.on("click", "#allagree-expend", function (e) {
                e.preventDefault();
                if($("#box-agreement").css('display') == 'none') {
                    $("#box-agreement").slideDown('fast');
                    $("button.allagree-expend span").css({'transform':'rotate(315deg)', 'top':'8px'});
                }else {
                    $("#box-agreement").slideUp('fast');
                    $("button.allagree-expend span").css({'transform':'rotate(135deg)', 'top':'0px'});
                }
            });
            <%-- 약관 전체동의 버튼 클릭 이벤트 --%>
            $areaContent.on("click", ".btn-type-allagree-txt", function (e) {
                e.preventDefault();
                $(this).toggleClass("checked");
                if ($(this).hasClass("checked")) {
                    checkboxToggle(true);
                }else{
                    checkboxToggle(false);
                }
                buttonDisabledToggle();
            });
            <%-- 체크박스 토글 --%>
            function checkboxToggle(checked) {
                var $checkboxs = $areaContent.find(".form-checkbox").not(".check-all");
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
            <%-- 약관 개별동의 펼쳐보기 클릭 이벤트 --%>
            $areaContent.on("click", ".btn-agree-check", function (e) {
                e.preventDefault();
                
                $(".btn-agree-check button span").css({'transform':'rotate(135deg)', 'top':'0px'});
                $(".term-area-content-layer").slideUp('fast');
                var cmm_com_idx = $(this).data('cmn_com_idx');
                if($("#term-area-"+cmm_com_idx).css('display') == 'none') {
                    $("#term-area-"+cmm_com_idx).slideDown('fast');
                    $(this).find("button span").css({'transform':'rotate(315deg)', 'top':'8px'});
                }else {
                    $("#term-area-"+cmm_com_idx).slideUp('fast');
                    $(this).find("button span").css({'transform':'rotate(135deg)', 'top':'0px'});
                }
            });
            <%-- 약관 개별동의 체크박스 클릭시 통합된 체크박스 자동 체크 --%>
            $areaContent.on("click", ".row-agreement", function (e) {
                var cmn_com_up_idx = $(this).find("input[type='checkbox']").data('cmn_com_up_idx');
                $(".terms-hidden-" + cmn_com_up_idx).attr("checked", $(this).find("input[type='checkbox']").is(":checked"));
                buttonDisabledToggle();
                if ($(this).find("input[type='checkbox']").is(":checked")) {
                    $(".btn-agree-check button span").css({'transform':'rotate(135deg)', 'top':'0px'});
                    $(".term-area-content-layer").slideUp('fast');
                    // $(".btn-agree-check:not([data-cmn_com_idx=" + e.target.value + "]) button span").css({'transform':'rotate(135deg)', 'top':'0px'});
                    // $(".term-area-content-layer:not(#term-area-" + e.target.value + ")").slideUp('fast');
                    $('#term-area-' + e.target.value).slideDown('fast');
                    $(this).parent().find("button span").css({'transform':'rotate(315deg)', 'top':'8px'});
                } else {
                    $('#term-area-' + e.target.value).slideUp('fast');
                    $(this).parent().find("button span").css({'transform':'rotate(135deg)', 'top':'0px'});
                }
            });
            <%-- 입력완료 버튼 클릭 이벤트 --%>
            var $contractFormValidator = $contractForm.validate({
                ignore : [],
                rules : {
                    HPCALL_TIME : {
                        required : true
                    },
                    ORD_MST_VDR_BNF_ID : {
                        required : true,
                        engOrNumOrSl : false,
                        maxlength : 20
                    },
                    INSPL_VALID : {
                        insplValid : true
                    },
                    INSPL_MEM_NM : {
                        required : true,
                        maxlength : 30
                    },
                    INSPL_CELL : {
                        required : true,
                        number : true,
                        rangelength : [9, 11]
                    },
                    INSPL_ADDR : {
                        required : true,
                        maxlength : 70
                    },
                    INSPL_ADDR2 : {
                        required : true,
                        maxlength : 70
                    }
                },
                submitHandler : function(form) {
                    if ($.resources.isApp && $.resources.isAndroid) { 
                        $.common.check.oneself("", function (data) {
                            if (data.isSuccess) {
                                var params = new Array();
                                $(form).find(".terms:checked").each(function () {
                                    params.push(TagUtil.createDynamicInput("hidden", "MEM_AGR_TRM_CD", this.value));
                                });
                                $(form).find(".terms2:checked").each(function () {
                                    params.push(TagUtil.createDynamicInput("hidden", "MEM_AGR_TRM_CD", this.value));
                                });
                                $termsForm.append(params);
                                
                                $.postSyncJsonAjax($.action.contract.join.form.save.ajax(), $contractForm.serialize(), function () {
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
                        $(form).find(".terms2:checked").each(function () {
                            params.push(TagUtil.createDynamicInput("hidden", "MEM_AGR_TRM_CD", this.value));
                        });
                        $joinStepForm.find("input").each(function () {
                            params.push(TagUtil.createDynamicInput("hidden", $(this).attr("name"), this.value));
                        });
                        $termsForm.append(params);
                        $.postSyncJsonAjax($.action.contract.join.form.save.ajax(), $contractForm.serialize(), function () {
                            $.postSyncJsonAjax($.action.contract.join.form.save.ajax(), $termsForm.serialize(), function () {
                                <%-- 데이드 기획 요청. 2022-03-16 --%>
                                kakaoPixel('4921613175266887595').purchase('conversion');
                                <%-- 데이드 기획 요청. 2022-06-14 --%>
                                IGATrackingGet({tw_type : "purchase", revenue : 1000});
                                <%-- 데이드 기획 요청. 2022-06-14 --%>
                                gtag('event', 'conversion', {
                                    'send_to': 'AW-316241620/wvR7CLCUn6gDENTt5ZYB',
                                    'transaction_id': ''
                                });
                                fbq('track', 'InitiateCheckout');
                                $.common.check.oneselfMove(redirect);                        
                            });
                        });
                    }
                }
            });
            <%-- 설치 주소 유효성 검증 추가 --%>
            $.validator.addMethod("insplValid", function(value, element, param) {
                var $boxOrder = $contractForm.find(".box-order"),
                    $deliveryArea = $boxOrder.find(".delivery-area");
                var valid = true;
                if ($deliveryArea.children(".data").length == 0) {
                    valid = false;
                } else {
                    $deliveryArea.children(".data").each(function () {
                        $(this).find("input").each(function () {
                            if (this.value == "") {
                                valid = false;
                            }
                        });
                    });
                }
                return valid;
            }, "은(는) 필수 항목입니다.");
            <%-- 버튼 disabled 클래스 토글 --%>
            function buttonDisabledToggle() {
                if ($contractFormValidator.checkForm()) {
                    $contractForm.find(".btn-type-text1").filter(":not(.zipcode)").removeClass("disabled");
                } else {
                    $contractForm.find(".btn-type-text1").filter(":not(.zipcode)").addClass("disabled");
                }
            }
        });
    </script>
</body>
</html>