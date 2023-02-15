package web.fr.myplanner.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessPlannerRole;
import common.annotation.CommandMap;
import common.model.OneSelfCheck;
import common.model.Planner;
import common.model.Planner.ROLE_PLANNER;
import common.session.SessionsPlanner;
import common.support.ControllerSupport;
import common.util.StringUtil;
import common.viewer.JSON;
import web.fr.common.service.CommonService;
import web.fr.display.service.BannerDisplayService;
import web.fr.planner.service.PlannerCommonService;
import web.fr.planner.service.PlannerLoginService;

/**
 * <pre>
 * &#64;PackageName: web.fr.myplanner.controller
 * &#64;FileName : MyPlannerMainController.java
 * &#64;Date : 2020. 5. 14.
 * &#64;프로그램 설명 : 플래너 메인
 * &#64;author upleat
 * </pre>
 */
@Controller
public class MyPlannerProfileController extends ControllerSupport {

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "plannerCommonService")
    private PlannerCommonService plannerCommonService;

    @Resource(name = "plannerLoginService")
    private PlannerLoginService plannerLoginService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    /**
     * <pre>
     * 1. MethodName : mainView
     * 2. ClassName  : MyPlannerMainController.java
     * 3. Comment    : 마이플래너 메인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.profile.edit}")
    public ModelAndView profileEdit(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 배너
        mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_READY_PLANNER"));

        // 플래너 정보 조회
        mv.addObject("info", this.plannerCommonService.selectPlannerInfoByPlanner(SessionsPlanner.getSessionPlanner(request)));

        // 비밀번호 확인 여부
        boolean passwordCheck = SessionsPlanner.getProfilePasswordCheck(request);
        if (passwordCheck) {
            setViewName(mv, "myplanner.profile.edit");
        } else {
            // 비밀번호 확인 페이지로 이동
            setViewName(mv, "myplanner.profile.password.check.form");
        }

        mv.addObject("commandMap", commandMap);
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : profilePasswordCheck
     * 2. ClassName  : MyPlannerMainController.java
     * 3. Comment    : 비밀번호 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.profile.password.check.request}")
    public ModelAndView profilePasswordCheckRequest(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 배너
        mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_READY_PLANNER"));

        // 비밀번호 확인 여부 삭제
        SessionsPlanner.clearProfilePasswordCheck(request);

        // 플래너 정보 조회
        Map<String, Object> info = this.plannerCommonService.selectPlannerInfoByPlanner(SessionsPlanner.getSessionPlanner(request));

        // 비밀번호 확인
        String RDP_MST_PW = StringUtil.getString(commandMap, "RDP_MST_PW", "");
        String RDP_MST_PW_CHECK = StringUtil.getString(info, "RDP_MST_PW", "");
        if (StringUtils.isNotBlank(RDP_MST_PW) && RDP_MST_PW.equals(RDP_MST_PW_CHECK)) {
            // 비밀번호 확인 여부 저장 
            SessionsPlanner.setProfilePasswordCheck(request);
            // 플래너 프로필 페이지로 이동
            setRedirectView(mv, "myplanner.profile.edit");
        } else {
            // 비밀번호 확인 페이지로 이동
            mv.addObject("errorMessage", "비밀번호가 일치하지 않습니다.");
            setViewName(mv, "myplanner.profile.password.check.form");
        }
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : changePasswordFormLayer
     * 2. ClassName  : MyPlannerProfileController.java
     * 3. Comment    : 비밀번호 변경 레이어
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.change.password.form.layer}", method = RequestMethod.POST)
    public ModelAndView changePasswordFormLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.change.password.form.layer");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : changePasswordFormAjax
     * 2. ClassName  : MyPlannerProfileController.java
     * 3. Comment    : 비밀번호 변경 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.change.password.form.ajax}", method = RequestMethod.POST)
    public JSON changePasswordFormAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();

        // 플래너 조회
        Map<String, Object> info = this.plannerCommonService.selectPlannerInfoByPlanner(SessionsPlanner.getSessionPlanner(request));

        // 기존 비밀번호 확인
        String RDP_MST_PW_OLD = StringUtil.getString(commandMap, "RDP_MST_PW_OLD", "");
        String RDP_MST_PW_CHECK = StringUtil.getString(info, "RDP_MST_PW", "");
        if (StringUtils.isNotBlank(RDP_MST_PW_OLD) && RDP_MST_PW_OLD.equals(RDP_MST_PW_CHECK)) {

            // 비밀번호 변경
            json.put("isSuccess", this.plannerCommonService.updatePlannerPassword(request, commandMap) > 0);
        } else {

            // 실패 - 기존 비밀번호 오류
            json.put("isSuccess", false);
            json.put("message", "기존 비밀번호를 정확히 입력해주세요.");
        }

        return json;
    }

    /**
     * <pre>
     * 1. MethodName : profileImageUpload
     * 2. ClassName  : MyPlannerProfileController.java
     * 3. Comment    : 플래너 프로필 이미지 업로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.profile.image.upload.ajax}", method = RequestMethod.POST)
    public JSON profileImageUpload(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        int result = this.plannerCommonService.updatePlannerProfileImage((MultipartHttpServletRequest) request, commandMap);
        if (result > 0) {
            // 세션 갱신
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("RDP_MST_IDX", SessionsPlanner.getSessionPlanner(request).getRDP_MST_IDX());
            this.plannerLoginService.setPlannerSession(request, param);
        }
        json.put("isSuccess", result > 0);
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : changePhoneFormAjax
     * 2. ClassName  : MyPlannerProfileController.java
     * 3. Comment    : 연락처 변경 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.change.phone.form.ajax}", method = RequestMethod.POST)
    public JSON changePhoneFormAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();

        // 본인확인 여부 확인
        if (SessionsPlanner.hasOneSelfCheck(request) == false) {

            json.put("isSuccess", false);
            json.put("message", "본인확인이 필요합니다.");
        } else {

            // 본인확인 정보
            OneSelfCheck oneSelfCheck = SessionsPlanner.getOneSelfCheck(request);

            // 본인확인 여부 초기화
            SessionsPlanner.clearOneSelfCheck(request);

            // CI 값 비교
            Planner planner = SessionsPlanner.getSessionPlanner(request);
            if (oneSelfCheck.getONE_SELF_CI().equals(planner.getRDP_MST_CI())) {
                // 수정
                commandMap.put("RDP_MST_HP1", StringUtil.splitPhoneNumber(oneSelfCheck.getONE_SELF_HP())[0]);
                commandMap.put("RDP_MST_HP2", StringUtil.splitPhoneNumber(oneSelfCheck.getONE_SELF_HP())[1]);
                commandMap.put("RDP_MST_HP3", StringUtil.splitPhoneNumber(oneSelfCheck.getONE_SELF_HP())[2]);
                json.put("isSuccess", this.plannerCommonService.updatePlannerPhoneNumber(request, commandMap) > 0);
            } else {
                json.put("isSuccess", false);
                json.put("message", "본인의 휴대전화로만 변경 할 수 있습니다.");
            }
        }
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : changeBankFormLayer
     * 2. ClassName  : MyPlannerProfileController.java
     * 3. Comment    : 정산계좌 변경 레이어
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.change.bank.form.layer}", method = RequestMethod.POST)
    public ModelAndView changeBankFormLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 공통코드
        List<String> codeList = new ArrayList<>();
        codeList.add("INICIS_BANK_CODE"); // 은행 코드
        mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

        // 플래너 조회
        mv.addObject("info", this.plannerCommonService.selectPlannerInfoByPlanner(SessionsPlanner.getSessionPlanner(request)));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.change.bank.form.layer");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : changeBankFormAjax
     * 2. ClassName  : MyPlannerProfileController.java
     * 3. Comment    : 정산계좌 변경 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.change.bank.form.ajax}", method = RequestMethod.POST)
    public JSON changeBankFormAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", this.plannerCommonService.updatePlannerBankAccount(request, commandMap) > 0);
        return json;
    }

}
