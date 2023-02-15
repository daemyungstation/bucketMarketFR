<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta property="og:site_name" key="site_name" content="<spring:eval expression="@resource['project.title']"/>" class="meta-sns-share">
    <meta property="og:url" key="url" content="<spring:eval expression="@resource['mobile.ssl.domain']"/><c:out value="${requestURI }"/><c:out value="${paramsQueryString }"/>" class="meta-sns-share"/>
    <meta property="og:type" key="type" content="article"  class="meta-sns-share"/>
    <meta property="og:title" key="title" content="<c:out value="${info.EVT_MST_TITLE}"/>" class="meta-sns-share"/>
    <meta property="og:description" key="description" content="<spring:eval expression="@resource['project.title']"/> 이벤트"  class="meta-sns-share"/>
    <meta property="og:image" key="image" content="<spring:eval expression="@resource['mobile.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${info.CMM_FLE_WEB_MB_PATH}"/>" class="meta-sns-share"/>
    <meta property="og:image:width" key="image_width" content="750" class="meta-sns-share"/>
    <meta property="og:image:height" key="image_height" content="750" class="meta-sns-share"/>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/promotion.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title|search"/>
        <jsp:param name="headerTitle" value="${info.EVT_MST_TITLE }"/>
    </jsp:include>

    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-event-basis">
                <%-- 이벤트 제목 --%>
                <div class="box-detail-product1">
                    <h2 class="title">
                        <c:if test="${info.EVT_MST_ING_YN eq 'Y' }">
                            <span class="event e-ing">진행중</span>
                        </c:if>
                        <c:if test="${info.EVT_MST_ING_YN ne 'Y' }">
                            <span class="event e-end">종료</span>
                        </c:if>
                        <c:out value="${info.EVT_MST_TITLE }"/>
                    </h2>
                    <span class="data"><ui:formatDate value="${info.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${info.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>
                    <span class="btn-share"><button class="call-sns-layer">SNS</button></span>
                </div>
                <%-- 이벤트 동영상/사진 --%>
                <div class="box-detail-product2">
                    <%-- 동영상 없을 경우 video 전체 없앰 --%>
                    <c:if test="${not empty info.EVT_MST_MB_MDA and info.EVT_MST_MB_MDA ne '<p>&nbsp;</p>' }">
                        <div class="video">
                            <c:out value="${info.EVT_MST_MB_MDA }" escapeXml="false"/>
                        </div>
                    </c:if>
                    <div class="images">
                        <c:out value="${info.EVT_MST_MB_DTL }" escapeXml="false"/>
                    </div>
                </div>
                <c:if test="${info.EVT_MST_RPL_YN eq 'Y' }">
                    <%-- 댓글시작 --%>
                    <hr class="divline-type2">
                    <div class="box-detail-product5">
                        <h3 class="title">댓글 <span class="text-point2 list-total-count"></span>개</h3>
                        <span class="btn-type-text1 btn-arrow-type1"><button class="reply-form">댓글 작성하기</button></span>
                        <div class="contain-commentlist">
                            <ul class="box-comment list-area">
                            </ul>
                            <div class="paginate">
                            </div>
                        </div>
                    </div>
                    <%-- 댓글끝 --%>
                </c:if>
            </div>
        </div>
    </div>
    <%-- //본문 --%>
    <%@include file="/WEB-INF/jsp/mo/include/footer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/floating.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/aside.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/layer.jsp" %>
    <%@include file="/WEB-INF/jsp/mo/include/script.jsp" %>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/paging.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
    <script id="eventReplyListTemplate" type="text/x-jquery-tmpl">
        {{if StringUtil.getInt(totalCount) == 0}}
            <p class="text-information-type2">등록된 댓글이 없습니다.</p>
        {{else}}
            <div class="contain-qna">
                {{each(i, row) list}}
                    <li>
                        <span class="name">\${row.EVT_RPL_NM}</span>
                        <span class="date">\${StringUtil.formatDate(row.EVT_RPL_REG_DT, "yyyy.MM.dd")}</span>
                        <span class="content">{{html StringUtil.replaceEnterToBr(row.EVT_RPL_CTS)}}</span>
                        <span class="image"><img src="<spring:eval expression="@resource['cdn.ssl.domain']"/>\${row.CMM_FLE_WEB_PATH}" alt="" /></span>
                        <div class="box-comment-more">
                            <button class="btn-comment">더보기</button>
                            <div class="box-comment-inner">
                                <span><button class="reply-edit" data-key="\${row.EVT_RPL_IDX}">수정</button></span>
                                <span><button class="reply-remove" data-key="\${row.EVT_RPL_IDX}">삭제</button></span>
                            </div>
                        </div>
                    </li>
                {{/each}}
            </div>
        {{/if}}
    </script>
    <script>
        $(function () {
            var defaultParm = {EVT_MST_IDX : "<c:out value="${info.EVT_MST_IDX }"/>"};
            var $areaContent = $(".area-content"),
                $layerPopup = $(".layer-popup1"),
                $totalCount = $areaContent.find(".list-total-count"),
                $listArea = $areaContent.find(".list-area"),
                $paginate = $areaContent.find(".paginate"),
                $eventReplyListTemplate = $("#eventReplyListTemplate");
            <%-- SNS 공유 --%>
            $areaContent.on("click", ".call-sns-layer", function () {
                $.common.layer.sns();
            });
            <%-- 댓글 등록 버튼 클릭 이벤트 --%>
            $areaContent.on("click", ".reply-form", function () {
                var params = {
                    EVT_MST_IMG_YN : "<c:out value="${info.EVT_MST_IMG_YN}"/>",
                    EVT_MST_PSN_YN : "<c:out value="${info.EVT_MST_PSN_YN}"/>"
                };
                $layerPopup.requestLayer($.action.marketing.event.reply.form.layer(), $.extend(params, defaultParm));
                $.callback = function () {
                    requestReplyList(1);
                }
            });
            <%-- 댓글 수정 버튼 클릭 이벤트 --%>
            $areaContent.on("click", ".reply-edit", function () {
                var $this = $(this);
                var evtRplIdx = $this.data("key"),
                    params = {
                        EVT_RPL_IDX : evtRplIdx,
                        EVT_MST_IMG_YN : "<c:out value="${info.EVT_MST_IMG_YN}"/>"
                    };
                $this.closest(".box-comment-inner").removeClass("active");
                openLoginFormLayer(evtRplIdx, function (prdQnAMemNm, prdQnAMemPw) {
                    $layerPopup.requestLayer($.action.marketing.event.reply.edit.layer(), $.extend(params, defaultParm));
                    $.callback = function () {
                        requestReplyList();
                    }
                });
            });
            <%-- 댓글 삭제 버튼 클릭 이벤트 --%>
            $areaContent.on("click", ".reply-remove", function () {
                var $this = $(this);
                var evtRplIdx = $this.data("key");
                $this.closest(".box-comment-inner").removeClass("active");
                openLoginFormLayer(evtRplIdx, function (prdQnAMemNm, prdQnAMemPw) {
                    if (confirm("댓글을 삭제하시겠습니까?")) {
                        $.postSyncJsonAjax($.action.marketing.event.reply.remove.ajax(), $.extend({EVT_RPL_IDX : evtRplIdx}, defaultParm), function (data) {
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
                $.postSyncJsonAjax($.action.marketing.event.reply.list.ajax(), $.extend({cPage : cPage}, defaultParm), function (data) {
                    var totalCount = StringUtil.getInt(data.totalCount);
                    $totalCount.text(StringUtil.setComma(totalCount));
                    $listArea.siblings(".text-information-type2").remove();
                    $listArea.empty();
                    if (totalCount > 0) {
                        $eventReplyListTemplate.tmpl(data).appendTo($listArea);
                        commentMore();
                    } else {
                        $listArea.before($eventReplyListTemplate.tmpl(data));
                    }
                    $paginate.paging(data.paging, requestReplyList);
                });
            };
            <%-- 로그인 폼 레이어 열기 --%>
            openLoginFormLayer = function (evtRplIdx, callback) {
                var $loginFormLayer = $(".layer-popup2");
                $loginFormLayer.requestLayer($.action.common.login.form.layer(), {title : "본인 댓글 확인", sessionYn : "N"});
                $.callback = function (prdQnAMemNm, prdQnAMemPw) {
                    var params = $.extend({searchEvtRplIdx : evtRplIdx, searchEvtRplNm : prdQnAMemNm, searchEvtRplPw : prdQnAMemPw}, defaultParm);
                    $.postSyncJsonAjax($.action.marketing.event.reply.login.ajax(), params, function (data) {
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