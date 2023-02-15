<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta property="og:site_name" key="site_name" content="<spring:eval expression="@resource['project.title']"/>" class="meta-sns-share">
    <meta property="og:url" key="url" content="<spring:eval expression="@resource['mobile.ssl.domain']"/><c:out value="${requestURI }"/><c:out value="${paramsQueryString }"/>" class="meta-sns-share"/>
    <meta property="og:type" key="type" content="article"  class="meta-sns-share"/>
    <meta property="og:title" key="title" content="<c:out value="${info.PLN_MST_TITLE}"/>" class="meta-sns-share"/>
    <meta property="og:description" key="description" content="<spring:eval expression="@resource['project.title']"/> 기획전"  class="meta-sns-share"/>
    <meta property="og:image" key="image" content="<spring:eval expression="@resource['mobile.ssl.domain']"/><spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${info.CMM_FLE_WEB_MB_PATH}"/>" class="meta-sns-share"/>
    <meta property="og:image:width" key="image_width" content="750" class="meta-sns-share"/>
    <meta property="og:image:height" key="image_height" content="750" class="meta-sns-share"/>
    <%@include file="/WEB-INF/jsp/mo/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/mo/css/promotion.css">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/mo/include/header.jsp" flush="false">
        <jsp:param name="headerGroup" value="historyback|title|search"/>
        <jsp:param name="headerTitle" value="${info.PLN_MST_TITLE }"/>
    </jsp:include>

    <%-- 본문 --%>
    <div class="area-content">
        <div class="area-inner">
            <div class="contain-event-basis">
                <%-- 기획전 제목 --%>
                <div class="box-detail-product1">
                    <h2 class="title"><c:out value="${info.PLN_MST_TITLE }"/></h2>
                    <span class="data"><ui:formatDate value="${info.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${info.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>
                    <span class="btn-share"><button class="call-sns-layer">SNS</button></span>
                </div>
                <%-- 기획전 동영상/사진 --%>
                <div class="box-detail-product2">
                    <%-- 동영상 없을 경우 video 전체 없앰 --%>
                    <c:if test="${not empty info.PLN_MST_MB_MDA and info.PLN_MST_MB_MDA ne '<p>&nbsp;</p>' }">
                        <div class="video">
                            <c:out value="${info.PLN_MST_MB_MDA }" escapeXml="false"/>
                        </div>
                    </c:if>
                    <div class="images">
                        <c:out value="${info.PLN_MST_MB_DTL }" escapeXml="false"/>
                    </div>
                </div>
                <c:if test="${info.PLN_MST_PRD_DPL_YN eq 'Y' }">
                    <%-- 기획전 셀렉트 --%>
                    <div class="box-detail-product3">
                        <span class="form-select">
                            <select class="plan-group" data-key="<c:out value="${info.PLN_MST_IDX }"/>">
                                <option value="" selected="selected">전체</option>
                                <c:if test="${not empty planGroupTitleList }">
                                    <c:forEach var="row" items="${planGroupTitleList }">
                                        <option value="<c:out value="${row.PLN_GRP_IDX }"/>" <c:if test="${row.PLN_GRP_IDX eq commandMap.searchPlnGrpIdx }">selected="selected"</c:if>>
                                            <c:out value="${row.PLN_GRP_TITLE }"/>
                                        </option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </span>
                    </div>
                    <hr class="divline-type2">
                    <div class="box-detail-product4">
                        <c:if test="${empty planGroupList }">
                            <p class="text-empty-data">등록된 상품이 없습니다.</p><%-- 데이터가 없을때 --%>
                        </c:if>
                        <c:if test="${not empty planGroupList }">
                            <c:forEach var="grpRow" items="${planGroupList }">
                                <div class="box-product4-inner">
                                    <h3 class="title"><c:out value="${grpRow.PLN_GRP_TITLE }"/></h3>
                                    <c:if test="${not empty grpRow.planDetailList }">
                                        <ul class="brand-list">
                                            <c:forEach var="dtlRow" items="${grpRow.planDetailList }">
                                                <li>
                                                    <ui:productList info="${dtlRow }" thubnailSize="750"/>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:if>
                                </div>
                                <hr class="divline-type2">
                            </c:forEach>
                        </c:if>
                    </div>
                </c:if>
                <c:if test="${info.PLN_MST_RPL_YN eq 'Y' }">
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
    <script id="planReplyListTemplate" type="text/x-jquery-tmpl">
        {{if StringUtil.getInt(totalCount) == 0}}
            <p class="text-information-type2">등록된 댓글이 없습니다.</p>
        {{else}}
            <div class="contain-qna">
                {{each(i, row) list}}
                    <li>
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
                    </li>
                {{/each}}
            </div>
        {{/if}}
    </script>
    <script>
        $(function () {
            var defaultParm = {PLN_MST_IDX : "<c:out value="${info.PLN_MST_IDX }"/>"};
            var $areaContent = $(".area-content"),
                $layerPopup = $(".layer-popup1"),
                $totalCount = $areaContent.find(".list-total-count"),
                $listArea = $areaContent.find(".list-area"),
                $paginate = $areaContent.find(".paginate"),
                $planReplyListTemplate = $("#planReplyListTemplate");
            <%-- SNS 공유 --%>
            $areaContent.on("click", ".call-sns-layer", function () {
                $.common.layer.sns();
            });
            <%-- 상품 그룹 셀렉트박스 변경 이벤트 --%>
            $areaContent.on("change", ".plan-group", function () {
                var $this = $(this);
                $.requestPage($.action.marketing.plan.view(), {PLN_MST_IDX : $this.data("key"), searchPlnGrpIdx : $this.val()});
            });
            <%-- 댓글 등록 버튼 클릭 이벤트 --%>
            $areaContent.on("click", ".reply-form", function () {
                $layerPopup.requestLayer($.action.marketing.plan.reply.form.layer(), defaultParm);
                $.callback = function () {
                    requestReplyList(1);
                }
            });
            <%-- 댓글 수정 버튼 클릭 이벤트 --%>
            $areaContent.on("click", ".reply-edit", function () {
                var $this = $(this);
                var plnRplIdx = $this.data("key");
                $this.closest(".box-comment-inner").removeClass("active");
                openLoginFormLayer(plnRplIdx, function (prdQnAMemNm, prdQnAMemPw) {
                    $layerPopup.requestLayer($.action.marketing.plan.reply.edit.layer(), $.extend({PLN_RPL_IDX : plnRplIdx}, defaultParm));
                    $.callback = function () {
                        requestReplyList();
                    }
                });
            });
            <%-- 댓글 삭제 버튼 클릭 이벤트 --%>
            $areaContent.on("click", ".reply-remove", function () {
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