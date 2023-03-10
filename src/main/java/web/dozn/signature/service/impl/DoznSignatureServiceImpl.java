package web.dozn.signature.service.impl;

import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.client.UnknownHttpStatusCodeException;

import common.dao.CommonDefaultDAO;
import common.model.User.ROLE_USER;
import common.session.SessionsDozn;
import common.session.SessionsUser;
import common.session.SessionsContract;

import common.util.JSONUtil;
import common.util.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.extern.log4j.Log4j2;
import net.sf.json.JSONObject;
import web.dozn.signature.model.DoznSignatureResult.RESULT;
import web.dozn.signature.model.DoznSignatureResult.SING_TYPE;
import web.dozn.signature.service.DoznSignatureService;

@Log4j2
@Service("doznSignatureService")
public class DoznSignatureServiceImpl implements DoznSignatureService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    @Value("#{signature['signature.expiration.time']}")
    private String expirationTime;
    
    @Value("#{signature['signature.title']}")
    private String title;
    
    @Value("#{signature['signature.message']}")
    private String message;
    
    @Value("#{signature['signature.callcenter.no']}")
    private String callcenterNo;
    
    @Value("#{signature['signature.callcenter.label']}")
    private String callcenterLabel;
    
    @Resource(name = "signaturePropertiesService")
    private EgovPropertyService properties;
    
    private static final String CHAR_SET = "UTF-8";
    
    private RestTemplate restTemplate = new RestTemplate();
    
    /**
     * <pre>
     * 1. MethodName : getRequestUrl
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : Request Header ????????? ????????????.
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @param type
     * @return
     * @throws Exception
     */
    private HttpHeaders getHeaders() throws Exception {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "x-www-form-urlencoded", Charset.forName(CHAR_SET)));
        headers.set("Authorization", getAccessToken());
        headers.set("Accept", "application/json");
        headers.set("Accept-Charset", CHAR_SET);
        log.info("headers : [{}]", headers.toString());
        return headers;
    }
    
    /**
     * <pre>
     * 1. MethodName : getRequestUrl
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : ?????? URL??? ????????????.
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @param type
     * @return
     * @throws Exception
     */
    private String getRequestUrl (String type) throws Exception {
        String requestUrl = properties.getString("signature.domain");
        requestUrl += properties.getString("signature.uri." + type);
        log.info("requestUrl : [{}]", requestUrl);
        return requestUrl;
    }
    
    /**
     * <pre>
     * 1. MethodName : getAccessToken
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : Oauth 2.0 ????????? ?????? Access Token ??? ????????????.
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @return
     */
    private String getAccessToken () {
        return "Bearer " + properties.getString("signature.accesstoken");
    }
    
    /**
     * <pre>
     * 1. MethodName : getAccessToken
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : ???????????? ????????????.
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @return
     */
    private JSONObject getData (JSONObject responseBody) {
        JSONObject result = (JSONObject) responseBody.get("data");
        if (result != null) {
            return result;
        } else {
            return responseBody;
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : getRequestBody
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : Request Body ????????? ????????????.
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @param params
     * @return
     * @throws Exception
     */
    private String getRequestBody (Map<String, Object> params) throws Exception {
        String requestBody = "";
        int i = 0;
        for (String key : params.keySet()) {
            requestBody += (i > 0) ? "&" : "";
            requestBody += key;
            requestBody += "=";
            requestBody += URLEncoder.encode(StringUtil.getString(params, key, ""), CHAR_SET);
            i++;
            log.info(key + " : [{}]", StringUtil.getString(params, key, ""));
        }
        log.info("requestBody : [{}]", requestBody);
        return requestBody;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectDoznSignatureTokenStr
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : ????????? > ????????? ???????????? > ?????? ??? ??????/??????
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private String selectDoznSignatureTokenStr (Map<String, Object> commandMap) throws Exception {
        String token = defaultDAO.selectStr("DoznSignature.selectDoznSignatureKeyStr", commandMap);
        SessionsDozn.setSessionDoznToken(token);
        return token;
    }
    /**
     * <pre>
     * 1. MethodName : selectDoznSignatureTxIdStr
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : ????????? > ????????? ???????????? > ???????????? ??????
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private String selectDoznSignatureTxIdStr (Map<String, Object> commandMap) throws Exception {
        commandMap.put("kko_sign_idx", SessionsDozn.getSessionDoznToken());
        return defaultDAO.selectStr("DoznSignature.selectDoznSignatureTxIdStr", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : insertDoznSignature
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : ????????? > ????????? ???????????? > ??????
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private int insertDoznSignature (Map<String, Object> commandMap) throws Exception {
        commandMap.put("kko_sign_idx", SessionsDozn.getSessionDoznToken());
        commandMap.put("ci_val", SessionsUser.getSessionValue("USER_CI"));
        return defaultDAO.insert("DoznSignature.insertDoznSignature", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updateDoznSignature
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : ????????? > ????????? ???????????? > ??????
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private int updateDoznSignature (Map<String, Object> commandMap) throws Exception {
        commandMap.put("kko_sign_idx", SessionsDozn.getSessionDoznToken());
        return defaultDAO.update("DoznSignature.updateDoznSignature", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : signRequest
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : ????????? > ????????? ???????????? > ??????
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> signRequest(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> params = new HashMap<>();
        
        Map<String, Object> contract = SessionsContract.getSessionContractData();
        String[] mainContract = StringUtil.getArray(contract, "MAIN_CONTRACT");
        String countTitle = "";
        if(mainContract.length > 1) {
            countTitle = " ("+ mainContract.length +"??????)";
        }
        
        if (SessionsUser.isLogin(ROLE_USER.contractor)) {
            params.put("ci", SessionsUser.getSessionValue("USER_CI"));
        } else {
            params.put("phone_no", StringUtil.getString(commandMap, "PHONE_NO", ""));
            params.put("name", StringUtil.getString(commandMap, "NAME", ""));
            params.put("birthday", StringUtil.getString(commandMap, "BIRTHDAY", ""));
        }
        params.put("token", this.selectDoznSignatureTokenStr(commandMap));
        params.put("expires_in", expirationTime);
        params.put("title", title + countTitle);
        params.put("message", message);
        params.put("call_center_no", callcenterNo);
        params.put("call_center_label", callcenterLabel);
        params.put("verify_auth_name", "Y");
        JSONObject responseBody = null;
        try {
            restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName(CHAR_SET)));
            responseBody = restTemplate.postForObject(this.getRequestUrl(SING_TYPE.REQUEST.getType()),
                    new HttpEntity<String>(this.getRequestBody(params), this.getHeaders()),
                    JSONObject.class);
        } catch (UnknownHttpStatusCodeException e) {
            responseBody = JSONUtil.convStringToJSONObject(e.getResponseBodyAsString());
        } catch (HttpStatusCodeException e) {
            responseBody = JSONUtil.convStringToJSONObject(e.getResponseBodyAsString());
        }
        log.info("REQUEST responseBody : [{}]", responseBody);
        Map<String, Object> resultMap = JSONUtil.convJSONObjectToMap(this.getData(responseBody));
        log.info("REQUEST resultMap : [{}]", resultMap);
        String resultCode = StringUtil.getString(resultMap, "result", StringUtil.getString(resultMap, "errcode", "U"));
        log.info("resultCode : [{}]", resultCode);
        RESULT result = RESULT.getResult(resultCode, SING_TYPE.REQUEST);
        boolean isSuccess = result.isSuccess();
        if (isSuccess) {
            this.insertDoznSignature(resultMap);
        }
        resultMap.put("isSuccess", isSuccess);
        resultMap.put("resultCode", result.getCode());
        resultMap.put("resultMessage", result.getMessage());
        return resultMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : signStatus
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : ????????? > ????????? ???????????? > ?????? ??????
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> signStatus(Map<String, Object> commandMap) throws Exception {
        JSONObject responseBody = null;
        try {
            restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName(CHAR_SET)));
            ResponseEntity<JSONObject> response = restTemplate.exchange(
                    this.getRequestUrl(SING_TYPE.STATUS.getType()),
                    HttpMethod.GET,
                    new HttpEntity<String>(this.getHeaders()),
                    JSONObject.class,
                    selectDoznSignatureTxIdStr(commandMap));
            responseBody = response.getBody();
        } catch (UnknownHttpStatusCodeException e) {
            responseBody = JSONUtil.convStringToJSONObject(e.getResponseBodyAsString());
        } catch (HttpStatusCodeException e) {
            responseBody = JSONUtil.convStringToJSONObject(e.getResponseBodyAsString());
        }
        log.info("STATUS responseBody : [{}]", responseBody);
        Map<String, Object> resultMap = JSONUtil.convJSONObjectToMap(this.getData(responseBody));
        
        String resultCode = StringUtil.getString(resultMap, "status", StringUtil.getString(resultMap, "errcode", "U"));
        RESULT result = RESULT.getResult(resultCode, SING_TYPE.STATUS);
        boolean isSuccess = result.isSuccess();
        String code = result.getCode();
        if ("PREPARE".equals(code) || "COMPLETE".equals(code) || "EXPIRED".equals(code) ) {
            this.updateDoznSignature(resultMap);
            if (isSuccess) {
                resultMap.putAll(signVerify(resultMap));
            }
        }
        resultMap.put("isSuccess", isSuccess);
        resultMap.put("resultCode", code);
        resultMap.put("resultMessage", result.getMessage());
        return resultMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : signVerify
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : ????????? > ????????? ???????????? > ?????? ??????
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 18.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    private Map<String, Object> signVerify(Map<String, Object> commandMap) throws Exception {
        JSONObject responseBody = null;
        try {
            restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName(CHAR_SET)));
            ResponseEntity<JSONObject> response = restTemplate.exchange(
                    this.getRequestUrl(SING_TYPE.VERIFY.getType()),
                    HttpMethod.GET,
                    new HttpEntity<String>(this.getHeaders()),
                    JSONObject.class,
                    selectDoznSignatureTxIdStr(commandMap));
            responseBody = response.getBody();
            
        } catch (UnknownHttpStatusCodeException e) {
            responseBody = JSONUtil.convStringToJSONObject(e.getResponseBodyAsString());
        } catch (HttpStatusCodeException e) {
            responseBody = JSONUtil.convStringToJSONObject(e.getResponseBodyAsString());
        }
        log.info("VERIFY responseBody : [{}]", responseBody);
        Map<String, Object> resultMap = JSONUtil.convJSONObjectToMap(this.getData(responseBody));
        
        String signedData = StringUtil.getString(resultMap, "signed_data", "");
        boolean isSuccess = !("".equals(signedData));
        resultMap.put("isSuccess", isSuccess);
        if (isSuccess) {
            this.updateDoznSignature(resultMap);
            SessionsDozn.setSessionDoznTokenClear();
        } else {
            String resultCode = StringUtil.getString(resultMap, "errcode", "U");
            RESULT result = RESULT.getResult(resultCode, SING_TYPE.VERIFY);
            resultMap.put("resultCode", result.getCode());
            resultMap.put("resultMessage", result.getMessage());
        }
        return resultMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectDoznSignatureValidCount
     * 2. ClassName  : DoznSignatureServiceImpl.java
     * 3. Comment    : ????????? > ????????? ???????????? > ?????? ?????? ??????
     * 4. ?????????       : upleat
     * 5. ?????????       : 2020. 5. 29.
     * </pre>
     *
     * @see web.dozn.signature.service.DoznSignatureService#selectDoznSignatureValidCount()
     * @return
     * @throws Exception
     */
    public int selectDoznSignatureValidCount() throws Exception {
        return defaultDAO.selectCount("DoznSignature.selectDoznSignatureValidCount", null);
    }
}