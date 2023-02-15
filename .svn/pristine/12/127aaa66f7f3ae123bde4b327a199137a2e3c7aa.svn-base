package common.advices;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessPlannerRole;
import common.annotation.AccessRole;
import common.exception.AuthenticationException;
import common.model.Planner.ROLE_PLANNER;
import common.model.Request;
import common.model.User.ROLE_USER;
import common.session.SessionsPlanner;
import common.session.SessionsUser;
import common.util.StringUtil;
import common.viewer.JSON;
import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class PageRequestPermissionAdvice {

    @Resource(name = "urlPropertiesService")
    private EgovPropertyService urlPropertiesService;

    /**
     * <pre>
     * 1. MethodName : getMethod
     * 2. ClassName  : PageRequestPermissionAdvice.java
     * 3. Comment    : Method 정보를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 29.
     * </pre>
     *
     * @param clazz
     * @param methodName
     * @return
     * @throws Exception
     */
    private Method getMethod(Class<?> clazz, String methodName) throws Exception {
        Method method = null;
        for (Method item : clazz.getMethods()) {
            if ((methodName).equals(item.getName())) {
                method = clazz.getMethod(item.getName(), item.getParameterTypes());
                break;
            }
        }
        return method;
    }

    /**
     * <pre>
     * 1. MethodName : getCommandMap
     * 2. ClassName  : PageRequestPermissionAdvice.java
     * 3. Comment    : commandMap 정보를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 29.
     * </pre>
     *
     * @param joinPoint
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    private Map<String, Object> getCommandMap(JoinPoint joinPoint) throws Exception {
        Map<String, Object> commandMap = new HashMap<>();
        Object[] args = joinPoint.getArgs();
        for (Object arg : args) {
            if (arg instanceof Map) {
                commandMap = (Map<String, Object>) arg;
                break;
            }
        }
        return commandMap;
    }

    /**
     * 
     * <pre>
     * 1. MethodName : checkAccessRole
     * 2. ClassName  : PageRequestPermissionAdvice.java
     * 3. Comment    : 사용자 접근 정보 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 22.
     * </pre>
     *
     * @param request
     * @param clazz
     * @param methodName
     * @param commandMap
     * @throws Exception
     */
    private void checkAccessRole(HttpServletRequest request, Class<?> clazz, String methodName, Map<String, Object> commandMap) throws Exception {
        Method method = getMethod(clazz, methodName);
        // 접근자 디폴트 셋팅
        ROLE_USER grantRole = ROLE_USER.guest;
        String key = "main.index";
        boolean isAttachParameter = false;
        try {
            AccessRole accessRole = null;
            // 접근하고자 하는 Class 또는 Method의 접근 레벨 확인
            if (AnnotationUtils.findAnnotation(method, AccessRole.class) != null) {
                accessRole = AnnotationUtils.findAnnotation(method, AccessRole.class);
            } else if (clazz.isAnnotationPresent(AccessRole.class)) {
                accessRole = clazz.getAnnotation(AccessRole.class);
            }
            if (accessRole != null) {
                grantRole = accessRole.value();
                key = accessRole.key();
                isAttachParameter = accessRole.isAttachParameter();
            }
        } catch (Exception e) {

        }
        if (!ROLE_USER.guest.equals(grantRole)) {
            if (!SessionsUser.isLogin(grantRole)) {
                if (isAttachParameter) {
                    log.debug("commandMap : {}", commandMap);
                    throw new AuthenticationException(key, commandMap, true);
                } else {
                    throw new AuthenticationException(key, true);
                }
            }
        }
    }

    /**
     * 
     * <pre>
     * 1. MethodName : checkAccessPlannerRole
     * 2. ClassName  : PageRequestPermissionAdvice.java
     * 3. Comment    : 레디플래너 접근 정보 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 22.
     * </pre>
     *
     * @param request
     * @param clazz
     * @param methodName
     * @throws Exception
     */
    private void checkAccessPlannerRole(HttpServletRequest request, Class<?> clazz, String methodName) throws Exception {
        Method method = getMethod(clazz, methodName);
        // 접근자 디폴트 셋팅
        ROLE_PLANNER grantRole = ROLE_PLANNER.guest;
        try {
            // 접근하고자 하는 Class 또는 Method의 접근 레벨 확인
            if (AnnotationUtils.findAnnotation(method, AccessPlannerRole.class) != null) {
                grantRole = AnnotationUtils.findAnnotation(method, AccessPlannerRole.class).value();
            } else if (clazz.isAnnotationPresent(AccessPlannerRole.class)) {
                grantRole = clazz.getAnnotation(AccessPlannerRole.class).value();
            }
        } catch (Exception e) {

        }
        if (!ROLE_PLANNER.guest.equals(grantRole)) {
            if (!SessionsPlanner.isLogin(grantRole)) {
                throw new AuthenticationException("planner.login.form", true);
            }
        }
    }

    public Object checkPageRequestPermission(ProceedingJoinPoint joinPoint) throws Throwable {

        HttpServletRequest request = Request.getCurrentRequest();
        try {
            checkAccessRole(request, joinPoint.getTarget().getClass(), joinPoint.getSignature().getName(), getCommandMap(joinPoint));
            checkAccessPlannerRole(request, joinPoint.getTarget().getClass(), joinPoint.getSignature().getName());
            return joinPoint.proceed();
        } catch (AuthenticationException e) {
            log.error(e.toString());
            if (Boolean.parseBoolean(request.getHeader("isAjax"))) {
                Signature signature =  joinPoint.getSignature();
                Class<?> returnType = ((MethodSignature) signature).getReturnType();
                if (returnType.equals(JSON.class)) {
                    Map<String, String> header = new HashMap<>();
                    header.put("authenticationYn", "Y");
                    header.put("redirectUrl", urlPropertiesService.getString(StringUtil.getString(e.getKey())));
                    return new JSON(HttpStatus.FORBIDDEN, header); 
                } else {
                    ModelAndView mv = new ModelAndView(); 
                    mv.setViewName("redirect:" + urlPropertiesService.getString("common.error.authentication") + "?key=" + e.getKey());
                    return mv;
                }
            } else {
                // 권한 오류 처리
                if (e.isRedirect()) {
                    ModelAndView mv = new ModelAndView();
                    mv.addObject("exception", e);
                    mv.setViewName("redirect:" + urlPropertiesService.getString(e.getKey()) + "?" + StringUtil.getQueryString(e.getCommandMap()));
                    return mv;
                } else {
                    ModelAndView mv = new ModelAndView();
                    mv.addObject("commandMap", e.getCommandMap());
                    mv.setViewName("forward:" + urlPropertiesService.getString(e.getKey()));
                    return mv;
                }
            }
        }
    }
}
