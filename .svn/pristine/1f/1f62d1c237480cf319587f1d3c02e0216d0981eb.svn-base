package common.session;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.model.Request;
import common.model.BoardUser;
import common.util.StringUtil;

/**
 * <pre>
 * @PackageName: common.session
 * @FileName : SessionsBoardUser.java
 * @Date : 2020. 4. 29.
 * @프로그램 설명 : 사용자 세션을 처리하는 Class
 * @author upleat
 * </pre>
 */
public class SessionsBoardUser implements Serializable {
    private static final long serialVersionUID = 4264291207508518054L;
    private static final String BOARD_USER_OBJECT = "__BOARD_BOARD_USER_OBJECT__";
    private static final String BOARD_USER_INFO = "__BOARD_BOARD_USER_INFO__";
    
    
    /**
     * <pre>
     * 1. MethodName : getSessionValue
     * 2. ClassName  : SessionBoardUser.java
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
     * 2. ClassName  : SessionBoardUser.java
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
        if (getSessionBoardUserMap(request) == null) {
            return "";
        } else {
            try {
                return String.valueOf(getSessionBoardUserMap(request).get(name));
            } catch (Exception e) {
                return "";
            }
        }
    }

    /**
     * <pre>
     * 1. MethodName : setSessionBoardUserMap
     * 2. ClassName  : SessionBoardUser.java
     * 3. Comment    : 사용자 정보를 세션에 저장한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param Map
     */
    private static void setSessionBoardUserMap(HttpServletRequest request, Map<String, Object> map) {
        HttpSession session = request.getSession();
        session.setAttribute(BOARD_USER_INFO, map);
    }

    /**
     * <pre>
     * 1. MethodName : setSessionBoardUser
     * 2. ClassName  : SessionBoardUser.java
     * 3. Comment    : 사용자 정보를 세션에 저장한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @param Map
     */
    public static void setSessionBoardUser(HttpServletRequest request, BoardUser user) {
        HttpSession session = request.getSession();
        session.setAttribute(BOARD_USER_OBJECT, user);
        Map<String, Object> map = new HashMap<>();
        map.put("USER_NM", user.getUSER_NM());
        map.put("USER_PWD", user.getUSER_PWD());
        setSessionBoardUserMap(request, map);
    }
    
    /**
     * <pre>
     * 1. MethodName : setSessionBoardUserClear
     * 2. ClassName  : SessionBoardUser.java
     * 3. Comment    : 세션을 삭제한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     */
    public static void setSessionBoardUserClear(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute(BOARD_USER_OBJECT, null);
        session.setAttribute(BOARD_USER_INFO, null);
    }

    /**
     * <pre>
     * 1. MethodName : getSessionMap
     * 2. ClassName  : SessionBoardUser.java
     * 3. Comment    : 세션에 담긴 정보를 Map 형태로 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @return
     */
    @SuppressWarnings("unchecked")
    private static Map<String, Object> getSessionBoardUserMap(HttpServletRequest request) {
        try {
            if (getSessionBoardUser(request) == null) {
                return null;
            }
            return (Map<String, Object>) request.getSession().getAttribute(BOARD_USER_INFO);
        } catch (Exception e) {
            return null;
        }

    }

    /**
     * <pre>
     * 1. MethodName : getSessionBoardUser
     * 2. ClassName  : SessionBoardUser.java
     * 3. Comment    : 사용자 세션 정보를 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @return
     */
    public static BoardUser getSessionBoardUser(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            BoardUser user = (BoardUser) session.getAttribute(BOARD_USER_OBJECT);
            if (user == null) {
                return new BoardUser();
            } else {
                return user;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            return new BoardUser();
        }
    }

    /**
     * <pre>
     * 1. MethodName : isLogin
     * 2. ClassName  : SessionBoardUser.java
     * 3. Comment    : 로그인 유무를 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 1.
     * </pre>
     *
     * @param request
     * @return
     */
    public static boolean isLogin(HttpServletRequest request) {
        BoardUser manger = getSessionBoardUser(request);
        return !"".equals(StringUtil.getString(manger.getUSER_NM(), "")); 
    }

}
