<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<spring:eval var="fileAllows" expression="@file['file.allowed.extensions.image']" />
<spring:eval var="fileMaxSize" expression="@file['file.max.byte.size.image']" />

<div class="layer-inner">
    <!-- 헤더 -->
    <header class="area-header-layer">
        <div class="area-inner">
            <h1 class="title">가입신청후기작성</h1>
            <span class="btn-close"><button>닫기</button></span>
        </div>
    </header>
    <!-- //헤더 -->
    <!-- 본문 -->
    <div class="area-content-layer">
        <div class="area-inner">
        
            <div class="mypage">
                <div class="box-information-member">
                    <dl>
                        <dt><c:out value="${contractor.USER_NM }"/></dt>
                        <dd>
                            <ul class="list-type3">
                                <li>가입상품: <c:out value="${info.PRD_MST_NM }"/></li>
                                <li>모델분류: <c:out value="${info.MODEL_CL_NM }"/></li>
                            </ul>
                        <dd class="profile">
                            <c:if test="${contractor.USER_SEX eq Const.MAN}">
                                <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_profile_men.png" alt="프로필 사진">
                            </c:if>
                            <c:if test="${contractor.USER_SEX ne Const.MAN}">
                                <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_profile_women.png" alt="프로필 사진">
                            </c:if>
                        </dd>
                    </dl>
                </div>

                <hr class="divline-type2">
                
                <%-- 후기 등록 --%>
                <form id="reviewForm" name="reviewForm">
                    <c:if test="${not empty info.detailList }">
                        <c:forEach var="row" items="${info.detailList }" varStatus="stat">
                            <input type="hidden" name="ORD_MST_IDXs" value="${row.ORD_MST_IDX }">
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty info.detailList }">
                        <input type="hidden" name="ORD_MST_IDXs" value="${info.ORD_MST_IDX }">
                    </c:if>

                    <div class="box-reviewmark">
                        <p class="text-normal-type2">상품은 잘 보셨나요?<br>이 상품 추천하고 싶으신가요?</p>
                        <div class="box-meta-review">
                            <label class="form-radio star1"><input type="radio" name="PRD_REV_PIT" value="1"></label>
                            <label class="form-radio star2"><input type="radio" name="PRD_REV_PIT" value="2"></label>
                            <label class="form-radio star3"><input type="radio" name="PRD_REV_PIT" value="3"></label>
                            <label class="form-radio star4"><input type="radio" name="PRD_REV_PIT" value="4"></label>
                            <label class="form-radio star5"><input type="radio" name="PRD_REV_PIT" value="5"></label>
                        </div>
                    </div>
    
                    <div class="box-reviewwrite">
                        <p class="text-normal-type2">고객님의 신청후기를 들려주세요.</p>
                        <span class="form-textarea">
                            <textarea name="PRD_REV_CTS" placeholder="예) 똑똑하게 혜택 받으면서, 버킷리스트 준비하고 싶어요!" onkeyup="StringUtil.getStrLength(this, '.byte', 500);"></textarea>
                            <i><span class="byte">0</span>/500</i>
                        </span>
                    </div>
    
                    <div class="box-addphoto">
                        <span class="btn-addphoto">
                            <input type="file" name="FILE" style="display:none;"/>
                            <button type="button" class="file-add">사진첨부</button>
                        </span>
                        <p class="text-information-type2"><ui:byteCal bytes="${fileMaxSize }"/> 이하만 가능</p>
                        <div class="box-photo">
                        </div>
                    </div>
                    
                    <!-- 하단 고정버튼 -->
                    <div class="fixed-box-button">
                        <span class="btn-type-text1"><button id="btnSave">저장</button></span><!-- 활성화 버튼 --><!-- 비활성화 시 disabled 클래스 추가 -->
                    </div>
                    <!-- //하단 고정버튼 -->
                
                </form>
                <%-- 후기 등록 --%>

            </div>

        </div>
    </div>
    <!-- //본문 -->
</div>

<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
<script id="reviewImageTemplate" type="text/x-jquery-tmpl">
    <span class="btn-delete-photo"><button>삭제</button></span>
    <img src="\${src}" alt="Default Image" onerror="this.src='<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_icon_photo_gray.png'">
</script>

<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $reviewForm = $layerPopup.find("#reviewForm"),
        $boxPhoto = $reviewForm.find(".box-photo"),
        $reviewImageTemplate = $layerPopup.find("#reviewImageTemplate");
    
    <%-- 이미지 등록 버튼  클릭 이벤트 --%>
    $reviewForm.off("click", ".file-add").on("click", ".file-add", function (e) {
        e.preventDefault(); 
        $(this).siblings("input[name='FILE']").trigger("click");
    });
    <%-- 이미지 삭제 버튼  클릭 이벤트 --%>
    $reviewForm.off("click", ".btn-delete-photo").on("click", ".btn-delete-photo", function (e) {
        e.preventDefault(); 
        $reviewForm.find("input[name='FILE']").val("");
        $boxPhoto.empty();
    });
    <%-- 파일변경 이벤트 --%>
    $reviewForm.off("click", "input[name='FILE']").on("change", "input[name='FILE']", function () {
        var $this = $(this);
        if ($this.val() != "") {
            if (validFileExt($this.val()) && validFileSize(this)) {
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
                $reviewImageTemplate.tmpl({src : e.target.result}).appendTo($boxPhoto);
            }
            reader.readAsDataURL(object.files[0]);
        }
    }
    // 폼
    $reviewForm.validate({
        rules : {
            PRD_REV_PIT : { required : true },
            PRD_REV_CTS : { required : true, maxlength : 500 }
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
                    if (Array.isArray(value)) {
                        $.each(value, function () {
                            formData.append(key, this);
                        });
                    } else {
                        formData.append(key, value);
                    }
                });
                $.postSyncMultipartJsonAjax($.action.mycontract.info.review.ajax(), formData, function (data) {
                    if (data.isSuccess) {
                        alert("가입후기가 등록되었습니다.");
                        $.common.layer.close($layerPopup);
                        document.location.reload();
                    } else {
                        alert("가입후기가 등록이 실패하였습니다.");
                    }
                });
            }
        }
    });
    // 유효성 검사
    $reviewForm.valid();
});
</script>

<%-- 가입 후기를 이미 작성 한 경우 --%>
<c:if test="${not empty info.PRD_REV_IDX }">
    <script>
    $(function () {
        var $layerPopup = $(".layer-popup1");
        alert("이미 가입 후기를 작성하였습니다.");
        $.common.layer.close($layerPopup);
    });
    </script>
</c:if>