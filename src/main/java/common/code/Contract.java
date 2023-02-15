package common.code;

import lombok.Getter;

public class Contract {
    
    public static enum JOIN_STEP {
        INDEX, VIEW, STEP1, STEP2, STEP3, STEP4, REGIST
    }
    
    @Getter
    public static enum ERROR {
        E403("E403", "본인 인증정보가 만료 되었습니다.\\n처음부터 다시 시도해 주세요.\\n[errorCode : E403]"),
        E404("E404", "전시중인 상품정보가 존재하지 않습니다.\\n[errorCode : E404]"),
        E450("E450", "필수 정보가 누락되었습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E450]\\n[errorMessage : 상품코드 누락]"),
        E451("E451", "필수 정보가 누락되었습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E451]\\n[errorMessage : 옵션정보 누락]"),
        E452("E452", "필수 정보가 누락되었습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E452]\\n[errorMessage : 상품코드 누락]"),
        E453("E453", "필수 정보가 누락되었습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E453]\\n[errorMessage : 가입구좌 누락]"),
        E454("E454", "필수 정보가 누락되었습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E454]\\n[errorMessage : 공통정보 누락]"),
        E455("E455", "필수 정보가 누락되었습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E455]\\n[errorMessage : 메인 계약 정보 누락]"),
        E456("E456", "필수 정보가 누락되었습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E456]\\n[errorMessage : 배송/설치 정보 누락]"),
        E457("E457", "필수 정보가 누락되었습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E457]\\n[errorMessage : 추가 정보 누락]"),
        E458("E458", "필수 정보가 누락되었습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E458]\\n[errorMessage : 카카오 전자서명 인증정보 누락]"),
        E459("E459", "필수 정보가 누락되었습니다.\\n확인 후 다시 시도해주세요.\\n[errorCode : E459]\\n[errorMessage : 주문번호 누락]"),
        E497("E497", "가입 데이터 등록에 실패하였습니다.\\n[errorCode : {0}]\\n[errorMessage : {1}]"),
        E498("E498", "PG 처리 중 오류가 발생되었습니다.\\n[errorCode : {0}]\\n[errorMessage : {1}]"),
        E499("E499", "가입 데이터 등록에 실패하였습니다.\\n[errorCode : E499]\\n[errorMessage : 가입 데이터 등록 실패]"),
        E500("E500", "알수없는 오류가 발생되었습니다.");
        private String code;
        private String message;
        ERROR(String code, String message) {
            this.code = code;
            this.message = message;
        }
    }
}
