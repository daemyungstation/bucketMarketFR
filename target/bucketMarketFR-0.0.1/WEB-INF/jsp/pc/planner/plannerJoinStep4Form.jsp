<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/join.css">
</head>
<body class="">

<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>

<jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
    <jsp:param name="oneDepth" value="로그인"/>
    <jsp:param name="oneDepthKey" value="planner.login.form"/>
</jsp:include>

<!-- Body -->
<div class="area-body">
    <div class="area-inner">

        <div class="contain-login">

            <h3 class="title">레디플래너 가입</h3>

            <div class="contain-join-head">
                <h2 class="title-step">추가정보 입력</h2>
                <div class="box-step">
                    <span>01</span>
                    <span>02</span>
                    <span>03</span>
                    <span class="on">04</span>
                    <span>05</span>
                </div>
            </div>
        
            <%-- 추가정보 --%>
            <form id="frm" name="frm">
                <input type="hidden" name="plannerNo" value="${commandMap.plannerNo }">
                <input type="hidden" name="RDP_MST_NO" value="${commandMap.RDP_MST_NO }">
                <input type="hidden" name="RDP_MST_NM" value="${commandMap.RDP_MST_NM }">
                <input type="hidden" name="RDP_MST_PW">
                <input type="hidden" name="RDP_MST_ACT_HDR">
            
            <div class="contain-join-body">

                <p class="text-information-type1">레디플래너 로그인 및 정산에 필요한 <br >추가 정보를 입력해 주세요. <span class="text-notice-type2 form">* 필수</span></p>

                <dl class="box-form">
                    <dt class="necessary">아이디 정보</dt>
                    <dd>
                        <span class="form-addbutton">
                            <input type="text" name="RDP_MST_ID" placeholder="아이디 입력" value="<c:out value="${commandMap.RDP_MST_ID }" />" maxlength="20" >
                            <span class="btn-type-text1">
                                <button id="btnCheckDuplicateId" type="button">중복체크</button>
                            </span>
                        </span>
                    </dd>
                    <dd class="form-alert" message-target="RDP_MST_ID" data-name="아이디"></dd>
                    <%-- 아이디 중복 체크 --%>
                    <input type="hidden" name="RDP_MST_ID_CHECK">
                    <dd class="form-alert" message-target="RDP_MST_ID_CHECK" data-name="아이디 중복체크"></dd>
                </dl>
                <dl class="box-form">
                    <dt class="necessary">비밀번호</dt>
                    <dd><input type="password" id="rdpMstPw" name="RDP_MST_PW_TEMP" placeholder="영문, 숫자, 특수문자 2가지 이상 6~15자 이내" maxlength="15"></dd>
                    <dd class="form-alert" message-target="RDP_MST_PW_TEMP" data-name="비밀번호"></dd>
                </dl>
                <dl class="box-form">
                    <dt class="necessary">비밀번호 확인</dt>
                    <dd><input type="password" name="RDP_MST_PW_CHECK_TEMP" placeholder="영문, 숫자, 특수문자 2가지 이상 6~15자 이내" maxlength="15"></dd>
                    <dd class="form-alert" message-target="RDP_MST_PW_CHECK_TEMP" data-name="비밀번호"></dd>
                </dl>

                <hr class="divline-type1" >
                
                <%-- 사업자 유형 --%>
                <c:choose>
                    <c:when test="${empty commandMap.RDP_MST_BUSI_CLS }">
                        <c:set var="RDP_MST_BUSI_CLS_VALUE" value="${Code.PLANNER_BUSINESS_CLASS_PRIVATE }"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="RDP_MST_BUSI_CLS_VALUE" value="${commandMap.RDP_MST_BUSI_CLS }"/>
                    </c:otherwise>
                </c:choose>

                <h2 class="title">사업자 유형 별 정보 입력</h2>
                <div class="box-radio-biztype">
                    <c:forEach var="item" items="${codes.PLANNER_BUSINESS_CLASS}" varStatus="status">
                        <label for="rdpMstBusiCls<c:out value="${status.index + 1}"/>" class="form-radio <c:if test="${item.CMN_COM_IDX eq RDP_MST_BUSI_CLS_VALUE }">checked</c:if> ">
                            <input id="rdpMstBusiCls<c:out value="${status.index + 1}"/>" name="RDP_MST_BUSI_CLS" type="radio" value="<c:out value="${item.CMN_COM_IDX }"/>" <c:if test="${item.CMN_COM_IDX eq RDP_MST_BUSI_CLS_VALUE  }">checked="checked"</c:if> ><c:out value="${item.CMN_COM_NM }"/>
                        </label>
                    </c:forEach>
                </div>

                <hr class="divline-type2" >

                <%-- 공통 --%>
                <dl class="box-form">
                    <dt class="necessary">이름</dt>
                    <dd><input id="rdpMstMemNm" type="text" value="<c:out value="${commandMap.RDP_MST_MEM_NM }"/>" disabled ></dd>
                </dl>
                
                <dl class="box-form">
                    <dt class="necessary">주소</dt>
                    <dd><span class="form-addbutton">
                            <input id="" type="hidden" name="RDP_MST_ZIP_CODE" value="<c:out value="${commandMap.RDP_MST_ZIP_CODE }"/>" >
                            <input id="" type="text" name="RDP_MST_DR_ADDR1" value="<c:out value="${commandMap.RDP_MST_DR_ADDR1 }"/>" placeholder="주소선택" readonly="readonly" >
                            <span class="btn-type-text1">
                                <button id="btnFindAddress" type="button">주소찾기</button>
                            </span>
                        </span>
                    </dd>
                    <dd><input type="text" name="RDP_MST_DR_ADDR2" value="<c:out value="${commandMap.RDP_MST_DR_ADDR2 }"/>" placeholder="상세주소 입력" maxlength="66"></dd>
                    <dd class="form-alert" message-target="RDP_MST_ZIP_CODE" data-name="주소"></dd>
                    <dd class="form-alert" message-target="RDP_MST_DR_ADDR2" data-name="주소"></dd>
                </dl>
                <%-- //공통 --%>

                <!-- 개인  -->
                <div id="divPrivate" <c:if test="${RDP_MST_BUSI_CLS_VALUE ne Code.PLANNER_BUSINESS_CLASS_PRIVATE }">class="ignore" style="display: none;"</c:if> >
                    <dl class="box-form">
                        <dt class="necessary">주민등록번호</dt>
                        <dd>
                            <span class="form-regnum">
                                <input type="text" id="rdpMstSsn1" name="RDP_MST_SSN1" value="<c:out value="${commandMap.RDP_MST_SSN1 }"/>" maxlength="6" >
                                <i>-</i>
                                <input type="text" id="rdpMstSsn2" name="RDP_MST_SSN2" value="<c:out value="${commandMap.RDP_MST_SSN2 }"/>" maxlength="7" >
                                <span class="btn-type-text1">
                                    <button id="btnCheckSsn" type="button">인증</button>
                                </span>
                            </span>
                        </dd>
                        <dd class="form-alert" message-target="RDP_MST_SSN1" data-name="주민등록번호"></dd>
                        <dd class="form-alert" message-target="RDP_MST_SSN2" data-name="주민등록번호"></dd>
                        <%-- 주민등록번호 인증 --%>
                        <input type="hidden" name="RDP_MST_SSN_CHECK">
                        <dd class="form-alert" message-target="RDP_MST_SSN_CHECK" data-name="주민등록번호 인증"></dd>
                        <dd class="form-notice">리워드 지급을 위하여 소득세법 제 145조에 따라 수집이용하며 5년동안 보관합니다.</dd>
                    </dl>
                    <dl class="box-form">
                        <dt class="necessary">연락처</dt>
                        <dd><input type="text" value="<c:out value="${commandMap.RDP_MST_HP1 }"/>-<c:out value="${commandMap.RDP_MST_HP2 }"/>-<c:out value="${commandMap.RDP_MST_HP3 }"/>" disabled ></dd>
                    </dl>
                    <dl class="box-form">
                        <dt class="necessary">이메일</dt>
                        <dd><input type="text" value="<c:out value="${commandMap.RDP_MST_MAIL }"/>" disabled ></dd>
                        <dd class="form-alert">이메일 주소를 입력해 주세요.</dd>
                    </dl>
                    <%-- 예금주 확인 --%>
                    <input type="hidden" name="RDP_MST_BNK_ACT_NAME_CHECK_PRIVATE">
                </div>
                <!-- //개인  -->
                
                <!-- 법인/개인사업자 -->
                <div id="divBusiness" <c:if test="${RDP_MST_BUSI_CLS_VALUE eq Code.PLANNER_BUSINESS_CLASS_PRIVATE }">class="ignore" style="display: none;"</c:if> >
                    <dl class="box-form">
                        <dt class="necessary">연락처</dt>
                        <dd><input type="text" value="<c:out value="${commandMap.RDP_MST_HP1 }"/>-<c:out value="${commandMap.RDP_MST_HP2 }"/>-<c:out value="${commandMap.RDP_MST_HP3 }"/>" disabled ></dd>
                    </dl>
                    <dl class="box-form">
                        <dt class="necessary">이메일</dt>
                        <dd><input type="text" value="<c:out value="${commandMap.RDP_MST_MAIL }"/>" disabled ></dd>
                        <dd class="form-alert">이메일 주소를 입력해 주세요.</dd>
                    </dl>
                    <hr class="divline-type1" >
                    <dl class="box-form">
                        <dt class="necessary">사업자번호</dt>
                        <dd>
                            <span class="form-compregnum">
                                <input type="text" name="RDP_MST_BUSI1" value="<c:out value="${commandMap.RDP_MST_BUSI1 }"/>" maxlength="3"><i>-</i>
                                <input type="text" name="RDP_MST_BUSI2" value="<c:out value="${commandMap.RDP_MST_BUSI2 }"/>" maxlength="2"><i>-</i>
                                <input type="text" name="RDP_MST_BUSI3" value="<c:out value="${commandMap.RDP_MST_BUSI3 }"/>" maxlength="5">
                            </span>
                        </dd>
                        <dd class="form-alert" message-target="RDP_MST_BUSI1" data-name="사업자번호"></dd>
                        <dd class="form-alert" message-target="RDP_MST_BUSI2" data-name="사업자번호"></dd>
                        <dd class="form-alert" message-target="RDP_MST_BUSI3" data-name="사업자번호"></dd>
                    </dl>
                    <dl class="box-form">
                        <dt class="necessary">대표자명</dt>
                        <dd><input type="text" id="rdpMstCeoNm" name="RDP_MST_CEO_NM" value="<c:out value="${commandMap.RDP_MST_CEO_NM }"/>" maxlength="10"></dd>
                        <dd class="form-alert" message-target="RDP_MST_CEO_NM" data-name="대표자명"></dd>
                    </dl>
                    <dl class="box-form">
                        <dt class="necessary">회사명</dt>
                        <dd><input type="text" name="RDP_MST_BUSI_NM" value="<c:out value="${commandMap.RDP_MST_BUSI_NM }"/>" maxlength="16"></dd>
                        <dd class="form-alert" message-target="RDP_MST_BUSI_NM" data-name="회사명"></dd>
                    </dl>
                    <dl class="box-form">
                        <dt class="necessary">업태</dt>
                        <dd><input type="text" name="RDP_MST_BUSI_CDT" value="<c:out value="${commandMap.RDP_MST_BUSI_CDT }"/>" maxlength="16" ></dd>
                        <dd class="form-alert" message-target="RDP_MST_BUSI_CDT" data-name="업태"></dd>
                    </dl>
                    <dl class="box-form">
                        <dt class="necessary">종목</dt>
                        <dd><input type="text" name="RDP_MST_BUSI_TYPE" value="<c:out value="${commandMap.RDP_MST_BUSI_TYPE }"/>" maxlength="16" ></dd>
                        <dd class="form-alert" message-target="RDP_MST_BUSI_TYPE" data-name="종목"></dd>
                    </dl>
                    <%-- 예금주 확인 --%>
                    <input type="hidden" name="RDP_MST_BNK_ACT_NAME_CHECK_BUSINESS">
                </div>
                <!-- //법인/개인사업자 -->

                <hr class="divline-type1" >

                <h2 class="title">정산 계좌 정보</h2>

                <dl class="box-form">
                    <dt class="necessary">은행</dt>
                    <dd>
                        <span class="form-select">
                            <select name="RDP_MST_BNK_CD">
                                <option value="">은행선택</option>
                                <c:if test="${not empty codes.INICIS_BANK_CODE }">
                                    <c:forEach var="row" items="${codes.INICIS_BANK_CODE }" varStatus="i">
                                        <option value="<c:out value="${row.CMN_COM_IDX }"/>" data-cmn_com_etc1="${row.CMN_COM_ETC1 }" <c:if test="${row.CMN_COM_IDX eq commandMap.RDP_MST_BNK_CD }">selected="selected"</c:if>>
                                            <c:out value="${row.CMN_COM_NM }" />
                                        </option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </span>
                    </dd>
                    <dd class="form-alert" message-target="RDP_MST_BNK_CD" data-name="은행"></dd>
                </dl>
                <dl class="box-form">
                    <dt class="necessary">계좌번호</dt>
                    <dd><input type="number" class="number" name="RDP_MST_BNK_ACT" value="<c:out value="${commandMap.RDP_MST_BNK_ACT }"/>" maxlength="20"></dd>
                    <dd class="form-alert" message-target="RDP_MST_BNK_ACT" data-name="계좌번호"></dd>
                </dl>
                <dl class="box-form">
                    <dt class="necessary">계좌 예금주</dt>
                    <dd><input type="text" id="rdpMstBnkActName" placeholder="계좌확인 시 자동 입력" disabled ></dd>
                    <dd><span class="btn-type-text3">
                            <button id="btnCheckBankAccount" type="button">계좌확인</button>
                        </span>
                    </dd>
                    
                    <%-- 계좌 확인 --%>
                    <input type="hidden" name="RDP_MST_BNK_ACT_CHECK">
                    <dd class="form-alert" message-target="RDP_MST_BNK_ACT_CHECK" data-name="계좌확인"></dd>
                    <dd class="form-alert" message-target="RDP_MST_BNK_ACT_NAME_CHECK_PRIVATE" data-name="예금주"></dd>
                    <dd class="form-alert" message-target="RDP_MST_BNK_ACT_NAME_CHECK_BUSINESS" data-name="예금주"></dd>
                </dl>

            </div>

            <!-- 하단 고정버튼 -->
            <div class="fixed-box-button">
                <span class="btn-type-text1 disabled"><button type="button" id="btnNext">다음</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
            </div>
            <!-- //하단 고정버튼 -->
        
            </form>
            <%-- 추가정보 --%>

        </div>

    </div>
