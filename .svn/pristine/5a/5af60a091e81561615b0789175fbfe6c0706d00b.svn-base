package common.session;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.model.Request;
import common.util.StringUtil;

public class SessionsContract {

    private static final String SESSION_CONTRACT_DATA_NM = "__SESSION_CONTRACT_DATA_NM__";
    
    /**
     * <pre>
     * 1. MethodName : getSession
     * 2. ClassName  : SessionsContract.java
     * 3. Comment    : 세션 객체를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @return
     */
    private static HttpSession getSession() {
        HttpServletRequest request = Request.getCurrentRequest();
        return request.getSession();
    }
    
    /**
     * <pre>
     * 1. MethodName : isExists
     * 2. ClassName  : SessionsContract.java
     * 3. Comment    : 세션에 특정 데이터가 담겨 있는지 여부를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 29.
     * </pre>
     *
     * @param key
     * @return
     */
    public static boolean isExists (String key) {
        boolean isExists = false;
        Map<String, Object> data = getSessionContractData();
        if (data.get(key) != null) {
            if (data.get(key).getClass().isArray()) {
                isExists = (StringUtil.getArray(data, key).length > 0);
            } else {
                isExists = !("".equals(StringUtil.getString(data, key, "")));
            }
        }
        return isExists;
    }
    
    /**
     * <pre>
     * 1. MethodName : setSessionContractData
     * 2. ClassName  : SessionsContract.java
     * 3. Comment    : 세션에 데이터를 저장한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 29.
     * </pre>
     *
     * @param commandMap
     */
    public static void setSessionContractData(Map<String, Object> commandMap) {
        getSession().setAttribute(SESSION_CONTRACT_DATA_NM, commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : setSessionContractAddData
     * 2. ClassName  : SessionsContract.java
     * 3. Comment    : 세션에 데이터를 추가 저장한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 29.
     * </pre>
     *
     * @param commandMap
     */
    public static void setSessionContractAddData(Map<String, Object> commandMap) {
        Map<String, Object> data = getSessionContractData();
        
        String [] colArray = {"MAIN_CONTRACT", "INSPL_MEM_NM", "INSPL_CELL", "INSPL_ZIP", "INSPL_ADDR", "INSPL_ADDR2", "ORD_MST_VDR_BNF_ID", "PRD_OPT_IDXs", "MEM_AGR_TRM_CD"};
        List<String> colList = Arrays.asList(colArray);
        for (String key : commandMap.keySet()) {
            if (colList.contains(key)) {
                data.put(key, StringUtil.getArray(commandMap, key));
            } else {
                data.put(key, StringUtil.getString(commandMap, key));
            }
        }
        setSessionContractData(data);
    }
    
    /**
     * <pre>
     * 1. MethodName : getSessionContractData
     * 2. ClassName  : SessionsContract.java
     * 3. Comment    : 세션에 담긴 데이터를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 29.
     * </pre>
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> getSessionContractData() {
        Map<String, Object> returnMap = (Map<String, Object>) getSession().getAttribute(SESSION_CONTRACT_DATA_NM);
        if (returnMap != null) {
            return returnMap;
        } else {
            return new HashMap<>();
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : setSessionContractDataClear
     * 2. ClassName  : SessionsContract.java
     * 3. Comment    : 세션에 담긴 데이터를 초기화 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 29.
     * </pre>
     *
     */
    public static void setSessionContractDataClear() {
        getSession().setAttribute(SESSION_CONTRACT_DATA_NM, null);
    }
}
