package common.session;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.model.Request;
import common.util.DeviceUtil;

public class SessionsCategory {

    private static final String SESSION_PC_CATEGORY_NM = "__SESSION_PC_CATEGORY_NM__";
    private static final String SESSION_MB_CATEGORY_NM = "__SESSION_MB_CATEGORY_NM__";
    /**
     * <pre>
     * 1. MethodName : getSession
     * 2. ClassName  : SessionsCategory.java
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
     * 1. MethodName : setSessionCategory
     * 2. ClassName  : SessionsCategory.java
     * 3. Comment    : 카테고리를 세션에 저장한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param category
     */
    public static void setSessionCategory(List<Map<String, Object>> category) {
        if (DeviceUtil.isNormal()) {
            getSession().setAttribute(SESSION_PC_CATEGORY_NM, category);
        } else {
            getSession().setAttribute(SESSION_MB_CATEGORY_NM, category);
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : getSessionCategory
     * 2. ClassName  : SessionsCategory.java
     * 3. Comment    : 카테고리를 세션에서 가져온다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param reqNum
     * @return
     */
    @SuppressWarnings("unchecked")
    public static List<Map<String, Object>> getSessionCategory() {
        List<Map<String, Object>> category = null;
        try {
            if (DeviceUtil.isNormal()) {
                category = (List<Map<String, Object>>) getSession().getAttribute(SESSION_PC_CATEGORY_NM);
            } else {
                category = (List<Map<String, Object>>) getSession().getAttribute(SESSION_MB_CATEGORY_NM);
            }
        } catch (Exception e) {
            category = new ArrayList<>();
        }
        return category;
    }
    
    /**
     * <pre>
     * 1. MethodName : setSessionCategoryClear
     * 2. ClassName  : SessionsCategory.java
     * 3. Comment    : 세션에 담긴 카테고리를 초기화 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     */
    public static void setSessionCategoryClear() {
        if (DeviceUtil.isNormal()) {
            getSession().setAttribute(SESSION_PC_CATEGORY_NM, null);
        } else {
            getSession().setAttribute(SESSION_MB_CATEGORY_NM, null);
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : isEmpty
     * 2. ClassName  : SessionsCategory.java
     * 3. Comment    : 세션에 담겨있는 카테고리가 비어있는지 여부를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     */
    public static boolean isEmpty() {
        boolean isEmpty = false;
        try {
            isEmpty = getSessionCategory().isEmpty();
        } catch (Exception e) {
            isEmpty = true;
        }
        return isEmpty;
    }
}