</div>
<!-- //Body -->

<!-- 팝업 : 추가정보 미입력 안내  -->
<div id="informationPopup" class="layer-popup2 active">
    <div class="layer-inner">
        <div class="contain-head">
            <p class="text-title-type1">잠깐만요!</p>
        </div>
        <hr class="divline-type1" >
        <div class="contain-body">

            <p class="text-normal-type2-1">레디플래너  로그인 아이디 및 <br >실적 정산에 꼭 필요한 정보가 필요합니다. <br >추가정보 입력페이지로 이동합니다.</p>
            <div class="box-button">
                <span class="btn-type-text1"><button id="popupClose">확인</button></span>
            </div>
        </div>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</div>
<!-- //팝업 : 추가정보 미입력 안내 -->

<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
<script>
    $(function () {
        var $areaContent = $(".area-body"),
            $frm = $areaContent.find("#frm");
        var $informationPopup = $("#informationPopup");
        // 주민등록번호
        $.validator.addMethod("ssn", function(value, element, params) {
            return ValidationUtil.checkSsn($(params.ssn1).val(), $(params.ssn2).val());
        });
        // 폼 체크
        $frm.validate({
            ignore : ".ignore input, .ignore select, .ignore textarea",
            rules : {
                RDP_MST_ID : { required : true, minlength : 6, maxlength : 20 },
                RDP_MST_ID_CHECK : { required : true },
                RDP_MST_PW_TEMP : { required : true, minlength : 6, maxlength : 15, passwordCk : true },
                RDP_MST_PW_CHECK_TEMP : { required : true, minlength : 6, maxlength : 155, passwordCk : true, equalTo : "#rdpMstPw" },
                RDP_MST_SSN1 : { required : true, minlength : 6, maxlength : 6 },
                RDP_MST_SSN2 : { required : true, minlength : 7, maxlength : 7, ssn : { ssn1 : "#rdpMstSsn1", ssn2 : "#rdpMstSsn2" } },
                RDP_MST_SSN_CHECK : { required : true },
                RDP_MST_BUSI1 : { required : true, number : true, minlength : 3, maxlength : 3 },
                RDP_MST_BUSI2 : { required : true, number : true, minlength : 2, maxlength : 2 },
                RDP_MST_BUSI3 : { required : true, number : true, minlength : 5, maxlength : 5 },
                RDP_MST_CEO_NM : { required : true },
                RDP_MST_BUSI_NM : { required : true },
                RDP_MST_ZIP_CODE : { required : true },
                RDP_MST_DR_ADDR2 : { required : true },
                RDP_MST_BUSI_CDT : { required : true },
                RDP_MST_BUSI_TYPE : { required : true },
                RDP_MST_BNK_CD : { required : true },
                RDP_MST_BNK_ACT : { required : true, number : true },
                RDP_MST_ACT_HDR : { required : true },
                RDP_MST_BNK_ACT_NAME_CHECK_PRIVATE : { equalTo : "#rdpMstMemNm" },
                RDP_MST_BNK_ACT_NAME_CHECK_BUSINESS : { equalTo : "#rdpMstCeoNm" },
                RDP_MST_BNK_ACT_CHECK : { required : true }
            },
            messages : {
                RDP_MST_ID_CHECK : { required : "는 필수입니다" },
                RDP_MST_SSN2 : { ssn : "가 유효하지 않습니다." },
                RDP_MST_SSN_CHECK : { required : "은 필수입니다" },
                RDP_MST_BNK_ACT_NAME_CHECK_PRIVATE : { equalTo : "는 사용자 이름과 동일해야 합니다." },
                RDP_MST_BNK_ACT_NAME_CHECK_BUSINESS : { equalTo : "는 대표자명과 동일해야 합니다." },
                RDP_MST_BNK_ACT_CHECK : { required : "은 필수입니다" }
            }
        });
        // 폼 유효성 검사
        $frm.valid();
        // 안내 팝업 닫기
        $informationPopup.on("click", "#popupClose", function() {
            $.common.layer.close($informationPopup);
        });
        // 아이디
        $areaContent.on("input", "input[name='RDP_MST_ID']", function() {
            $areaContent.find("input[name='RDP_MST_ID_CHECK']").val("");
            $frm.valid(); // 유효성 검사 
        });
        // 아이디 중복 체크
        $areaContent.on("click", "#btnCheckDuplicateId", function() {
            if ($areaContent.find("input[name='RDP_MST_ID']").valid()) {
                var params = {
                    RDP_MST_ID : $areaContent.find("input[name='RDP_MST_ID']").val(),
                    RDP_MST_NO : $areaContent.find("input[name='RDP_MST_NO']").val()
                };
                $.postSyncJsonAjax($.action.planner.join.checkIdDuplicate.ajax(), params, function (data) {
                    if (data.isSuccess) {
                        $areaContent.find("input[name='RDP_MST_ID_CHECK']").val("Y").valid();
                        alert("사용 가능한 아이디입니다.");
                    } else {
                        alert("이미 사용중인 아이디입니다.");
                        $areaContent.find("input[name='RDP_MST_ID_CHECK']").val("").valid();
                    }
                });
            }
        });
        // 사업자 유형 변경
        $areaContent.on("click", "input[name='RDP_MST_BUSI_CLS']", function() {
            $frm.find(".form-alert").removeClass("on ver2");            
            $frm.validate().resetForm(); // 초기화
            var cls = $("input[name='RDP_MST_BUSI_CLS']:checked").val();
            if (cls == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_PRIVATE }"/>") {
                $areaContent.find("#divPrivate").show().removeClass("ignore");
                $areaContent.find("#divBusiness").hide().addClass("ignore");
            } else {
                $areaContent.find("#divPrivate").hide().addClass("ignore");
                $areaContent.find("#divBusiness").show().removeClass("ignore");
            }
            $areaContent.find("input[name='RDP_MST_BNK_ACT_CHECK']").val("").valid();
            $frm.valid();
        });
        // 주민등록번호
        $areaContent.on("input", "input[name='RDP_MST_SSN1'], input[name='RDP_MST_SSN2']", function() {
            $areaContent.find("input[name='RDP_MST_SSN_CHECK']").val("").valid();
            $frm.valid(); // 유효성 검사 
        });
        // 주민등록번호 인증
        $areaContent.on("click", "#btnCheckSsn", function() {
            if ($areaContent.find("input[name='RDP_MST_SSN1'], input[name='RDP_MST_SSN2']").valid()) {
                var jumin1 = $areaContent.find("input[name='RDP_MST_SSN1']").val();
                var jumin2 = $areaContent.find("input[name='RDP_MST_SSN2']").val();
                var name = $areaContent.find("#rdpMstMemNm").val();
                var srvNo = "<c:out value="${sciServiceNo }"/>"; // 각 페이지에 맞는 서비스번호
                $.common.check.ssn(jumin1, jumin2, name, srvNo, function(data) {
                    if (data.isSuccess) {
                        $areaContent.find("input[name='RDP_MST_SSN_CHECK']").val("Y").valid();
                        alert("주민등록번호가 인증되었습니다.");
                    } else {
                        $areaContent.find("input[name='RDP_MST_SSN_CHECK']").val("").valid();
                        alert("주민등록번호 인증이 실패하였습니다. [ " + data.message + " ]");
                    }
                });
            }
        });
        // 주소
        $areaContent.on("input", "input[name='RDP_MST_DR_ADDR2']", function() {
            $areaContent.find("input[name='RDP_MST_DR_ADDR2']").valid(); 
        });
        $areaContent.on("click", "#btnFindAddress", function() {
            $.common.layer.zipcode(function(data) {
                $areaContent.find("input[name='RDP_MST_ZIP_CODE']").val(data.zipcode).valid(); 
                $areaContent.find("input[name='RDP_MST_DR_ADDR1']").val(data.addr);
            });
        });
        // 은행 및 계좌
        $areaContent.on("change", "select[name='RDP_MST_BNK_CD']", function() {
            $areaContent.find("input[name='RDP_MST_BNK_ACT_CHECK']").val("").valid(); 
        });
        $areaContent.on("input", "input[name='RDP_MST_BNK_ACT']", function() {
            $areaContent.find("input[name='RDP_MST_BNK_ACT_CHECK']").val("").valid(); 
        });
        // 계좌 확인
        $areaContent.on("click", "#btnCheckBankAccount", function() {
            if ($areaContent.find("select[name='RDP_MST_BNK_CD'], input[name='RDP_MST_BNK_ACT']").valid()) {
                var bankCode = $areaContent.find("select[name='RDP_MST_BNK_CD']").find("option:selected").data("cmn_com_etc1");
                var bankAccount = $areaContent.find("input[name='RDP_MST_BNK_ACT']").val();
                $.common.check.bankAccount(bankCode, bankAccount, function(data) {
                    if (data.isSuccess) {
                        // 초기화
                        $areaContent.find("input[name='RDP_MST_BNK_ACT_NAME_CHECK_PRIVATE']").val("");
                        $areaContent.find("input[name='RDP_MST_BNK_ACT_NAME_CHECK_BUSINESS']").val("");
                        // 계좌정보 출력
                        $areaContent.find("#rdpMstBnkActName").val(data.depositor);
                        $areaContent.find("input[name='RDP_MST_ACT_HDR']").val(data.depositor);
                        if ($("input[name='RDP_MST_BUSI_CLS']:checked").val() == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_PRIVATE }"/>") {
                            // 개인
                            $areaContent.find("input[name='RDP_MST_BNK_ACT_NAME_CHECK_PRIVATE']").val(data.depositor);
                        } else if ($("input[name='RDP_MST_BUSI_CLS']:checked").val() == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_NATURAL_PERSON }"/>") {
                            // 개인 사업자
                            $areaContent.find("input[name='RDP_MST_BNK_ACT_NAME_CHECK_BUSINESS']").val(data.depositor);
                        } else if ($("input[name='RDP_MST_BUSI_CLS']:checked").val() == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_LEGAL_PERSON }"/>") {
                            // 법인 사업자
                            $areaContent.find("input[name='RDP_MST_BNK_ACT_NAME_CHECK_BUSINESS']").val($("#rdpMstCeoNm").val());
                        }
                        $areaContent.find("input[name='RDP_MST_BNK_ACT_CHECK']").val("Y").valid();
                        alert("계좌정보가 인증되었습니다.");
                    } else {
                        alert("계좌정보가 인증이 실패하였습니다. : " + data.message); // 오류 메세지
                        $areaContent.find("input[name='RDP_MST_BNK_ACT_CHECK']").val("").valid();
                    }
                    $frm.valid();
                });
            }
        });
        // 다음
        $areaContent.on("click", "#btnNext", function() {
            if ($frm.valid()) {
                $frm.find("input[name='RDP_MST_PW']").val(hex_sha512($frm.find("input[name='RDP_MST_PW_TEMP']").val()).toString());
                $frm.find("input[name='RDP_MST_PW_TEMP']").attr("name", "");
                $frm.postSubmit($.action.planner.join.step4.updateInfo());
            }
        });
    });
</script>
</body>
</html>