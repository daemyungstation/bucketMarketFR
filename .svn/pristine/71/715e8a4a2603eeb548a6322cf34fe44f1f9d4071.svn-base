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
 * &#64;FileName : MyContractMembershipController.java
 * &#64;Date : 2020. 6. 1.
 * &#64;프로그램 설명 : 맴버십 카드
 * &#64;author upleat
 * </pre>
 */
@Controller
public class MyContractMembershipController extends ControllerSupport {

    @Resource(name = "myContractCommonService")
    private MyContractCommonService myContractCommonService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    /**
     * <pre>
     * 1. MethodName : membershipListView
     * 2. ClassName  : MyContractMembershipController.java
     * 3. Comment    : 맴버십 카드 목록
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
    @RequestMapping(value = "${mycontract.membership.list.view}")
    public ModelAndView membershipListView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
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
        setViewName(mv, "mycontract.membership.list.view");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : membershipViewLayer
     * 2. ClassName  : MyContractMembershipController.java
     * 3. Comment    : 맴버십 카드 상세 (layer)
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
    @RequestMapping(value = "${mycontract.membership.view.layer}")
    public ModelAndView membershipViewLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 가입내역 정보
        mv.addObject("info", this.myContractCommonService.selectContractDetail(request, commandMap));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.membership.view.layer");
        return mv;
    }
}
