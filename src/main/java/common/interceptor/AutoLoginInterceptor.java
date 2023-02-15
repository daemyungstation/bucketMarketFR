package common.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import common.model.Planner.ROLE_PLANNER;
import common.session.SessionsPlanner;
import egovframework.rte.fdl.property.EgovPropertyService;
import web.fr.planner.service.PlannerLoginService;

/**
 * <pre>
 * &#64;PackageName: common.interceptor
 * &#64;FileName : AutoLoginInterceptor.java
 * &#64;Date : 2020. 5. 20.
 * &#64;프로그램 설명 : 자동 로그인 확인 인터셉터
 * &#64;author upleat
 * </pre>
 */
public class AutoLoginInterceptor extends HandlerInterceptorAdapter {

    @Resource(name = "urlPropertiesService")
    private EgovPropertyService urlPropertiesService;

    @Resource(name = "plannerLoginService")
    private PlannerLoginService plannerLoginService;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 플래너가 로그아웃된 상태이고 자동 로그인 대상 URL 인 경우에만 자동 로그인 처리
        if (SessionsPlanner.isLogin(ROLE_PLANNER.planner) == false && isAutoLoginTargetUrl(request)) {
            this.plannerLoginService.plannerAutoLoginProc(request);
        }
        return true;
    }

    /**
     * <pre>
     * 1. MethodName : isLoginUrl
     * 2. ClassName  : AutoLoginInterceptor.java
     * 3. Comment    : 자동 로그인 대상 URL 인지 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param request
     * @return
     */
    private boolean isAutoLoginTargetUrl(HttpServletRequest request) {

        String reqUrl = request.getRequestURI();

        // 레디플래너 관련 페이지
        if (reqUrl.contains("/myplanner/")) {
            return true;
        } else {
            return false;
        }
    }
}
