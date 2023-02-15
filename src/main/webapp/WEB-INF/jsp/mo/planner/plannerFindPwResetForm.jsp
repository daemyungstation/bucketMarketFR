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
    <jsp:param name="headerTitle" value="아이디/비밀번호 찾기"/>
</jsp:include>
<!-- //헤더 -->

<!-- 본문 -->
<div class="area-content">
    <div class="area-inner">

        <div class="box-tab-head">
            <span><button onclick="javascript:$.requestPage($.action.planner.find.id.form());">아이디 찾기</button></span>
            <span class="on"><button>비밀번호 찾기</button></span>
        </div>
        <div>
        
            <%-- 비밀번호 변경 --%>
            <form id="frm" name="frm">
                <input type="hidden" name="RDP_MST_PW">
            
                <div class="box-resultpassword">
                    <p class="text-normal-type1"><span class="text-point2"><c:out value="${info.RDP_MST_MEM_NM }" /></span>님, <br ><u>비밀번호를 재 설정</u> 합니다.</p>
                    <div class="table-type1">
                        <table>
                            <colgroup>
                            <col style="width:115px" >
                            <col >
                            </colgroup>
                            <tr>
                                <th>아이디</th>
                                <td><strong><c:out value="${info.RDP_MST_ID }" /></strong></td>
                            </tr>
                        </table>
                    </div>
                    <dl class="box-form">
                        <dt class="necessary">새 비밀번호</dt>
                        <dd><input type="password" id="rdpMstPw" name="RDP_MST_PW_TEMP" placeholder="영문,숫자,특수문자 2가지 이상 6~15자 이내" maxlength="15"></dd>
                        <dd class="form-alert" message-target="RDP_MST_PW_TEMP" data-name="비밀번호"></dd>
                    </dl>
                    <dl class="box-form">
                        <dt class="necessary">새 비밀번호 확인</dt>
                        <dd><input type="password" name="RDP_MST_PW_CHECK_TEMP" placeholder="영문,숫자,특수문자 2가지 이상 6~15자 이내" maxlength="15"></dd>
                        <dd class="form-alert" message-target="RDP_MST_PW_CHECK_TEMP" data-name="비밀번호"></dd>
                    </dl>
                </div>
                
                <!-- 하단 고정버튼 -->
                <div class="fixed-box-button">
                    <span class="btn-type-text1 disabled"><button type="button" id="btnNext">확인</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
                </div>
                <!-- //하단 고정버튼 -->
            
            </form>
            <%-- //비밀번호 변경 --%>
            
        </div>

    </div>
</div>
<!-- //본문 -->
<%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
<%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
<script>
    $(function () {
        var $areaContent = $(".area-content");
            $frm = $areaContent.find("#frm");
        // 폼 체크
        $frm.validate({
            rules : {
                RDP_MST_PW_TEMP : { required : true, minlength : 6, maxlength : 15 },
                RDP_MST_PW_CHECK_TEMP : { required : true, minlength : 6, maxlength : 15, equalTo : "#rdpMstPw" }
            }
        });
        // 비밀번호
        $areaContent.on("input", "input[name^='RDP_MST_PW']", function() {
           $frm.valid(); 
        });
        // 확인
        $areaContent.on("click", "#btnNext", function() {
           if ($frm.valid()) {
               $frm.find("input[name='RDP_MST_PW']").val(hex_sha512($frm.find("input[name='RDP_MST_PW_TEMP']").val()).toString());
               $frm.find("input[name='RDP_MST_PW_TEMP']").attr("name", "");
               $frm.postSubmit($.action.planner.find.pw.reset.password());
           }
        });
    });
</script>

</body>
</html>