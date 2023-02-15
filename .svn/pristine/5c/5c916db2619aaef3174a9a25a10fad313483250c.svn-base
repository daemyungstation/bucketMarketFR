<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/payment.css">
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@pg['pg.css.url']"/>">
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
                        <div class="box-title-step">
                            <p class="step-num"><span>1</span>약관동의 및 본인확인</p>
                            <p class="step-num on"><span>2</span>가입정보입력</p>
                            <p class="step-num"><span>3</span>가입정보확인</p>
                        </div>
                        <div class="box-step-form">
                            <dl class="box-form">
                                <dt>가입자 정보<i>(필수)</i></dt>
                                <dd>
                                    <span class="form-title">이름</span>
                                    <input type="text" value="<c:out value="${SessionsUser.USER_NM }"/>" disabled="disabled"/>
                                </dd>
                                <dd>
                                    <span class="form-title">연락처</span>
                                    <input type="text" value="<c:out value="${SessionsUser.USER_HP }"/>" disabled="disabled"/>
                                </dd>
                                <dd>
                                    <span class="form-title">생년월일</span>
                                    <input type="text" value="<c:out value="${SessionsUser.USER_BIRTHDAY }"/>" disabled="disabled">
                                    <span class="form-gender <c:if test="${SessionsUser.USER_SEX eq Const.MAN }">on</c:if>" style="margin-left: 25px;">남자</span>
                                    <span class="form-gender <c:if test="${SessionsUser.USER_SEX eq Const.FEMALE }">on</c:if>">여자</span>
                                </dd>
                                <dd class="type2" style="margin-top:20px;">
                                    <span class="form-title">주소<br />(가입증서 배송지)</span>
                                    <span class="form-addbutton">
                                        <input type="text" value="<c:out value="${contract.HOME_ADDR }"/>" disabled="disabled"/>
                                        <span class="btn-type-text1 zipcode" data-type="home"><button disabled="disabled">주소검색</button></span>
                                    </span>
                                </dd>
                                <dd class="type2">
                                    <input type="text" value="<c:out value="${contract.HOME_ADDR2 }"/>" disabled="disabled"/>
                                </dd>
                            </dl>
                            <dl class="box-form">
                                <dt>선택정보</dt>
                                <dd>
                                    <span class="form-title">비상연락처</span>
                                    <input type="text" value="<c:out value="${contract.HOME_TEL }"/>" disabled="disabled"/>
                                </dd>
                                <dd>
                                    <span class="form-title">이메일 주소</span>
                                    <input type="text" value="<c:out value="${contract.EMAIL }"/>" disabled="disabled"/>
                                </dd>
                            </dl>
                            <c:if test="${isMainLifeService }">
                                <dl class="box-form">
                                    <dt>라이프 서비스 신청<i>(필수)</i></dt>
                                    <dd class="type3">
                                        <c:if test="${commandMap.ORD_MST_CNT gt 1 }">
                                            <p class="text-normal-type1"><fmt:formatNumber value="${commandMap.ORD_MST_CNT }" type="number"/> 개 선택 가능<br />(가입구좌 수량 만큼 선택해 주세요)</p>
                                        </c:if>
                                        <c:forEach begin="1" end="${commandMap.ORD_MST_CNT }" varStatus="stat">
                                            <span class="form-select">
                                                <select disabled="disabled">
                                                    <option value="">주 계약 선택</option>
                                                    <c:forEach var="row" items="${mainLifeServiceList }">
                                                        <option value="<c:out value="${row.CMN_COM_ETC1 }"/>"<c:if test="${contract.MAIN_CONTRACT[stat.index - 1] eq row.CMN_COM_ETC1 }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }"/></option>
                                                    </c:forEach>
                                                </select>
                                            </span>
                                        </c:forEach>
                                    </dd>
                                </dl>
                            </c:if>
                            <c:if test="${isDelivery }">
                                <dl class="box-form">
                                    <dt>배송/설치 정보<i>(필수)</i></dt>
                                    <dd>
                                        <c:if test="${commandMap.ORD_MST_CNT gt 1 }">
                                            <p class="text-normal-type1"><fmt:formatNumber value="${commandMap.ORD_MST_CNT }" type="number"/> 개 선택 가능<br />(가입구좌 수량 만큼 선택해 주세요)</p>
                                        </c:if>
                                        <span class="deliver-checkbox">
                                            <label class="form-checkbox"><input type="checkbox" class="contractor-same-add" disabled="disabled">가입자 주소와 동일</label>
                                            <c:if test="${commandMap.ORD_MST_CNT gt 1 }">
                                                <label class="form-checkbox"><input type="checkbox" class="delivery-all-add" disabled="disabled">배송지 일괄입력</label>
                                            </c:if>
                                        </span>
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
                                                <span class="delivery-area">
                                                    <span class="infor">
                                                        <c:out value="${contract.INSPL_MEM_NM[stat.index - 1] }"/> <ui:formatPhone value="${contract.INSPL_CELL[stat.index - 1] }"/>
                                                    </span>
                                                    <span class="address">
                                                        <c:out value="${contract.INSPL_ADDR[stat.index - 1] }"/> <c:out value="${contract.INSPL_ADDR2[stat.index - 1] }"/>
                                                    </span>
                                                    <span class="btn-type-text5 delivery-row-mod"><button disabled="disabled">배송지 수정</button></span>
                                                </span>
                                            </div>
                                        </c:forEach>
                                    </dd>
                                </dl>
                            </c:if>
                            <c:if test="${isEtc }">
                                <dl class="box-form">
                                    <dt>추가 정보<span class="btn-help"><button class="help1">도움말</button></span><i>(필수)</i></dt>
                                    <dd>
                                        <c:if test="${commandMap.ORD_MST_CNT gt 1 }">
                                            <span class="select"><fmt:formatNumber value="${commandMap.ORD_MST_CNT }" type="number"/>개 선택 가능</span>
                                        </c:if>
                                        <span class="deliver-checkbox">
                                            <c:if test="${commandMap.ORD_MST_CNT gt 1 }">
                                                <label class="form-checkbox"><input type="checkbox" class="etc-all-add" disabled="disabled">추가정보 일괄입력</label>
                                            </c:if>
                                        </span>
                                    </dd>
                                    <dd class="type3">
                                        <p class="form-type2">
                                            <span><c:out value="${info.PRD_MST_BND_ID }"/></span>
                                            <c:forEach begin="1" end="${commandMap.ORD_MST_CNT }" varStatus="stat">
                                                <input type="text" value="<c:out value="${contract.ORD_MST_VDR_BNF_ID[stat.index - 1] }"/>" disabled="disabled"/>
                                            </c:forEach>
                                        </p>
                                    </dd>
                                </dl>
                            </c:if>
                            <dl class="box-form">
                                <dt>해피콜 상담시간<span class="btn-help"><button class="help2">도움말</button></span>
                                    <i>(필수)</i></dt>
                                <dd class="type3">
                                    <p class="text-normal-type1">* 가입완료 후, 전문 상담원이 해피콜을 드립니다. 통화 가능한 시간대를 선택해 주세요</p>
                                    <span class="form-select" style="width:450px;">
                                        <select disabled="disabled">
                                            <option value="">상담시간 선택</option>
                                            <c:forEach var="row" items="${happCallList }">
                                                <option value="<c:out value="${row.CMN_COM_ETC1 }"/>" <c:if test="${contract.HPCALL_TIME eq row.CMN_COM_ETC1 }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }"/></option>
                                            </c:forEach>
                                        </select>
                                    </span>
                                </dd>
                            </dl>
                            <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                                <dl class="box-form">
                                    <dt>사전 결제금액</span>
                                        <i>(필수)</i></dt>
                                    <dd class="type3">
                                        <span class="text-payment">결제금액 <span class="text-point1"><fmt:formatNumber value="${info.PRD_MST_ISTM_SPT_PAY}" type="number"/></span>원</span>
                                    </dd>
                                </dl>
                            </c:if>
                        </div>
                        <div class="box-certification-kakao-complete">
                            <p class="text-information">전자서명이 인증완료되었습니다. <br>사전 결제금액을 결제하시면 가입신청이 완료됩니다.</p>
                        </div>
                        <div class="fixed-box-button">
                            <span class="btn-type-text1 request-payment"><button>결제하기</button></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- //Body --%>
    <%-- 도움말 --%>
    <div class="box-help help1">
        <div class="box-inner">혜택 받으실 아이디를 정확하게 기입해주세요. 아이디를 잘못 입력하실 경우, 혜택이 제공되지 않을 수 있습니다.</div>
    </div>
    <div class="box-help help2">
        <div class="box-inner">해피콜 미 진행 시, 상품 가입이 되지 않습니다. 해피콜은 약 5분 정도 소요 되며, 고객님께서 원하시는 시간에 연락 드리겠습니다.</div>
    </div>
    <%-- //도움말 --%>
    <form name="joinStepForm" id="joinStepForm">
        <input type="hidden" name="PRD_MST_NO" value="<c:out value="${commandMap.PRD_MST_NO }"/>"/>
        <c:if test="${info.PRD_MST_OPT_YN eq 'Y' }">
            <c:forEach var="PRD_OPT_IDX" items="${commandMap.PRD_OPT_IDXs }">
                <input type="hidden" name="PRD_OPT_IDXs" value="<c:out value="${PRD_OPT_IDX }"/>"/>
            </c:forEach>
        </c:if>
        <input type="hidden" name="ORD_MST_CNT" value="<c:out value="${commandMap.ORD_MST_CNT }"/>"/>
        <input type="hidden" name="ORD_MST_IDX" value=""/>
    </form>
    <form id="pgForm" name="pgForm" method="POST" accept-charset="EUC-KR"></form>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    <script language="javascript" type="text/javascript" src="<spring:eval expression="@pg['pg.script.url']"/>" charset="UTF-8"></script>
    <script>
        $(function () {
            var $areaBody = $(".area-body"),
                $layerPopup = $(".layer-popup1"),
                $joinStepForm = $("#joinStepForm");
            <%-- 페이지 로딩 후 앵커 이동 --%>
            $("html, body").animate({
                scrollTop: $(".box-certification-kakao-complete").offset().top
            });
            <%-- 결제하기 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".request-payment", function (e) {
                $.postSyncJsonAjax($.action.contract.join.data.exists.ajax(), null, function (data) {
                    if (data.isLogin && data.isDataExists) {
                        $.postSyncJsonAjax($.action.pg.request.ajax(), $joinStepForm.serializeObject(), function (data) {
                            var params = new Array();
                            $.each(data.info, function (key, value) {
                                params.push(TagUtil.createDynamicInput("hidden", key, value));
                            });
                            var $pgForm = $("#pgForm");
                            $pgForm.empty();
                            $pgForm.append(params);
                            INIStdPay.pay("pgForm");
                        });
                    } else {
                        $joinStepForm.getSubmit($.action.contract.join.step1.form());  
                    }
                });
            });
            <%-- 결제 --%>
            payment = function (ordMstIdx) {
                $joinStepForm.find("input[name='ORD_MST_IDX']").val(ordMstIdx);
                $joinStepForm.postSubmit($.action.contract.join.regist());
            };
        });
    </script>
</body>
</html>