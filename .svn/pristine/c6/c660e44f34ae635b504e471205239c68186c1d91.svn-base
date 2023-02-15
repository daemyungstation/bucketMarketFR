package web.fr.planner.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import common.annotation.CommandMap;
import common.code.Code;
import common.support.ControllerSupport;
import common.util.StringUtil;
import web.fr.planner.service.PlannerCommonService;
import web.fr.planner.service.PlannerLoginService;

/**
 * <pre>
 * &#64;PackageName: web.fr.planner.controller
 * &#64;FileName : PlannerLoginController.java
 * &#64;Date : 2020. 4. 28.
 * &#64;프로그램 설명 : 플래너 로그인
 * &#64;author upleat
 * </pre>
 */
@Controller
public class PlannerLoginController extends ControllerSupport {

    @Resource(name = "plannerCommonService")
    private PlannerCommonService plannerCommonService;

    @Resource(name = "plannerLoginService")
    private PlannerLoginService plannerLoginService;

    /**
     * <pre>
     * 1. MethodName : plannerLogin
     * 2. ClassName  : PlannerLoginController.java
     * 3. Comment    : 로그인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param request
     * @param response
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.login.form}")
    public ModelAndView plannerLogin(HttpServletRequest request, HttpServletResponse response, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 로그아웃 처리
        // - 세션 삭제 및 자동로그인 해제
        // this.plannerLoginService.plannerLogoutProc(request, response);

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "planner.login.form");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : loginByPlannerNo
     * 2. ClassName  : PlannerLoginController.java
     * 3. Comment    : 플래너번호로 로그인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.login.byPlannerNo}")
    public ModelAndView loginByPlannerNo(HttpServletRequest request, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 조회
        Map<String, Object> info = this.plannerCommonService.selectPlannerInfoByPlannerNo(commandMap);
        if (info != null) {

            // 플래너 상태에 따른 분기
            int RDP_MST_STATE = StringUtil.getInt(info, "RDP_MST_STATE", -1);
            if (Code.PLANNER_STATE_APPLY == RDP_MST_STATE || Code.PLANNER_STATE_REJECT == RDP_MST_STATE) {

                // 신청, 반려 - 신청 결과 페이지로
                mv.addObject("info", info);
                mv.addObject("commandMap", commandMap);
                setViewName(mv, "planner.login.byPlannerNo");
            } else if (Code.PLANNER_STATE_APPROVAL == RDP_MST_STATE) {

                // 승인 - 추가정보 입력 페이지로
                redirect.addAttribute("plannerNo", StringUtil.getString(commandMap, "RDP_MST_NO"));
                setRedirectView(mv, "planner.join.step4.form");
            } else if (Code.PLANNER_STATE_INACTIVE == RDP_MST_STATE) {

                // 활동대기 - 교육이수 페이지로
                redirect.addAttribute("plannerNo", StringUtil.getString(commandMap, "RDP_MST_NO"));
                setRedirectView(mv, "planner.join.step5.form");
            } else if (Code.PLANNER_STATE_ACTIVE == RDP_MST_STATE || Code.PLANNER_STATE_STOP == RDP_MST_STATE || Code.PLANNER_STATE_REQUEST_RELEASE == RDP_MST_STATE) {

                // 정상, 정지, 해제요청 - 로그인 페이지로
                mv.addObject("alertMsg", "아이디/비밀번호로 로그인해 주세요.");
                setResultView(mv, "planner.login.form");
            } else {

                // 오류 - 로그인 페이지로
                mv.addObject("alertMsg", "플래너 번호가 잘못되었습니다.");
                setResultView(mv, "planner.login.form");
            }
        } else {

            // 오류 - 오류 - 로그인 페이지로
            mv.addObject("alertMsg", "플래너 번호가 잘못되었습니다.");
            setResultView(mv, "planner.login.form");
        }
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : loginByIdPw
     * 2. ClassName  : PlannerLoginController.java
     * 3. Comment    : 아이디 비밀번호로 로그인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.login.byIdPw}", method = RequestMethod.POST)
    public ModelAndView loginByIdPw(HttpServletRequest request, HttpServletResponse response, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 로그아웃 처리
        // - 세션 삭제 및 자동로그인 해제
        this.plannerLoginService.plannerLogoutProc(request, response);

        // 플래너 조회
        Map<String, Object> info = this.plannerCommonService.selectPlannerInfoById(commandMap);
        if (info != null) {

            // 플래너 상태에 따른 분기
            int RDP_MST_STATE = StringUtil.getInt(info, "RDP_MST_STATE", -1);
            if (Code.PLANNER_STATE_INACTIVE == RDP_MST_STATE) {

                // 활동대기 - 교육이수 페이지로
                redirect.addAttribute("plannerNo", StringUtil.getString(info, "RDP_MST_NO"));
                setRedirectView(mv, "planner.join.step5.form");
            } else if (Code.PLANNER_STATE_ACTIVE == RDP_MST_STATE || Code.PLANNER_STATE_STOP == RDP_MST_STATE || Code.PLANNER_STATE_REQUEST_RELEASE == RDP_MST_STATE) {

                // 비밀번호 확인
                String RDP_MST_PW = StringUtil.getString(commandMap, "RDP_MST_PW", "");
                String RDP_MST_PW_CHECK = StringUtil.getString(info, "RDP_MST_PW", "");
                if (StringUtils.isNotBlank(RDP_MST_PW) && RDP_MST_PW.equals(RDP_MST_PW_CHECK)) {

                    // 
                    commandMap.putAll(info);

                    // 정상, 정지, 해제요청 - 로그인 처리
                    this.plannerLoginService.plannerLoginProc(request, response, commandMap);

                    // 마이레디플래너 메인으로
                    setRedirectView(mv, "myplanner.main.view");
                } else {

                    // 비밀번호 다름
                    commandMap.put("errorMessage", "아이디와 비밀번호가 일치하지 않습니다.");
                    mv.addObject("commandMap", commandMap);
                    setViewName(mv, "planner.login.form");
                }
            } else {

                // 플래너 상태가 아이디로 로그인 할 수 없음
                commandMap.put("errorMessage", "아이디와 비밀번호가 일치하지 않습니다.");
                mv.addObject("commandMap", commandMap);
                setViewName(mv, "planner.login.form");
            }
        } else {

            // 플래너 아이디 없음
            commandMap.put("errorMessage", "아이디와 비밀번호가 일치하지 않습니다.");
            mv.addObject("commandMap", commandMap);
            setViewName(mv, "planner.login.form");
        }

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : logout
     * 2. ClassName  : PlannerLoginController.java
     * 3. Comment    : 로그아웃
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.logout}")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 로그아웃 처리
        // - 세션 삭제 및 자동로그인 해제
        this.plannerLoginService.plannerLogoutProc(request, response);

        // 메인으로
        setRedirectView(mv, "main.index");

        return mv;
    }

}
