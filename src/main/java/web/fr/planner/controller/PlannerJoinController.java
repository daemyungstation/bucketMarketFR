package web.fr.planner.controller;

import java.util.ArrayList;
import java.util.List;
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
import common.model.OneSelfCheck;
import common.session.SessionsPlanner;
import common.support.ControllerSupport;
import common.util.DeviceUtil;
import common.util.StringUtil;
import common.viewer.JSON;
import egovframework.rte.fdl.property.EgovPropertyService;
import web.fr.common.service.CommonService;
import web.fr.planner.service.PlannerJoinService;
import web.fr.planner.service.PlannerLoginService;

/**
 * <pre>
 * &#64;PackageName: web.fr.planner.controller
 * &#64;FileName : PlannerJoinController.java
 * &#64;Date : 2020. 5. 4.
 * &#64;프로그램 설명 : 플래너 가입
 * &#64;author upleat
 * </pre>
 */
@Controller
public class PlannerJoinController extends ControllerSupport {

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "plannerJoinService")
    private PlannerJoinService plannerJoinService;

    @Resource(name = "plannerLoginService")
    private PlannerLoginService plannerLoginService;

    @Resource(name = "urlPropertiesService")
    private EgovPropertyService urlPropertiesService;

    @Resource(name = "sciPropertiesService")
    private EgovPropertyService sciPropertiesService;

    /**
     * <pre>
     * 1. MethodName : joinStep1
     * 2. ClassName  : PlannerJoinController.java
     * 3. Comment    : 플래너 가입 > (1/5) 약관 동의 및 본인 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.join.step1.form}")
    public ModelAndView joinStep1(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "planner.join.step1.form");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : joinStep2
     * 2. ClassName  : PlannerJoinController.java
     * 3. Comment    : 플래너 가입 > (2/5) 신청 정보 입력
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.join.step2.form}", method = RequestMethod.POST)
    public ModelAndView joinStep2(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 본인확인 여부 확인
        if (SessionsPlanner.hasOneSelfCheck(request) == false) {
            mv.addObject("alertMsg", "본인확인 후 신청 할 수 있습니다.");
            setResultView(mv, "planner.join.step1.form");
            return mv;
        }

        OneSelfCheck oneSelfCheck = SessionsPlanner.getOneSelfCheck(request);

        // 가입 여부 확인
        commandMap.put("RDP_MST_CI", oneSelfCheck.getONE_SELF_CI());
        if (this.plannerJoinService.checkDuplicateCi(commandMap) > 1) {
            mv.addObject("alertMsg", "이미 가입된 사용자입니다.");
            setResultView(mv, "planner.join.step1.form");
            return mv;
        }

        // 본인확인 정보
        commandMap.put("RDP_MST_MEM_NM", oneSelfCheck.getONE_SELF_NM());
        commandMap.put("RDP_MST_HP1", StringUtil.splitPhoneNumber(oneSelfCheck.getONE_SELF_HP())[0]);
        commandMap.put("RDP_MST_HP2", StringUtil.splitPhoneNumber(oneSelfCheck.getONE_SELF_HP())[1]);
        commandMap.put("RDP_MST_HP3", StringUtil.splitPhoneNumber(oneSelfCheck.getONE_SELF_HP())[2]);

        // 공통코드
        List<String> codeList = new ArrayList<>();
        codeList.add("PLANNER_SUBJECT"); // 홍보사이트 주제
        mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "planner.join.step2.form");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : joinStep2Reapply
     * 2. ClassName  : PlannerJoinController.java
     * 3. Comment    : 플래너 가입 > (2/5) 재신청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.join.step2.reapply}", method = RequestMethod.POST)
    public ModelAndView joinStep2Reapply(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 기존 정보 조회
        Map<String, Object> info = this.plannerJoinService.selectPlannerReapplyInfoByPlannerNo(commandMap);
        commandMap.putAll(info);

        // 본인확인 정보 저장
        OneSelfCheck oneSelfCheck = new OneSelfCheck();
        oneSelfCheck.setONE_SELF_CI(StringUtil.getString(info, "RDP_MST_CI", ""));
        oneSelfCheck.setONE_SELF_NM(StringUtil.getString(info, "RDP_MST_MEM_NM", ""));
        oneSelfCheck.setONE_SELF_HP(StringUtil.getString(info, "RDP_MST_HP1", "") + StringUtil.getString(info, "RDP_MST_HP2", "") + StringUtil.getString(info, "RDP_MST_HP3", ""));
        SessionsPlanner.setOneSelfCheck(request, oneSelfCheck);

        // 반려 상태가 아닌 경우 플래너 로그인 페이지로 이동 
        int RDP_MST_STATE = StringUtil.getInt(commandMap, "RDP_MST_STATE", -1);
        if (RDP_MST_STATE == Code.PLANNER_STATE_REJECT) {

            // 공통코드
            List<String> codeList = new ArrayList<>();
            codeList.add("PLANNER_SUBJECT"); // 홍보사이트 주제
            mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

            mv.addObject("commandMap", commandMap);
            setViewName(mv, "planner.join.step2.form");
        } else {

            mv.addObject("alertMsg", "플래너 신청이 완료었습니다.");
            setResultView(mv, "planner.login.form");
        }

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : joinStep2Apply
     * 2. ClassName  : PlannerJoinController.java
     * 3. Comment    : 플래너 가입 > (2/5) 플래너 신청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.join.step2.apply}", method = RequestMethod.POST)
    public ModelAndView joinStep2Apply(HttpServletRequest request, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 본인확인 여부 확인
        if (SessionsPlanner.hasOneSelfCheck(request) == false) {
            mv.addObject("alertMsg", "본인확인 후 신청 할 수 있습니다.");
            setResultView(mv, "planner.join.step1.form");
            return mv;
        }

        int result = 0;

        // 플래너 번호 확인
        String RDP_MST_NO = StringUtil.getString(commandMap, "RDP_MST_NO", "");
        if (StringUtils.isNotEmpty(RDP_MST_NO)) {

            // 이메일 중복 확인 - 재신청인 경우 본인 이메일 제외
            if (this.plannerJoinService.checkDuplicateEmail(commandMap) > 0) {
                mv.addObject("alertMsg", "이미 사용중인 이메일입니다.");
                mv.addObject("commandMap", commandMap);
                setResultView(mv, "planner.join.step2.form");
                return mv;
            }

            // 재신청
            result = this.plannerJoinService.updateApplyPlanner(request, commandMap);

        } else {

            OneSelfCheck oneSelfCheck = SessionsPlanner.getOneSelfCheck(request);

            // 가입 여부 확인
            commandMap.put("RDP_MST_CI", oneSelfCheck.getONE_SELF_CI());
            if (this.plannerJoinService.checkDuplicateCi(commandMap) > 0) {
                mv.addObject("alertMsg", "이미 가입된 사용자입니다.");
                setResultView(mv, "planner.join.step1.form");
                return mv;
            }

            // 이메일 중복 확인 - 재신청인 경우 본인 이메일 제외
            if (this.plannerJoinService.checkDuplicateEmail(commandMap) > 0) {
                mv.addObject("alertMsg", "이미 사용중인 이메일입니다.");
                mv.addObject("commandMap", commandMap);
                setResultView(mv, "planner.join.step2.form");
                return mv;
            }

            // 본인인증 정보 추가
            commandMap.put("RDP_MST_CI", oneSelfCheck.getONE_SELF_CI());
            commandMap.put("RDP_MST_MEM_NM", oneSelfCheck.getONE_SELF_NM());
            commandMap.put("RDP_MST_HP1", StringUtil.splitPhoneNumber(oneSelfCheck.getONE_SELF_HP())[0]);
            commandMap.put("RDP_MST_HP2", StringUtil.splitPhoneNumber(oneSelfCheck.getONE_SELF_HP())[1]);
            commandMap.put("RDP_MST_HP3", StringUtil.splitPhoneNumber(oneSelfCheck.getONE_SELF_HP())[2]);

            // 신청
            result = this.plannerJoinService.insertApplyPlanner(request, commandMap);

        }

        if (result > 0) {
            redirect.addAttribute("plannerNo", StringUtil.getString(commandMap, "RDP_MST_NO"));
            setRedirectView(mv, "planner.join.step3.form");
        } else {
            mv.addObject("commandMap", commandMap);
            mv.addObject("alertMsg", "플래너 신청이 실패하였습니다.");
            setResultView(mv, "planner.join.step2.form");
        }

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : joinStep3
     * 2. ClassName  : PlannerJoinController.java
     * 3. Comment    : 플래너 가입 > (3/5) 신청 완료
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.join.step3.form}", method = RequestMethod.GET)
    public ModelAndView joinStep3(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 번호 확인
        String plannerNo = StringUtil.getString(commandMap, "plannerNo", "");
        if (StringUtils.isEmpty(plannerNo)) {

            // 오류 - 로그인 페이지로
            mv.addObject("alertMsg", "플래너 번호가 잘못되었습니다.");
            setResultView(mv, "planner.login.form");
            return mv;
        }

        mv.addObject("info", this.plannerJoinService.selectApplyPlannerInfo(plannerNo));

        setViewName(mv, "planner.join.step3.form");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : joinStep4
     * 2. ClassName  : PlannerJoinController.java
     * 3. Comment    : 플래너 가입 > (4/5) 추가정보 입력
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.join.step4.form}")
    public ModelAndView joinStep4(HttpServletRequest request, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 번호 확인
        String plannerNo = StringUtil.getString(commandMap, "plannerNo", "");
        if (StringUtils.isEmpty(plannerNo)) {

            // 오류 - 로그인 페이지로
            mv.addObject("alertMsg", "플래너 번호가 잘못되었습니다.");
            setResultView(mv, "planner.login.form");
            return mv;
        }

        // 신청 플래너 정보 조회
        Map<String, Object> info = this.plannerJoinService.selectApplyPlannerInfo(plannerNo);

        // 플래너 상태에 따른 분기
        int RDP_MST_STATE = StringUtil.getInt(info, "RDP_MST_STATE", -1);
        if (Code.PLANNER_STATE_APPROVAL == RDP_MST_STATE) {

            // SCI 실명확인 서비스번호
            if (DeviceUtil.isMobile()) {
                mv.addObject("sciServiceNo", this.sciPropertiesService.getString("sci.name.check.service.number.planner.join.mobile"));
            } else {
                mv.addObject("sciServiceNo", this.sciPropertiesService.getString("sci.name.check.service.number.planner.join.pc"));
            }

            // 공통코드
            List<String> codeList = new ArrayList<>();
            codeList.add("PLANNER_BUSINESS_CLASS"); // 사업자 유형 그룹
            codeList.add("INICIS_BANK_CODE"); // 은행 코드
            mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

            commandMap.putAll(info);

            // 승인 - 추가정보 입력 페이지로
            mv.addObject("commandMap", commandMap);
            setViewName(mv, "planner.join.step4.form");

        } else if (Code.PLANNER_STATE_INACTIVE == RDP_MST_STATE) {

            // 활동대기 - 교육이수 페이지로
            redirect.addAttribute("plannerNo", plannerNo);
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

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : updateAdditionalInfo
     * 2. ClassName  : PlannerJoinController.java
     * 3. Comment    : 플래너 가입 > 추가정보 입력 (4/5) 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.join.step4.updateInfo}", method = RequestMethod.POST)
    public ModelAndView updateAdditionalInfo(HttpServletRequest request, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 아이디 중복 확인
        if (this.plannerJoinService.checkDuplicateId(commandMap) > 0) {
            mv.addObject("alertMsg", "이미 사용중인 아이디입니다.");
            mv.addObject("commandMap", commandMap);
            setResultView(mv, "planner.join.step4.form");
            return mv;
        }

        // 추가정보 업데이트
        int result = this.plannerJoinService.updateApplyPlannerAdditionalInfo(request, commandMap); // 재신청
        if (result > 0) {
            redirect.addAttribute("plannerNo", StringUtil.getString(commandMap, "RDP_MST_NO"));
            setRedirectView(mv, "planner.join.step5.form");
        } else {
            mv.addObject("commandMap", commandMap);
            mv.addObject("alertMsg", "플래너 신청이 실패하였습니다.");
            setResultView(mv, "planner.join.step4.form");
        }

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : joinStep5
     * 2. ClassName  : PlannerJoinController.java
     * 3. Comment    : 플래너 가입 > (5/5) 교육 이수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.join.step5.form}")
    public ModelAndView joinStep5(HttpServletRequest request, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 번호 확인
        String plannerNo = StringUtil.getString(commandMap, "plannerNo", "");
        if (StringUtils.isEmpty(plannerNo)) {

            // 오류 - 로그인 페이지로
            mv.addObject("alertMsg", "플래너 번호가 잘못되었습니다.");
            setResultView(mv, "planner.login.form");
            return mv;
        }

        // 신청 플래너 정보 조회
        Map<String, Object> info = this.plannerJoinService.selectApplyPlannerInfo(plannerNo);

        // 플래너 상태에 따른 분기
        int RDP_MST_STATE = StringUtil.getInt(info, "RDP_MST_STATE", -1);
        if (Code.PLANNER_STATE_APPROVAL == RDP_MST_STATE) {

            // 승인 - 추가정보 입력 페이지로
            redirect.addAttribute("plannerNo", plannerNo);
            setRedirectView(mv, "planner.join.step4.form");
        } else if (Code.PLANNER_STATE_INACTIVE == RDP_MST_STATE) {

            // 활동대기 - 교육이수 페이지로
            mv.addObject("info", info);
            mv.addObject("groupList", this.plannerJoinService.selectPlannerQuizGroupList());
            setViewName(mv, "planner.join.step5.form");
        } else if (Code.PLANNER_STATE_ACTIVE == RDP_MST_STATE || Code.PLANNER_STATE_STOP == RDP_MST_STATE || Code.PLANNER_STATE_REQUEST_RELEASE == RDP_MST_STATE) {

            // 정상, 정지, 해제요청 - 로그인 페이지로
            mv.addObject("alertMsg", "아이디/비밀번호로 로그인해 주세요.");
            setResultView(mv, "planner.login.form");
        } else {

            // 오류 - 로그인 페이지로
            mv.addObject("alertMsg", "플래너 번호가 잘못되었습니다.");
            setResultView(mv, "planner.login.form");
        }

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : updateQuizComplete
     * 2. ClassName  : PlannerJoinController.java
     * 3. Comment    : 플래너 가입 > 교육이수 완료
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 4.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.join.step5.updateQuiz}", method = RequestMethod.POST)
    public ModelAndView updateQuizComplete(HttpServletRequest request, HttpServletResponse response, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 교육이수 정보 업데이트 및 활동플래너로 상태 변경
        int result = this.plannerJoinService.updateApplyPlannerQuizComplete(request, commandMap);
        if (result > 0) {

            // 로그인 처리
            this.plannerLoginService.plannerLoginProc(request, response, commandMap);

            // 마이페이지 - 캠페인 생성 페이지로 이동
            setRedirectView(mv, "myplanner.campaign.product.list");
        } else {
            mv.addObject("commandMap", commandMap);
            mv.addObject("alertMsg", "교육 이수가 실패하였습니다.");
            setResultView(mv, "planner.join.step5.form");
        }

        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : checkIdDuplicateAjax
     * 2. ClassName  : PlannerJoinController.java
     * 3. Comment    : 아이디 중복 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.join.checkIdDuplicate.ajax}")
    public JSON checkIdDuplicateAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.addObject("isSuccess", this.plannerJoinService.checkDuplicateId(commandMap) == 0);
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : checkSiteDuplicate
     * 2. ClassName  : PlannerJoinController.java
     * 3. Comment    : 아이디 중복 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${planner.join.checkSiteDuplicate.ajax}")
    public JSON checkSiteDuplicate(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.addObject("isSuccess", this.plannerJoinService.checkDuplicateSite(commandMap) == 0);
        return json;
    }

}