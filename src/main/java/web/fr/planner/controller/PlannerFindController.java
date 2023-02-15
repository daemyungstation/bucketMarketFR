package web.fr.planner.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import common.annotation.CommandMap;
import common.code.Code;
import common.model.OneSelfCheck;
import common.session.SessionsPlanner;
import common.support.ControllerSupport;
import common.util.StringUtil;
import web.fr.planner.service.PlannerCommonService;
import web.fr.planner.service.PlannerFindService;

/**
 * <pre>
 * &#64;PackageName: web.fr.planner.controller
 * &#64;FileName : PlannerFindController.java
 * &#64;Date : 2020. 5. 12.
 * &#64;프로그램 설명 : 플래너 아이디/비밀번호 찾기
 * &#64;author upleat
 * </pre>
 */
@Controller
public class PlannerFindController extends ControllerSupport {

    @Resource(name = "plannerCommonService")
    private PlannerCommonService plannerCommonService;

    @Resource(name = "plannerFindService")
    private PlannerFindService plannerFindService;

    /**
     * <pre>
     * 1. MethodName : findId
     * 2. ClassName  : PlannerFindController.java
     * 3. Comment    : 아이디 찾기
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.find.id.form}")
    public ModelAndView findId(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 본인확인 여부 초기화
        SessionsPlanner.clearOneSelfCheck(request);

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "planner.find.id.form");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : findIdFind
     * 2. ClassName  : PlannerFindController.java
     * 3. Comment    : 아이디 찾기 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.find.id.find}")
    public ModelAndView findIdFind(HttpServletRequest request, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 본인확인 여부 확인
        if (SessionsPlanner.hasOneSelfCheck(request) == false) {
            mv.addObject("alertMsg", "본인확인 후 신청 할 수 있습니다.");
            setResultView(mv, "planner.find.id.form");
            return mv;
        }

        // 본인확인 정보
        OneSelfCheck oneSelfCheck = SessionsPlanner.getOneSelfCheck(request);

        // 본인확인 여부 초기화
        SessionsPlanner.clearOneSelfCheck(request);

        // 플래너 아이디 조회
        commandMap.put("RDP_MST_CI", oneSelfCheck.getONE_SELF_CI());
        Map<String, Object> info = this.plannerFindService.selectPlannerByCi(commandMap);
        if (info == null) {
            info = new HashMap<>();
        }

        String RDP_MST_NO = StringUtil.getString(info, "RDP_MST_NO", ""); // 플래너 번호
        int RDP_MST_STATE = StringUtil.getInt(info, "RDP_MST_STATE", -1); // 플래너 상태
        if (StringUtils.isNotEmpty(RDP_MST_NO)) {

            // 플래너 상태에 따른 분기
            if (Code.PLANNER_STATE_ACTIVE == RDP_MST_STATE || Code.PLANNER_STATE_STOP == RDP_MST_STATE || Code.PLANNER_STATE_REQUEST_RELEASE == RDP_MST_STATE) {

                // 정상, 정지, 해제요청 - 아이디 로그인 가능 아이디 찾기 결과 페이지로
                mv.addObject("info", info);
                setViewName(mv, "planner.find.id.result.view");
            } else {

                // 플래너 신청 중 상태 - 플래너 신청을 마무리하도록 안내 
                info.put("inApplyState", true);
                mv.addObject("info", info);
                setViewName(mv, "planner.find.id.form");
            }
        } else {

            // 플래너 없음
            info.put("notFound", true);
            mv.addObject("info", info);
            setViewName(mv, "planner.find.id.form");
        }

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : findPw
     * 2. ClassName  : PlannerFindController.java
     * 3. Comment    : 비밀번호 찾기
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.find.pw.form}")
    public ModelAndView findPw(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 본인확인 여부 초기화
        SessionsPlanner.clearOneSelfCheck(request);

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "planner.find.pw.form");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : findPwFind
     * 2. ClassName  : PlannerFindController.java
     * 3. Comment    : 아이디 찾기 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.find.pw.find}")
    public ModelAndView findPwFind(HttpServletRequest request, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 본인확인 여부 확인
        if (SessionsPlanner.hasOneSelfCheck(request) == false) {
            mv.addObject("alertMsg", "본인확인 후 신청 할 수 있습니다.");
            setResultView(mv, "planner.find.pw.form");
            return mv;
        }

        // 본인확인 정보
        OneSelfCheck oneSelfCheck = SessionsPlanner.getOneSelfCheck(request);

        // 본인확인 여부 초기화
        SessionsPlanner.clearOneSelfCheck(request);

        // 플래너 조회
        commandMap.put("RDP_MST_CI", oneSelfCheck.getONE_SELF_CI());
        Map<String, Object> info = this.plannerFindService.selectPlannerById(commandMap);
        if (info == null) {
            info = new HashMap<>();
        }

        String RDP_MST_NO = StringUtil.getString(info, "RDP_MST_NO", ""); // 플래너 번호
        int RDP_MST_STATE = StringUtil.getInt(info, "RDP_MST_STATE", -1); // 플래너 상태
        if (StringUtils.isNotEmpty(RDP_MST_NO)) {

            // 본인이 맞는지 확인 - CI 값 비교
            String RDP_MST_CI = StringUtil.getString(info, "RDP_MST_CI", ""); // CI
            String RDP_MST_CI_REQUEST = StringUtil.getString(commandMap, "RDP_MST_CI", ""); // CI
            if (StringUtils.isNotBlank(RDP_MST_CI_REQUEST) && RDP_MST_CI_REQUEST.equals(RDP_MST_CI)) {

                // 플래너 상태에 따른 분기
                if (Code.PLANNER_STATE_ACTIVE == RDP_MST_STATE || Code.PLANNER_STATE_STOP == RDP_MST_STATE || Code.PLANNER_STATE_REQUEST_RELEASE == RDP_MST_STATE) {

                    // 변경 대상 아이디 전달
                    redirect.addFlashAttribute("RDP_MST_NO", RDP_MST_NO);
                    // 정상, 정지, 해제요청 - 비밀번호 변경 페이지로
                    setRedirectView(mv, "planner.find.pw.reset.form");
                } else {

                    // 플래너 신청 중 상태 - 플래너 신청을 마무리하도록 안내 
                    info.put("inApplyState", true);
                    mv.addObject("info", info);
                    setViewName(mv, "planner.find.pw.form");
                }
            } else {

                // 오류
                info.put("notFound", true);
                mv.addObject("info", info);
                setViewName(mv, "planner.find.pw.form");
            }
        } else {

            // 플래너 없음
            info.put("notFound", true);
            mv.addObject("info", info);
            setViewName(mv, "planner.find.pw.form");
        }

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : findPwReset
     * 2. ClassName  : PlannerFindController.java
     * 3. Comment    : 비밀번호 결과 & 비밀번호 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.find.pw.reset.form}")
    public ModelAndView findPwReset(HttpServletRequest request, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 저장된 아이디 초기화
        SessionsPlanner.clearPasswordChange(request);

        Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
        if (flashMap != null && flashMap.containsKey("RDP_MST_NO") && flashMap.get("RDP_MST_NO") != null) {
            String RDP_MST_NO = (String) flashMap.get("RDP_MST_NO");

            // 변경 대상 아이디 저장
            SessionsPlanner.setPasswordChange(request, RDP_MST_NO);

            // 플래너 정보 조회
            commandMap.put("RDP_MST_NO", RDP_MST_NO);
            Map<String, Object> info = this.plannerCommonService.selectPlannerInfoByPlannerNo(commandMap);

            mv.addObject("info", info);
            setViewName(mv, "planner.find.pw.reset.form");
        } else {
            setRedirectView(mv, "planner.find.pw.form");
        }
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : findPwResetPassword
     * 2. ClassName  : PlannerFindController.java
     * 3. Comment    : 비밀번호 변경 결과
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.find.pw.reset.password}")
    public ModelAndView findPwResetPassword(HttpServletRequest request, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 저장된 아이디 조회
        String RDP_MST_NO = SessionsPlanner.getPasswordChange(request);
        if (StringUtils.isNotBlank(RDP_MST_NO)) {

            // 플래너 정보 조회
            commandMap.put("RDP_MST_NO", RDP_MST_NO);
            Map<String, Object> info = this.plannerCommonService.selectPlannerInfoByPlannerNo(commandMap);

            // 비밀번호 수정
            commandMap.put("RDP_MST_IDX", StringUtil.getString(info, "RDP_MST_IDX", ""));
            int result = this.plannerFindService.updatePlannerPassword(commandMap);
            if (result > 0) {

                // 비밀번호 변경 결과 페이지로
                redirect.addAttribute("RDP_MST_MEM_NM", StringUtil.getString(info, "RDP_MST_MEM_NM", ""));
                setRedirectView(mv, "planner.find.pw.reset.result.view");
            } else {

                // 변경 실패
                mv.addObject("alertMsg", "비밀번호 변경이 실패하였습니다.");
                setResultView(mv, "planner.find.pw.find");
            }
        } else {

            // 변경 실패
            mv.addObject("alertMsg", "비밀번호 변경이 실패하였습니다.");
            setResultView(mv, "planner.find.pw.find");
        }

        // 저장된 아이디 초기화
        SessionsPlanner.clearPasswordChange(request);

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : findPwResetResultView
     * 2. ClassName  : PlannerFindController.java
     * 3. Comment    : 비밀번호 변경 결과
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.find.pw.reset.result.view}")
    public ModelAndView findPwResetResultView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "planner.find.pw.reset.result.view");
        return mv;
    }

}
