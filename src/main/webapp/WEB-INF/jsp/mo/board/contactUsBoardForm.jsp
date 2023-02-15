<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<spring:eval var="fileAllows" expression="@file['file.allowed.extensions.image']" />
<spring:eval var="fileMaxSize" expression="@file['file.max.byte.size.image']" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/customer.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title-btn|search"/>
        <jsp:param name="headerTitle" value="제휴문의"/>
    </jsp:include>
    <jsp:include page="/WEB-INF/jsp/mo/include/nav.jsp" flush="false">
        <jsp:param name="navGroup" value="board"/>
    </jsp:include>

    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <form name="contactUsForm" id="contactUsForm" onsubmit="return false;">
                <div class="contain-partner">
                    <p class="text-information-type1"><span class="text-point1">버킷마켓</span>과 파트너를 맺고 싶다면,<br />지금 바로 문의해 보세요!</p>
                    <p class="text-information-type2">※ 제휴문의는 아래의 모든 항목을 상세히 작성해 주시면,<br />담당자가 검토 후 2~3영업일 이내에 연락을 드립니다.</p>
        
                    <div class="box-partner">
                        <p class="text-notice-type2 form2">* 필수</p>
                        <div class="box-inquiry-title"><h2 class="title-step text-point3">기본정보 입력</h2></div>
                        <dl class="box-form">
                            <dt class="necessary">이름</dt>
                            <dd>
                                <input type="text" name="CTT_US_NM" id="CTT_US_NM" value="" placeholder="홍길동" maxlength="10"/>
                                <label class="form-alert" message-target="CTT_US_NM" data-name="이름"></label>
                            </dd>
                        </dl>
                        <dl class="box-form">
                            <dt class="necessary">연락처</dt>
                            <dd>
                                <input type="text" name="CTT_US_HP" id="CTT_US_HP" value="" placeholder="'-' 없이 입력해주세요" maxlength="11">
                                <label class="form-alert" message-target="CTT_US_HP" data-name="연락처"></label>
                            </dd>
                        </dl>
                        <dl class="box-form">
                            <dt class="necessary">회사명</dt>
                            <dd>
                                <input type="text" name="CTT_US_CPN" id="CTT_US_CPN" value="" maxlength="17">
                                <label class="form-alert" message-target="CTT_US_CPN" data-name="회사명"></label>
                            </dd>
                        </dl>
                        <dl class="box-form">
                            <dt>회사소속</dt>
                            <dd>
                                <input type="text" name="CTT_US_CPN_DIV" id="CTT_US_CPN_DIV" value="" maxlength="17">
                                <label class="form-alert" message-target="CTT_US_CPN_DIV" data-name="회사소속"></label>
                            </dd>
                        </dl>
                        <dl class="box-form">
                            <dt class="necessary">제목</dt>
                            <dd>
                                <input type="text" name="CTT_US_TITLE" id="CTT_US_TITLE" value="" maxlength="170">
                                <label class="form-alert" message-target="CTT_US_TITLE" data-name="제목"></label>
                            </dd>
                        </dl>
                        <dl class="box-form">
                            <dt class="necessary">내용</dt>
                            <dd>
                                <span class="form-textarea">
                                    <textarea name="CTT_US_CONTENTS" id="CTT_US_CONTENTS" onkeyup="StringUtil.getStrLength(this, '.byte', 600);" maxlength="600"></textarea>
                                    <i><span class="byte">0</span>/600</i>
                                </span>
                                <label class="form-alert" message-target="CTT_US_CONTENTS" data-name="내용"></label>
                            </dd>
                        </dl>
                        <dl class="box-form">
                            <dt>첨부파일</dt>
                            <dd>
                                <span class="form-addbutton">
                                    <input type="text" id="FILE_TEXT" placeholder="선택파일없음" readonly="readonly">
                                    <input type="file" name="FILE" id="FILE" style="display: none;"/>
                                    <span class="btn-type-text1 file-add"><button>파일 선택</button></span>
                                </span>
                                <span class="text-form-notice1">* <ui:byteCal bytes="${fileMaxSize }"/> 이하로 등록해 주세요.</span>
                            </dd>
                        </dl>
                        <h2 class="title-step text-point3 necessary">개인정보 수집 및 활용 동의</h2>
                        <span class="form-provision">
                            <c:out value="${termInfo.AGR_MST_CONTENTS }" escapeXml="false"/>
                        </span>
                        <label class="form-checkbox"><input type="checkbox" name="CTT_US_PSN_YN" id="CTT_US_PSN_YN" value="Y">개인정보 수집 및 활용에 동의합니다.</label>
                        <label class="form-alert" message-target="CTT_US_PSN_YN" data-name="개인정보 수집 및 활용"></label>
                    </div>
                </div>
                <%-- 하단 고정버튼 --%>
                <div class="fixed-box-button">
                    <span class="btn-type-text1 disabled"><button>저장</button></span>
                </div>
                <%-- //하단 고정버튼 --%>
            </form>
        </div>
    </div>
    <%-- //본문 --%>
    <%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
    <script id="contactUsCompleteTemplate" type="text/x-jquery-tmpl">
        <div class="contain-partner">
            <p class="text-information-type1 notice2">감사합니다.<br /><strong class="text-point1">제휴문의 접수</strong>가 완료 되었습니다.</p>
        </div>
    </script>
    <script>
        $(function () {
            var $areaContent = $(".area-content"),
                $contactUsForm = $areaContent.find("#contactUsForm");
            var $contactUsCompleteTemplate = $("#contactUsCompleteTemplate");
            
            <%-- 파일 등록 버튼  클릭 이벤트 --%>
            $contactUsForm.off("click", ".file-add").on("click", ".file-add", function (e) {
                e.preventDefault(); 
                $(this).siblings("input[name='FILE']").trigger("click");
            });
            
            <%-- 파일변경 이벤트 --%>
            $contactUsForm.off("click", "input[name='FILE']").on("change", "input[name='FILE']", function () {
                var $this = $(this);
                var value = $this.val();
                if (value != "") {
                    if (validFileExt(value) && validFileSize(this)) {
                        $this.siblings("#FILE_TEXT").val(value);
                    } else {
                        $this.siblings("#FILE_TEXT").val("");
                        $this.val("");
                    }
                } else {
                    $this.siblings("#FILE_TEXT").val("");
                }
            });
            
            <%-- 첨부파일 확장자 확인 --%>
            function validFileExt(value) {
                var valid = false,
                    extName = value.substring(value.lastIndexOf(".") + 1).toLowerCase(),
                    allows = "<c:out value="${fileAllows }"/>".split("|");
                for (var i = 0; i < allows.length; i++) {
                    if (extName == $.trim(allows[i])) {
                        valid = true;
                        break;
                    }
                }
                if (!valid) {
                    alert("업로드 불가능한 파일 입니다.\n*업로드 가능 파일[" + allows.join(", ") + "]");
                }
                return valid;
            }
            <%-- 첨부파일 용량 확인 --%> 
            function validFileSize(object) {
                var valid = false,
                    sizeinbytes = 0;
                if (window.ActiveXObject) {
                    sizeinbytes = new ActiveXObject("Scripting.FileSystemObject").getFile(object.value).size;
                } else { 
                    sizeinbytes = object.files[0].size;
                }
                var i = 0,
                    fSExt = ["Bytes", "KB", "MB", "GB"],
                    maxSize = StringUtil.getInt("<c:out value="${fileMaxSize}"/>");
                while (maxSize > 900) {
                    maxSize /= 1024;
                    i++;
                }
                if (sizeinbytes > StringUtil.getInt("<c:out value="${fileMaxSize}"/>")) {
                    alert("첨부파일은 " + ((Math.round(maxSize * 100) / 100) + fSExt[i]) + " 이하로 등록가능합니다.");
                } else {
                    valid = true;
                }
                return valid;
            }
            <%-- 폼 유효성 체크 및 전송 이벤트 --%>
            $contactUsForm.validate({
                rules : {
                    CTT_US_NM : {
                        required : true,
                        maxlength : 10
                    },
                    CTT_US_HP : {
                        required : true,
                        number : true,
                        maxlength : 11
                    },
                    CTT_US_CPN : {
                        required : true,
                        maxlength : 17
                    },
                    CTT_US_CPN_DIV : {
                        required : false,
                        maxlength : 17
                    },
                    CTT_US_TITLE : {
                        required : true,
                        maxlength : 170
                    },
                    CTT_US_CONTENTS : {
                        required : true,
                        maxlength : 600
                    },
                    CTT_US_PSN_YN : {
                        required : true
                    }
                },
                submitHandler : function(form) {
                    if (confirm("저장 하시겠습니까?")) {
                        var $form = $(form),
                            $file = $form.find("input[name='FILE']");
                        var formData = new FormData(),
                            params = $(form).serializeObject();
                        if ($file.length > 0 && $file.val() != "") {
                            formData.append("FILE", $form.find("input[name='FILE']")[0].files[0]);
                        }
                        $.each(params, function (key, value) {
                            formData.append(key, value);
                        });
                        $.postSyncMultipartJsonAjax($.action.board.contact.us.registAjax(), formData, function (data) {
                            if (data.isSuccess) {
                                $contactUsForm.after($contactUsCompleteTemplate.tmpl());
                                $contactUsForm.remove();
                            }
                        });
                    }
                }
            });
        });
    </script>
</body>
</html>