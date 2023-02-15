<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<spring:eval var="fileAllows" expression="@file['file.allowed.extensions.image']" />
<spring:eval var="fileMaxSize" expression="@file['file.max.byte.size.image']" />
<%-- 헤더 --%>
<header class="area-header-layer">
    <div class="area-inner">
        <h1 class="title">댓글 수정</h1>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</header>
<%-- //헤더 --%>
<%-- 본문 --%>
<div class="area-content-layer area-pad">
    <div class="area-inner">
        <form name="replyForm" id="replyForm" onsubmit="return false">
            <input type="hidden" name="EVT_RPL_IDX" value="<c:out value="${commandMap.EVT_RPL_IDX }"/>"/>
            <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>"/>
            <input type="hidden" name="EVT_MST_PSN_YN" value="<c:out value="${commandMap.EVT_MST_PSN_YN }"/>"/>
            <div class="contain-comment">
                <span class="form-textarea">
                    <textarea name="EVT_RPL_CTS" id="EVT_RPL_CTS" placeholder="내용을 입력해 주세요" onkeyup="StringUtil.getStrLength(this, '.byte', 600);" maxlength="600"><c:out value="${info.EVT_RPL_CTS }"/></textarea>
                    <i><span class="byte"><c:out value="${fn:length(info.EVT_RPL_CTS) }"/></span>/600</i>
                    <label class="form-alert" message-target="EVT_RPL_CTS" data-name="내용"></label>
                </span>
                <div class="box-form">
                    <span>
                        <input type="text" name="EVT_RPL_NM" id="EVT_RPL_NM" value="<c:out value="${info.EVT_RPL_NM }"/>" placeholder="이름" maxlength="10"/>
                        <label class="form-alert" message-target="EVT_RPL_NM" data-name="이름"></label>
                    </span>
                    <span>
                        <input type="password" name="EVT_RPL_PW" id="EVT_RPL_PW" value="" placeholder="비밀번호" maxlength="15"/>
                        <label class="form-alert" message-target="EVT_RPL_PW" data-name="비밀번호"></label>
                    </span>
                </div>
                <c:if test="${commandMap.EVT_MST_IMG_YN eq 'Y'}">
                    <div class="box-addphoto">
                        <span class="btn-addphoto">
                            <input type="file" name="FILE" style="display:none;"/>
                            <button class="file-add">이미지 등록</button>
                        </span>
                        <p class="text-information-type2"><ui:byteCal bytes="${fileMaxSize }"/> 이하만 가능</p>
                        <c:if test="${empty fileList }">
                            <div class="box-photo">
                            </div>
                        </c:if>
                        <c:if test="${not empty fileList }">
                            <c:forEach var="row" items="${fileList }">
                                <div class="box-photo">
                                    <span class="btn-delete-photo" data-key="<c:out value="${row.CMM_FLE_IDX }"/>"><button>삭제</button></span>
                                    <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${row.CMM_FLE_ATT_PATH }"/><c:out value="${row.CMM_FLE_SYS_NM }"/>" alt="Default Image" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_icon_photo_gray.png'">
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </c:if>
            </div>
            <hr class="divline-type2">
            <div class="contain-comment">
                <h3 class="title">유의사항</h3>
                <div class="list-type2">
                    <ul>
                        <li>이벤트와 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 게시글이 삭제 조치 될 수 있습니다.</li>
                    </ul>
                </div>
            </div>
            
            <%-- 하단 고정버튼 --%>
            <div class="fixed-box-button">
                <span class="btn-type-text1"><button>저장</button></span><%-- 활성화 버튼 --%><%-- 비활성화 시 disabled 클래스 추가 --%>
            </div>
            <%-- //하단 고정버튼 --%>
        </form>
    </div>
</div>
<%-- //본문 --%>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
<script id="eventReplyImageTemplate" type="text/x-jquery-tmpl">
    <span class="btn-delete-photo"><button>삭제</button></span>
    <img src="\${src}" alt="Default Image" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_icon_photo_gray.png'">
</script>
<script>
    $(function () {
        var $layerPopup = $(".layer-popup1"),
            $replyForm = $layerPopup.find("#replyForm"),
            $boxPhoto = $replyForm.find(".box-photo"),
            $eventReplyImageTemplate = $layerPopup.find("#eventReplyImageTemplate");
        
        <%-- 이미지 등록 버튼  클릭 이벤트 --%>
        $replyForm.off("click", ".file-add").on("click", ".file-add", function (e) {
            e.preventDefault(); 
            $(this).siblings("input[name='FILE']").trigger("click");
        });
        <%-- 이미지 삭제 버튼  클릭 이벤트 --%>
        $replyForm.off("click", ".btn-delete-photo").on("click", ".btn-delete-photo", function (e) {
            e.preventDefault(); 
            var cmmFleDelIdx = $(this).data("key");
            if (typeof(cmmFleDelIdx) != "undefined") {
                $replyForm.append(TagUtil.createDynamicInput("hidden", "CMM_FLE_DEL_IDXs", cmmFleDelIdx));
            }
            $boxPhoto.empty();
        });
        <%-- 파일변경 이벤트 --%>
        $replyForm.off("click", "input[name='FILE']").on("change", "input[name='FILE']", function () {
            var $this = $(this);
            if ($this.val() != "") {
                if (validFileExt($this.val()) && validFileSize(this)) {
                    var cmmFleDelIdx = $this.closest(".btn-addphoto").siblings(".box-photo").find(".btn-delete-photo").data("key");
                    if (typeof(cmmFleDelIdx) != "undefined") {
                        $replyForm.append(TagUtil.createDynamicInput("text", "CMM_FLE_DEL_IDXs", cmmFleDelIdx));
                    }
                    readFile(this);
                } else {
                    $this.val("");
                    $boxPhoto.empty();
                }
            } else {
                $boxPhoto.empty();
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
        <%-- 이미지 미리보기 --%>
        function readFile(object) {
            if (object.files && object.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $boxPhoto.empty();
                    $eventReplyImageTemplate.tmpl({src : e.target.result}).appendTo($boxPhoto);
                }
                reader.readAsDataURL(object.files[0]);
            }
        }
        
        <%-- 폼 유효성 체크 및 전송 이벤트 --%>
        $replyForm.validate({
            rules : {
                EVT_RPL_CTS : {
                    required : true
                },
                EVT_RPL_NM : {
                    required : true
                },
                EVT_RPL_PW : {
                    required : true,
                    engOrNum : true,
                    rangelength : [6, 10]
                }
            },
            submitHandler : function(form) {
                if (confirm("저장 하시겠습니까?")) {
                    var $form = $(form),
                        $file = $form.find("input[name='FILE']");
                    $form.find("input[name='EVT_RPL_PW']").val(hex_sha512($form.find("input[name='EVT_RPL_PW']").val()).toString());
                    var formData = new FormData(),
                        params = $(form).serializeObject();
                    if ($file.length > 0 && $file.val() != "") {
                        formData.append("FILE", $form.find("input[name='FILE']")[0].files[0]);
                    }
                    $.each(params, function (key, value) {
                        formData.append(key, value);
                    });
                    $.postSyncMultipartJsonAjax($.action.marketing.event.reply.modify.ajax(), formData, function (data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다.");
                            $.callback();
                            $.common.layer.close($layerPopup);
                        }
                    });
                }
            }
        });
    });
</script>