package web.pg.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.inicis.std.util.HttpUtil;
import com.inicis.std.util.ParseUtil;
import com.inicis.std.util.SignatureUtil;

import common.code.PaymentGate;
import common.dao.CommonDefaultDAO;
import common.session.SessionsContract;
import common.session.SessionsPaymentGate;
import common.session.SessionsUser;
import common.util.DateUtil;
import common.util.DeviceUtil;
import common.util.HttpConnectionUtil;
import common.util.HttpConnectionUtil.HttpMethod;
import common.util.IPUtil;
import common.util.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.extern.log4j.Log4j2;
import net.sf.json.JSONObject;
import web.fr.contract.service.ContractService;
import web.fr.product.service.BasicProductService;
import web.pg.service.IniPayService;

@Log4j2
@Service("iniPayService")
@Component
public class IniPayServiceImpl implements IniPayService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name="basicProductService")
    private BasicProductService basicProductService;
    
    @Resource(name="contractService")
    private ContractService contractService;
    
    @Resource(name="urlPropertiesService")
    private EgovPropertyService urlPropertiesService;
    
    @Value("${spring.profiles.active:prd}")
    private String activeProfile;
    
    @Value("#{resource['front.ssl.domain']}")
    private String pcDomain;
    
    @Value("#{resource['mobile.ssl.domain']}")
    private String mobileDomain;
    
    @Value("#{pg['pg.mid']}")
    private String mid;
    
    @Value("#{pg['pg.sign.key']}")
    private String signKey;
    
    @Value("#{pg['pg.version']}")
    private String version;
    
    @Value("#{pg['pg.currency']}")
    private String currency;
    
    @Value("#{pg['pg.paymethod']}")
    private String paymethod;
    
    @Value("#{pg['pg.mname']}")
    private String mname;
    
    @Value("#{pg['pg.charset']}")
    private String charset;
    
    @Value("#{pg['pg.pay.view.type']}")
    private String payViewType;
    
    @Value("#{pg['pg.acceptmethod']}")
    private String acceptmethod;
    
    @Value("#{pg['pg.format']}")
    private String format;
    
    @Value("#{pg['pg.refund.type']}")
    private String refundType;
    
    @Value("#{pg['pg.refund.url']}")
    private String refundUrl;
    
    @Value("#{pg['pg.refund.key']}")
    private String refundKey;
    
    @Value("#{pg['pg.mobile.accept.charset']}")
    private String acceptCharset;
    
    @Value("#{pg['pg.content.type']}")
    private String contentType;
    
    @Value("#{resource['app.pakage.name']}")
    private String appPackageName;
    
    @Value("#{resource['app.schema.name']}")
    private String appSchemaName;
    
    
    
    /**
     * <pre>
     * 1. MethodName : getResultUrl
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 인증 요청 url 반환.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @return
     * @throws Exception
     */
    private String getResultUrl () throws Exception {
        if (DeviceUtil.isNormal()) {
            return this.pcDomain + this.urlPropertiesService.getString("pg.request.pc.result");
        } else {
            return this.mobileDomain + this.urlPropertiesService.getString("pg.request.mb.result");
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : parseStringToMap
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 문자열을 Map으로 치환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param str
     * @return
     * @throws Exception
     */
    private Map<String, String> parseStringToMap(String str) throws Exception {
        String test = str.replace(",", "&").replace(":", "=").replace("\"", "").replace(" ","").replace("\n", "").replace("}", "").replace("{", "");
        Map<String, String> resultMap = new HashMap<>();
        resultMap = ParseUtil.parseStringToMap(test); // 문자열을 MAP형식으로 파싱
        return resultMap;
    }
    
    
    /**
     * <pre>
     * 1. MethodName : selectIniPayReqKeyStr
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 인증 요청 key 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @return
     * @throws Exception
     */
    private String selectIniPayReqKeyStr() throws Exception {
        return this.defaultDAO.selectStr("IniPay.selectIniPayReqKeyStr", null);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectIniPayReqResultInfo
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 인증 요청 결과 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @return
     * @throws Exception
     */
    private Map<String, Object> selectIniPayReqResultInfo() throws Exception {
        return this.defaultDAO.select("IniPay.selectIniPayReqResultInfo", SessionsPaymentGate.getSessionPaymentGate());
    }
    
    /**
     * <pre>
     * 1. MethodName : getIniPayParamMap
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 인증 요청 데이터 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private Map<String, Object> getIniPayParamMap(Map<String, Object> commandMap) throws Exception {
        SessionsPaymentGate.setSessionPaymentGateClear();
        Map<String, Object> params = new HashMap<>();
        params.put("PRD_MST_NO", StringUtil.getString(commandMap, "PRD_MST_NO"));
        params = this.basicProductService.selectBasicProductInfo(params);
        String oid = this.contractService.selectContractMasterKeyStr(params);
        String apvReqIdx = this.selectIniPayReqKeyStr();
        params.put("apvReqIdx", apvReqIdx);
        params.put("oid",  oid);
        params.put("buyername", SessionsUser.getSessionValue("USER_NM"));
        params.put("buyertel", SessionsUser.getSessionValue("USER_HP"));
        params.put("buyeremail", StringUtil.getString(SessionsContract.getSessionContractData(), "EMAIL"));
        params.put("goodname", StringUtil.getString(params, "PRD_MST_NM"));
        params.put("price", StringUtil.getString(params, "PRD_MST_ISTM_SPT_PAY"));
        String quotabase = StringUtil.getString(params, "PRD_MST_ISTM_MTH");
        /** 2020-07-09 요건 변경 요청에 따른 주석 처리
        int prdMstIstmMth = StringUtil.getInt(params, "PRD_MST_ISTM_MTH");
        String quotabase = "";
        for (int i = 2; i <= prdMstIstmMth; i++) {
            quotabase += i;
            if (i < prdMstIstmMth) {
                quotabase += ":";
            }
        }
        */
        log.debug("quotabase : [{}]", quotabase);
        params.put("quotabase", quotabase);
        params.put("merchantData", apvReqIdx +  "|" + oid);
        return params;
    }
    
    /**
     * <pre>
     * 1. MethodName : getIniPayReqMap
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 인증요청 데이터 생성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param params
     * @return
     * @throws Exception
     */
    private Map<String, Object> getIniPayReqMap(Map<String, Object> params) throws Exception {
        String oid = StringUtil.getString(params, "oid"); // 가맹점 주문번호
        String buyername = StringUtil.getString(params, "buyername"); // 구매자 명
        String buyertel = StringUtil.getString(params, "buyertel"); // 구매자 연락처
        String buyeremail = StringUtil.getString(params, "buyeremail"); // 구매자 이메일
        String goodname = StringUtil.getString(params, "goodname"); // 상품명
        String price = StringUtil.getString(params, "price"); // 상품가격(특수기호 제외)
        String quotabase = StringUtil.getString(params, "quotabase"); // 할부 개월수
        
        String merchantData = StringUtil.getString(params, "merchantData"); // 가맹점 추가 데이
        Map<String, Object> returnMap = new HashMap<>();
        if (DeviceUtil.isNormal()) {
            //###############################################
            // 1. 전문 필드 값 설정
            //###############################################
            String timestamp = SignatureUtil.getTimestamp(); // util에 의해서 자동생성
            //###############################################
            // 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
            //###############################################
            String mKey = SignatureUtil.hash(this.signKey, "SHA-256");
            //###############################################
            // 3. signature 생성
            //###############################################
            Map<String, String> signParam = new HashMap<>();
            signParam.put("oid", oid);                  // 필수
            signParam.put("price", price);              // 필수
            signParam.put("timestamp", timestamp);      // 필수

            // signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
            String signature = SignatureUtil.makeSignature(signParam);
            
            returnMap.put("mid", this.mid); // 상점 아이디
            returnMap.put("oid", oid); // 가맹점 주문번호
            returnMap.put("buyername", buyername); // 구매자 명
            returnMap.put("buyertel", buyertel); // 구매자 연락처
            returnMap.put("buyeremail", buyeremail); // 구매자 이메일
            returnMap.put("goodname", goodname); // 상품명
            returnMap.put("price", price); // 상품가격(특수기호 제외)
            returnMap.put("quotabase", quotabase); // 할부 개월수
            returnMap.put("mKey", mKey); // 서명  Hash key
            returnMap.put("signature", signature); // 서명 값
            returnMap.put("timestamp", timestamp); // 타임스탬프
            returnMap.put("version", this.version); // 버전
            returnMap.put("currency", this.currency); // 원화
            returnMap.put("gopaymethod", this.paymethod); // 결제 수단
            returnMap.put("charset", this.charset); // 인코딩
            returnMap.put("payViewType", this.payViewType); // 결제창 표시방법
            returnMap.put("returnUrl", this.getResultUrl()); // 인증결과수신 Url
            returnMap.put("closeUrl", this.getResultUrl()); // 취소 처리로 Overlay 창을 닫아주는 역활을 하는 Url
            returnMap.put("acceptmethod", this.acceptmethod); // 결제 수단별 추가 옵션 값
            returnMap.put("merchantData", merchantData); // 가맹점 추가 데이터
            SessionsPaymentGate.setSessionPaymentGate(returnMap);
        } else {
            returnMap.put("P_MID", this.mid); // 상점 아이디
            returnMap.put("P_OID", oid); // 가맹점 주문번호
            returnMap.put("P_UNAME", buyername); // 구매자 명
            returnMap.put("P_MOBILE", buyertel); // 구매자 연락처
            
            returnMap.put("P_EMAIL", buyeremail); // 구매자 이메일
            returnMap.put("P_GOODS", goodname); // 상품명
            returnMap.put("P_AMT", price); // 상품가격(특수기호 제외)
            returnMap.put("P_QUOTABASE", quotabase); // 할부 개월수
            returnMap.put("P_MNAME", this.mname); // 가맹점 명
            returnMap.put("P_INI_PAYMENT", this.paymethod); // 결제 수단
            returnMap.put("P_CHARSET", this.charset); // 인코딩
            returnMap.put("P_NOTI", merchantData); // 가맹점 추가 데이터
            String option = "twotrs_isp=Y&block_isp=Y&cp_yn=N&ismart_use_sign=Y"; // 추가 옵션
            if (DeviceUtil.isApp()) {
                option += "&app_scheme=" + appSchemaName + "://";
                option += "&mall_app_name=" + appSchemaName + "://";
            }
            if (!"prd".equals(activeProfile)) {
                option += "&below1000=Y";
            }
            returnMap.put("P_RESERVED", option); // 추가 정보
            returnMap.put("P_NEXT_URL", this.getResultUrl()); // 인증결과수신 Url
        }
        return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : getIniPayReqResultMap
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 인증 요청 결과 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private Map<String, Object> getIniPayReqResultMap(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        String resultCode = PaymentGate.RESULT.UNKNOWN.getCode(); // 결과코드
        String resultMsg = ""; // 결과메세지
        String authToken = ""; // 승인요청 토근
        String tid = ""; // 인증거래번호
        String price = ""; // 상품가격(특수기호 제외)
        String authUrl = ""; // 승인요청 Url
        String netCancelUrl = ""; // 망취소요청 Url
        String merchantData = ""; // 가맹점 데이터
        if (DeviceUtil.isNormal()) {
            if (commandMap.isEmpty()) {
                resultCode = PaymentGate.RESULT.E01.getCode(); // 결과코드
                resultMsg = "사용자가 결제를 취소 하였습니다.";
                Map<String, Object> data = SessionsPaymentGate.getSessionPaymentGate();
                merchantData = StringUtil.getString(data, "merchantData"); // 가맹점 데이터
            } else {
                resultCode = StringUtil.getString(commandMap, "resultCode", PaymentGate.RESULT.UNKNOWN.getCode()); // 결과코드
                resultMsg = StringUtil.getString(commandMap, "resultMsg"); // 결과메세지
                authToken = StringUtil.getString(commandMap, "authToken"); // 승인요청 토근
                authUrl = StringUtil.getString(commandMap, "authUrl"); // 승인요청 Url
                netCancelUrl = StringUtil.getString(commandMap, "netCancelUrl"); // 망취소요청 Url
                merchantData = StringUtil.getString(commandMap, "merchantData"); // 가맹점 데이터
            }
            SessionsPaymentGate.setSessionPaymentGateClear();
        } else {
            resultCode = StringUtil.getString(commandMap, "P_STATUS", PaymentGate.RESULT.UNKNOWN.getCode()); // 결과코드
            resultMsg = StringUtil.getString(commandMap, "P_RMESG1"); // 결과메세지
            tid = StringUtil.getString(commandMap, "P_TID"); // 승인요청 토근 (tid)
            price = StringUtil.getString(commandMap, "P_AMT"); //
            authUrl = StringUtil.getString(commandMap, "P_REQ_URL"); // 승인요청 Url
            merchantData = StringUtil.getString(commandMap, "P_NOTI"); // 가맹점 데이터
        }
        PaymentGate.RESULT result = PaymentGate.RESULT.getResult(resultCode);
        boolean isSuccess = result.isSuccess();
        log.debug("=========== RESULT PAYMENT GATE REQUEST ===========");
        log.debug("isSuccess : [{}]", isSuccess);
        log.debug("resultCode : [{}]", resultCode);
        log.debug("resultMsg : [{}]", resultMsg);
        log.debug("authUrl : [{}]", authUrl);
        if (DeviceUtil.isNormal()) {
            log.debug("authToken : [{}]", authToken);
            log.debug("netCancelUrl : [{}]", netCancelUrl);
        } else {
            log.debug("tid : [{}]", tid);
            log.debug("price : [{}]", price);
        }
        log.debug("merchantData : [{}]", merchantData);
        log.debug("===================================================");
        resultMap.put("isSuccess", isSuccess);
        resultMap.put("resultCode", resultCode);
        resultMap.put("resultMsg", resultMsg);
        resultMap.put("authToken", authToken);
        resultMap.put("tid", tid);
        resultMap.put("authUrl", authUrl);
        resultMap.put("netCancelUrl", netCancelUrl);
        resultMap.put("merchantData", merchantData);
        String [] merchantDatas = merchantData.split("\\|");
        String apvReqIdx = merchantDatas[0];
        String ordMstIdx = merchantDatas[1];
        resultMap.put("ordMstIdx", ordMstIdx);
        if (isSuccess) {
            Map<String, Object> data = new HashMap<>();
            data.put("APV_REQ_IDX", apvReqIdx);
            data.put("ORD_MST_IDX", ordMstIdx);
            SessionsPaymentGate.setSessionPaymentGate(data);
        }
        return resultMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : getIniPayApvPcResultMap
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 승인요청 결과 반환 (PC)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private Map<String, Object> getIniPayApvPcResultMap(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        Map<String, Object> info = this.selectIniPayReqResultInfo();
        //###############################################
        // 1. 전문 필드 값 설정
        //###############################################
        String mid = this.mid; // 상점 ID
        String buyername = StringUtil.getString(info, "P_UNAME"); // 구매자 명
        String price = StringUtil.getString(info, "P_AMT"); // 상품가격(특수기호 제외)
        String timestamp = SignatureUtil.getTimestamp(); // 타임스탬프(util에 의해서 자동생성)
        String charset = this.charset; // 인코딩
        String format = this.format; // 리턴형식
        String authToken = StringUtil.getString(info, "AUTHTOKEN"); // TID
        String authUrl  = StringUtil.getString(info, "AUTHURL"); // 승인요청 API url
        String netCancel= StringUtil.getString(info, "NETCANCELURL"); // 망취소 API url
        //###############################################
        // 2. signature 생성
        //###############################################
        Map<String, String> signParam = new HashMap<String, String>();
        signParam.put("authToken", authToken);     // 필수
        signParam.put("timestamp", timestamp);     // 필수
        // signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
        String signature = SignatureUtil.makeSignature(signParam);
        //###############################################
        // 3.API 요청 전문 생성
        //###############################################
        Map<String, String> authMap = new Hashtable<String, String>();
        authMap.put("mid", mid);                // 필수
        authMap.put("authToken", authToken);    // 필수
        authMap.put("signature", signature);    // 필수
        authMap.put("timestamp", timestamp);    // 필수
        authMap.put("charset", charset);        // default=UTF-8
        authMap.put("format", format);          // default=XML
        authMap.put("price", price);            // 가격위변조체크기능 (선택사용)

        HttpUtil httpUtil = new HttpUtil();
        try {
            //###############################################
            // 4. API 통신 시작
            //###############################################
            String authResultString = "";
            authResultString = httpUtil.processHTTP(authMap, authUrl);
            //###############################################
            // 5. API 통신결과 처리
            //###############################################
            Map<String, String> resultMap = this.parseStringToMap(authResultString);
            if (log.isDebugEnabled()) {
                log.debug("=========== RESULT PAYMENT GATE API ===========");
                for (String key : resultMap.keySet()) {
                    log.debug("{} : [{}]", key, StringUtil.getString(resultMap, key));
                }
                log.debug("===============================================");
            }
            
            /*************************  결제보안 강화  START ****************************/ 
            Map<String , String> secureMap = new HashMap<>();
            secureMap.put("mid", mid); // mid
            secureMap.put("tstamp", timestamp); // timestemp
            secureMap.put("MOID", resultMap.get("MOID")); // MOID
            secureMap.put("TotPrice", resultMap.get("TotPrice")); // TotPrice
            
            // signature 데이터 생성 
            String secureSignature = SignatureUtil.makeSignatureAuth(secureMap);
            String resultCode = StringUtil.getString(resultMap, "resultCode", PaymentGate.RESULT.UNKNOWN.getCode());
            String resultMsg = StringUtil.getString(resultMap, "resultMsg");
            
            PaymentGate.RESULT result = PaymentGate.RESULT.getResult(resultCode);
            boolean isSuccess = result.isSuccess();
            returnMap.put("isSuccess", isSuccess);
            returnMap.put("PAY_MST_AGT", DeviceUtil.getDeviceChar());
            returnMap.put("P_STATUS", resultCode); // 결과 코드
            returnMap.put("P_RMESG1", resultMsg); // 결과 메시지
            returnMap.put("P_MID", mid); // 상점 ID
            returnMap.put("P_OID", StringUtil.getString(resultMap, "MOID", "")); // 주문 번호
            returnMap.put("P_TID", StringUtil.getString(resultMap, "tid", "")); // 거래 번호
            returnMap.put("P_AMT", StringUtil.getString(resultMap, "TotPrice", "")); // 결제완료금액
            returnMap.put("P_UNAME", buyername);
            returnMap.put("P_MNAME", this.mname);
            returnMap.put("CURRENCY", this.currency); // 통화 구분
            returnMap.put("P_TYPE", StringUtil.getString(resultMap, "payMethod", "")); // 결제방법(지불수단)
            returnMap.put("P_AUTH_DT", StringUtil.getString(resultMap, "applDate", "") + StringUtil.getString(resultMap, "applTime", "")); // 승인일시
            int quota = StringUtil.getInt(resultMap, "CARD_Quota");
            String eventCode = StringUtil.getString(resultMap, "EventCode");
            String cardInterest = StringUtil.getString(resultMap, "CARD_Interest");
           
            returnMap.put("P_CARD_NUM", StringUtil.getString(resultMap, "CARD_Num", "")); // 카드번호
            returnMap.put("P_FN_CD1", StringUtil.getString(resultMap, "CARD_Code", "")); // 카드 종류
            returnMap.put("P_CARD_ISSUER_CODE", StringUtil.getString(resultMap, "CARD_BankCode", "")); // 카드 발급사
            returnMap.put("P_AUTH_NO", StringUtil.getString(resultMap, "applNum", "")); // 승인번호
            returnMap.put("P_RMESG2", StringUtil.getString(resultMap, "CARD_Quota", "")); // 할부기간
            if ("1".equals(cardInterest) || "1".equals(eventCode)) {
                returnMap.put("P_CARD_INTEREST", "1"); // 무이자할부여부 (무이자)
            } else if(quota > 0 && !"1".equals(eventCode)) {
                returnMap.put("P_CARD_INTEREST", "0"); // 무이자할부여부 (일반)
            }
            resultMap.put("P_CARD_PRTC_CODE", StringUtil.getString(resultMap, "CARD_PRTC_CODE", "")); // 부분취소 가능여부 (1:가능, 0:불가능)
            if (!"".equals(eventCode)) {
                returnMap.put("EVENTCODE", eventCode); // 이벤트 코드
            }
            returnMap.put("BUYEREMAIL", StringUtil.getString(resultMap, "buyerEmail", "")); // 구매자Email
            returnMap.put("CUSTEMAIL", StringUtil.getString(resultMap, "custEmail", "")); // 최종Email
            returnMap.put("BUYERTEL", StringUtil.getString(resultMap, "custEmail", "")); // 구매자 휴대폰번호
            returnMap.put("PAY_MST_REG_IP", IPUtil.getClientIP());
            if (isSuccess && !secureSignature.equals(StringUtil.getString(resultMap, "authSignature"))) {
                // 망취소
                throw new RuntimeException("E999");
            }
        } catch (RuntimeException e) {
            if (log.isDebugEnabled()) {
                e.printStackTrace();
            } else {
                log.error(Arrays.toString(e.getStackTrace()));
            }
            //###############################################
            // 망취소 API
            //###############################################
            returnMap.put("isSuccess", false);
            Map<String, String> resultMap = this.parseStringToMap(httpUtil.processHTTP(authMap, netCancel)); // 망취소 요청 API url(고정, 임의 세팅 금지)
            returnMap.put("PAY_MST_AGT", DeviceUtil.getDeviceChar());
            returnMap.put("P_STATUS", StringUtil.getString(resultMap, "resultCode"));
            returnMap.put("P_RMESG1", StringUtil.getString(resultMap, "resultMsg"));
            returnMap.put("P_TID", StringUtil.getString(resultMap, "tid"));
            returnMap.put("P_TYPE", StringUtil.getString(resultMap, "selectPayMethod"));
            returnMap.put("P_MID", StringUtil.getString(resultMap, "mid"));
            returnMap.put("P_OID", StringUtil.getString(resultMap, "MOID"));
            returnMap.put("P_AMT", price);
            returnMap.put("P_UNAME", buyername);
            returnMap.put("P_MNAME", this.mname);
            returnMap.put("PAY_MST_REG_IP", IPUtil.getClientIP());
            String error = e.getMessage();
            if ("E999".equals(error)) {
                returnMap.put("P_RMESG2", "데이터 위변조 체크 실패");
            }
        }
        SessionsPaymentGate.setSessionPaymentGateClear();
        return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : getIniPayApvMbResultMap
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 승인 요청 결과 반환 (MOBILE)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private Map<String, Object> getIniPayApvMbResultMap(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> info = this.selectIniPayReqResultInfo();
        String mid = this.mid; // 상점 ID
        String tid = StringUtil.getString(info, "P_TID"); // 인증거래번호
        String reqUrl = StringUtil.getString(info, "P_REQ_URL"); // 인증 요청 url
        Map<String, Object> headers = new HashMap<>();
        headers.put("Accept-Charset", this.acceptCharset);
        headers.put("Content-Type", this.contentType);
        Map<String, Object> params = new HashMap<>();
        params.put("P_MID", mid);
        params.put("P_TID", tid);
        Map<String, Object> resultMap = new HashMap<>();
        try {
            resultMap = HttpConnectionUtil.excute(reqUrl, HttpMethod.POST, headers, params, this.acceptCharset, String.class);
        } catch (Exception e) {
            if (log.isDebugEnabled()) {
                e.printStackTrace();
            } else {
                Arrays.toString(e.getStackTrace());
            }
            info.put("MSG", "가맹점 오류 자동 취소");
            this.insertIniPayCnlReq(info);
        }
        log.debug("resultMap : [{}]", resultMap);
        String resultCode = StringUtil.getString(resultMap, "P_STATUS", PaymentGate.RESULT.UNKNOWN.getCode());
        PaymentGate.RESULT result = PaymentGate.RESULT.getResult(resultCode);
        resultMap.put("isSuccess", result.isSuccess());
        resultMap.put("PAY_MST_AGT", DeviceUtil.getDeviceChar());
        resultMap.put("PAY_MST_REG_IP", IPUtil.getClientIP());
        resultMap.putAll(resultMap);
        return resultMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : getIniPayCnlReqMap
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 취소 요청 데이터 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private Map<String, Object> getIniPayCnlReqMap(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> info = this.selectIniPayApvInfo(commandMap);
        String oid = StringUtil.getString(info, "P_OID"); // 상점 주문번호
        String payMstIdx = StringUtil.getString(info, "PAY_MST_IDX"); // payment gate key
        String type = this.refundType; // "Refund" 고정
        String paymethod = StringUtil.getString(info, "P_TYPE"); // 지불수단 코드
        String timestamp = DateUtil.getCurrentDateTime(); // 전문생성시간(YYYYMMDDhhmmss)
        String clientIp = IPUtil.getServerIP(); // 요청 서버IP
        String mid = StringUtil.getString(info, "P_MID"); // 가맹점 ID
        String tid = StringUtil.getString(info, "P_TID"); // 취소요청 TID
        String msg = StringUtil.getString(commandMap, "MSG"); // 취소요청사유
        String hashData = SignatureUtil.hash((this.refundKey + type + paymethod + timestamp + clientIp + mid + tid), "SHA-512"); // 전문위변조 HASH
        log.debug("hashData : [{}]", hashData);
        log.debug("this.refundKey : [{}]", this.refundKey);
        Map<String, Object> params = new HashMap<>();
        params.put("oid", oid);
        params.put("payMstIdx", payMstIdx);
        params.put("type", type);
        params.put("paymethod", paymethod);
        params.put("timestamp", timestamp);
        params.put("clientIp", clientIp);
        params.put("mid", mid);
        params.put("tid", tid);
        params.put("msg", msg);
        params.put("hashData", hashData);
        
        return params;
    }
    
    /**
     * <pre>
     * 1. MethodName : getIniPayCnlReqResultMap
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 취소 요청 결과 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param params
     * @return
     * @throws Exception
     */
    private Map<String, Object> getIniPayCnlReqResultMap(Map<String, Object> params) throws Exception {
        Map<String, Object> headers = new HashMap<>();
        headers.put("Accept-Charset", this.acceptCharset);
        headers.put("Content-Type", this.contentType);
        Map<String, Object> resultMap = new HashMap<>();
        try {
            resultMap = HttpConnectionUtil.excute(this.refundUrl, HttpMethod.POST, headers, params, this.charset, JSONObject.class);
        } catch (Exception e) {
            if (log.isDebugEnabled()) {
                e.printStackTrace();
            } else {
                Arrays.toString(e.getStackTrace());
            }
        }
        log.debug("resultMap : [{}]", resultMap);
        String resultCode = StringUtil.getString(resultMap, "resultCode", PaymentGate.RESULT.UNKNOWN.getCode());
        PaymentGate.RESULT result = PaymentGate.RESULT.getResult(resultCode);
        resultMap.put("isSuccess", result.isSuccess());
        return resultMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectIniPayApvInfo
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 승인 결과 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @see web.pg.service.IniPayService#selectIniPayApvInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectIniPayApvInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("IniPay.selectIniPayApvInfo", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : insertIniPayReq
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 인증 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @see web.pg.service.IniPayService#insertIniPayReq(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> insertIniPayReq(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> params = this.getIniPayParamMap(commandMap);
        Map<String, Object> reqMap = this.getIniPayReqMap(params);
        Map<String, Object> data = new HashMap<>();
        data.put("APV_REQ_IDX", StringUtil.getString(params, "apvReqIdx"));
        data.put("P_INI_PAYMENT", this.paymethod);
        data.put("P_MID", this.mid);
        data.put("P_OID", StringUtil.getString(params, "oid"));
        data.put("P_AMT", StringUtil.getString(params, "price"));
        data.put("P_UNAME", StringUtil.getString(params, "buyername"));
        data.put("P_MNAME", this.mname);
        data.put("P_NOTI", StringUtil.getString(params, "merchantData"));
        data.put("P_GOODS", StringUtil.getString(params, "goodname"));
        data.put("P_MOBILE", StringUtil.getString(params, "buyertel"));
        data.put("P_EMAIL", StringUtil.getString(params, "buyeremail"));
        data.put("P_QUOTABASE", StringUtil.getString(params, "quotabase"));
        data.put("P_CHARSET", this.charset);
        data.put("VERSION", this.version);
        data.put("CURRENCY", this.currency);
        data.put("TIMESTAMP", StringUtil.getString(params, "timestamp"));
        data.put("SIGNATURE", StringUtil.getString(params, "signature"));
        data.put("MKEY", StringUtil.getString(params, "mKey"));
        data.put("APV_REQ_AGT", DeviceUtil.getDeviceChar());
        data.put("APV_REQ_REG_IP", IPUtil.getClientIP());
        this.defaultDAO.insert("IniPay.insertIniPayReq", data);
        return reqMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : insertIniPayReqResult
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 인증요청 결과
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @see web.pg.service.IniPayService#insertIniPayReqResult(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> insertIniPayReqResult(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> resultMap = getIniPayReqResultMap(commandMap);
        Map<String, Object> data = new HashMap<>();
        String [] merchantDatas = StringUtil.getString(resultMap, "merchantData").split("\\|");
        data.put("APV_REQ_IDX", merchantDatas[0]);
        data.put("P_OID", merchantDatas[1]);
        data.put("P_STATUS", StringUtil.getString(resultMap, "resultCode"));
        data.put("P_RMESG1", StringUtil.getString(resultMap, "resultMsg"));
        if (DeviceUtil.isNormal()) {
            data.put("AUTHTOKEN", StringUtil.getString(resultMap, "authToken"));
            data.put("AUTHURL", StringUtil.getString(resultMap, "authUrl"));
            data.put("NETCANCELURL", StringUtil.getString(resultMap, "netCancelUrl"));
        } else {
            data.put("P_TID", StringUtil.getString(resultMap, "tid"));
            data.put("P_AMT", StringUtil.getString(resultMap, "price"));
            data.put("P_REQ_URL", StringUtil.getString(resultMap, "authUrl"));
        }
        data.put("P_NOTI", StringUtil.getString(resultMap, "merchantData"));
        data.put("APV_RET_REG_IP", IPUtil.getClientIP());
        
        this.defaultDAO.insert("IniPay.insertIniPayReqResult", data);
        return resultMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : insertIniPayApv
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 승인 요청 / 결과
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @see web.pg.service.IniPayService#insertIniPayApv(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> insertIniPayApv(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        Map<String, Object> data = new HashMap<>();
        if (DeviceUtil.isNormal()) {
            data = this.getIniPayApvPcResultMap(commandMap);
        } else {
            data = this.getIniPayApvMbResultMap(commandMap);
        }
        result += this.defaultDAO.insert("IniPay.insertIniPayApv", data);
        boolean isSuccess = (boolean) data.get("isSuccess");
        if (isSuccess && result > 0) {
            this.defaultDAO.insert("IniPay.insertIniPayMaster", data);
        }
        SessionsPaymentGate.setSessionPaymentGateClear();
        return data;
    }
    
    /**
     * <pre>
     * 1. MethodName : insertIniPayCnlReq
     * 2. ClassName  : IniPayServiceImpl.java
     * 3. Comment    : 프론트 > Payment Gate > 취소 요청 / 결과
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @see web.pg.service.IniPayService#insertIniPayCnlReq(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> insertIniPayCnlReq(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("isSuccess", false);
        Map<String, Object> params = this.getIniPayCnlReqMap(commandMap);
        params.put("CNL_REQ_REG_IP", IPUtil.getClientIP());
        int result = this.defaultDAO.insert("IniPay.insertIniPayCnlReq", params);
        if (result > 0) {
            Map<String, Object> data = this.getIniPayCnlReqResultMap(params);
            data.put("CNL_REQ_IDX", StringUtil.getString(params, "CNL_REQ_IDX"));
            data.put("CNL_RET_REG_IP", IPUtil.getClientIP());
            this.defaultDAO.insert("IniPay.insertIniPayCnlReqResult", data);
            if ((boolean) data.get("isSuccess")) {
                this.defaultDAO.update("IniPay.updateIniPayMaster", params);
            }
            returnMap.putAll(data);
        }
        return returnMap;
    }
}
