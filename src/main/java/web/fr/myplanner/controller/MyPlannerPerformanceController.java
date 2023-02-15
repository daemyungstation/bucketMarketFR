package web.fr.myplanner.controller;

import java.util.ArrayList;
import java.util.List;
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
import common.util.DateUtil;
import common.viewer.EXCEL;
import common.viewer.JSON;
import web.fr.display.service.BannerDisplayService;
import web.fr.myplanner.service.MyPlannerPerformanceService;
import web.fr.planner.service.PlannerCommonService;

/**
 * <pre>
 * &#64;PackageName: web.fr.myplanner.controller
 * &#64;FileName : MyPlannerMainController.java
 * &#64;Date : 2020. 5. 14.
 * &#64;프로그램 설명 : 마이플래너 실적
 * &#64;author upleat
 * #529
 * </pre>
 */
@Controller
public class MyPlannerPerformanceController extends ControllerSupport {

    @Resource(name = "plannerCommonService")
    private PlannerCommonService plannerCommonService;

    @Resource(name = "myPlannerPerformanceService")
    private MyPlannerPerformanceService myPlannerPerformanceService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    /**
     * <pre>
     * 1. MethodName : performanceView
     * 2. ClassName  : MyPlannerPerformanceController.java
     * 3. Comment    : 실적 조회
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
    @RequestMapping(value = "${myplanner.performance.view}", method = RequestMethod.GET)
    public ModelAndView performanceView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 배너
        mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_READY_PLANNER"));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.performance.view");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : performanceDailyListAjax
     * 2. ClassName  : MyPlannerPerformanceController.java
     * 3. Comment    : 실적 조회 - 일별 (ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.performance.daily.list.ajax}", method = RequestMethod.POST)
    public JSON performanceDailyListAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.addAllObjects(this.myPlannerPerformanceService.selectPerformanceByDaily(commandMap));
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : performanceDailyMonthlyAjax
     * 2. ClassName  : MyPlannerPerformanceController.java
     * 3. Comment    : 실적 조회 - 월별 (ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.performance.monthly.list.ajax}", method = RequestMethod.POST)
    public JSON performanceDailyMonthlyAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.addAllObjects(this.myPlannerPerformanceService.selectPerformanceByMonthly(commandMap));
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : performanceDailyListAjax
     * 2. ClassName  : MyPlannerPerformanceController.java
     * 3. Comment    : 실적 조회 - 상품별 (ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.performance.product.list.ajax}", method = RequestMethod.POST)
    public JSON performanceProductListAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.addAllObjects(this.myPlannerPerformanceService.selectPerformanceByProduct(commandMap));
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : performanceProductHistory
     * 2. ClassName  : MyPlannerPerformanceController.java
     * 3. Comment    : 실적 조회 - 상품별 히스토리
     * 4. 작성자       : Inuscommunity
     * 5. 작성일       : 2022. 2. 05.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.performance.product.history}")
    public ModelAndView performanceProductHistory(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        
        List<Map<String, Object>> list = this.myPlannerPerformanceService.selectPerformanceByProductHistory(commandMap);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        setViewName(mv, "myplanner.performance.product.history");
        return mv;
    }  
    
    /**
     * <pre>
     * 1. MethodName : performanceProductCousel
     * 2. ClassName  : MyPlannerPerformanceController.java
     * 3. Comment    : 실적 조회 - 주문별 상담내역
     * 4. 작성자       : Inuscommunity
     * 5. 작성일       : 2022. 2. 06.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.performance.product.counsel}")
    public ModelAndView performanceProductCounsel(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        
        List<Map<String, Object>> list = this.myPlannerPerformanceService.selectPerformanceByProductCounsel(commandMap);
        mv.addObject("commandMap", commandMap);
        mv.addObject("list", list);
        
        setViewName(mv, "myplanner.performance.product.counsel");
        return mv;
    }  
    
    /**
     * <pre>
     * 1. MethodName : performanceProductDown
     * 2. ClassName  : MyPlannerPerformanceController.java
     * 3. Comment    : 실적 조회 - 상품별 다운로드
     * 4. 작성자       : Inuscommunity
     * 5. 작성일       : 2022. 2. 04.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.performance.product.down}", method = RequestMethod.GET)
    public EXCEL performanceProductDown(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        EXCEL excel = new EXCEL();
        List<Map<String, Object>> list = this.myPlannerPerformanceService.selectPerformanceByProductDown(commandMap);
        if (list != null) {
            excel.put("fileName", "My_Performance_Status_" + DateUtil.getCurrentDateTime());
            List<String[]> column = new ArrayList<>();
            column.add(new String[] { "NO", "RNUM", "String", "50" });
            column.add(new String[] { "가입자명", "MEM_NM", "String", "50" });
            column.add(new String[] { "연락처", "CELL", "String", "50" });
            column.add(new String[] { "온라인상품명", "PRD_MST_NM", "String", "100" });
            column.add(new String[] { "접수일자", "RECEIPT_DT", "String", "100" });
            column.add(new String[] { "가입대기일자", "WAITING_TO_JOIN_DT", "String", "100" });
            column.add(new String[] { "가입일자", "JOIN_DT", "String", "100" });
            column.add(new String[] { "해약일자", "CANCEL_DT", "String", "100" });
            column.add(new String[] { "가입상태", "JOIN_STATE_NM", "String", "50" });
            column.add(new String[] { "상담메모", "COUNSELL_MEMO", "String", "50" });
            excel.put("headerTitle", column.stream().map(a -> a[0]).toArray(String[]::new));
            excel.put("cellField", column.stream().map(a -> a[1]).toArray(String[]::new));
            excel.put("cellType", column.stream().map(a -> a[2]).toArray(String[]::new));
            excel.put("colSize", column.stream().map(a -> a[3]).toArray(String[]::new));
            excel.put("list", list);
        }
        return excel;
    }  
}
