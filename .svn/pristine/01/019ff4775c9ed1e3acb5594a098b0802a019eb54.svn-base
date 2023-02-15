<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 헤더 -->
<header class="area-header-layer">
    <div class="area-inner">
        <h1 class="title" style="font-size: 20px">단체 - 복수 캠페인 URL 생성하기 </h1>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</header>
<!-- //헤더 -->

<input type="hidden" id="PRD_MST_RDP_TXT" value="<c:out value="${info.PRD_MST_RDP_TXT }"/>">
<input type="hidden" id="PRD_MST_NO" value="<c:out value="${info.PRD_MST_NO }"/>">

<!-- 본문 -->
<div class="area-content-layer" style="margin: 0px">
    <div class="area-inner">

        <!-- 팝업본문 -->
        <div class="content-rdmember-layer02">
            <div class="box-campaign-url">
                <div class="readyplannerSellerImg2">
                    <div class="readyPlanner-method2">
                        <div class="inner-readyPlanner-method2">
                        <img src="<spring:eval expression="@resource['mobile.ssl.domain']"/>/resources/mo/images/readyPlanner_sellerText.jpg"
                             onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'"
                             alt="">
                            <div style="margin-top: 50px">
                        <label style="display: inline-block; margin-right: 20px" class="inner-readyPlanner-seller-label">영업사원 이름:</label>
                        <input class="inner-readyPlanner-seller-input-name" type="text" id="SELLER_NAME" value=""/>
                            </div>
                        <div class="inner-readyPlanner-seller-url" style="margin-top: 4%; text-align: center;">
                            <button class="url-create <c:if test="${planner.RDP_MST_STATE ne Code.PLANNER_STATE_ACTIVE }">disabled</c:if>">
                                <img src="<spring:eval expression="@resource['mobile.ssl.domain']"/>/resources/mo/images/readyPlanner_sellerUrl.jpg"
                                     onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.mobile']"/>'"
                                     alt="" style="width: 100%">
                            </button>
                        </div>
                            <p class="show-seller-shorturl">
                                <span class="url-new btn-show-seller-shorturl">
                                <button class="show-seller-shorturl-list url-new">※ 생성된 영업사원 고유 URL 확인하기
                                </button>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="divline-type2">
            <div></div>
        </div>
        <!-- //팝업본문 -->
    </div>
</div>
<!-- //본문 -->

<script>
    $(function () {
        let $layerPopup = $(".layer-popup5");
        // 탭
        $layerPopup.on("click", ".show-seller-shorturl-list", function () {
            console.log("show-seller-shorturl-list");
            $("#layerSellerShortUrlList").addClass("active");
            posPopup2(".layer-popup5", ".layer-table" );
        });
        $layerPopup.on("click", ".duplicate-confirm-yes", function (e) {
            e.stopImmediatePropagation();
            let nextSellerName = getNextSellerName();
            if( nextSellerName =='') {
                alert("중복 이름의 허용 가능한 수를 초과했습니다.");
            } else {
                $('#SELLER_NAME').val(nextSellerName);
                campaignCreateSellerAjax(true);
                $(this).closest('.layer-sub').find('.btn-close-sub').click();
            }
        });
        function getNextSellerName() {
            let $sellerTable = $(".seller-table");
            let sellerName = $('#SELLER_NAME').val();
            let startNum = 1;
            if( sellerName.match("[0-9]+$") != null)  {
                startNum = sellerName.match("[0-9]+$")[0];
                sellerName = sellerName.replace(new RegExp('[0-9]+$'), '');
            }
            for(let num = startNum ; num < 100; num++) {
                if( $sellerTable.find("td.seller-name").filter(( i, td) => $(td).text() == sellerName + num ).length == 0 ) {
                    return sellerName + num;
                }
            }
            return '';
        }
        function campaignCreateSellerAjax(withPopup) {
            let $sellerTable = $(".seller-table");
            let $sellerShortUrlTmpl = $("#sellerShortUrlTmpl");
            let sellerName = $('#SELLER_NAME').val();
            if( $sellerTable.find("td.seller-name").filter(( i, td) => $(td).text() == sellerName).length > 0 ) {
                let nextSellerName  = getNextSellerName();
                if( nextSellerName == '') {
                    $("#layerSellerDuplicate .next-seller-name").text("");
                    alert("중복 이름의 허용 가능한 수를 초과했습니다.")
                    return;
                } else {
                    $("#layerSellerDuplicate .next-seller-name").text("[" + nextSellerName +"]");
                }
                $("#layerSellerDuplicate").addClass("active");
                posPopup2(".layer-popup5", ".layer-dialog");
                return;
            }
            let param = {
                SELLER_NAME: sellerName,
                PRD_MST_NO: $('#PRD_MST_NO').val(),
            };
            $.postJsonAjax($.action.myplanner.campaign.create.seller.ajax(), param, function (data) {
                console.log(data);
                if (data.list && data.list.length > 0) {
                    if (data.list && data.list.length > 0) {
                        $sellerTable.find("#sellerShortUrlTableDiv").show();
                        $sellerTable.find("#sellerShortUrlTableNone").hide();
                        let $sellerShortUrlTableList = $sellerTable.find("#sellerShortUrlTableList");

                        $sellerShortUrlTableList.find("tr.row").remove();
                        $.each(data.list, function(i, row) {
                            row["index"] = i + 1;
                            $sellerShortUrlTableList.append($sellerShortUrlTmpl.tmpl(row));
                        });
                    } else {
                        $sellerTable.find("#sellerShortUrlTableDiv").hide();
                        $sellerTable.find("#sellerShortUrlTableNone").show();
                    }
                } else {
                    $sellerTable.find("#sellerShortUrlTableNone").show();
                }
                if( withPopup ) {
                    $("#layerSellerShortUrlList").addClass("active");
                    posPopup2(".layer-popup5", "layer-table");
                }
            });
        };

        $layerPopup.on("click", ".url-create", function () {
            console.log("url-create");
            campaignCreateSellerAjax(true);
        });
        campaignCreateSellerAjax(false);

        let $layerPopup5Sub = $(".layer-sub")
        /* 레이어 닫기 버튼 클릭 이벤트 */
        $layerPopup5Sub.on("click", ".btn-close-sub", function () {
            $(this).closest(".layer-sub").removeClass("active");
        });
    });
