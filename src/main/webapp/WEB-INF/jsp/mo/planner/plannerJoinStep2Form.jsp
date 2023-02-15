<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/join.css">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
    <jsp:param name="headerGroup" value="historyback|navigation|title|search|home"/>
    <jsp:param name="headerTitle" value="레디플래너 신청"/>
</jsp:include>
<!-- //헤더 -->

<!-- 본문 -->
<div class="area-content">
    <div class="area-inner">

        <div class="contain-join-head">
            <h2 class="title-step">신청정보입력</h2>
            <div class="box-step">
                <span>01</span>
                <span class="on">02</span>
                <span>03</span>
            </div>
        </div>
        
        <%-- 신청 폼 --%>
        <form id="frm" name="frm">
            <input type="hidden" name="RDP_MST_NO" value="<c:out value="${commandMap.RDP_MST_NO }"/>" />
        
            <div class="contain-join-body">
    
                <p class="text-information-type1">버킷마켓 상품 홍보를 위한<br><span class="text-point1">레디플래너 정보</span>를 입력해 주세요.</p>
    
                <hr class="divline-type1" >
    
                <p class="text-notice-type2 form">* 필수</p>
    
                <dl class="box-form fixed">
                    <dt>이름</dt>
                    <dd><c:out value="${commandMap.RDP_MST_MEM_NM }" /></dd>
                </dl>
                <dl class="box-form fixed">
                    <dt>휴대폰 번호</dt>
                    <dd><c:out value="${commandMap.RDP_MST_HP1 }"/>-<c:out value="${commandMap.RDP_MST_HP2 }"/>-<c:out value="${commandMap.RDP_MST_HP3 }"/></dd>
                </dl>
                <dl class="box-form">
                    <dt class="necessary">이메일 주소</dt>
                    <dd>
                        <input type="text" name="RDP_MST_MAIL" value="<c:out value="${commandMap.RDP_MST_MAIL }"/>" maxlength="33">
                        <label class="form-alert" message-target="RDP_MST_MAIL" data-name="이메일 주소">이메일 주소를 입력해 주세요.</label>
                    </dd>
                </dl>
                <dl class="box-form">
                    <dt class="">홍보사이트 (http://, https:// 포함 입력)</dt>
                    <dd id="siteAddressList">
                        <span class="form-addbutton">
                            <input type="text" id="siteAddress" placeholder="http://" maxlength="2000">
                            <span class="btn-type-text1">
                                <button type="button" id="btnAddSite">추가</button>
                            </span>
                        </span>
                        <label class="form-alert2 on">본인의 블로그, 카페, SNS, 사이트 정보를 입력해 주세요.</label>
                        <label id="siteAddressAlert" class="form-alert">올바른 사이트 주소가 아닙니다.</label>
                        <input type="hidden" name="RDP_SIT_ADRs_CHECK" value="${fn:length(commandMap.RDP_SIT_ADRs) }">
                        <%-- 홍보사이트 목록 --%>
                        <c:forEach var="item" items="${commandMap.RDP_SIT_ADRs }">
                            <p class="form-site">
                                <input type="hidden" name="RDP_SIT_ADRs" value="<c:out value="${item }"/>" />
                                <c:out value="${item }"/>
                                <span class="btn-type-icon1 delete">
                                    <button type="button">삭제</button>
                                </span>
                            </p>
                        </c:forEach>
                        <%-- //홍보사이트 목록 --%>
                    </dd>
                </dl>
                <dl class="box-form">
                    <dt><label>홍보사이트의 운영 성격은?</label></dt>
                    <dd><span class="form-textarea"><textarea id="rdpMstSitDsc" name="RDP_MST_SIT_DSC" placeholder="예) 취미생활 블로그" onkeyup="StringUtil.getStrLength(this, '.byte', 3000);" maxlength="3000"><c:out value="${commandMap.RDP_MST_SIT_DSC }"/></textarea><i><span class="byte">0</span>/3000</i></span></dd>
                </dl>
                <dl class="box-form">
                    <dt class="necessary">홍보사이트를 설명하는 주제는?<span class="text-addtion">중복선택 가능</span></dt>
                    <dd class="box-checkitem">
                        <c:set var="RDP_SUB_CDs_JOIN" value="${fn:join(commandMap.RDP_SUB_CDs, ',') }"/>
                        <c:forEach var="item" items="${codes.PLANNER_SUBJECT }">
                            <label class="form-checkbox">
                                <input type="checkbox" name="RDP_SUB_CDs" value="<c:out value="${item.CMN_COM_IDX }"/>" <c:if test="${fn:contains(RDP_SUB_CDs_JOIN, item.CMN_COM_IDX) }">checked="checked"</c:if> ><c:out value="${item.CMN_COM_NM }"/>
                            </label>
                        </c:forEach>
                        <label class="form-alert" message-target="RDP_SUB_CDs" data-name="주제"></label>
                    </dd>
                </dl>
                <dl class="box-form">
                    <dt class="necessary">레디플래너 가입 경로는?</dt>
                    <dd><input type="text" name="RDP_MST_ANS1" maxlength="100" value="<c:out value="${commandMap.RDP_MST_ANS1 }"/>"></dd>
                </dl>
    
                <dl class="box-form">
                    <dt>이용약관과 운영정책 내용 확인하셨나요?</dt>
                    <dd><input type="text" name="RDP_MST_ANS2" maxlength="100" value="<c:out value="${commandMap.RDP_MST_ANS2 }"/>"></dd>
                </dl>
    
                <hr class="divline-type1" >
    
                <dl class="box-form">
                    <dt>소속구분</dt>
                    <dd class="box-radio">
                        <c:if test="${commandMap.RDP_MST_DM_YN ne 'Y' }">
                            <label class="form-radio checked"><input type="radio" name="RDP_MST_DM_YN" value="N" checked="checked">일반</label>
                            <label class="form-radio"><input type="radio" name="RDP_MST_DM_YN" value="Y">임직원</label>
                        </c:if>
                        <c:if test="${commandMap.RDP_MST_DM_YN eq 'Y' }">
                            <label class="form-radio"><input type="radio" name="RDP_MST_DM_YN" value="N">일반</label>
                            <label class="form-radio checked"><input type="radio" name="RDP_MST_DM_YN" value="Y" checked="checked">임직원</label>
                        </c:if>
                    </dd>
                    <dd>
                        <input type="text" name="RDP_MST_DM_NO" maxlength="20" class="number" placeholder="사원번호 입력" value="<c:out value="${commandMap.RDP_MST_DM_NO }"/>" <c:if test="${commandMap.RDP_MST_DM_YN ne 'Y' }">style="display: none;"</c:if> >
                        <label id="alertRdpMstDmNo" class="form-alert on" <c:if test="${commandMap.RDP_MST_DM_YN ne 'Y' }">style="display: none;"</c:if> >대명소노그룹의 직원일 경우 사번을 입력해 주세요.</label>
                    </dd><!-- 임직원일때만 노출 -->
                </dl>
    
            </div>

            <!-- 하단 고정버튼 -->
            <div class="fixed-box-button">
                <span class="btn-type-text1"><button type="button" id="btnNext">다음</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
            </div>
            <!-- //하단 고정버튼 -->
            
        </form>
        <%-- 신청 폼 --%>

    </div>
</div>
<!-- //본문 -->
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>

<%-- 홍보사이트 --%>
<script id="siteAddrTemplate" type="text/x-jquery-tmpl">
    <p class="form-site">
        <input type="hidden" name="RDP_SIT_ADRs" value="{{= RDP_SIT_ADR }}" />
        {{= RDP_SIT_ADR }}
        <span class="btn-type-icon1 delete">
            <button type="button">삭제</button>
        </span>
    </p>
</script>

<script>
    $(function () {
        var $areaContent = $(".area-content"),
            $frm = $areaContent.find("#frm");
        // 폼
        $frm.validate({
            ignore : ".ignore input, .ignore select, .ignore textarea",   
            rules : {
                RDP_MST_MAIL : { required : true, email : true },
                /* RDP_SIT_ADRs_CHECK : { required : true, min : 1 }, */
                RDP_SUB_CDs : { required : true },
                RDP_MST_ANS1 : { required : true },
                RDP_MST_DM_NO : { required : function(el) { return $("input[name='RDP_MST_DM_YN']:checked").val() == 'Y'; } }
            },
            messages : {
                /* RDP_SIT_ADRs_CHECK : { min : "는 하나 이상 등록해야합니다." } */
            }
        });
        // 폼 유효성 검사
        $frm.valid();
        // 임직원 여부
        $areaContent.on("click", "input[name='RDP_MST_DM_YN']", function() {
            $areaContent.find("input[name='RDP_MST_DM_NO']").toggle($areaContent.find("input[name='RDP_MST_DM_YN']:checked").val() == "Y").focus();
            $areaContent.find("#alertRdpMstDmNo").toggle($areaContent.find("input[name='RDP_MST_DM_YN']:checked").val() == "Y").focus();
            $frm.valid();
        });
        // 홍보사이트 추가
        $areaContent.on("click", "#btnAddSite", function() {
            var site = $areaContent.find("#siteAddress").val() || "";
            if (site.length > 0) {
                var params = {
                    RDP_SIT_ADR : site
                };
                $.postSyncJsonAjax($.action.planner.join.checkSiteDuplicate.ajax(), params, function (data) {
                    if (data.isSuccess) {
                        alert("사용 가능한 홍보사이트입니다.");
                        $areaContent.find("#siteAddressList").append($("#siteAddrTemplate").tmpl({ RDP_SIT_ADR : site }));
                        $areaContent.find("#siteAddress").val("");
                        $areaContent.find("#siteAddressAlert").removeClass("on");
                    } else {
                        alert("이미 사용중인 홍보사이트입니다.");
                    }
                });
            }
            $frm.find("input[name='RDP_SIT_ADRs_CHECK']").val($frm.find("p.form-site").length);
            $frm.valid();
        });
        // 홍보사이트 삭제
        $areaContent.on("click", "p.form-site span.delete button", function() {
            $(this).closest("p.form-site").remove();
            $frm.find("input[name='RDP_SIT_ADRs_CHECK']").val($frm.find("p.form-site").length);
            $frm.valid();
        });
        // 다음
        $areaContent.on("click", "#btnNext", function() {
            if ($frm.valid()) {
                // 신청
                $frm.postSubmit($.action.planner.join.step2.apply());
            }
        });
    });
</script>

</body>
</html>