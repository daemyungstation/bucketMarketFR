<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 헤더 --%>
<header class="area-header-layer">
    <div class="area-inner">
        <h1 class="title">상품Q&amp;A 작성하기</h1>
        <span class="btn-close"><button>닫기</button></span>
    </div>
</header>
<%-- //헤더 --%>
<%-- 본문 --%>
<div class="area-content-layer">
    <div class="area-inner">
        <dl class="detail-product-type1 type1">
            <dd class="image">
                <ui:productImage prdMstCd="${basicProductInfo.PRD_MST_CD }" thubnailSize="158"/>
                <c:if test="${basicProductInfo.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL}">
                    <span class="ribbon-type1">
                        <c:out value="${basicProductInfo.PRD_MST_SPT_TXT }"/>
                    </span>
                </c:if>
            </dd>
            <dt>
                <span class="brand"><c:out value="${basicProductInfo.VDR_MST_NM }"/></span>
                <span class="catchphrase"><c:out value="${basicProductInfo.PRD_MST_SEL_TXT }"/></span>
                <span class="detail"><c:out value="${basicProductInfo.PRD_MST_NM }"/></span>
            </dt>
        </dl>
        <form name="productQnAForm" id="productQnAForm" onsubmit="return false">
            <input type="hidden" name="PRD_MST_NO" value="<c:out value="${commandMap.PRD_MST_NO }"/>" />
            <div class="box-qna-write">
                <dl class="box-form">
                    <dd>
                        <span class="form-textarea">
                            <textarea name="PRD_QNA_CTS" id="PRD_QNA_CTS" placeholder="문의하실 내용을 입력해 주세요." onkeyup="StringUtil.getStrLength(this, '.byte', 600);" maxlength="600"></textarea>
                            <i><span class="byte">0</span>/600</i>
                        </span>
                        <label class="form-alert" message-target="PRD_QNA_CTS" data-name="내용"></label>
                    </dd>
                </dl>
                <dl class="box-form">
                    <dt class="necessary">이름</dt>
                    <dd>
                        <input type="text" name="PRD_QNA_MEM_NM" id="PRD_QNA_MEM_NM" value="" maxlength="10" placeholder="(필수)이름"/>
                        <label class="form-alert" message-target="PRD_QNA_MEM_NM" data-name="이름"></label>
                    </dd>
                </dl>
                <dl class="box-form">
                    <dt class="necessary">비밀번호</dt>
                    <dd>
                        <input type="password" name="PRD_QNA_MEM_PW" id="PRD_QNA_MEM_PW" value="" placeholder="(필수)비밀번호"/>
                        <label class="form-alert" message-target="PRD_QNA_MEM_PW" data-name="비밀번호"></label>
                    </dd>
                </dl>
                <label class="form-checkbox"><input type="checkbox" name="PRD_QNA_DSP_YN" id="PRD_QNA_DSP_YN" value="N"/>질문 비공개</label>
                <dl class="box-form">
                    <dt>개인정보 수집 및 활용 동의</dt>
                    <dd>
                        <div class="box-agreement scroll">
                            <div class="box-inner">
                                <c:out value="${termInfo.AGR_MST_CONTENTS }" escapeXml="false"/>
                            </div>
                        </div>
                    </dd>
                </dl>
                <label class="form-checkbox"><input type="checkbox" name="PRD_QNA_SMS_YN" id="PRD_QNA_SMS_YN" value="Y"/>개인정보 수집 및 활용에 동의합니다.</label>
                <label class="form-alert" message-target="PRD_QNA_SMS_YN" data-name="개인정보 수집 및 활용에 동의"></label>
                <dl class="box-form">
                    <dt>답변 받을 연락처</dt>
                    <dd>
                        <input type="text" name="PRD_QNA_HP" id="PRD_QNA_HP" class="number" placeholder="'-' 없이 입력해주세요" maxlength="11"/>
                        <label class="form-alert" message-target="PRD_QNA_HP" data-name="답변 받을 연락처"></label>
                    </dd>
                    <dd class="text-form-notice1">* 개인정보 수집 및 활용에 동의해 주셔야 답변 받을 수 있습니다.</dd>
                </dl>
            </div>
            <hr class="divline-type2" >
            <%-- 유의사항 --%>
            <div class="contain-product3">
                <div class="contain-inner">
                    <h3 class="title">유의사항</h3>
                    <div class="list-type2">
                        <ul>
                            <li>상품Q&A는 파트너 혜택상품과 대명라이프서비스가 결합된 패키지 상품을 문의하는 게시판입니다.</li>
                            <li>상품과 관련없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 게시글이 삭제 조치 될 수 있습니다.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <%-- //유의사항 --%>
            <span class="btn-type-text1 disabled"><button>문의하기</button></span>
        </form>
    </div>
</div>
<%-- //본문 --%>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/common/js/lib/security/sha512.min.js"></script>
<script>
$(function () {
    var $layerPopup = $(".layer-popup1"),
        $productQnAForm = $layerPopup.find("#productQnAForm");
    <%-- 폼 유효성 체크 및 전송 이벤트 --%>
    $productQnAForm.validate({
        rules : {
            PRD_QNA_CTS : {
                required : true
            },
            PRD_QNA_MEM_NM : {
                required : true
            },
            PRD_QNA_MEM_PW : {
                required : true,
                engOrNum : true,
                rangelength : [6, 10]
            },
            PRD_QNA_SMS_YN : {
                required : function () {
                    return ($productQnAForm.find("#PRD_QNA_HP").val() != "");
                }
            },
            PRD_QNA_HP : {
                required : function () {
                    return ($productQnAForm.find("#PRD_QNA_SMS_YN").is(":checked"));
                },
                number : true
            }
        },
        submitHandler : function(form) {
            $(form).find("input[name='PRD_QNA_MEM_PW']").val(hex_sha512($(form).find("input[name='PRD_QNA_MEM_PW']").val()).toString());
            $.postSyncJsonAjax($.action.product.qna.regist.ajax(), $(form).serializeObject(), function (data) {
                if (data.isSuccess) {
                    alert("저장 되었습니다.");
                    $.common.layer.close($layerPopup);
                    $.callback();
                }
            });
            
        }
    });
});
</script>