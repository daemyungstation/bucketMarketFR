package common.session;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.model.Request;
import common.model.Utm;
import lombok.extern.log4j.Log4j2;

/**
 * <pre>
 * &#64;PackageName: common.session
 * &#64;FileName : SessionsUtm.java
 * &#64;Date : 2021. 4. 01.
 * &#64;프로그램 설명 : utm 세션을 처리하는 Class
 * &#64;author inuscommunity
 * </pre>
 */
@Log4j2
public class SessionsUtm {

    private static final String UTM_INFO = "__UTM_INFO__";
    
    /**
     * <pre>
     * 1. MethodName : getSessionValue
     * 2. ClassName  : SessionUtm.java
     * 3. Comment    : 세션 정보 중 요청한 세션명에 대한 값만 반환한다. 
     * 4. 작성자       : inuscommunity
     * 5. 작성일       : 2021. 4. 1.
     * </pre>
     *
     * @param name
     * @return
     */
    public static String getSessionValue(String name) {
        if (getSessionUtmMap(Request.getCurrentRequest()) == null) {
            return "";
        } else {
            try {
                return String.valueOf(getSessionUtmMap(Request.getCurrentRequest()).get(name));
            } catch (Exception e) {
                return "";
            }
        }
    }
    
    
    /**
     * <pre>
     * 1. MethodName : setSessionUtmMap
     * 2. ClassName  : SessionUtm.java
     * 3. Comment    : UTM 정보를 세션에 저장한다. 
     * 4. 작성자       : inuscommunity
     * 5. 작성일       : 2021. 4. 1.
     * </pre>
     *
     * @param request
     * @param Map
     */
    public static void setSessionUtm(HttpServletRequest request, Utm utm) {
        HttpSession session = request.getSession();
        
        Map<String, Object> map = new HashMap<>();
        map.put("UTM_SOURCE", utm.getUTM_SOURCE());
        map.put("UTM_MEDIUM", utm.getUTM_MEDIUM());
        map.put("UTM_CAMPAIGN", utm.getUTM_CAMPAIGN());
        map.put("UTM_TERM", utm.getUTM_TERM());
        map.put("UTM_CONTENT", utm.getUTM_CONTENT());
        
        session.setAttribute(UTM_INFO, map);
    }

    /**
     * <pre>
     * 1. MethodName : setSessionClear
     * 2. ClassName  : SessionUtm.java
     * 3. Comment    : UTM 세션을 삭제한다. 
     * 4. 작성자       : inucommunity
     * 5. 작성일       : 2021. 4. 1.
     * </pre>
     *
     * @param request
     */
    public static void setSessionClear(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute(UTM_INFO, null);
    }

    /**
     * <pre>
     * 1. MethodName : getSessionMap
     * 2. ClassName  : SessionUtm.java
     * 3. Comment    : 세션에 담긴 정보를 Map 형태로 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @return
     */
    @SuppressWarnings("unchecked")
    private static Map<String, Object> getSessionUtmMap(HttpServletRequest request) {
        try {
            return (Map<String, Object>) request.getSession().getAttribute(UTM_INFO);
        } catch (Exception e) {
            return null;
        }

    }
}