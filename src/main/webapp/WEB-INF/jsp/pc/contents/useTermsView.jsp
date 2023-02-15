<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="/WEB-INF/jsp/pc/include/head.jsp" %> 
</head>
<body class="">
<c:set var="page" value="이용약관"/>
<%@include file="/WEB-INF/jsp/pc/include/header.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/gnb.jsp" %>
<jsp:include page="/WEB-INF/jsp/pc/include/nav.jsp" flush="false">
    <jsp:param name="oneDepth" value="${page }"/>
    <jsp:param name="oneDepthKey" value="contents.terms.use.view"/>
</jsp:include>
<%-- Body --%>
<div class="area-body">

    <div class="area-inner">
        <%-- Content without LNB  --%>
        <div class="contain-body">
            <div class="content-header">
                <h3 class="title"><c:out value="${page }"/></h3>
            </div>

            <div class="content-terms">
                <div class="box-privacy">
                    <dl>
                        <dt>제1조(목적)</dt>
                        <dd>이 약관은 ㈜대명스테이션(이하 “회사”라 함)이 운영하는 다이렉트 라이프서비스 가입몰을 이용함에 있어 “몰”과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.</dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제2조(정의)</dt>
                        <dd>
                            ① “몰”이란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 구성한 온라인, 모바일상의 영업장을 말합니다.<br />
                            ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br />
                            ③ “회원”이라 함은 “몰”을 통해 회사가 제공하는 서비스에 가입하여 이용할 수 있는 자를 말합니다.<br />                            
                            ④ “비회원”이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br />                            
                            ⑤ “계약”이란 “몰”이 제공하는 서비스에 관한 회원의 가입신청을 회사가 승낙함으로써 성립하는 계약을 말합니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제3조(약관 등의 명시와 설명 및 개정)</dt>
                        <dd>
                            ① 몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소, 전화번호, 전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 “몰”의 초기 서비스화면에 <br />게시합니다.<br />
                            ② “몰”은 이용자가 약관에 동의하기에 앞서 약관에 기재된 내용 중 청약철회, 환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업 등을 제공합니다.<br />                            
                            ③ “몰”은 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 전자문서 및 전자거래기본법, 전자금융법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 소비자기본법 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정합니다.<br />
                            ④ “몰”이 약관을 개정할 경우 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 천일까지 공지합니다. 단, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.<br />
                            ⑤ “몰”이 약관을 개정할 경우 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고, 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관 조항이 그대로 적용됩니다. 단, 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내 “몰”에 송신하여 “몰”의 동의를 받은 경우에 개정약관 조항이 적용됩니다.<br />
                            ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제4조(서비스의 제공 및 변경)</dt>
                        <dd>
                            ① “몰”은 다음과 같은 업무를 수행합니다.
                            <span class="privacy-inner1">
                            1. 재화 또는 용역에 대한 정보 제공<br />                            
                            2. 재화 또는 용역에 대한 계약 등의 체결<br />                            
                            3. 계약이 체결된 재화 또는 용역의 배송<br />                            
                            4. 기타 “몰”이 정하는 업무</span>
                            
                            ② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br />
                            ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우 그 사유를 이용자에게 전화, 이메일 등으로 즉시 통지합니다.<br />
                            ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상함. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우 배상하지 않습니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제5조(서비스의 중단)</dt>
                        <dd>
                            ① “몰”은 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신 두절 등의 사유가 발생할 경우 서비스의 제공을 일시적으로 중단할 수 있습니다.<br />
                            ② “몰”은 제1항의 사유로 서비스 제공이 일시적으로 중단됨에 따라 이용자 또는 제3자가 입은 손해에 대해 배상함. 단, 고의 또는 과실이 없음을 입증한 경우 배상하지 않습니다.<br />
                            ③ 사업종목의 전환, 사업의 포기, 업체 간 통합 등의 이유로 서비스를 제공할 수 없게 될 경우 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제6조(서비스 가입)</dt>
                        <dd>
                            ① 이용자는 “몰”이 정한 양식에 따라 회원정보 및 가입에 필요한 기타 정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 “몰”에서 제공하는 서비스 가입을 신청합니다.<br />
                            ② 계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 정합니다.<br />
                            ③ “몰”은 제1항을 통해 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.
                            <span class="privacy-inner1">
                                1. 가입신청자가 이 약관 제7조 제2항에 의하여 이전에 회원자격을 상실한 적이 있는 경우<br />
                                2. 가입신청, 등록 내용에 허위, 기재 누락, 오기가 있는 경우<br />
                                3. 만 19세 미만의 자가 회원 가입을 신청한 경우<br />
                                4. 본인확인절차에서 본인이 아님이 확인된 경우<br />
                                5. “몰” 이용약관의 적용을 받는 자가 해당 약관을 위반한 경우<br />
                                6. 이 약관에 위배되거나 위법 또는 부당한 회원 가입신청임이 확인된 경우<br />
                                7. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우
                            </span>
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제7조(계약 해지 및 자격 상실 등)</dt>
                        <dd>
                            ① 회원은 원할 시 회사에 의사를 통지하여 계약을 해지할 수 있습니다. 단, 해지의사를 통지하기 전 진행 중인 모든 상품 또는 서비스의 거래를 완료하거나 철회 또는 취소하여야 하며, 거래의 철회 또는 취소로 인한 불이익은 회원 본인이 부담하여야 합니다. 또한, 회원이 “몰”에 대한 계약 등 채무를 전부 이행하지 않으면 회원이 해당 채무를 전부 이핼할 때까지 “몰”은 회원의 계약해지를 제한할 수 있습니다.<br />
                            ② “몰”은 다음 각호에서 정한 바에 따라 계약을 해지할 수 있습니다.<br />
                            <span class="privacy-inner1">
                                1. “몰”은 회원에게 다음 각 목의 1에 해당하는 사유가 발생하거나 확인이 되면 계약을 해지할 수 있습니다.<br />
                                가. 다른 회원 또는 “몰”의 권리나 명예, 신용 기타 정당한 이익을 침해하거나 대한민국 법령, 공공질서 또는 선량한 풍속에 위배되는 행위를 한 경우<br />
                                나. 회원이 이 약관에 위배되는 행위 할 경우<br />
                                다. 회원에게 제6조에서 정한 계약의 승낙거부사유가 있음이 확인된 경우<br />
                                나. 서비스의 원활한 진행을 방해하거나 방해할 우려가 있는 아래 행위 등을 한 경우<br />
                                    <span class="privacy-inner2">
                                        I. 합리적 사유 없이 상습적, 악의적으로 이의를 제기하는 행위<br />
                                        II. 구매하거나 이용중인 상품 또는 서비스에 특별한 하자가 없음에도 상습적으로 사용 후 취소, 반품 등을 하는 행위<br />
                                        III. 그외 “몰”이 정한 계약내용을 위반한 경우
                                    </span>

                                2. “몰”이 계약을 해지하더라도, 해지 이전에 이미 체결된 계약의 완결에 대해서는 해당 계약 및 본 약관이 계속 적용됩니다.<br />
                                3. 계약이 종료될 겨우 “몰”은 별도 통지 없이 해당 회원과 관련된 계약 또는 거래를 취소 또는 해지할 수 있으며, 계약에 따른 채무가 이행되지 아니한 경우 회원은 취소 또는 해지된 계약 또는 거래의 모든 채무를 전부 이행하여야 합니다.<br />
                                4. 계약이 종료된 경우 “몰”은 회원의 재이용 신청을 승낙하지 않을 수 있습니다.</span>
                            ③ 계약의 종료와 관련하여 발생한 손해에 대해서는 자신의 귀책사유로 계약이 종료된 해당 회원이 책임을 져야 하고, “몰”은 귀책사유가 없는 한 책임을 지지 않습니다.<br />
                            ④ “몰”이 회원자격을 상실시키는 경우 회원등록을 말소할 수 있으며, 이경우 회원에게 이를 통지하고 말소 전 최소 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제8조(회원에 대한 통지)</dt>
                        <dd>
                            ① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소나 이동전화 SMS 등으로 할 수 있습니다.<br />
                            ② “몰”은 불특정다수 이용자에 대한 통지의 경우 일주일 이상 “몰”게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 단, 회원 본인의 거래와 관련된 중대한 내용에 대해서는 개별 통지할 수 있습니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제9조(가입신청 및 개인정보 제공 동의 등)</dt>
                        <dd>
                            ① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법의 이하여 가입계약을 신청하며, “몰”은 이용자가 가입계약을 신청함에 있어 다음 각 내용을 알기 쉽게 제공합니다.
                            <span class="privacy-inner1">
                                1. 제공하는 서비스의 검색 및 선책<br />                                                            
                                2. 받는 사람의 성명, 주소, 정화번호, 전자우편주소 등의 입력<br />
                                3. 가입 신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
                            </span>
                            ② “몰”이 제3자에게 이용자 개인정보를 제공할 필요가 있는 경우 1)개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3)제공받는 개인정보의 항목, 4)개인정보를 제공받는 자의 개인정보보유 및 이용기간을 이용자에게 알리고 동의를 받아야 합니다.<br />
                            ③ “몰”이 제3자에게 이용자의 개인정보를 취급할 수 있도록 업무를 위탁한 경우, 1)개인정보 취급위탁을 받는자, 2)개인정보 취급위탁을 하는 업무의 내용을 이용자에게 알리고 동의를 받아야 합니다. 단, 서비스 제공에 관한 계약이행을 위해 필요하고 회원의 편의 증진과 관련된 경우 정보통신망 이용촉진 및 정보보호 등에 관한 법률에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않을 수 있습니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제10조(계약의 성립)</dt>
                        <dd>
                            ① “몰”은 제9조와 같은 가입 신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다.<br />
                            ② “몰”과 이용자 간 전자서명 또는 녹취계약을 완료한 후 “몰”이 제공하는 서비스 또는 상품의 구매가의 일정 부분을 이용자가 지불(납부)하였을 때 계약 성립 시점으로 봅니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제11조(결제)</dt>
                        <dd>
                            ① “몰”은 “회원”이 현금, 카드 기타의 방법으로 구매대금을 결제할 수 있는 방법을 제공합니다.<br />
                            ② 구매대금의 결제와 관련 “회원”이 입력한 정보 및 그 정보와 관련하여 발생한 책임과 불이익은 전적으로 “회원”이 부담하여야 합니다.<br />
                            ③ “회원”은 “몰”에서 제공하는 상품 또는 서비스에 대한 가입, 구매, 이용에 대한 대금지급을 다음 각 호에 해당하는 방식 중 하나로 할 수 있습니다.
                            <span class="privacy-inner1">
                                1. 신용카드 등<br />
                                2. 선불카드<br />
                                3. 실시간 계좌이체<br />
                                4. 가상 계좌 (단, “몰” 또는 “회사” 정책에 따라 이용 범위 제한)<br />
                                5. 기타 “몰”이 추가 지정하는 결제 수단
                            </span>
                            ④ “몰”은 회원의 대금 지급에 법적, 기술적 문제가 발생하거나 “몰”이 예견하지 못한 장애가 발생한 경우 정책에 따라 회원에게 결제 수단의 변경을 요청하거나 잠정 결제 보류 내지 거부할 수 있습니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제12조(서비스 또는 재화 등의 공급)</dt>
                        <dd>
                            ① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도 약정이 없는 이상, 이용자가 청약을 한 날로부터 30일 이내에 재화 등을 배송할 수 있도록 조치를 취해야 합니다.<br />
                            ② “몰”은 이용자가 구매한 재화에 대해 이용자와 약속한 기간 내 배송을 완료하여야 하며, 그로 인해 발생할 수 있는 이용자의 피해를 배상하여야 합니다. 단, “몰”의 고의 또는 과실이 없는 경우는 배상하지 않습니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제13조(환급)</dt>
                        <dd>
                            “몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우 대금을 받은 날로부터 n영업일 이내 환급하거나 환급에 필요한 조치를 취합니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제14조(청약철회 등)</dt>
                        <dd>
                            ① “몰”과 재화 등 구매에 관한 계약을 체결한 이용자는 전자상거래 등에서의 소비자보호에 관한 법률에 따라 계약이 성립된 시점으로부터 7일 이내 청약의 철회를 할 수 있습니다. 단, 철회에 관하여 전자상거래 등에서의 소비자보호에 관한 법률에 달리 정함이 있는 경우에 동 법규정에 따릅니다.<br />
                            ② 이용자는 재화 등을 배송 받는 경우 다음 각호에 해당하는 경우네는 반품 및 교환을 할 수 없습니다.
                            <span class="privacy-inner1">
                            1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우<br />
                            2. 이용자의 사용 또는 일부 소비에 의해 재화 등의 가치가 감소한 경우<br />
                            3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 감소한 경우<br />
                            4. 기타 구매자가 환불이나 교환을 요청할 수 없는 합리적인 사유가 있는 경우
                            </span>

                            ③ 이용자는 재화 등의 내용이 표시, 광고 내용과 다르거나 계약내용과 다르게 이행된 경우 당해 재화 등을 공급받을 날부터 3개월 내 그 사실을 안날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.<br />
                            ④ 이용자는 상품이 배송되기 전까지 계약을 취소할 수 있습니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제15조(개인정보보호)</dt>
                        <dd>
                            ① “몰”은 이용자의 개인정보 수집 시 서비스 제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.<br />
                            ② “몰”은 회원가입 시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 단, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 정보를 수집하는 경우에는 그러하지 아니합니다.<br />
                            ③ “몰”은 이욪아의 개인정보 수집 및 이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.<br />
                            ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 목적이 발생한 경우 또는 제3자에게 제공하는 경우 이용, 제공 단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 단, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br />
                            ⑤ “몰”이 제3항과 제4항에 의해 이요자의 동의를 받아야 하는 경우 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 등), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항 등 정보통신망 이용촉진 및 정보보호 등에 관한 법률에서 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br />
                            ⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 지닙니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br />
                            ⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br />
                            ⑧ 몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br />
                            ⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정하지 아니함또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.<br />
                            ⑩ “몰”은 다음과 같은 경우 법이 허용하는 범위 내에서 회원의 개인정보를 제 3자에게 제공할 수 있습니다.
                            <span class="">
                                1. 수시기관이나 기타 정부기관으로부터 정보제공을 요청 받은 경우<br />
                                2. 회원이 법령을 위반하는 등 부쟁행위를 확인하기 위해 필요한 경우<br />
                                3. 기타 법률에 의해 요구되는 경우
                            </span>
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제16조(“몰”의 의무)</dt>
                        <dd>
                            ① “몰”은 법령과 이 약관이 금지하거나 공서약속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화, 용역을 제공하는데 최선을 다합니다.<br />
                            ② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보보호를 위한 보안 시스템을 갖춰야 합니다.<br />
                            ③ “몰”이 상품이나 용역에 대해 표시, 광고의 공정화에 관한 법률 제3조 소정의 부당한 표시, 광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br />
                            ④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제17조(“이용자”의 의무)</dt>
                        <dd>
                            이용자는 다음 행위를 하여서는 안됩니다.<br />
                            1. 신청 또는 변경 시 허위 내용의 등록<br />
                            2. 타인의 정보 도용<br />
                            3. “몰”에 게시된 정보의 변경<br />
                            4. “몰”이 정한 정보 이외의 정보 등의 송신 또는 게시<br />
                            5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해<br />
                            6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br />
                            7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 게시하는 행위
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제18조(연결”몰”과 피연결”몰” 간의 관계)</dt>
                        <dd>
                            ① 상위 사이트와 하위 사이트가 하이퍼링크(예, 하이퍼링크의 대상에는 문자, 그림 및 동영상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결몰(웹사이트)이라고 하고, 후자를 피연결몰(웹사이트)이라고 합니다.<br />
                            ② “회사”가 연결몰은 피연결몰이 독자적으로 제공하는 상품 등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결몰의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 “회사”는 “이용자”에게 그 거래에 대한 보증책임을 지지 않습니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제19조(저작권의 구속 및 이용제한)</dt>
                        <dd>
                            ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.<br />
                            ② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br />
                            ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.<br />
                            ④ 회원이 “몰”의 서비스를 이용하면서 작성한 각종 게시물의 저작권은 회원 본인에게 있으며, 해당 게시물의 저작권 침해를 비롯한 민·형사상 모든 책임은 회원 본인이 집니다.<br />
                            ⑤ ⑤“몰”은 회원이 등록한 게시물을 검색사이트나 다른 사이트에 노출할 수 있으며, 판촉, 홍보 및 기타의 자료로 무상으로 사용할 수 있습니다. 또한, 회사가 제공하는 서비스 내에서 회원 게시물을 복제, 전시, 전송, 배포할 수 있으며 2차적 저작물과 편집저작물로 작성 할 수 있습니다. 다만, 해당 게시물을 등록한 회원이 게시물의 삭제 또는 사용중지를 요청하면 회사는 관련 법률에 따라 보존해야 하는 사항을 제외하고 즉시 삭제 또는 사용을 중지합니다.<br />
                            ⑥ 본 조 제5항에 언급된 회사의 사용권은 “몰” 서비스를 운영하는 동안에만 확정적으로 유효합니다<br />
                            ⑦ “몰”이 본 조 제5항 이외의 방법으로 회원의 게시물을 상업적으로 이용하고자 할 때에는, 전화, 팩스, 이메일(E-mail)등의 방법으로 미리 회원의 동의를 얻어야 합니다. 회사가 본 항에 따라 회원의 게시물을 상업적으로 이용할 때 회사는 별도의 보상제도를 운영할 수 있습니다.<br />
                            ⑧ “몰”이 작성한 저작물에 대한 저작권과 지적 재산권은 회사에 귀속합니다.<br />
                            ⑨ 이용자가 “몰”을 이용하여 얻은 정보를 회사의 승낙 없이 복제, 송신, 출판, 배포, 방송, 기타 방법으로 이용하거나 제3자에게 이용하게 할 때 그에 대한 책임은 이용자 본인에게 있습니다.<br />
                            ⑩ 회원은 “몰” 내에서 자신의 저작권이 침해되면 회사가 운영하는 신고센터 제도를 이용하여 자신의 정당한 권리를 보호받을 수 있습니다.<br />
                            ⑪ 게시물의 내용이 다음 각 호의 내용을 담고 있을 때 “몰”은 게시물을 삭제하거나 게시자에게 특정 서비스의 이용제한 또는 정지, 이용계약의 해지 등의 조치를 할 수 있습니다. 이때 게시물이 삭제되면 해당 게시물과 관련된 게시물(답변글, 댓글 등)도 모두 삭제됩니다.
                            <span class="privacy-inner1">
                                1. 대한민국의 법령을 위반하는 내용을 포함하는 경우<br />
                                2. 타인의 권리나 명예, 신용 기타 정당한 이익을 침해하는 경우<br />
                                3. 정보통신기기의 오작동을 일으킬 수 있는 악성코드나 데이터를 포함하는 경우<br />
                                4. 사회 공공질서나 미풍양속에 위배되는 경우<br />
                                5. 기타 제1호 내지 제4호에 준하는 중대한 사유로 말미암아 회사가 제공하는 서비스의 원활한 진행을 방해하는 것으로 판단되는 경우
                            </span>                            
                            ⑫ 몰”이 제11항에 따라 게시물을 삭제했을 때, 해당 게시자는 “몰”에 이의를 제기하여 구제받을 수 있습니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제20조(분쟁해결)</dt>
                        <dd>
                            ① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치.운영합니다.<br />
                            ② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.<br />
                            ③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제21조(재판권 및 준거법)</dt>
                        <dd>
                            ① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br />
                            ② “몰”과 이용자 간에 제기된 전자상거래 소송에는 대한민국 법령을 적용합니다
                        </dd>
                    </dl>
                </div>

                <div class="box-privacy">
                    <dl>
                        <dt>제21조(기타 조항)</dt>
                        <dd>
                            ① “몰”은 필요하면 특정 서비스나 기능의 전부 또는 일부를 “몰”을 통해 미리 공지한 후 일시적 또는 영구적으로 수정하거나 중단할 수 있습니다.<br />
                            ② 각 당사자는 상대방의 서면 동의 없이 이 약관상의 권리와 의무를 제3자에게 양도하거나 처분할 수 없습니다.<br />
                            ③ 이 약관과 관련하여 당사자 간의 합의에 따라 추가로 작성된 계약서, 협정서, 통보서 등과 회사의 정책변경, 법령의 제·개정 또는 공공기관의 고시나 지침 등에 따라 “몰”이 “몰”에 공지하는 내용도 이용계약의 일부를 구성합니다.<br />
                            ④ “몰”은 구매자 회원이 서비스를 이용할 때 발생할 수 있는 정당한 의견이나 불만 사항을 적극적으로 수렴하여 해결하고, 회원 상호 간의 분쟁을 조정하기 위하여 고객센터를 설치하고 운영합니다. “몰”은 회원이 제기하는 각종 불만사항과 의견을 적극적으로 검토한 후 정당하다고 판단될 때에는 이를 신속하게 처리하며, 즉시 처리하기가 어려운 사항이 있으면 그 사유와 처리기간을 전자우편주소(E-mail), 전화, 팩스 또는 기타의 방법으로 회원에게 통보합니다.
                        </dd>
                    </dl>
                </div>

                <p>[부칙] 본 약관은 2020년 8월 10일부터 적용됩니다. </p>

            </div>
        </div>
        <%-- //Content without LNB  --%>
        
    </div>
</div>
<%-- //Body --%>

<%@include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/layer.jsp" %>
<%@include file="/WEB-INF/jsp/pc/include/script.jsp" %>


</body>
</html>