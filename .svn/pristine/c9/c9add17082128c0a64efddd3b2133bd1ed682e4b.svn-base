package common.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.model.Request;
import common.util.StringUtil;

/**
 * <pre>
 * @PackageName: common.session
 * @FileName : SessionsDozn.java
 * @Date : 2020. 5. 14.
 * @프로그램 설명 : 본인 인증 세션을 관리하는 Class
 * @author upleat
 * </pre>
 */
public class SessionsDozn {

    private static final String SESSION_TOEKN_NM = "__SESSION_DOZN_TOKEN_NM__";
    
    /**
     * <pre>
     * 1. MethodName : getSession
     * 2. ClassName  : SessionsDozn.java
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
     * 1. MethodName : setSessionDoznToken
     * 2. ClassName  : SessionsDozn.java
     * 3. Comment    : 요청 번호를 세션에 저장한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param reqNum
     */
    public static void setSessionDoznToken(String doznToken) {
        getSession().setAttribute(SESSION_TOEKN_NM, doznToken);
    }
    
    /**
     * <pre>
     * 1. MethodName : getSessionDoznToken
     * 2. ClassName  : SessionsDozn.java
     * 3. Comment    : 요청번호를 세션에서 가져온다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param reqNum
     * @return
     */
    public static String getSessionDoznToken() {
        return StringUtil.getString(getSession().getAttribute(SESSION_TOEKN_NM));
    }
    
    /**
     * <pre>
     * 1. MethodName : setSessionDoznTokenClear
     * 2. ClassName  : SessionsDozn.java
     * 3. Comment    : 세션에 담긴 요청번호를 초기화 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     */
    public static void setSessionDoznTokenClear() {
        getSession().setAttribute(SESSION_TOEKN_NM, null);
    }
}