</script>



<%-- 지급내역 --%>
<script id="sellerShortUrlTmpl" type="text/x-jquery-tmpl">
    <tr class="item row">
        <td>\${index}</td>
        <td class='seller-name'>\${SELLER_NAME}</button></td>
        <td>{{= StringUtil.formatDate(REG_DT, "yyyy-MM-dd") }}</td>
        <td class="url-copy seller-url-copy" data-clipboard-text="\${SHORTEN_URL}" >\${SHORTEN_URL}</td>
    </tr>
</script>


<%-- 생성된 영업사원 고유 URL --%>
<div class="layer-popup5 layer-sub" id="layerSellerShortUrlList">
    <div class="layer-table">
        <div class="contain-head">
            <p class="text-title-type2">생성된 영업사원 고유 URL</p>
        </div>
        <hr class="divline-type1">
        <div class="contain-body seller-table">
            <div class="table-type2" id="sellerShortUrlTableDiv" style="display: none; font-size: 9px">
                <table cellspacing="0" class="table-col table-b">
                    <colgroup>
                        <col style="width: 8%;"/>
                        <col style="width: 15%;"/>
                        <col style="width: 24%;"/>
                        <col style="width: 50%;"/>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>순번</th>
                        <th>영업사원</th>
                        <th>URL 생성일자</th>
                        <th>생성된 URL(복사)</th>
                    </tr>
                    </thead>
                    <tbody id="sellerShortUrlTableList">
                    </tbody>
                </table>
            </div>
            <p class="text-empty-data" id="sellerShortUrlTableNone" style="display: none;">조회 내역이 없습니다.</p>
        </div>

        <span class="btn-close-sub"><button>닫기</button></span>
    </div>
</div>


<%-- 중복 사원 가이드 --%>
<div class="layer-popup5 layer-sub" id="layerSellerDuplicate">
    <div class="layer-dialog">
        <div class="contain-head">
            <p class="text-title-type3">이미 등록된 영업사원 이름입니다.</p>
        </div>
        <hr class="divline-type1">
        <div class="contain-body">
            <label class="inner-duplicate-label">동명이인의 경우 자동으로 [이름값][순번] URL을 생성합니다.</label>
            <label class="inner-duplicate-label next-seller-name" style="text-align: center; font-weight: bold;"></label>
            <div class="inner-duplicate-yesno" style="margin-top: 4%; text-align: center;">
                <span class="btn-type-text7 type2">
                <button class="duplicate-confirm-yes <c:if test="${planner.RDP_MST_STATE ne Code.PLANNER_STATE_ACTIVE }">disabled</c:if>">
                    URL 생성하기 >
                </button>
                </span>
                <span class="btn-type-text7 type2">
                <button class="duplicate-confirm-no btn-cancel <c:if test="${planner.RDP_MST_STATE ne Code.PLANNER_STATE_ACTIVE }">disabled</c:if>">
                    취소
                </button></span>
            </div>
        </div>
        <span class="btn-close-sub"><button>닫기</button></span>
    </div>
</div>
