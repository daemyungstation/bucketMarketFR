package web.fr.mycontract.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import common.annotation.CommandMap;
import common.model.User;
import common.session.SessionsUser;
import common.support.ControllerSupport;
import common.util.DeviceUtil;
import web.fr.contract.service.ContractService;
import web.fr.display.service.BannerDisplayService;
import web.fr.dlcc.service.DlccService;

/**
 * <pre>
 * &#64;PackageName: web.fr.mycontract.controller
 * &#64;FileName : MyContractMainController.java
 * &#64;Date : 2020. 5. 27.
 * &#64;프로그램 설명 : 마이계약 메인
 * &#64;author upleat
 * </pre>
 */
@Controller
public class MyContractIndexController extends ControllerSupport {

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    @Resource(name = "dlccService")
    private DlccService dlccService;

    @Resource(name = "contractService")
    private ContractService contractService;

    /**
     * <pre>
     * 1. MethodName : index
     * 2. ClassName  : MyContractIndexController.java
     * 3. Comment    : 메인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${mycontract.index}")
    public ModelAndView index(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // PC 의 경우 메인 페이지 없음. 가입내역 조회 페이지로 이동
        if (DeviceUtil.isNormal()) {
            setRedirectView(mv, "mycontract.info.list.view");
            return mv;
        }

        // 로그인 사용자 확인
        User user = SessionsUser.getSessionUser(request);
        if (user != null && StringUtils.isNotBlank(user.getUSER_CI())) {
            mv.addObject("info", user);
        }

        // 배너
        mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_MY_CONTRACT"));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.index");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : logout
     * 2. ClassName  : MyContractIndexController.java
     * 3. Comment    : 본인확인 안내
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27.
     * </pre>
     *
     * @param request
     * @param response
     * @param commandMap
     * @param redirect
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${mycontract.oneself.form}")
    public ModelAndView oneselfForm(HttpServletRequest request, HttpServletResponse response, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 로그인 삭제
        // SessionsUser.setSessionClear(request);

        // 배너
        if (DeviceUtil.isNormal()) {
            mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_MY_CONTRACT"));
        }

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.oneself.form");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : logout
     * 2. ClassName  : MyContractIndexController.java
     * 3. Comment    : 로그아웃
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27.
     * </pre>
     *
     * @param request
     * @param response
     * @param commandMap
     * @param redirect
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${mycontract.logout}")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, @CommandMap Map<String, Object> commandMap, RedirectAttributes redirect) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 로그아웃
        SessionsUser.setSessionClear(request);

        // 마이계약 메인으로
        setRedirectView(mv, "mycontract.index");

        return mv;
    }

}
