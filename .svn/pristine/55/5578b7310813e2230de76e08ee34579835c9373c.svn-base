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

/**
 * <pre>
 * &#64;PackageName: web.fr.mycontract.controller
 * &#64;FileName : MyContractPaymentController.java
 * &#64;Date : 2020. 6. 2.
 * &#64;프로그램 설명 : 납입/환급금 조회
 * &#64;author upleat
 * </pre>
 */
@Controller
public class MyContractPaymentController extends ControllerSupport {

    @Resource(name = "myContractCommonService")
    private MyContractCommonService myContractCommonService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    /**
     * <pre>
     * 1. MethodName : index
     * 2. ClassName  : MyContractPaymentController.java
     * 3. Comment    : 납입/환급금 조회 목록
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
    @RequestMapping(value = "${mycontract.paymentrefund.list.view}")
    public ModelAndView paymentListView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
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
        setViewName(mv, "mycontract.paymentrefund.list.view");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : index
     * 2. ClassName  : MyContractPaymentController.java
     * 3. Comment    : 납입상세 (layer)
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
    @RequestMapping(value = "${mycontract.paymentrefund.detail.view.layer}")
    public ModelAndView paymentDetailViewLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 납입/환급 정보 조회
        mv.addObject("info", this.myContractCommonService.selectPaymentInfo(request, commandMap));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.paymentrefund.detail.view.layer");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : index
     * 2. ClassName  : MyContractPaymentController.java
     * 3. Comment    : 환급금 조회 (layer)
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
    @RequestMapping(value = "${mycontract.paymentrefund.refund.view.layer}")
    public ModelAndView paymentRefundViewLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 납입/환급 정보 조회
        mv.addObject("info", this.myContractCommonService.selectPaymentInfo(request, commandMap));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.paymentrefund.refund.view.layer");
        return mv;
    }
}
