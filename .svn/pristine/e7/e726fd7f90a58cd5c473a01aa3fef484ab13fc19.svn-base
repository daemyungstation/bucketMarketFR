package common.session;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import common.model.OneSelfCheck;
import common.model.Planner;
import common.model.Planner.ROLE_PLANNER;
import common.model.Request;
import common.util.StringUtil;
import lombok.extern.log4j.Log4j2;

/**
 * <pre>
 * &#64;PackageName: common.session
 * &#64;FileName : SessionsUser.java
 * &#64;Date : 2020. 4. 29.
 * &#64;프로그램 설명 : 레디플래너 세션을 처리하는 Class
 * &#64;author upleat
 * </pre>
 */
@Log4j2
public class SessionsPlanner {

    // 본인확인 정보
    private static final String ONE_SELF_OBJECT = "__ONE_SELF_OBJECT__";

    // 레디플래너 플래너
    private static final String PLANNER_OBJECT = "__PLANNER_OBJECT__";
    private static final String PLANNER_INFO = "__PLANNER_INFO__";
    // 플래너 비밀번호 변경 확인을 위한 값
    private static final String PLANNER_PASSWORD_CHANGE_INFO = "__PLANNER_PASSWORD_CHANGE_INFO__";
    // 플래너 프로필 수정 시 비밀번호 입력 확인을 위한 값
    private static final String PLANNER_PROFILE_PASSWORD_CHECK_INFO = "__PLANNER_PROFILE_PASSWORD_CHECK_INFO__";

    /**
     * <pre>
     * 1. MethodName : getSessionValue
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 세션 정보 중 요청한 세션명에 대한 값만 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param name
     * @return
     */
    public static String getSessionValue(String name) {
        return getSessionValue(Request.getCurrentRequest(), name);
    }

    /**
     * <pre>
     * 1. MethodName : getSessionValue
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 세션 정보 중 요청한 세션명에 대한 값만 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param name
     * @return
     */
    public static String getSessionValue(HttpServletRequest request, String name) {
        if (getSessionsPlannerMap(request) == null) {
            return "";
        } else {
            try {
                return String.valueOf(getSessionsPlannerMap(request).get(name));
            } catch (Exception e) {
                return "";
            }
        }
    }

    /**
     * <pre>
     * 1. MethodName : setSessionsPlannerMap
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 플래너 정보를 세션에 저장한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param Map
     */
    private static void setSessionsPlannerMap(HttpServletRequest request, Map<String, Object> map) {
        HttpSession session = request.getSession();
        session.setAttribute(PLANNER_INFO, map);
    }

    /**
     * <pre>
     * 1. MethodName : setSessionsPlanner
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 플래너 정보를 세션에 저장한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param Map
     */
    public static void setSessionPlanner(HttpServletRequest request, Planner planner) {
        HttpSession session = request.getSession();
        session.setAttribute(PLANNER_OBJECT, planner);
        Map<String, Object> map = new HashMap<>();
        map.put("RDP_MST_IDX", planner.getRDP_MST_IDX());
        map.put("RDP_MST_NO", planner.getRDP_MST_NO());
        map.put("RDP_MST_ID", planner.getRDP_MST_ID());
        map.put("RDP_MST_MEM_NM", planner.getRDP_MST_MEM_NM());
        map.put("RDP_MST_BUSI_CLS", planner.getRDP_MST_BUSI_CLS());
        map.put("RDP_MST_DM_NO", planner.getRDP_MST_DM_NO());
        map.put("RDP_MST_DM_YN", planner.getRDP_MST_DM_YN());
        map.put("RDP_MST_MAIL", planner.getRDP_MST_MAIL());
        map.put("RDP_MST_HP1", planner.getRDP_MST_HP1());
        map.put("RDP_MST_HP2", planner.getRDP_MST_HP2());
        map.put("RDP_MST_HP3", planner.getRDP_MST_HP3());
        map.put("RDP_MST_CI", planner.getRDP_MST_CI());
        map.put("RDP_MST_PROFILE_IMAGE", planner.getRDP_MST_PROFILE_IMAGE());
        setSessionsPlannerMap(request, map);
    }

    /**
     * <pre>
     * 1. MethodName : setSessionClear
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 세션을 삭제한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     */
    public static void setSessionClear(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute(PLANNER_OBJECT, null);
        session.setAttribute(PLANNER_INFO, null);
    }

    /**
     * <pre>
     * 1. MethodName : getSessionMap
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 세션에 담긴 정보를 Map 형태로 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @return
     */
    @SuppressWarnings("unchecked")
    private static Map<String, Object> getSessionsPlannerMap(HttpServletRequest request) {
        try {
            if (getSessionPlanner(request) == null) {
                return null;
            }
            return (Map<String, Object>) request.getSession().getAttribute(PLANNER_INFO);
        } catch (Exception e) {
            return null;
        }

    }

