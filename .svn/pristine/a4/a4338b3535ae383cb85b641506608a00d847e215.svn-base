package web.message;

/**
 * 메세지 타입
 */
public enum MessageType {

    // FR
    PLANNER_APPLY_COMPLETE("BM003", "레디플래너 신청완료"), // 사용자 > 레디플래너 신청 완료 시
    PLANNER_RELEASE_REQUEST("BM008", "레디플래너 해제요청"), // 사용자 > My레디플래너 > 해제요청 시 
    CONTRACT_COMPLETE_TYPE1("BM010", "간편가입 신청완료 (=주문완료)_월지원/렌탈/즉발"), // 사용자 > 간편가입 신청완료 시 상품유형 : 월지원/렌탈/즉발
    CONTRACT_COMPLETE_TYPE2("BM011", "간편가입 신청완료 (=주문완료)_할부지원형"), // 사용자 > 간편가입 신청완료 시 상품유형 : 할부지원형
    CONTRACT_CANCEL_REQUEST("BM012", "해지신청 완료"), // 사용자 > My계약 > 해지신청 시 
    CONTRACT_TRANSFER_REQUEST("BM013", "양도/양수신청 완료"), // 사용자 > My계약 > 양도/양수신청 시 
    CONTRACT_LIFESERVICE_REQUEST("BM014", "라이프서비스 신청"), // 사용자 > My계약 > 라이프서비스 신청 시 
    PLANNER_ADMIN_REQUEST("BM020", "레디플래너 신청 관리자 알림"); // 사용자 > 레디플레너 신청 > 특정관리자에게 카톡 발송 

    String templateCode; // 템플릿 코드
    String templateName; // 텝플릿 명칭

    MessageType(String templateCode, String templateName) {
        this.templateCode = templateCode;
        this.templateName = templateName;
    }

    public String getTemplateCode() {
        return templateCode;
    }

    public String getTemplateName() {
        return templateName;
    }

}
