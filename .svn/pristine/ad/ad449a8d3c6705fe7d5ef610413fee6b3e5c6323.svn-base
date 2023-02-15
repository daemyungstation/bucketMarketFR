package web.fr.mycontract.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessRole;
import common.annotation.CommandMap;
import common.code.Code;
import common.model.User.ROLE_USER;
import common.support.ControllerSupport;
import common.util.DeviceUtil;
import common.viewer.JSON;
import web.fr.display.service.BannerDisplayService;
import web.fr.mycontract.service.MyContractCommonService;

/**
 * <pre>
 * &#64;PackageName: web.fr.mycontract.controller
 * &#64;FileName : MyContractLifeServiceController.java
 * &#64;Date : 2020. 5. 28.
 * &#64;프로그램 설명 : 라이프 서비스
 * &#64;author upleat
 * </pre>
 */
@Controller
public class MyContractLifeServiceController extends ControllerSupport {

    @Resource(name = "myContractCommonService")
    private MyContractCommonService myContractCommonService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    /**
     * <pre>
     * 1. MethodName : lifeServiceListView
     * 2. ClassName  : MyContractLifeServiceController.java
     * 3. Comment    : 라이프 서비스 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.lifeservice.list.view}")
    public ModelAndView lifeServiceListView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 상태가 '가입'인 계약만 조회
        commandMap.put("searchContractStatus", Code.CONTRACT_STATUS_JOIN);

        // 목록
        mv.addObject("list", this.myContractCommonService.selectContractList(request, commandMap));

        // 배너
        if (DeviceUtil.isNormal()) {
            mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_MY_CONTRACT"));
        }

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.lifeservice.list.view");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : lifeServiceApplyLayer
     * 2. ClassName  : MyContractLifeServiceController.java
     * 3. Comment    : 라이프서비스 변경 (layer)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.lifeservice.apply.layer}")
    public ModelAndView lifeServiceApplyLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 가입내역 정보
        mv.addObject("info", this.myContractCommonService.selectContractInfo(request, commandMap));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.lifeservice.apply.layer");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : lifeServiceApplyAjax
     * 2. ClassName  : MyContractLifeServiceController.java
     * 3. Comment    : 라이프서비스 변경 (ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.lifeservice.apply.ajax}", method = RequestMethod.POST)
    public JSON lifeServiceApplyAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", this.myContractCommonService.insertLifeService(request, commandMap) > 0);
        return json;
    }
}
