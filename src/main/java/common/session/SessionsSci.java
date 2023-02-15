package common.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.model.Request;
import common.util.StringUtil;
import lombok.extern.log4j.Log4j2;

/**
 * <pre>
 * @PackageName: common.session
 * @FileName : SessionsSci.java
 * @Date : 2020. 5. 14.
 * @프로그램 설명 : 본인 인증 세션을 관리하는 Class
 * @author upleat
 * </pre>
 */

@Log4j2
public class SessionsSci {

    private static final String SESSION_REQ_NUM_NM = "__SESSION_SCI_REQ_NUM_NM__";
    private static final String SESSION_SRV_NO_NM = "__SESSION_SCI_SRV_NO_NM__";
    
    /**
     * <pre>
     * 1. MethodName : getSession
     * 2. ClassName  : SessionsSci.java
     * 3. Comment    : 세션 객체를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @return
     */
    private static HttpSession getSession() {
        HttpServletRequest request = Request.getCurrentRequest();
        log.info("SESSION ID : [{}]", request.getSession().getId());
        return request.getSession();
    }
    
    /**
     * <pre>
     * 1. MethodName : setSessionSciReqNum
     * 2. ClassName  : SessionsSci.java
     * 3. Comment    : 요청 번호를 세션에 저장한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param reqNum
     */
    public static void setSessionSciReqNum(String reqNum) {
        getSession().setAttribute(SESSION_REQ_NUM_NM, reqNum);
    }
    /**
     * <pre>
     * 1. MethodName : setSessionSciSrvNo
     * 2. ClassName  : SessionsSci.java
     * 3. Comment    : 서비스 번호를 세션에 저장한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param srvNo
     */
    public static void setSessionSciSrvNo(String srvNo) {
        getSession().setAttribute(SESSION_SRV_NO_NM, srvNo);
    }
    
    /**
     * <pre>
     * 1. MethodName : getSessionSciReqNum
     * 2. ClassName  : SessionsSci.java
     * 3. Comment    : 요청번호를 세션에서 가져온다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param reqNum
     * @return
     */
    public static String getSessionSciReqNum() {
        return StringUtil.getString(getSession().getAttribute(SESSION_REQ_NUM_NM));
    }
    /**
     * <pre>
     * 1. MethodName : getSessionSciSrvNo
     * 2. ClassName  : SessionsSci.java
     * 3. Comment    : 서비스번호를 세션에서 가져온다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @return
     */
    public static String getSessionSciSrvNo() {
        return StringUtil.getString(getSession().getAttribute(SESSION_SRV_NO_NM));
    }
    
    /**
     * <pre>
     * 1. MethodName : setSessionSciReqNumClear
     * 2. ClassName  : SessionsSci.java
     * 3. Comment    : 세션에 담긴 요청번호를 초기화 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     */
    public static void setSessionSciReqNumClear() {
        getSession().setAttribute(SESSION_REQ_NUM_NM, null);
    }
    /**
     * <pre>
     * 1. MethodName : setSessionSciSrvNoClear
     * 2. ClassName  : SessionsSci.java
     * 3. Comment    : 세션에 담긴 서비스번호를 초기화 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     */
    public static void setSessionSciSrvNoClear() {
        getSession().setAttribute(SESSION_SRV_NO_NM, null);
    }
    
}