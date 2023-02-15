package web.fr.myplanner.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.support.ControllerSupport;
import web.fr.display.service.BannerDisplayService;

/**
 * <pre>
 * &#64;PackageName: web.fr.myplanner.controller
 * &#64;FileName : MyPlannerMainController.java
 * &#64;Date : 2020. 5. 14.
 * &#64;프로그램 설명 : 활용 가이드
 * &#64;author upleat
 * </pre>
 */
@Controller
public class MyPlannerGuideController extends ControllerSupport {

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    /**
     * <pre>
     * 1. MethodName : applicationGuideView
     * 2. ClassName  : MyPlannerGuideController.java
     * 3. Comment    : 활용 가이드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${myplanner.application.guide.view}")
    public ModelAndView applicationGuideView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 배너
        mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_READY_PLANNER"));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.application.guide.view");
        return mv;
    }

}
