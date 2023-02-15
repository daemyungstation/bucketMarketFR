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
import common.model.Paging;
import common.model.Planner.ROLE_PLANNER;
import common.support.ControllerSupport;
import web.fr.display.service.BannerDisplayService;
import web.fr.myplanner.service.MyPlannerNoticeService;

/**
 * <pre>
 * &#64;PackageName: web.fr.myplanner.controller
 * &#64;FileName : MyPlannerMainController.java
 * &#64;Date : 2020. 5. 14.
 * &#64;프로그램 설명 : 플래너 공지사항
 * &#64;author upleat
 * </pre>
 */
@Controller
public class MyPlannerNoticeController extends ControllerSupport {

    @Resource(name = "myPlannerNoticeService")
    private MyPlannerNoticeService myPlannerNoticeService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    /**
     * <pre>
     * 1. MethodName : noticeList
     * 2. ClassName  : MyPlannerNoticeController.java
     * 3. Comment    : 공지사항 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.notice.list}", method = RequestMethod.GET)
    public ModelAndView noticeList(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 배너
        mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_READY_PLANNER"));

        // 상단
        commandMap.put("RDP_NTS_TOP_YN", "Y");
        mv.addObject("topList", myPlannerNoticeService.selectNoticeList(commandMap));

        // 하단
        commandMap.put("RDP_NTS_TOP_YN", "");
        // 목록 개수
        int totalCount = myPlannerNoticeService.selectNoticeListCount(commandMap);
        // 페이징
        mv.addObject("paging", new Paging(totalCount, commandMap));
        mv.addObject("totalCount", totalCount);
        // 하단 목록
        if (totalCount > 0) {
            mv.addObject("list", myPlannerNoticeService.selectNoticeList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.notice.list");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : noticeView
     * 2. ClassName  : MyPlannerNoticeController.java
     * 3. Comment    : 공지사항 상세
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessPlannerRole(ROLE_PLANNER.planner)
    @RequestMapping(value = "${myplanner.notice.view}", method = RequestMethod.GET)
    public ModelAndView noticeView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 배너
        mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_READY_PLANNER"));

        int result = myPlannerNoticeService.updateNoticeReadCount(commandMap);
        if (result > 0) {
            mv.addAllObjects(myPlannerNoticeService.selectNoticeInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.notice.view");
        return mv;
    }

}
