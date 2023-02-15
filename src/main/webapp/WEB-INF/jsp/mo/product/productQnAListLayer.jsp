<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 헤더 --%>
<header class="area-header-layer">
    <div class="area-inner">
        <h1 class="title">상품Q&amp;A 전체보기</h1>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</header>
<%-- //헤더 --%>
<%-- 본문 --%>
<div class="area-content-layer">
    <div class="area-inner qna">
        <h3 class="title">상품 Q&amp;A (<span><fmt:formatNumber value="${commandMap.productQnACount }" type="number"/></span>)</h3>
        <div class="contain-sort">
            <div class="box-option-sort">
                <span class="btn-sort on"><button class="call-list-search" data-type="all">전체</button></span>
                <span class="btn-sort"><button class="call-list-search" data-type="answer">답변완료(<span class="list-answer-count"></span>)</button></span>
            </div>
            <div class="box-option-check">
                <label class="form-checkbox"><input type="checkbox" class="call-my-list">나의 Q&amp;A</label>
            </div>
        </div>
        <div class="list-area">
        </div>
        <div class="paginate"></div>
    </div>
</div>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/paging.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
<script id="productQnAListTemplate" type="text/x-jquery-tmpl">
    {{if StringUtil.getInt(totalCount) == 0}}
        <p class="text-empty-data">등록된 상품 Q&amp;A가 없습니다.</p>
    {{else}}
        <div class="contain-qna">
            {{each(i, row) list}}
                <dl class="box-qna{{if row.PRD_QNA_RPL_YN == "Y"}} completed{{/if}}" data-index="\${i}">
                    <dt>
                        <span class="stat">[{{if row.PRD_QNA_RPL_YN == "Y"}}답변완료{{else}}답변대기{{/if}}]</span>
                        <span class="name">\${row.PRD_QNA_MEM_NM}</span>
                        <span class="date">\${StringUtil.formatDate(row.PRD_QNA_REG_DT, "yyyy.MM.dd")}</span>
                        {{if row.PRD_QNA_DSP_YN == "Y"}}
                            <span class="title">\${row.PRD_QNA_CTS}</span>
                        {{else}}
                            <span class="title"><button class="private">비공개로 작성된 글입니다.</button></span>
                        {{/if}}
                    </dt>
                    {{if row.PRD_QNA_DSP_YN == "Y" && row.PRD_QNA_RPL_YN == "Y"}}
                        {{tmpl({info : row}) "#productQnAAnswerTemplate"}}
                    {{/if}}
                </dl>
            {{/each}}
        </div>
    {{/if}}
</script>
<script id="productQnAAnswerTemplate" type="text/x-jquery-tmpl">
<dd>
    <div class="box-answer">
        <div class="title">
            A.
            {{if info.AUT_MST_VDR_YN == "Y"}}
                <span class="icon-partner">파트너</span>
            {{else}}
                <span class="icon-bucketmarket">
                    <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_icon_bi.png" alt="버킷마켓" >
                </span>
            {{/if}}
        </div>
        {{html info.PRD_QNA_RPL_CTS}}
    </div>
</dd>
</script>
<script>
$(function () {
    var dataList;
    var $layerPopup = $(".layer-popup1"),
        $answerCount = $layerPopup.find(".list-answer-count"),
        $listArea = $layerPopup.find(".list-area"),
        $paginate = $layerPopup.find(".paginate"),
        $productQnAListTemplate = $layerPopup.find("#productQnAListTemplate"),
        $productQnAAnswerTemplate = $layerPopup.find("#productQnAAnswerTemplate");
    <%-- 검색(전체, 답변완료) 버튼 클릭 이벤트 --%>
    $layerPopup.off("click", ".call-list-search").on("click", ".call-list-search", function () {
        var $this = $(this),
            $span = $this.closest(".btn-sort");
        $span.addClass("on");
        $span.siblings(".btn-sort").removeClass("on");
        requestList(1);
    });
    <%-- 검색(나의 Q&A) 버튼 변경 이벤트 --%>
    $layerPopup.off("change", ".call-my-list").on("change", ".call-my-list", function () {
        var $this = $(this);
        if ($this.is(":checked")) {
            openLoginFormLayer (function () {
                requestList(1);
            }, "Y");
        } else {
            $.postSyncJsonAjax($.action.common.board.logout.ajax(), null, function (data) {
                if (data.isSuccess) {
                    requestList(1);
                }
            });
        }
    });
    $layerPopup.on("click", ".box-qna.completed", function () {
        var $this = $(this);
        if( $this.hasClass("on") ) {
            $this.removeClass("on");
        } else {
            $this.addClass("on");
        }
    });
    <%-- 비공개 글 버튼 클릭 이벤트 --%>
    $listArea.off("click", ".private").on("click", ".private", function () {
        var $this = $(this);
        openLoginFormLayer (function (prdQnAMemNm, prdQnAMemPw) {
            var params = {
                searchPrdMstNo : "<c:out value="${commandMap.PRD_MST_NO }"/>",
                searchPrdQnAMemNm : prdQnAMemNm,
                searchPrdQnAMemPw : prdQnAMemPw
            };
            $.postSyncJsonAjax($.action.product.qna.login.ajax(), params, function (data) {
                if (data.isSuccess) {
                    var $span = $this.closest(".title"),
                        $dl = $span.closest(".box-qna");
                    var info = dataList[$dl.data("index")];
                    $span.empty().text(info.PRD_QNA_CTS);
                    if (info.PRD_QNA_RPL_YN == "Y") {
                        $productQnAAnswerTemplate.tmpl({info : info}).appendTo($dl);
                        $dl.addClass("on");
                    }
                } else {
                    alert("이름 또는 비밀번호가 일치하지 않습니다.");
                }
            });
        }, "N");
    });
    <%-- 목록 호출 --%>
    requestList = function (cPage) {
        var type = $layerPopup.find(".btn-sort").filter(".on").children("button.call-list-search").data("type"),
            params = {
                cPage : cPage,
                searchPrdMstNo : "<c:out value="${commandMap.PRD_MST_NO }"/>",
                searchPrdQnARplYn : type == "answer" ? "Y" : ""
            };
        $.postSyncJsonAjax($.action.product.qna.list.ajax(), params, function (data) {
            dataList = data.list;
            $answerCount.text(StringUtil.setComma(data.answerCount));
            $listArea.empty();
            $productQnAListTemplate.tmpl(data).appendTo($listArea);
            $paginate.paging(data.paging, requestList);
        });
    };
    <%-- 로그인 폼 레이어 열기 --%>
    openLoginFormLayer = function (callback, sessionYn) {
        var $loginFormLayer = $(".layer-popup2");
        $loginFormLayer.requestLayer($.action.common.login.form.layer(), {title : "문의 등록 시 입력한 정보를\n입력해 주세요.", sessionYn : sessionYn});
        $loginFormLayer.off("click", ".btn-layer-close").on("click", ".btn-layer-close", function () {
            var $checkbox = $layerPopup.find(".call-my-list");
            $checkbox.removeClass("checked");
            $checkbox.prop("checked", false);
            $checkbox.closest(".form-checkbox").removeClass("checked");
        });
        $.callback = function (prdQnAMemNm, prdQnAMemPw) {
            callback(prdQnAMemNm, prdQnAMemPw);
        }
    }
    requestList(1);
});
</script>
<%-- //본문 --%>