package web.dozn.signature.model;

import java.io.Serializable;

import org.apache.commons.lang3.StringUtils;

import lombok.Data;
import lombok.Getter;

@Data
public class DoznSignatureResult implements Serializable {
    private static final long serialVersionUID = 7929275393831540518L;
    
    @Getter
    public static enum SING_TYPE {
        REQUEST("request"),
        STATUS("status"),
        VERIFY("verify");
        private String type;
        SING_TYPE(String type) {
            this.type = type;
        }
    }
    
    @Getter
    public static enum RESULT {
        REQUEST_SUCCESS("Y", SING_TYPE.REQUEST, true, "성공"),
        /** 잘못된 토큰이거나 해당 API에 접근 할 수 있는 권한이 없음 */
        REQUEST_E300("E300", SING_TYPE.REQUEST, false, "권한이 없습니다."),
        /** 카카오톡 사용자가 아니거나 해지된 사용자, ci 파라미터 오류 */
        REQUEST_E400("E400", SING_TYPE.REQUEST, false, "카카오톡 사용자가 아니거나 해지된 사용자 또는  ci 파라미터 오류 입니다."),
        REQUEST_E401("E401", SING_TYPE.REQUEST, false, "휴대폰번호가 누락 되었거나, 형식에 맞지 않습니다."),
        REQUEST_E402("E402", SING_TYPE.REQUEST, false, "고객성명 이누락 되었거나, 형식에 맞지 않습니다."),
        REQUEST_E403("E403", SING_TYPE.REQUEST, false, "생년월일이 누락 되었거나, 형식에 맞지 않습니다."),
        REQUEST_E404("E404", SING_TYPE.REQUEST, false, "콜센터번호가 누락 되었거나, 이용기관 정보를 찾을 수 없습니다."),
        REQUEST_E406("E406", SING_TYPE.REQUEST, false, "해당 서비스 코드에서는 해당 API를 사용할 수 없습니다."),
        REQUEST_E421("E421", SING_TYPE.REQUEST, false, "요청시의 생년월일과 카카오톡에 등록 된 생년월일이 맞지 않습니다."),
        REQUEST_E422("E422", SING_TYPE.REQUEST, false, "요청시의 고객성명과 카카오톡에 등록 된 성명이 맞지 않습니다."),
        /** call_center_label 파라미터가 너무 긴 경우, 상기 에러 코드에 정의되지 않은 기타 오류 */
        REQUEST_E499("E499", SING_TYPE.REQUEST, false, "요청 정보가 잘못 되었습니다."),
        REQUEST_E500("E500", SING_TYPE.REQUEST, false, "카카오페이 시스템 장애 혹은 서버 오류 입니다."),
        /** 대기중, 서명을 요청한 상태 입니다. */
        STATUS_PREPARE("PREPARE", SING_TYPE.STATUS, false, "서명 대기중 입니다."),
        STATUS_COMPLETE("COMPLETE", SING_TYPE.STATUS, true, "서명 완료"),
        /** 타임아웃 처리마감시간 동안 서명을 완료하지 않은 상태 */
        STATUS_EXPIRED("EXPIRED", SING_TYPE.STATUS, false, "처리 마감시간동안 서명이 완료되지 않았습니다."),
        STATUS_E401("E401", SING_TYPE.STATUS, false, "조회 식별자가 존재하지 않습니다."),
        STATUS_E402("E402", SING_TYPE.STATUS, false, "서명 결과가 존재하지 않습니다."),
        STATUS_E404("E404", SING_TYPE.STATUS, false, "Transaction ID 가 존재하지 않거나, 이용기관 정보를 찾을 수 없습니다"),
        STATUS_E500("E500", SING_TYPE.STATUS, false, "카카오페이 시스템 장애 혹은 서버 오류 입니다."),
        VERIFY_E400("E400", SING_TYPE.VERIFY, false, "잘못된 요청입니다."),
        VERIFY_E401("E401", SING_TYPE.VERIFY, false, "조회 식별자가 존재하지 않습니다."),
        VERIFY_E402("E402", SING_TYPE.VERIFY, false, "서명 결과가 존재하지 않습니다."),
        VERIFY_E403("E403", SING_TYPE.VERIFY, false, "서명이 완료되지 않았습니다."),
        UNKNOWN("U", null, false, "알수없는 오류가 발생되었습니다.");

        private String code;
        private SING_TYPE type;
        private boolean success;
        private String message;

        RESULT(String codeValue, SING_TYPE type, boolean success, String codeMessage) {
            this.code = codeValue;
            this.type = type;
            this.success = success;
            this.message = codeMessage;
        }
        public static RESULT getResult(String value, SING_TYPE type) {
            for (RESULT result : values()) {
                if (StringUtils.equals(result.getCode(), value) && result.getType() == type) {
                    return result;
                }
            }
            return UNKNOWN;
        }
    }
}
