package web.fr.planner.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <pre>
 * &#64;PackageName: web.fr.planner.service
 * &#64;FileName : PlannerLoginService.java
 * &#64;Date : 2020. 5. 4.
 * &#64;프로그램 설명 : 플래너 가입
 * &#64;author upleat
 * </pre>
 */
public interface PlannerLoginService {

    /**
     * <pre>
     * 1. MethodName : setPlannerSession
     * 2. ClassName  : PlannerLoginService.java
     * 3. Comment    : 플래너 세션 생성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @throws Exception
     */
    public void setPlannerSession(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : logout
     * 2. ClassName  : PlannerLoginService.java
     * 3. Comment    : 플래너 세션 삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @return
     * @throws Exception
     */
    public void clearPlannerSession(HttpServletRequest request) throws Exception;

    /**
     * <pre>
     * 1. MethodName : plannerLoginProc
     * 2. ClassName  : PlannerLoginService.java
     * 3. Comment    : 플래너 로그인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @throws Exception
     */
    public void plannerLoginProc(HttpServletRequest request, HttpServletResponse response, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : plannerLogoutProc
     * 2. ClassName  : PlannerLoginService.java
     * 3. Comment    : 플래너 로그아웃
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public void plannerLogoutProc(HttpServletRequest request, HttpServletResponse response) throws Exception;

    /**
     * 
     * <pre>
     * 1. MethodName : plannerAutoLoginProc
     * 2. ClassName  : PlannerLoginService.java
     * 3. Comment    : 자동 로그인 처리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param request
     * @throws Exception
     */
    public void plannerAutoLoginProc(HttpServletRequest request) throws Exception;

}
