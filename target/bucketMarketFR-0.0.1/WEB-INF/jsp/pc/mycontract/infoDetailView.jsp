<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc/css/mypage.css">
</head>
<body class="">

<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>

<jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
    <jsp:param name="oneDepth" value="MY계약"/>
    <jsp:param name="oneDepthKey" value="mycontract.info.list.view"/>
</jsp:include>

<!-- Body -->
<div class="area-body">
    <div class="area-inner">

        <div class="wrap">
        
            <%-- 좌측 메뉴 --%>
            <jsp:include page="/WEB-INF/jsp/pc/include/aside.jsp" flush="false">
                <jsp:param name="asideTitle" value="MY계약"/>
                <jsp:param name="asideGroup" value="mycontract"/>
            </jsp:include>
            <%-- //좌측 메뉴 --%>
            
            <input type="hidden" id="ORD_MST_IDX" value="<c:out value="${info.ORD_MST_IDX }"/>">

            <div class="contain-body">
                <div class="content-header">
                    <h3 class="title">가입내역 상세</h3>
                </div>
                
                <div class="area-mypage">
                    <div class="box-mypage-list">
        
                    <div class="table-type2">
                        <table>
                            <colgroup>
                                <col style="width: 200px">
                                <col style="width: auto">
                                <col style="width: 120px">
                                <col style="width: 120px">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>회원번호</th>
                                    <th>가입상품명</th>
                                    <th>가입일자</th>
                                    <th>가입상태</th>
                                </tr>
                                <tr>
                                    <td class="member-num">
                                                    
                                        <%-- 계약 상태 별 분기 --%>
                                        <c:choose>
                                            <%-- 접수 --%>
                                            <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_RECEIPT }">
                                                <a class="detail" href="javascript:;"><c:out value="${info.MEM_NM }"/>&nbsp/&nbsp해피콜 상담 대기</a>
                                            </c:when>
                                            <%-- 가입대기 --%>
                                            <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_WAITING_TO_JOIN }">
                                                <a class="detail" href="javascript:;"><c:out value="${info.MEM_NM }"/>&nbsp/&nbsp<c:out value="${info.ACCNT_NO }"/></a>
                                            </c:when>
                                            <%-- 가입 --%>
                                            <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                                                <a class="detail" href="javascript:;"><c:out value="${info.MEM_NM }"/>&nbsp/&nbsp<c:out value="${info.ACCNT_NO }"/></a>
                                            </c:when>
                                        </c:choose>
                                        
                                    </td>
                                    <td class="member-product">
                                        <span>
                                            <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><spring:eval expression="@file['file.path.product']"/>/<c:out value="${info.PRD_MST_CD }"/>/m_750.png"
                                                 onerror="this.src='<spring:eval expression="@resource['img.ssl.none.src.pc']"/>'" 
                                                 alt="<c:out value="${info.PRD_MST_NM }"/>" >
                                        </span>
                                        <a class="detail" href="javascript:;""><c:out value="${info.PRD_MST_NM }"/></a>
                                    </td>
                                    
                                    <%-- 계약 상태 별 분기 --%>
                                    <c:choose>
                                        <%-- 접수 --%>
                                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_RECEIPT }">
                                            <td></dtdd>
                                            <td class="join-state">접수</td>
                                        </c:when>
                                        <%-- 가입대기 --%>
                                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_WAITING_TO_JOIN }">
                                            <td></td>
                                            <td class="join-state">가입대기</td>
                                        </c:when>
                                        <%-- 가입 --%>
                                        <c:when test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                                            <td><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" /></td>
                                            <td class="join-state">가입</td>
                                        </c:when>
                                    </c:choose>
                                    
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p class="btn-member">
                            
                        <%-- 가입 상태에서만 출력 --%>
                        <c:if test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">
                        
                            <%-- 상품유형 별 버튼 노출 --%>
                            <c:choose>
                                <%-- 월지원형 --%>
                                <c:when test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT }">
                                    <span class="btn-type-text7"><button class="benefit">혜택조회</button></span>
                                </c:when>
                                <%-- 즉발(채권) --%>
                                <c:when test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y'}">
                                    <span class="btn-type-text7"><button class="shipping">배송정보</button></span>
                                </c:when>
                                <%-- 즉발(비채권) --%>
                                <c:when test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN ne 'Y'}">
                                    <span class="btn-type-text7"><button class="benefit">혜택조회</button></span>
                                </c:when>
                                <%-- 렌탈 --%>
                                <c:when test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL }">
                                    <!-- 
                                    <span class="btn-type-text7"><button class="benefit">혜택조회</button></span>
                                     -->
                                </c:when>
                                <%-- 할부지원 --%>
                                <c:when test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                                    <span class="btn-type-text7"><button class="shipping">배송정보</button></span>
                                </c:when>
                            </c:choose>
                        
                            <span class="btn-type-text7"><button class="certificate">회원증서</button></span>
                            
                        </c:if>
                        
                        <%-- 상품유형 별 약관 노출 --%>
                        <c:choose>
                            <%-- 월지원형 --%>
                            <c:when test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT }">
                                <span class="btn-type-text7"><button class="term" data-gbn="<c:out value="${Code.TERM_CONTRACT_POINT1 }"/>">계약안내</button></span>
                            </c:when>
                            <%-- 즉발(채권) --%>
                            <c:when test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y'}">
                                <span class="btn-type-text7"><button class="term" data-gbn="<c:out value="${Code.TERM_CONTRACT_HOME_APPLIANCES }"/>">계약안내</button></span>
                            </c:when>
                            <%-- 즉발(비채권) --%>
                            <c:when test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN ne 'Y'}">
                                <span class="btn-type-text7"><button class="term" data-gbn="<c:out value="${Code.TERM_CONTRACT_POINT1 }"/>">계약안내</button></span>
                            </c:when>
                            <%-- 렌탈 --%>
                            <c:when test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL }">
                                <span class="btn-type-text7"><button class="term" data-gbn="<c:out value="${Code.TERM_CONTRACT_POINT1 }"/>">계약안내</button></span>
                            </c:when>
                            <%-- 할부지원 --%>
                            <c:when test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                                <span class="btn-type-text7"><button class="term" data-gbn="<c:out value="${Code.TERM_CONTRACT_POINT2 }"/>">계약안내</button></span>
                            </c:when>
                        </c:choose>
                        
                        <!-- 
                        <span class="btn-type-text7"><button class="term" data-gbn="3185">회원약관</button></span>
                         -->
                        
                    </p>      
                    
                    <h4>가입상품 정보</h4>
                    <!-- <p class="text-notice-type2 form2">가입 구좌 2개</p> -->
                    <div class="table-type1">
                        <table>
                            <colgroup>
                                <col style="width:320px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>가입상품명</th>
                                <td><c:out value="${info.PRD_MST_NM }"/></td>
                            </tr>
                            <tr>
                                <th>모델명</th>
                                <td><c:out value="${info.MODEL_CL_NM }"/></td>
                            </tr>
                            <tr>
                                <th>월 납입금</th>
                                <td>
                                    <%-- 즉발(채권) --%>
                                    <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y' }">
                                        -
                                    </c:if>
                                    <%-- 월지원형/즉발(비채권)/렌탈/할부지원 --%>
                                    <c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') }">
                                        <%-- 정기형 --%>
                                        <c:if test="${info.PRD_MST_IRG_YN ne 'Y' }">
                                            <fmt:formatNumber value="${info.MON_PAY_AMT }" type="number"/>원
                                        </c:if>
                                        <%-- 비정기형 --%>
                                        <c:if test="${info.PRD_MST_IRG_YN eq 'Y' }">
                                            <c:if test="${not empty info.PRD_MST_PAY_AMT1 and not empty info.PRD_MST_PAY_CNT1 }">
                                                <fmt:formatNumber value="${info.PRD_MST_PAY_AMT1 }"/>원 × <c:out value="${info.PRD_MST_PAY_CNT1 }"/>회 납입<br/>
                                            </c:if>
                                            <c:if test="${not empty info.PRD_MST_PAY_AMT2 and not empty info.PRD_MST_PAY_CNT2 }">
                                                <fmt:formatNumber value="${info.PRD_MST_PAY_AMT2 }"/>원 × <c:out value="${info.PRD_MST_PAY_CNT2 }"/>회 납입<br/>
                                            </c:if>
                                            <c:if test="${not empty info.PRD_MST_PAY_AMT3 and not empty info.PRD_MST_PAY_CNT3 }">
                                                <fmt:formatNumber value="${info.PRD_MST_PAY_AMT3 }"/>원 × <c:out value="${info.PRD_MST_PAY_CNT3 }"/>회 납입
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th>만기 회차</th>
                                <td><c:out value="${info.EXPR_NO }"/>회</td>
                            </tr>
                            <tr>
                                <th>총 상품금액</th>
                                <td><fmt:formatNumber value="${info.PROD_AMT }" type="number"/>원</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <h4>지원혜택 정보</h4>
                    <div class="table-type1">
                        <table>
                            <colgroup>
                                <col style="width:320px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>지원혜택</th>
                                <td><c:out value="${info.PRD_MST_SPL_NM }"/></td>
                            </tr>
                            <tr>
                                <th>월 지원금</th>
                                <td>
                                    <%-- 즉발(채권) --%>
                                    <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y' }">
                                        -
                                    </c:if>
                                    <%-- 월지원형/즉발(비채권)/렌탈/할부지원 --%>
                                    <c:if test="${not (info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE and info.PRD_MST_BND_YN eq 'Y') }">
                                        <fmt:formatNumber value="${info.REL_AMT }" type="number"/>원
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th>지원 회차</th>
                                <td><c:out value="${info.REL_CNT }"/>회</td>
                            </tr>
                            <tr>
                                <th>총 지원금</th>
                                <td><fmt:formatNumber value="${info.REL_AMT * info.REL_CNT }" type="number"/>원</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <h4>가입자 정보</h4>
                    <div class="table-type1">
                        <table>
                            <colgroup>
                                <col style="width:320px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>이름</th>
                                <td><c:out value="${info.MEM_NM }"/></td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td><ui:formatPhone value="${info.CELL }"/></td>
                            </tr>
                            <tr>
                                <th>생년월일 / 성별</th>
                                <td><ui:formatDate value="${info.BRTH_MON_DAY }" pattern="yyyy-MM-dd"/> / <c:if test="${info.SEX eq '0001' }">남자</c:if><c:if test="${info.SEX eq '0002' }">여자</c:if></td>
                            </tr>
                            <tr>
                                <th>주소(증서배송지)</th>
                                <td><c:out value="${info.HOME_ADDR }"/>&nbsp<c:out value="${info.HOME_ADDR2 }"/></td>
                            </tr>
                            <tr>
                                <th>비상연락처</th>
                                <td>
                                    <c:if test="${not empty info.HOME_TEL }">
                                        <ui:formatPhone value="${info.HOME_TEL }"/>
                                    </c:if>
                                    <c:if test="${empty info.HOME_TEL }">
                                        -
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일주소</th>
                                <td>
                                    <c:if test="${not empty info.EMAIL }">
                                        <c:out value="${info.EMAIL }"/>
                                    </c:if>
                                    <c:if test="${empty info.EMAIL }">
                                        -
                                    </c:if>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <%-- 라이프서비스 : 월지원형, 렌탈, 할부지원형 --%>
                    <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT or 
                                  info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL or 
                                  info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
    
                        <h4>라이프 서비스 신청</h4>
                        <div class="table-type1">
                            <table>
                                <colgroup>
                                    <col style="width:320px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>서비스</th>
                                    <td><c:out value="${info.MAIN_CONTRACT_NM }"/></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        
                    </c:if>

                    <%-- 결제 정보 : 할부지원형 --%>
                    <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN }">
                    
                        <h4>카드결제 정보</h4>
                        <div class="table-type1">
                            <table>
                                <colgroup>
                                    <col style="width:320px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>결제수단</th>
                                    <td><c:out value="${info.P_FN_NM }"/></td>
                                </tr>
                                <tr>
                                    <th>결제금액</th>
                                    <td>
                                        <fmt:formatNumber value="${info.P_AMT }" type="number"/>원 
                                        <c:if test="${info.P_RMESG2 eq '00' }">
                                            (일시불)
                                        </c:if>
                                        <c:if test="${info.P_RMESG2 ne '00' }">
                                            (<c:out value="${info.P_RMESG2 }"/>개월)
                                        </c:if>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        
                    </c:if>
            
                    <%-- 배송/설치 정보 : 즉발, 렌탈 --%>
                    <c:if test="${info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE or 
                                  info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_RENTAL }">
                          
                        <c:if test="${not empty info.INSPL_CELL }">

                            <h4>배송/설치 정보</h4>
                            <div class="table-type1">
                                <table>
                                    <colgroup>
                                        <col style="width:320px">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>상품1</th>
                                        <td><c:out value="${info.MODEL_NM }"/></td>
                                    </tr>
                                    <tr>
                                        <th>옵션</th>
                                        <td><c:out value="${info.PRD_OPT_DTL }"/></td>
                                    </tr>
                                    <tr>
                                        <th>수령인</th>
                                        <td><c:out value="${info.INSPL_MEM_NM }"/></td>
                                    </tr>
                                    <tr>
                                        <th>연락처</th>
                                        <td><ui:formatPhone value="${info.INSPL_CELL }"/></td>
                                    </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td><c:out value="${info.INSPL_ADDR }"/>&nbsp<c:out value="${info.INSPL_ADDR2 }"/></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                        </c:if>
                        
                    </c:if>
            
                    <%-- 추가정보 : 월지원형, 즉발 --%>
                    <c:if test="${(info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_MONTHLY_SUPPORT or 
                                   info.PRD_MST_TYPE eq Code.PRODUCT_TYPE_IMMEDIATELY_ISSUE)
                                  and not empty info.PRD_MST_BND_ID }">

                        <h4>추가정보</h4>
                        <div class="table-type1">
                            <table>
                                <colgroup>
                                    <col style="width:320px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th><c:out value="${info.PRD_MST_BND_ID }"/></th>
                                    <td><c:out value="${info.ORD_MST_VDR_BNF_ID }"/></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        
                    </c:if>

                    <h4>해피콜 상담시간</h4>
                    <div class="table-type1">
                        <table>
                            <colgroup>
                                <col style="width:320px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>상담시간</th>
                                <td><c:out value="${info.HPCALL_TIME }"/></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                
                    <%-- 가입 --%>
                    <c:if test="${info.CONTRACT_STATUS eq Code.CONTRACT_STATUS_JOIN }">

                        <div class="box-btn center">
                            <span class="btn-type-text7 type2"><button class="cancel">해지신청</button></span>
                            <span class="btn-type-text7 type2"><button class="transfer">양도/양수 신청</button></span>
                        </div>
                        
                    </c:if>
                    
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
        // 혜택조회
        $areaContent.on("click", "button.benefit", function() {
            var params = { ORD_MST_IDX : $areaContent.find("#ORD_MST_IDX").val() }
            $(".layer-popup1").requestLayer($.action.mycontract.shipping.benefit.view.layer(), params, "layer-member1");
        });
        // 배송정보
        $areaContent.on("click", "button.shipping", function() {
            var params = { ORD_MST_IDX : $areaContent.find("#ORD_MST_IDX").val() }
            $(".layer-popup1").requestLayer($.action.mycontract.shipping.shipping.view.layer(), params, "layer-member1");
        });
        // 회원증서
        $areaContent.on("click", "button.certificate", function() {
            // TODO - 회원증서 링크 연결
            alert("서비스 준비중입니다.");
        });
        // 약관
        $areaContent.on("click", "button.term", function() {
            $.common.layer.term($(this).attr("data-type"), $(this).attr("data-gbn"), true);
        });
        // 해지 신청
        $areaContent.on("click", "button.cancel", function() {
            var params = { ORD_MST_IDX : $areaContent.find("#ORD_MST_IDX").val() };
            $(".layer-popup1").requestLayer($.action.mycontract.info.contract.cancel.layer(), params);
        });
        // 양도/양수 신청
        $areaContent.on("click", "button.transfer", function() {
            var params = { ORD_MST_IDX : $areaContent.find("#ORD_MST_IDX").val() };
            $(".layer-popup1").requestLayer($.action.mycontract.info.contract.transfer.layer(), params);
        });
    });
</script>
</body>
</html>