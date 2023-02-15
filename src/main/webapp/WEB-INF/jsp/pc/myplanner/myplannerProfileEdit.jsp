<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/myplanner.css">
</head>
<body class="">

<%-- 첨부파일 --%>
<spring:eval var="fileAllows" expression="@file['file.allowed.extensions.image']" />
<spring:eval var="fileMaxSize" expression="@file['file.max.byte.size.image']" />

<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>

<jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
    <jsp:param name="oneDepth" value="My레디플래너"/>
    <jsp:param name="oneDepthKey" value="myplanner.campaign.product.list"/>
    <jsp:param name="twoDepth" value="프로필 관리"/>
    <jsp:param name="twoDepthKey" value="myplanner.profile.edit"/>
</jsp:include>

<!-- Body -->
<div class="area-body">
    <div class="area-inner">

        <div class="wrap">

            <%-- 좌측 메뉴 --%>
            <jsp:include page="/WEB-INF/jsp/pc/include/aside.jsp" flush="false">
                <jsp:param name="asideTitle" value="My 레디플래너"/>
                <jsp:param name="asideGroup" value="myplanner_pc"/>
            </jsp:include>
            <%-- 정지 상태 안내 --%>

            <div class="contain-body">
                <div class="content-header">
                    <h3 class="title">프로필 관리</h3>
                </div>

                <div class="content-password-box">
                    <div class="box-modify">
                        <div class="box-profile-modify">
                            <div class="box-profile">
                                <p class="profile-img">
                                    <c:choose>
                                        <c:when test="${not empty info.RDP_MST_PROFILE_IMAGE }">
                                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${info.RDP_MST_PROFILE_IMAGE }"/>" 
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'"
                                                 alt="프로필사진">
                                        </c:when>
                                        <c:when test="${empty info.RDP_MST_PROFILE_IMAGE }">
                                            <img src="<spring:eval expression="@resource['img.ssl.none.src.pc']"/>" alt="프로필사진">
                                        </c:when>
                                    </c:choose>
                                    <span class="btn-modify">
                                        <input id="profileImage" type="file" name="FILE" style="display:none;"/>
                                        <button id="btnUploadProfileImage">수정</button>
                                    </span>
                                </p>
                                <p class="profile-name">행복한 하루 되세요<span><span class="text-point2"><c:out value="${info.RDP_MST_MEM_NM }"/></span>님</span></p>                
                            </div>
                        </div>
                    
                        <hr class="divline-type2">
                    
                        <div class="box-profile-form">
                            <dl class="box-form fixed">
                                <dt>이름</dt>
                                <dd><c:out value="${info.RDP_MST_MEM_NM }"/><span class="btn-type-text5"><button id="btnChangePassword">비밀번호 변경</button></span></dd>
                            </dl>
                            <dl class="box-form fixed">
                                <dt>휴대폰 번호</dt>
                                <dd><c:out value="${info.RDP_MST_HP1 }"/>-<c:out value="${info.RDP_MST_HP2 }"/>-<c:out value="${info.RDP_MST_HP3 }"/><span class="btn-type-text5"><button id="btnChangePhoneNumber">연락처 변경</button></span></dd>
                            </dl>
                            <dl class="box-form fixed">
                                <dt>이메일 주소</dt>
                                <dd><c:out value="${info.RDP_MST_MAIL }"/></dd>
                            </dl>   
                            <hr class="divline-type1">                    
                        </div>
                    
                        <%-- 개인 --%>
                        <c:if test="${info.RDP_MST_BUSI_CLS eq Code.PLANNER_BUSINESS_CLASS_PRIVATE }">
                        
                            <div class="box-profile-form">
                                <dl class="box-form fixed">
                                    <dt>소속구분</dt>
                                    <dd>개인사업자(세금계산서N)</dd>
                                </dl>
                                <hr class="divline-type1">    
                            </div>  
                            
                            <dl class="box-form">
                                <dt class="necessary">주소</dt>
                                <dd><input type="text" placeholder="<c:out value="${info.RDP_MST_DR_ADDR1 }"/>" disabled></dd>
                                <dd><input type="text" placeholder="<c:out value="${info.RDP_MST_DR_ADDR2 }"/>" disabled></dd>
                            </dl>
                            
                        </c:if>
                        <%-- 개인 --%>
        
                        <%-- 개인사업자 / 법인사업자 --%>
                        <c:if test="${info.RDP_MST_BUSI_CLS ne Code.PLANNER_BUSINESS_CLASS_PRIVATE }">
                        
                            <div class="box-profile-form">
                                <dl class="box-form fixed">
                                    <dt>소속구분</dt>
                                    <dd>법인/개인사업자(세금계산서Y)</dd>
                                </dl>
                            </div>  
                    
                            <div class="box-profile-form">   
                                <dl class="box-form">
                                    <dt class="necessary">사업자번호</dt>
                                    <dd><span class="form-compregnum">
                                        <input type="text" placeholder="<c:out value="${info.RDP_MST_BUSI1 }"/>" disabled>
                                        <i>-</i>
                                        <input type="text" placeholder="<c:out value="${info.RDP_MST_BUSI2 }"/>" disabled>
                                        <i>-</i>
                                        <input type="text" placeholder="<c:out value="${info.RDP_MST_BUSI3 }"/>" disabled>
                                        </span>
                                    </dd>
                                </dl>
                                <div class="form-col2">
                                    <dl class="box-form">
                                        <dt class="necessary">대표자명</dt>
                                        <dd><input type="text" placeholder="<c:out value="${info.RDP_MST_CEO_NM }"/>" disabled></dd>
                                    </dl>
                                    <dl class="box-form">
                                        <dt class="necessary">회사명</dt>
                                        <dd><input type="text" placeholder="<c:out value="${info.RDP_MST_BUSI_NM }"/>" disabled></dd>
                                    </dl>
                                </div>
                                <dl class="box-form">
                                    <dt class="necessary">주소</dt>
                                    <dd><input type="text" placeholder="<c:out value="${info.RDP_MST_DR_ADDR1 }"/>" disabled></dd>
                                    <dd><input type="text" placeholder="<c:out value="${info.RDP_MST_DR_ADDR2 }"/>" disabled></dd>
                                </dl>
                                <div class="form-col2">
                                    <dl class="box-form">
                                        <dt class="necessary">업태</dt>
                                        <dd><input type="text" placeholder="<c:out value="${info.RDP_MST_BUSI_CDT }"/>" disabled></dd>
                                    </dl>
                                    <dl class="box-form">
                                        <dt class="necessary">종목</dt>
                                        <dd><input type="text" placeholder="<c:out value="${info.RDP_MST_BUSI_TYPE }"/>" disabled></dd>
                                    </dl>
                                </div>    
                                <hr class="divline-type1">            
                            </div>
                        
                        </c:if>
                        <%-- 개인사업자 / 법인사업자 --%>
                    
                        <div class="box-profile-form">
                            <dl class="box-form fixed">
                                <dt>정산 계좌 정보</dt>
                                <dd>
                                    <c:out value="${info.RDP_MST_BNK_CD_NM }"/>
                                    /
                                    <ui:formatBankAccount value="${info.RDP_MST_BNK_ACT }"/>
                                    /
                                    <c:out value="${info.RDP_MST_MEM_NM }"/>
                                    <span class="btn-type-text5">
                                        <button id="btnChangeBankAccount">변경</button>
                                    </span>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>

    </div>