    /**
     * <pre>
     * 1. MethodName : getSessionsPlanner
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 플래너 세션 정보를 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @return
     */
    public static Planner getSessionPlanner(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            Planner planner = (Planner) session.getAttribute(PLANNER_OBJECT);
            if (planner == null) {
                return new Planner();
            } else {
                return planner;
            }

        } catch (Exception e) {
            log.error(Arrays.toString(e.getStackTrace()));
            return new Planner();
        }
    }

    /**
     * <pre>
     * 1. MethodName : isLogin
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 로그인 유무를 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @return
     */
    public static boolean isLogin(ROLE_PLANNER type) {
        HttpServletRequest request = Request.getCurrentRequest();
        Planner planner = getSessionPlanner(request);
        boolean isLogin = false;
        switch (type) {
        case planner:
            isLogin = !"".equals(StringUtil.getString(planner.getRDP_MST_IDX(), ""));
            break;
        case guest:
            break;
        default:
            break;
        }
        return isLogin;
    }

    /**
     * <pre>
     * 1. MethodName : getPasswordChange
     * 2. ClassName  : SessionsUser.java
     * 3. Comment    : 비밀번호 변경 정보 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     * @param id
     * @return
     */
    public static String getPasswordChange(HttpServletRequest request) {
        return StringUtil.getString(request.getSession().getAttribute(PLANNER_PASSWORD_CHANGE_INFO), "");
    }

    /**
     * <pre>
     * 1. MethodName : setPasswordChange
     * 2. ClassName  : SessionsUser.java
     * 3. Comment    : 비밀번호 변경 정보 저장
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     * @param RDP_MST_NO
     */
    public static void setPasswordChange(HttpServletRequest request, String plannerId) {
        request.getSession().setAttribute(PLANNER_PASSWORD_CHANGE_INFO, plannerId);
    }

    /**
     * <pre>
     * 1. MethodName : clearPasswordChange
     * 2. ClassName  : SessionsUser.java
     * 3. Comment    : 비밀번호 변경 정보 삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     */
    public static void clearPasswordChange(HttpServletRequest request) {
        request.getSession().setAttribute(PLANNER_PASSWORD_CHANGE_INFO, null);
    }

    /**
     * <pre>
     * 1. MethodName : setProfilePasswordCheck
     * 2. ClassName  : SessionsUser.java
     * 3. Comment    : 프로필 비밀번호 확인 여부
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     * @param RDP_MST_NO
     */
    public static void setProfilePasswordCheck(HttpServletRequest request) {
        request.getSession().setAttribute(PLANNER_PROFILE_PASSWORD_CHECK_INFO, true);
    }

    /**
     * <pre>
     * 1. MethodName : setProfilePasswordCheck
     * 2. ClassName  : SessionsUser.java
     * 3. Comment    : 프로필 비밀번호 확인 여부 저장
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     * @param RDP_MST_NO
     */
    public static boolean getProfilePasswordCheck(HttpServletRequest request) {
        try {
            return (boolean) request.getSession().getAttribute(PLANNER_PROFILE_PASSWORD_CHECK_INFO);
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * <pre>
     * 1. MethodName : clearProfilePasswordCheck
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 프로필 비밀번호 확인 여부 삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 16.
     * </pre>
     *
     * @param request
     */
    public static void clearProfilePasswordCheck(HttpServletRequest request) {
        request.getSession().setAttribute(PLANNER_PROFILE_PASSWORD_CHECK_INFO, null);
    }

    /**
     * <pre>
     * 1. MethodName : hasOneSelfCheck
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 본인확인 정보를 가지고 있는지 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 22.
     * </pre>
     *
     * @param request
     * @return
     */
    public static boolean hasOneSelfCheck(HttpServletRequest request) {
        if (request.getSession().getAttribute(ONE_SELF_OBJECT) != null) {
            OneSelfCheck oneSelfCheck = getOneSelfCheck(request);
            return StringUtils.isAnyBlank(oneSelfCheck.getONE_SELF_CI(), oneSelfCheck.getONE_SELF_NM(), oneSelfCheck.getONE_SELF_HP()) == false && StringUtil.isPhoneNumber(oneSelfCheck.getONE_SELF_HP());
        } else {
            return false;
        }
    }

    /**
     * <pre>
     * 1. MethodName : setOneSelfCheck
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 본인확인 정보 저장
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 22.
     * </pre>
     *
     * @param request
     */
    public static void setOneSelfCheck(HttpServletRequest request, OneSelfCheck oneSelfCheck) {
        request.getSession().setAttribute(ONE_SELF_OBJECT, oneSelfCheck);
    }

    /**
     * <pre>
     * 1. MethodName : getOneSelfCheck
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 본인확인 정보 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 22.
     * </pre>
     *
     * @param request
     * @return
     */
    public static OneSelfCheck getOneSelfCheck(HttpServletRequest request) {
        try {
            return (OneSelfCheck) request.getSession().getAttribute(ONE_SELF_OBJECT);
        } catch (Exception e) {
            return new OneSelfCheck();
        }
    }

    /**
     * <pre>
     * 1. MethodName : clearOneSelfCheck
     * 2. ClassName  : SessionsPlanner.java
     * 3. Comment    : 본인확인 정보 초기화
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 22.
     * </pre>
     *
     * @param request
     */
    public static void clearOneSelfCheck(HttpServletRequest request) {
        request.getSession().setAttribute(ONE_SELF_OBJECT, null);
    }
}