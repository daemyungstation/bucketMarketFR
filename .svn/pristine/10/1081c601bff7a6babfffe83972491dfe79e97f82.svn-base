package web.fr.myplanner.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessPlannerRole;
import common.annotation.CommandMap;
import common.model.Planner.ROLE_PLANNER;
import common.support.ControllerSupport;
import common.viewer.JSON;
import web.fr.display.service.BannerDisplayService;
import web.fr.myplanner.service.MyPlannerPaymentService;
import web.fr.planner.service.PlannerCommonService;

/**
 * <pre>
 * &#64;PackageName: web.fr.myplanner.controller
 * &#64;FileName : MyPlannerMainController.java
 * &#64;Date : 2020. 5. 14.
 * &#64;프로그램 설명 : 마이플래너 정산 및 지급
 * &#64;author upleat
 * </pre>
 */
@Controller
public class MyPlannerPaymentController extends ControllerSupport {

    @Resource(name = "plannerCommonService")
    private PlannerCommonService plannerCommonService;

    @Resource(name = "myPlannerPaymentService")
    private MyPlannerPaymentService myPlannerPaymentService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    /**
     * <pre>
     * 1. MethodName : performanceView
     * 2. ClassName  : MyPlannerPerformanceController.java
     * 3. Comment    : 지급내역 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.payment.view}", method = RequestMethod.GET)
    public ModelAndView performanceList(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 배너
        mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_READY_PLANNER"));

        setViewName(mv, "myplanner.payment.view");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : paymentListAjax
     * 2. ClassName  : MyPlannerPaymentController.java
     * 3. Comment    : 년도별 지급내역 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 11.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.payment.list.ajax}", method = RequestMethod.POST)
    public JSON paymentListAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.addObject("list", this.myPlannerPaymentService.selectPaymentList(commandMap));
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : performanceView
     * 2. ClassName  : MyPlannerPaymentController.java
     * 3. Comment    : 지급내역 상세
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 10.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.payment.detail.layer}")
    public ModelAndView performanceView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        mv.addObject("summary", this.myPlannerPaymentService.selectPaymentDetailSummary(commandMap));
        mv.addObject("list", this.myPlannerPaymentService.selectPaymentDetailList(commandMap));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.payment.detail.layer");
        return mv;
    }
}