</div>
<!-- //Body -->

<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    
<script>
    $(function () {
        var $areaContent = $(".area-body");
        // 프로필 이미지 변경
        $areaContent.on("click", "#btnUploadProfileImage", function(e) {
            $areaContent.find("#profileImage").trigger("click");
        });
        $areaContent.on("change", "#profileImage", function () {
            var $this = $(this);
            if ($this.val() != "") {
                if (validFileExt($this.val()) && validFileSize(this)) {
                    if (confirm("선택한 이미지를 업로드 하시겠습니까?")) {
                        uploadProfileImage(this.files[0]);
                    }
                }
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
        // 프로필 이미지 수정
        function uploadProfileImage(image) {
            var formData = new FormData();
            formData.append("FILE", image);
            $.postSyncMultipartJsonAjax($.action.myplanner.profile.image.upload.ajax(), formData, function (data) {
                if (data.isSuccess) {
                    alert("저장 되었습니다.");
                    document.location.reload();
                } else {
                    alert("이미지 업로드가 실패하였습니다.");
                }
            });
        }
        // 비밀번호 변경 레이어
        $areaContent.on("click", "#btnChangePassword", function() {
            $(".layer-popup1").requestLayer($.action.myplanner.change.password.form.layer());
        });
        // 연락처 변경 - 본인확인 레이어
        $areaContent.on("click", "#btnChangePhoneNumber", function() {
            // # 서비스 번호 - 플래너 프로필 수정
            $.common.check.oneself("", function (data) {
                if (data.isSuccess) {
                    $.postSyncJsonAjax($.action.myplanner.change.phone.form.ajax(), {}, function (data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다.");
                            document.location.reload();
                        } else {
                            if (data.message) {
                                alert(data.message);
                            } else {
                                alert("변경 요청이 실패하였습니다.");
                            }
                        }
                    });
                } else {
                    alert(data.resultMessage);
                }
            });
        });
        // 정산 계좌 변경 레이어
        $areaContent.on("click", "#btnChangeBankAccount", function() {
            $(".layer-popup1").requestLayer($.action.myplanner.change.bank.form.layer());
        });
    });
</script>
</body>
</html>