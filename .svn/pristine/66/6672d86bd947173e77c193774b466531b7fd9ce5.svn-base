<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta property="og:site_name" key="site_name" content="<spring:eval expression="@resource['project.title']"/>" class="meta-sns-share">
    <meta property="og:url" key="url" content="<spring:eval expression="@resource['front.ssl.domain']"/><c:out value="${requestURI }"/><c:out value="${paramsQueryString }"/>" class="meta-sns-share"/>
    <meta property="og:type" key="type" content="article"  class="meta-sns-share"/>
    <meta property="og:title" key="title" content="<c:out value="${info.PLN_MST_TITLE}"/>" class="meta-sns-share"/>
    <meta property="og:description" key="description" content="<spring:eval expression="@resource['project.title']"/> 기획전"  class="meta-sns-share"/>
    <meta property="og:image" key="image" content="<spring:eval expression="@resource['front.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${info.CMM_FLE_WEB_PC_PATH}"/>" class="meta-sns-share"/>
    <meta property="og:image:width" key="image_width" content="750" class="meta-sns-share"/>
    <meta property="og:image:height" key="image_height" content="750" class="meta-sns-share"/>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/promotion.css">
</head>
<body class="">
    <%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
    <jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
        <jsp:param name="oneDepth" value="기획전"/>
        <jsp:param name="oneDepthKey" value="marketing.plan.list"/>
    </jsp:include>
    <%-- Body --%>
    <div class="area-body">
        <div class="area-inner">
            <div class="contain-event-box">
                <h3 class="title"><c:out value="${info.PLN_MST_TITLE }"/></h3>
                <div class="box-detail-product1">
                    <c:if test="${not empty planList }">
                        <div class="box-event-select">
                            <span class="form-select">
                                <select class="select-other-plan">
                                    <option value="" selected="selected">기획전 더보기</option>
                                    <c:forEach var="row" items="${planList }">
                                        <option value="<c:out value="${row.PLN_MST_IDX }"/>" selected="selected"><c:out value="${row.PLN_MST_TITLE }"/></option>
                                    </c:forEach>
                                </select>
                            </span>
                        </div>
                    </c:if>
                    <%@include file="/WEB-INF/jsp/pc/include/sns.jsp" %>
                </div>
                <div class="box-detail-product2">
                    <%-- 동영상 없을 경우 video 전체 없앰 --%>
                    <c:if test="${not empty info.PLN_MST_PC_MDA and info.PLN_MST_PC_MDA ne '<p>&nbsp;</p>' }">
                        <div class="video">
                            <c:out value="${info.PLN_MST_PC_MDA }" escapeXml="false"/>
                        </div>
                    </c:if>
                    <span class="content">
                        <c:out value="${info.PLN_MST_PC_DTL }" escapeXml="false"/>
                    </span>
                </div>
                <c:if test="${info.PLN_MST_PRD_DPL_YN eq 'Y' }">
                    <div class="box-detail-product4">
                        <c:if test="${empty planGroupList }">
                            <p class="text-information-type2">등록된 상품이 없습니다.</p>
                        </c:if>
                        <c:if test="${not empty planGroupList }">
                            <c:forEach var="grpRow" items="${planGroupList }">
                                <div class="box-product4-inner">
                                    <p class="title"><c:out value="${grpRow.PLN_GRP_TITLE }"/></p>
                                    <div class="box-store-list <c:out value="${grpRow.PLN_GRP_COL_NM }"/>">
                                        <c:if test="${not empty grpRow.planDetailList }">
                                            <c:forEach var="dtlRow" items="${grpRow.planDetailList }">
                                                <ui:productList info="${dtlRow }" type="type3" thubnailSize="750"/>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </c:if>
                <c:if test="${info.PLN_MST_RPL_YN eq 'Y' }">
                    <div class="box-detail-product5">
                        <div class="form-comment">
                            <form name="replyRegistForm" id="replyRegistForm" onsubmit="return false">
                                <input type="hidden" name="PLN_MST_IDX" value="<c:out value="${info.PLN_MST_IDX }"/>"/>
                                <span class="form-textarea">
                                    <textarea name="PLN_RPL_CTS" id="PLN_RPL_CTS" onkeyup="StringUtil.getStrLength(this, '.byte', 600);" maxlength="600" placeholder="기획전과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 게시글이 삭제 조치 될 수 있습니다."></textarea>
                                    <i><span class="byte">0</span>/600</i>
                                    <label class="form-alert" message-target="PLN_RPL_CTS" data-name="내용"></label>
                                </span>
                                <span class="btn-type-text1 disabled"><button>댓글 작성하기</button></span>
                                <div class="box-form">
                                    <span>
                                        <input type="text" name="PLN_RPL_NM" id="PLN_RPL_NM" placeholder="(필수) 이름" maxlength="10"/>
                                        <label class="form-alert" message-target="PLN_RPL_NM" data-name="이름"></label>
                                    </span>
                                    <span>
                                        <input type="password" name="PLN_RPL_PW" id="PLN_RPL_PW" placeholder="(필수) 비밀번호" maxlength=""/>
                                        <label class="form-alert" message-target="PLN_RPL_PW" data-name="비밀번호"></label>
                                    </span>
                                </div>
                            </form>
                        </div>
                        <p class="count">댓글 <strong class="text-point2 list-total-count"></strong>개</p>
                        <div class="box-commentlist list-area">
                        </div>
                        <div class="paginate">
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <%-- //Body --%>
    <%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/paging.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
    <script id="planReplyListTemplate" type="text/x-jquery-tmpl">
        {{if StringUtil.getInt(totalCount) == 0}}
            <p class="text-information-type2">등록된 댓글이 없습니다.</p>
        {{else}}
            <div class="contain-qna">
                {{each(i, row) list}}
                    <div class="box-comment">
                        <span class="name">\${row.PLN_RPL_NM}</span>
                        <span class="date">\${StringUtil.formatDate(row.PLN_RPL_REG_DT, "yyyy.MM.dd")}</span>
                        <span class="content">{{html StringUtil.replaceEnterToBr(row.PLN_RPL_CTS)}}</span>
                        <div class="box-comment-more">
                            <button class="btn-comment">더보기</button>
                            <div class="box-comment-inner">
                                <span><button class="reply-edit" data-key="\${row.PLN_RPL_IDX}">수정</button></span>
                                <span><button class="reply-remove" data-key="\${row.PLN_RPL_IDX}">삭제</button></span>
                            </div>
                        </div>
                    </div>
                {{/each}}
            </div>
        {{/if}}
    </script>
    <script id="planReplyEditTemplate" type="text/x-jquery-tmpl">
        <div class="form-comment">
            <form name="replyModifyForm" id="replyModifyForm">
                <input type="hidden" name="PLN_MST_IDX" value="<c:out value="${info.PLN_MST_IDX }"/>"/>
                <input type="hidden" name="PLN_RPL_IDX" value="\${info.PLN_RPL_IDX}"/>
                <span class="form-textarea">
                    <textarea name="PLN_RPL_CTS" id="PLN_RPL_CTS" onkeyup="StringUtil.getStrLength(this, '.byte', 600);" maxlength="600" placeholder="기획전과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 게시글이 삭제 조치 될 수 있습니다.">\${info.PLN_RPL_CTS}</textarea>
                    <i><span class="byte">\${info.PLN_RPL_CTS.length}</span>/600</i>
                    <label class="form-alert" message-target="PLN_RPL_CTS" data-name="내용"></label>
                </span>
                <span class="btn-type-text1 disabled"><button>저장</button></span>
                <span class="btn-type-text3"><button class="reply-cancel" onclick="return false">취소</button></span>
                <div class="box-form">
                    <span>
                        <input type="text" name="PLN_RPL_NM" id="PLN_RPL_NM" value="\${info.PLN_RPL_NM}" placeholder="(필수) 이름" maxlength="10"/>
                        <label class="form-alert" message-target="PLN_RPL_NM" data-name="이름"></label>
                    </span>
                    <span>
                        <input type="password" name="PLN_RPL_PW" id="PLN_RPL_PW" value="" placeholder="(필수) 비밀번호"/>
                        <label class="form-alert" message-target="PLN_RPL_PW" data-name="비밀번호"></label>
                    </span>
                </div>
            </form>
        </div> 
    </script>
    <script>
        $(function () {
            var defaultParm = {PLN_MST_IDX : "<c:out value="${info.PLN_MST_IDX }"/>"};
            var $areaBody = $(".area-body"),
                $layerPopup = $(".layer-popup2"),
                $totalCount = $areaBody.find(".list-total-count"),
                $listArea = $areaBody.find(".list-area"),
                $paginate = $areaBody.find(".paginate"),
                $planReplyListTemplate = $("#planReplyListTemplate"),
                $planReplyEditTemplate = $("#planReplyEditTemplate"),
                $replyRegistForm = $areaBody.find("#replyRegistForm");
            <%-- 기획전 더보기 셀렉트 박스 변경 이벤트 --%>
            $areaBody.on("change", ".select-other-plan", function () {
                var value = $(this).val();
                if (value != "") {
                    var params = {PLN_MST_IDX : value};
                    $.requestPage($.action.marketing.plan.view(), params);
                }
            });
            <%-- 댓글 등록 폼 유효성 체크 및 전송 이벤트 --%>
            $replyRegistForm.validate({
                rules : {
                    PLN_RPL_CTS : {
                        required : true
                    },
                    PLN_RPL_NM : {
                        required : true
                    },
                    PLN_RPL_PW : {
                        required : true,
                        engOrNum : true,
                        rangelength : [6, 10]
                    }
                },
                submitHandler : function(form) {
                    if (confirm("저장 하시겠습니까?")) {
                        var $form = $(form);
                        $form.find("input[name='PLN_RPL_PW']").val(hex_sha512($form.find("input[name='PLN_RPL_PW']").val()).toString());
                        $.postSyncJsonAjax($.action.marketing.plan.reply.regist.ajax(), $form.serializeObject(), function (data) {
                            if (data.isSuccess) {
                                alert("저장 되었습니다.");
                                $form.find("input, textarea").val("");
                                StringUtil.getStrLength(form.PLN_RPL_CTS, ".byte", 600);
                                $form.find(".form-alert").removeClass(["ver2", "on"]);
                                requestReplyList(1);
                            }
                        });
                    }
                }
            });
            <%-- 댓글 수정 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".reply-edit", function () {
                var $this = $(this);
                var plnRplIdx = $this.data("key");
                $this.closest(".box-comment-inner").removeClass("active");
                openLoginFormLayer(plnRplIdx, function (prdQnAMemNm, prdQnAMemPw) {
                    var $boxComment = $this.closest(".box-comment");
                    $.postSyncJsonAjax($.action.marketing.plan.reply.info.ajax(), $.extend({PLN_RPL_IDX : plnRplIdx}, defaultParm), function (data) {
                        $planReplyEditTemplate.tmpl(data).appendTo($boxComment);
                        var $replyModifyForm = $boxComment.find("#replyModifyForm");
                        <%-- 댓글 수정 폼 유효성 체크 및 전송 이벤트 --%>
                        $replyModifyForm.validate({
                            rules : {
                                PLN_RPL_CTS : {
                                    required : true
                                },
                                PLN_RPL_NM : {
                                    required : true
                                },
                                PLN_RPL_PW : {
                                    required : true,
                                    engOrNum : true,
                                    rangelength : [6, 10]
                                }
                            },
                            submitHandler : function(form) {
                                if (confirm("저장 하시겠습니까?")) {
                                    var $form = $(form);
                                    $form.find("input[name='PLN_RPL_PW']").val(hex_sha512($form.find("input[name='PLN_RPL_PW']").val()).toString());
                                    $.postSyncJsonAjax($.action.marketing.plan.reply.modify.ajax(), $form.serializeObject(), function (data) {
                                        if (data.isSuccess) {
                                            alert("저장 되었습니다.");
                                            requestReplyList();
                                        }
                                    });
                                }
                            }
                        });
                        <%-- 댓글 수정 폼 취소버튼 클릭 이벤트 --%>
                        $replyModifyForm.off("click", ".reply-cancel").on("click", ".reply-cancel", function (e) {
                            e.preventDefault();
                            requestReplyList();
                        });
                    });
                });
            });
            <%-- 댓글 삭제 버튼 클릭 이벤트 --%>
            $areaBody.on("click", ".reply-remove", function () {
                var $this = $(this);
                var plnRplIdx = $this.data("key");
                $this.closest(".box-comment-inner").removeClass("active");
                openLoginFormLayer(plnRplIdx, function (prdQnAMemNm, prdQnAMemPw) {
                    if (confirm("댓글을 삭제하시겠습니까?")) {
                        $.postSyncJsonAjax($.action.marketing.plan.reply.remove.ajax(), $.extend({PLN_RPL_IDX : plnRplIdx}, defaultParm), function (data) {
                            if (data.isSuccess) {
                                alert("댓글이 삭제되었습니다.");
                            } else {
                                alert("댓글 삭제에 실패하였습니다.");
                            }
                            requestReplyList(1);
                        });
                    }
                });
            });
            <%-- 댓글 목록 호출 --%>
            requestReplyList = function (cPage) {
                if (typeof(cPage) == "undefined") {
                    cPage = StringUtil.getInt($paginate.find(".on").text());
                }
                $.postSyncJsonAjax($.action.marketing.plan.reply.list.ajax(), $.extend({cPage : cPage}, defaultParm), function (data) {
                    var totalCount = StringUtil.getInt(data.totalCount);
                    $totalCount.text(StringUtil.setComma(totalCount));
                    $listArea.siblings(".text-information-type2").remove();
                    $listArea.empty();
                    if (totalCount > 0) {
                        $planReplyListTemplate.tmpl(data).appendTo($listArea);
                        commentMore();
                    } else {
                        $listArea.before($planReplyListTemplate.tmpl(data));
                    }
                    $paginate.paging(data.paging, requestReplyList);
                });
            };
            <%-- 로그인 폼 레이어 열기 --%>
            openLoginFormLayer = function (plnRplIdx, callback) {
                var $loginFormLayer = $(".layer-popup2");
                $loginFormLayer.requestLayer($.action.common.login.form.layer(), {title : "본인 댓글 확인", sessionYn : "N"});
                $.callback = function (prdQnAMemNm, prdQnAMemPw) {
                    var params = $.extend({searchPlnRplIdx : plnRplIdx, searchPlnRplNm : prdQnAMemNm, searchPlnRplPw : prdQnAMemPw}, defaultParm);
                    $.postSyncJsonAjax($.action.marketing.plan.reply.login.ajax(), params, function (data) {
                        if (data.isSuccess) {
                            callback(prdQnAMemNm, prdQnAMemPw);
                        } else {
                            alert("이름과 비밀번호가 일치하지 않습니다.");
                        }
                    });
                }
            };
            if ($listArea.length > 0) {
                requestReplyList(1);
            }
        });
    </script>
</body>
</html>