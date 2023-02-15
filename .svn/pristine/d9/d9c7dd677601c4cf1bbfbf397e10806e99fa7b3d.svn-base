package common.session;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.model.Request;

public class SessionsKeyword {

private static final String SESSION_KEYWORD_NM = "__SESSION_KEYWORD_NM__";
    
    /**
     * <pre>
     * 1. MethodName : getSession
     * 2. ClassName  : SessionsKeyword.java
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
     * 1. MethodName : setSessionKeyword
     * 2. ClassName  : SessionsKeyword.java
     * 3. Comment    : 키워드를 세션에 저장한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param keyword
     */
    public static void setSessionKeyword(List<Map<String, Object>> keyword) {
        if (keyword == null) {
            keyword = new ArrayList<>();
        }
        getSession().setAttribute(SESSION_KEYWORD_NM, keyword);
    }
    
    /**
     * <pre>
     * 1. MethodName : getSessionKeyword
     * 2. ClassName  : SessionsKeyword.java
     * 3. Comment    : 키워드를 세션에서 가져온다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public static List<Map<String, Object>> getSessionKeyword() {
        List<Map<String, Object>> keyword = null;
        try {
            keyword = (List<Map<String, Object>>) getSession().getAttribute(SESSION_KEYWORD_NM);
            if (keyword == null) {
                keyword = new ArrayList<>();
            }
        } catch (Exception e) {
            keyword = new ArrayList<>();
        }
        return keyword;
    }
    
    /**
     * <pre>
     * 1. MethodName : setSessionKeywordClear
     * 2. ClassName  : SessionsKeyword.java
     * 3. Comment    : 세션에 담긴 키워드를 초기화 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     */
    public static void setSessionKeywordClear() {
        getSession().setAttribute(SESSION_KEYWORD_NM, null);
    }
    
    /**
     * <pre>
     * 1. MethodName : isExists
     * 2. ClassName  : SessionsKeyword.java
     * 3. Comment    : 세션에 담긴 키워드 존재여부를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 18.
     * </pre>
     *
     * @return
     */
    public static boolean isExists() {
        return !getSessionKeyword().isEmpty();
    }
    
}
