package web.sci.oneself.model;

import java.io.Serializable;

import org.apache.commons.lang3.StringUtils;

import lombok.Data;
import lombok.Getter;


@Data
public class SciOneselfCheckResult implements Serializable {
    private static final long serialVersionUID = 7929275393831540518L;
    @Getter
    public static enum RESULT {
        SUCCESS("Y", true, "성공"),
        /**
         * reqinfo 값이 없을 때나, returl이 없을 때 발생합니다. 보통 암호화가 제대로 되지 않아 reqinfo값이 없어서 발생하는 경우가 많기 때문에 암호화 모듈을 삭제하고 다시 설치해 주시기 바랍니다.
         * */
        CERT_ERROR("PJ1002", false, "암호화에 실패하였습니다"), 
        /**
         *returl에 숫자가 있는지, SCI평가정보에서 지정해준 숫자가 맞는지 확인해 주시기 바랍니다. 
         */
        URL_ERROR1("PJ1003", false, "URL 오류 입니다."),
        URL_ERROR2("PJ1004", false, "URL 오류 입니다."), 
        /**
         * 비즈사이렌에 등록해주신 url과 실제로 SCI평가정보에 들어오는 url과 상이해서 나타나는 오류입니다. url을 다시 확인해 주시기 바랍니다. (포트번호나,공백도 구분합니다.)
         */
        URL_NOT_EQUALS_ERROR("PJ100811", false, "비즈사이렌에 등록된 URL과 요청 URL이 일치하지 않습니다."),
        /**
         * 필수파라미터 유효성 체크 에러입니다.
         * id.length() == 0 || srvNo.length() != 6 || reqNum.length() == 0 || reqNum.length() >
         * 40 || certdate.length() != 14
         */
        PARAMETER_VALID_ERROR("PJ100601", false, "필수파라메터가 유효하지 않습니다."),
        /**
         * 생년월일 휴대폰인증 서비스 사용시
         * 동일 회원사(ID)의 동일 아이피 에서 연속 5회 명의자 인증 실패시
         * 차단 조건의 메세지 입니다.
         * 회원사 ID와 해당 IP를 확인 해서 전달 해주시면 해지 가능 합니다.
         */
        CERT_FAIL_ERROR1("PJ100901", false, "동일 회원사(ID)의 동일 아이피 에서 연속 인증 실패되었습니다."),
        CERT_FAIL_ERROR2("PJ101201", false, "동일 회원사(ID)의 동일 아이피 에서 연속 인증 실패되었습니다."),
        /**
         * 본인확인 요청시 필수 파라미터인id 널체크, servNo 6자리 체크, jumin 13자리 체크name 널체크, reqNum 널체크 과정에서서하나라도 만족하지 않을때 나는 오류 
         */
        PARAMETER_NULL_ERROR("PJ1006", false, "필수 파라메터가 누락되었습니다."),
        /**
         * 파라메터 위변조 오류 
         */
        PARAMETER_FALSIFICATION_ERROR("FALSIFICATION", false, "HMAC 확인이 필요합니다."), 
        UNKNOWN("U", false, "알수없는 오류가 발생되었습니다.");

        private String code;
        private boolean success;
        private String message;

        RESULT(String codeValue, boolean success, String codeMessage) {
            this.code = codeValue;
            this.success = success;
            this.message = codeMessage;
        }
        public static RESULT getResult(String value) {
            for (RESULT result : values()) {
                if (StringUtils.equals(result.getCode(), value)) {
                    return result;
                }
            }
            return UNKNOWN;
        }
    }
    String name; // 성명
    String sex; // 성별
    String birYMD; // 생년월일
    String fgnGbn; // 내외국인 구분값
    String scCode; // 가상식별번호
    String di; // DI
    String ci1; // CI
    String ci2; // CI
    String civersion; // CI Version
    String reqNum; // 요청번호
    String srvNo; // 서비스번호
    String certGb; // 인증수단
    String cellNo; // 핸드폰 번호
    String cellCorp; // 이동통신사
    String certDate; // 인증시간
    String addVar; // 추가 필드
    boolean success; // 성공여부
    String resultCode; // 결과코드
    String resultMessage; // 결과 메세지
}
