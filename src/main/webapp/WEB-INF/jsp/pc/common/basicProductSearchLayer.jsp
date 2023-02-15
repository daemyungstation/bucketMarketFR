<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 헤더 --%>
<header class="area-header-layer">
    <div class="area-inner">
        <h1 class="title">1:1문의 상품검색</h1>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</header>
<%-- //헤더 --%>
<%-- 본문 --%>
<div class="area-content-layer">
    <div class="area-inner">

    <div class="contain-inquiry-search">
        <h2 class="title-step text-point3">문의할 상품명을 검색하고, 상품명을 선택해 주세요.</h2>
        <div class="box-inquiry-search">
            <span class="form-addbutton">
                <form name="basicProductSearchForm" id="basicProductSearchForm" onsubmit="return false;">
                    <input type="hidden" name="PAGING_YN" id="PAGING_YN" value="<c:out value="${commandMap.PAGING_YN }"/>"/>
                    <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" value="" placeholder="골프">
                </form>
                <span class="btn-type-text1"><button class="search" onclick="return false;">검색</button></span>
            </span>
        </div>
        <div class="box-inquiry-result list-area">
            <p class="text-empty-data">문의할 상품을 검색하세요.</p>
        </div>
    </div>
    </div>
</div>
<%-- //본문 --%>

<c:if test="${commandMap.PAGING_YN eq 'Y' }">
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/paging.js"></script>
</c:if>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
<script id="basicProductSearchListTemplate" type="text/x-jquery-tmpl">
    {{if StringUtil.getInt(totalCount) == 0}}
        <p class="text-empty-data">검색된 상품이 없습니다.</p>
    {{else}}
        <ul>
            {{each(i, row) list}}
            <li>
                <a href="javascript:;" class="basic-product-row">
                    \${PRD_MST_NM}
                    <span class="basic-product-row-data">
                        <input type="hidden" name="PRD_MST_NO" value="\${row.PRD_MST_NO}"/>
                        <input type="hidden" name="PRD_MST_NM" value="\${row.PRD_MST_NM}"/>
                    </span>
                </a>
            </li>
            {{/each}}
        </ul>
    {{/if}}
</script>
<script>
    $(function () {
        var $layerPopup = $(".layer-popup1"),
            $basicProductSearchForm = $layerPopup.find("#basicProductSearchForm");
            $listArea = $layerPopup.find(".list-area"),
            $basicProductSearchListTemplate = $layerPopup.find("#basicProductSearchListTemplate");
        var pagingYn = "<c:out value="${commandMap.PAGING_YN }"/>";
        <%-- 엔터 이벤트 --%>
        $basicProductSearchForm.off("keyup", "input[type='text']").on("keyup", "input[type='text']", function (e) {
            if (e.keyCode == 13) {
                requestList(1);
            }
        });
        <%-- 검색버튼 클릭 이벤트 --%>
        $layerPopup.off("click", ".search").on("click", ".search", function () {
            requestList(1);
        });
        <%-- 목록 클릭 이벤트 --%>
        $listArea.off("click", ".basic-product-row").on("click", ".basic-product-row", function () {
            var data = new Object();
            var $input = $(this).find(".basic-product-row-data").children("input[type='hidden']");
            $input.each(function () {
                var $this = $(this);
                data[$this.attr("name")] = $this.val();
            });
            $.callback(data);
            $.common.layer.close($layerPopup);
        });
        <%-- 목록 호출 --%>
        requestList = function (cPage) {
            if ($basicProductSearchForm.find("#searchPrdMstNm").val() == "") {
                alert("검색어를 입력해 주세요");
                return;
            }
            var params = {};
            if (pagingYn == "Y") {
                params.cPage = cPage;
            }
            $.postSyncJsonAjax($.action.product.basic.list.ajax(), $.extend(params, $basicProductSearchForm.serializeObject()), function (data) {
                $listArea.empty();
                $basicProductSearchListTemplate.tmpl(data).appendTo($listArea);
                if (pagingYn == "Y") {
                    $paginate.paging(data.paging, requestList);
                }
            });
        };
    });
</script>