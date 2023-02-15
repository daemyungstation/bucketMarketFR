package web.fr.planner.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import common.code.Const;
import common.code.CookieName;
import common.dao.CommonDefaultDAO;
import common.model.Planner;
import common.session.SessionsPlanner;
import common.util.CookieUtil;
import common.util.StringUtil;
import lombok.extern.slf4j.Slf4j;
import web.fr.planner.service.PlannerLoginService;

/**
 * <pre>
 * &#64;PackageName: web.fr.planner.service.impl
 * &#64;FileName : PlannerLoginServiceImpl.java
 * &#64;Date : 2020. 5. 11.
 * &#64;프로그램 설명 : 플래너 로그인 서비스
 * &#64;author upleat
 * </pre>
 */
@Slf4j
@Service("plannerLoginService")
public class PlannerLoginServiceImpl implements PlannerLoginService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : setPlannerSession
     * 2. ClassName  : PlannerLoginServiceImpl.java
     * 3. Comment    : 플래너 세션 생성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @throws Exception
     */
    public void setPlannerSession(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {

        // 플래너 조회
        Planner planner = (Planner) this.defaultDAO.select("PlannerLogin.selectPlannerInfoForSession", (Object) commandMap);
        if (planner != null && StringUtils.isNotEmpty(planner.getRDP_MST_IDX())) {
            // 세션 생성
            SessionsPlanner.setSessionPlanner(request, planner);
        }
    }

    /**
     * <pre>
     * 1. MethodName : clearPlannerSession
     * 2. ClassName  : PlannerLoginServiceImpl.java
     * 3. Comment    : 플래너 세션 삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerLoginService#clearPlannerSession(javax.servlet.http.HttpServletRequest)
     * @param request
     * @throws Exception
     */
    @Override
    public void clearPlannerSession(HttpServletRequest request) throws Exception {

        // 플래너 삭제
        SessionsPlanner.setSessionClear(request);

        // 확인 플래그 삭제
        SessionsPlanner.clearPasswordChange(request);
        SessionsPlanner.clearProfilePasswordCheck(request);
    }

    /**
     * <pre>
     * 1. MethodName : plannerLoginProc
     * 2. ClassName  : PlannerLoginServiceImpl.java
     * 3. Comment    : 로그인 처리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerLoginService#plannerLoginProc(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @throws Exception
     */
    @Override
    public void plannerLoginProc(HttpServletRequest request, HttpServletResponse response, Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_HIS_REG_IP", request.getLocalAddr());

        // 플래너 조회
        Planner planner = (Planner) this.defaultDAO.select("PlannerLogin.selectPlannerInfoForSession", (Object) commandMap);
        if (planner != null && StringUtils.isNotEmpty(planner.getRDP_MST_IDX())) {

            // 세션 생성
            SessionsPlanner.setSessionPlanner(request, planner);

            // 세션 확인 플래그 삭제
            SessionsPlanner.clearPasswordChange(request);
            SessionsPlanner.clearProfilePasswordCheck(request);

            // 로그인 이력 추가
            this.defaultDAO.insert("PlannerLogin.insertLoginHistory", commandMap);

            // 자동 로그인 처리
            String AUTO_LOGIN_YN = StringUtil.getString(commandMap, "AUTO_LOGIN_YN", "N");
            if (Const.PLANNER_AUTO_LOGIN.equals(AUTO_LOGIN_YN)) {

                // 자동 로그인 키
                String loginKey = request.getSession().getId();

                // 쿠키 생성
                response.addCookie(CookieUtil.createCookie(CookieName.AUTO_LOGIN_COOKIE_NAME, loginKey, "/", (Const.PLANNER_AUTO_LOGIN_EXPIRE_DAYS * 24 * 60 * 60)));

                // 정보 저장
                Map<String, Object> param = new HashMap<String, Object>();
                param.put("RDP_MST_ID", planner.getRDP_MST_ID());
                param.put("RDP_LGN_CKE", loginKey);
                param.put("EXPIRE_DAYS", Const.PLANNER_AUTO_LOGIN_EXPIRE_DAYS);
                this.defaultDAO.insert("PlannerLogin.insertAutoLogin", param);

                log.info("plannerLoginProc() AUTO_LOGIN_YN : {}, loginKey : {}", new Object[] { AUTO_LOGIN_YN, loginKey });
            }
        }
    }

    /**
     * <pre>
     * 1. MethodName : plannerLogoutProc
     * 2. ClassName  : PlannerLoginServiceImpl.java
     * 3. Comment    : 로그아웃 처리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerLoginService#plannerLogoutProc(javax.servlet.http.HttpServletRequest,
     *      javax.servlet.http.HttpServletResponse)
     * @param request
     * @param response
     * @throws Exception
     */
    @Override
    public void plannerLogoutProc(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 세션 삭제
        this.clearPlannerSession(request);

        // 자동 로그인 정보 삭제
        CookieUtil cookie = new CookieUtil(request);
        if (cookie.isExist(CookieName.AUTO_LOGIN_COOKIE_NAME)) {

            Cookie autoLoginCookie = cookie.deleteCookie(CookieName.AUTO_LOGIN_COOKIE_NAME);

            // 쿠키 정보 삭제
            response.addCookie(autoLoginCookie);

            // 테이블 데이터 삭제
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("RDP_LGN_CKE", autoLoginCookie.getValue());
            this.defaultDAO.delete("PlannerLogin.deleteAutoLogin", param);
        }
    }

    /**
     * <pre>
     * 1. MethodName : plannerAutoLoginProc
     * 2. ClassName  : PlannerLoginServiceImpl.java
     * 3. Comment    : 자동 로그인 처리
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerLoginService#plannerAutoLoginProc(javax.servlet.http.HttpServletRequest)
     * @param request
     * @throws Exception
     */
    @Override
    public void plannerAutoLoginProc(HttpServletRequest request) throws Exception {

        // 쿠키 확인
        CookieUtil cookie = new CookieUtil(request);
        if (cookie.isExist(CookieName.AUTO_LOGIN_COOKIE_NAME)) {

            String autoLoginKey = cookie.getValue(CookieName.AUTO_LOGIN_COOKIE_NAME);
            if (StringUtils.isNotBlank(autoLoginKey)) {

                // 자동 로그인 유효기간 확인
                Map<String, Object> param = new HashMap<String, Object>();
                param.put("RDP_LGN_CKE", autoLoginKey);
                Map<String, Object> autoLoginInfo = this.defaultDAO.select("PlannerLogin.selectAutoLogin", param);
                if (autoLoginInfo != null && autoLoginInfo.containsKey("RDP_MST_IDX") && StringUtils.isNotBlank(StringUtil.getString(autoLoginInfo, "RDP_MST_IDX", ""))) {

                    // 자동 로그인 처리
                    this.setPlannerSession(request, autoLoginInfo);
                }
            }
        }
    }

}
