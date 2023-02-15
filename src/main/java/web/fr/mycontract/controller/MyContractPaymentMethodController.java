package web.fr.mycontract.controller;

import java.util.ArrayList;
import java.util.List;
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
import web.fr.common.service.CommonService;
import web.fr.display.service.BannerDisplayService;
import web.fr.mycontract.service.MyContractCommonService;

@Controller
public class MyContractPaymentMethodController extends ControllerSupport {

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "myContractCommonService")
    MyContractCommonService myContractCommonService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    /**
     * <pre>
     * 1. MethodName : index
     * 2. ClassName  : MyContractPaymentMethodController.java
     * 3. Comment    : 결제수단 변경 신청 목록
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
    @RequestMapping(value = "${mycontract.paymentmethod.list.view}")
    public ModelAndView index(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
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
        setViewName(mv, "mycontract.paymentmethod.list.view");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : paymentMethodCardLayer
     * 2. ClassName  : MyContractPaymentMethodController.java
     * 3. Comment    : 카드 결제정보 변경 (layer)
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
    @RequestMapping(value = "${mycontract.paymentmethod.card.layer}")
    public ModelAndView paymentMethodCardLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 공통코드
        List<String> codeList = new ArrayList<>();
        codeList.add("INICIS_CARD_CODE"); // 카드 코드
        codeList.add("CLAIM_PAYMENT_METHOD_PAY_DT"); // 납부일자
        codeList.add("HAPP_CALL"); // 해피콜 가능 시간
        mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

        // 가입내역 정보
        mv.addObject("info", this.myContractCommonService.selectContractInfo(request, commandMap));

        // 약관
        commandMap.put("AGR_MST_GBN", Code.TERM_CARD_WITHDRAWAL);
        mv.addObject("termInfo", this.commonService.selectCommonTermInfo(commandMap).get("term"));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.paymentmethod.card.layer");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : paymentMethodCardAjax
     * 2. ClassName  : MyContractPaymentMethodController.java
     * 3. Comment    : 카드 결제정보 변경 (ajax)
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
    @RequestMapping(value = "${mycontract.paymentmethod.card.ajax}", method = RequestMethod.POST)
    public JSON paymentMethodCardAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", this.myContractCommonService.insertCardPaymentMethodChange(request, commandMap) > 0);
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : paymentMethodCmsLayer
     * 2. ClassName  : MyContractPaymentMethodController.java
     * 3. Comment    : CMS 결제정보 변경 (layer)
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
    @RequestMapping(value = "${mycontract.paymentmethod.cms.layer}")
    public ModelAndView paymentMethodCmsLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 공통코드
        List<String> codeList = new ArrayList<>();
        codeList.add("INICIS_BANK_CODE"); // 은행 코드
        codeList.add("CLAIM_PAYMENT_METHOD_PAY_DT"); // 납부일자
        codeList.add("HAPP_CALL"); // 해피콜 가능 시간
        mv.addObject("codes", this.commonService.selectCodes(codeList.toArray(new String[codeList.size()])));

        // 가입내역 정보
        mv.addObject("info", this.myContractCommonService.selectContractInfo(request, commandMap));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.paymentmethod.cms.layer");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : paymentMethodCmsAjax
     * 2. ClassName  : MyContractPaymentMethodController.java
     * 3. Comment    : CMS 결제정보 변경 (ajax)
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
    @RequestMapping(value = "${mycontract.paymentmethod.cms.ajax}", method = RequestMethod.POST)
    public JSON paymentMethodCmsAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", this.myContractCommonService.insertCmsPaymentMethodChange(request, commandMap) > 0);
        return json;
    }
}
