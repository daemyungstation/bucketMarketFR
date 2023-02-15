<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 헤더 --%>
<header class="area-header-layer">
    <div class="area-inner">
        <h1 class="title"><c:out value="${commandMap.searchPrdRevBstYn eq 'Y' ? 'BEST' : '' }"/>가입후기 전체보기</h1>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</header>
<%-- //헤더 --%>
<%-- 본문 --%>
<div class="area-content-layer">
    <div class="area-inner latter">
        <h3 class="title">가입후기 (<span class="list-total-count"></span>)</h3>
        <hr class="divline-type2" >
        <div class="box-latter-body list-area">
        </div>
        <div class="paginate"></div>
    </div>
</div>
<%-- //본문 --%>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/paging.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/tmpl/jquery.tmpl.min.js"></script>
<script id="commentBoardListTemplate" type="text/x-jquery-tmpl">
    {{if StringUtil.getInt(totalCount) == 0}}
        <p class="text-empty-data">등록된 가입후기가 없습니다.</p>
    {{else}}
        {{each(i, row) list}}
            <div class="box-latter-view">
                {{if row.PRD_REV_BST_YN == "Y"}}
                    <span class="latter-best">BEST</span>
                {{/if}}
                {{if row.SEX == "<c:out value="${Const.FEMALE }"/>"}}
                    <p class="latter-profile woman"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_profile_women.png" alt="프로필 사진"></p>
                {{else}}
                    <p class="latter-profile man"><img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_profile_men.png" alt="프로필 사진"></p>
                {{/if}}
                <p class="latter-star"><span class="star-gray"><span class="star-red" style="width: \${row.PRD_REV_PIT * 20}%;"></span></span></p>
                <p class="latter-name">
                    \${row.MEM_NM}, \${row.AGE}대
                    <span class="latter-day">\${StringUtil.formatDate(row.PRD_REV_REG_DT, "yyyy.MM.dd")}</span>
                </p>
                <p class="latter-content">{{html StringUtil.replaceEnterToBr(row.PRD_REV_CTS)}}</p>
                {{if row.CMM_FLE_WEB_PATH != "" && row.CMM_FLE_WEB_PATH != null}}
                    <p class="latter-photo">
                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/>\${row.CMM_FLE_WEB_PATH}" alt="제품 사진">
                    </p>
                {{/if}}
                {{if row.PRD_REV_RPL}}
                    <div class="box-latter-answer">
                        <div class="box-answer">
                            <div class="title">
                                A.
                                {{if row.AUT_MST_VDR_YN == "Y"}}
                                    <span class="icon-partner">파트너</span>
                                {{/if}}
                                {{if row.AUT_MST_VDR_YN == "N"}}
                                    <span class="icon-bucketmarket">
                                        <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/mo/images/img_icon_bi.png" alt="버킷마켓" >
                                    </span>
                                {{/if}}
                            </div>
                            {{html row.PRD_REV_RPL}}
                        </div>
                    </div>
                {{/if}}
            </div>
        {{/each}}
    {{/if}}
</script>
<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $totalCount = $layerPopup.find(".list-total-count"),
        $listArea = $layerPopup.find(".list-area"),
        $paginate = $layerPopup.find(".paginate"),
        $commentBoardListTemplate = $layerPopup.find("#commentBoardListTemplate");
    <%-- 목록 호출 --%>
    requestList = function (cPage) {
        var params = {
            cPage : cPage,
            searchPrdRevBstYn : "<c:out value="${commandMap.searchPrdRevBstYn }"/>",
            searchPrdMstNo : "<c:out value="${commandMap.PRD_MST_NO }"/>",
        };
        $.postSyncJsonAjax($.action.board.comment.list.ajax(), params, function (data) {
            $totalCount.text(StringUtil.setComma(data.totalCount));
            $listArea.empty();
            $commentBoardListTemplate.tmpl(data).appendTo($listArea);
            $paginate.paging(data.paging, requestList);
        });
    };
    requestList(1);
});
</script>