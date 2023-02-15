package common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class ContextUtil {
    /**
     * <pre>
     * 1. MethodName : getBean
     * 2. ClassName  : ContextUtil.java
     * 3. Comment    : 빈을 직접 얻습니다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param beanName
     * @return
     */
    public static Object getBean(String beanName) {
        WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
        return context.getBean(beanName);
    }

    /**
     * <pre>
     * 1. MethodName : getRequest
     * 2. ClassName  : ContextUtil.java
     * 3. Comment    : HttpServletReqeust 객체를 직접 얻습니다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @return
     */
    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getRequest();
    }

    /**
     * <pre>
     * 1. MethodName : getSession
     * 2. ClassName  : ContextUtil.java
     * 3. Comment    : HttpSession 객체를 직접 얻습니다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param gen
     * @return
     */
    public static HttpSession getSession(boolean gen) {
        return ContextUtil.getRequest().getSession(gen);
    }

    /**
     * <pre>
     * 1. MethodName : getAttrFromRequest
     * 2. ClassName  : ContextUtil.java
     * 3. Comment    : REQUEST 영역에서 가져오기
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param key
     * @return
     */
    public static Object getAttrFromRequest(String key) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getAttribute(key, ServletRequestAttributes.SCOPE_REQUEST);
    }

    /**
     * <pre>
     * 1. MethodName : setAttrToRequest
     * 2. ClassName  : ContextUtil.java
     * 3. Comment    : REQUEST 영역에 객체 저장
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param key
     * @param obj
     */
    public static void setAttrToRequest(String key, Object obj) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        attr.setAttribute(key, obj, ServletRequestAttributes.SCOPE_REQUEST);
    }

    /**
     * <pre>
     * 1. MethodName : getAttrFromSession
     * 2. ClassName  : ContextUtil.java
     * 3. Comment    : SESSION 영역에서 가져오기
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param key
     * @return
     */
    public static Object getAttrFromSession(String key) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attr.getAttribute(key, ServletRequestAttributes.SCOPE_SESSION);
    }

    /**
     * <pre>
     * 1. MethodName : setAttrToSession
     * 2. ClassName  : ContextUtil.java
     * 3. Comment    : Session 영역에 객체 저장
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param key
     * @param obj
     */
    public static void setAttrToSession(String key, Object obj) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        attr.setAttribute(key, obj, ServletRequestAttributes.SCOPE_SESSION);
    }
}
