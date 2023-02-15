package web.fr.mycontract.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessRole;
import common.annotation.CommandMap;
import common.code.Code;
import common.model.User.ROLE_USER;
import common.support.ControllerSupport;
import common.util.DeviceUtil;
import web.fr.display.service.BannerDisplayService;
import web.fr.mycontract.service.MyContractCommonService;

@Controller
public class MyContractShippingController extends ControllerSupport {

    @Resource(name = "myContractCommonService")
    MyContractCommonService myContractCommonService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    /**
     * <pre>
     * 1. MethodName : index
     * 2. ClassName  : MyContractShippingController.java
     * 3. Comment    : 배송/지원혜택 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.shipping.list.view}")
    public ModelAndView shippingListView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
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
        setViewName(mv, "mycontract.shipping.list.view");
        return mv;
    }

    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.shipping.benefit.view.layer}")
    public ModelAndView benefitViewLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 지원혜택 조회
        mv.addObject("info", this.myContractCommonService.selectContractBenefit(request, commandMap));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.shipping.benefit.view.layer");
        return mv;
    }

    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.shipping.shipping.view.layer}")
    public ModelAndView shippingViewLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 배송 조회
        mv.addObject("info", this.myContractCommonService.selectContractShipping(request, commandMap));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.shipping.shipping.view.layer");
        return mv;
    }
}
