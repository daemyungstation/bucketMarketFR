package common.session;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.model.Request;

public class SessionsSkyscraper {

private static final String SESSION_SKYSCRAPER_NM = "__SESSION_SKYSCRAPER_NM__";
    
    /**
     * <pre>
     * 1. MethodName : getSession
     * 2. ClassName  : SessionsSkyscraper.java
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
     * 1. MethodName : setSessionSkyscraper
     * 2. ClassName  : SessionsSkyscraper.java
     * 3. Comment    : 스카이스크래퍼 배너를 세션에 저장한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param banner
     */
    public static void setSessionSkyscraper(List<Map<String, Object>> banner) {
        if (banner == null) {
            banner = new ArrayList<>();
        }
        getSession().setAttribute(SESSION_SKYSCRAPER_NM, banner);
    }
    
    /**
     * <pre>
     * 1. MethodName : getSessionSkyscraper
     * 2. ClassName  : SessionsSkyscraper.java
     * 3. Comment    : 스카이스크래퍼 배너를 세션에서 가져온다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public static List<Map<String, Object>> getSessionSkyscraper() {
        List<Map<String, Object>> banner = null;
        try {
            banner = (List<Map<String, Object>>) getSession().getAttribute(SESSION_SKYSCRAPER_NM);
            if (banner == null) {
                banner = new ArrayList<>();
            }
        } catch (Exception e) {
            banner = new ArrayList<>();
        }
        return banner;
    }
    
    /**
     * <pre>
     * 1. MethodName : setSessionSkyscraperClear
     * 2. ClassName  : SessionsSkyscraper.java
     * 3. Comment    : 세션에 담긴 스카이스크래퍼 배너를 초기화 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     */
    public static void setSessionSkyscraperClear() {
        getSession().setAttribute(SESSION_SKYSCRAPER_NM, null);
    }
    
    /**
     * <pre>
     * 1. MethodName : isExists
     * 2. ClassName  : SessionsSkyscraper.java
     * 3. Comment    : 세션에 담긴 스카이스크래퍼 배너 존재여부를 반한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 18.
     * </pre>
     *
     * @return
     */
    public static boolean isExists() {
        return !getSessionSkyscraper().isEmpty();
    }
    
}
