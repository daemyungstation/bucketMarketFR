package web.fr.myplanner.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import common.session.SessionsPlanner;
import common.support.ControllerSupport;
import common.viewer.JSON;
import web.fr.display.service.BannerDisplayService;
import web.fr.myplanner.service.MyPlannerCommunityService;

/**
 * <pre>
 * &#64;PackageName: web.fr.myplanner.controller
 * &#64;FileName : MyPlannerCommunityController.java
 * &#64;Date : 2020. 5. 14.
 * &#64;프로그램 설명 : 플래너 커뮤니티
 * &#64;author upleat
 * </pre>
 */
@Controller
public class MyPlannerCommunityController extends ControllerSupport {

    @Resource(name = "myPlannerCommunityService")
    private MyPlannerCommunityService myPlannerCommunityService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    /**
     * <pre>
     * 1. MethodName : communityList
     * 2. ClassName  : MyPlannerCommunityController.java
     * 3. Comment    : 커뮤니티 목록
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
    @RequestMapping(value = "${myplanner.community.list}", method = RequestMethod.GET)
    public ModelAndView communityList(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 배너
        mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_READY_PLANNER"));

        // 플래너 정보
        mv.addObject("planner", SessionsPlanner.getSessionPlanner(request));

        // 목록 개수
        int totalCount = myPlannerCommunityService.selectCommunityListCount(commandMap);
        // 페이징
        mv.addObject("paging", new Paging(totalCount, commandMap));
        mv.addObject("totalCount", totalCount);
        // 목록
        if (totalCount > 0) {
            mv.addObject("list", myPlannerCommunityService.selectCommunityList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.community.list");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : communityView
     * 2. ClassName  : MyPlannerCommunityController.java
     * 3. Comment    : 커뮤니티 상세
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
    @RequestMapping(value = "${myplanner.community.view}", method = RequestMethod.GET)
    public ModelAndView communityView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 배너
        mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_READY_PLANNER"));

        // 플래너 정보
        mv.addObject("planner", SessionsPlanner.getSessionPlanner(request));

        int result = myPlannerCommunityService.updateCommunityReadCount(commandMap);
        if (result > 0) {
            mv.addAllObjects(myPlannerCommunityService.selectCommunityInfo(commandMap));
            mv.addObject("commandMap", commandMap);
            setViewName(mv, "myplanner.community.view");
        } else {
            mv.addObject("alertMsg", "글을 찾을 수 없습니다.");
            mv.addObject("commandMap", commandMap);
            setResultView(mv, "myplanner.community.list");
        }
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : communityFormLayer
     * 2. ClassName  : MyPlannerCommunityController.java
     * 3. Comment    : 커뮤니티 등록 레이어
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
    @RequestMapping(value = "${myplanner.community.form.layer}")
    public ModelAndView communityFormLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 정보
        mv.addObject("planner", SessionsPlanner.getSessionPlanner(request));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.community.form.layer");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : communityFormView
     * 2. ClassName  : MyPlannerCommunityController.java
     * 3. Comment    : 커뮤니티 등록 폼
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
    @RequestMapping(value = "${myplanner.community.form.page}")
    public ModelAndView communityFormForm(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 정보
        mv.addObject("planner", SessionsPlanner.getSessionPlanner(request));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.community.form.page");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : communityFormAjax
     * 2. ClassName  : MyPlannerCommunityController.java
     * 3. Comment    : 커뮤니티 등록 요청
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
    @RequestMapping(value = "${myplanner.community.form.ajax}", method = RequestMethod.POST)
    public JSON communityFormAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", this.myPlannerCommunityService.insertCommunity(request, commandMap) > 0);
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : communityEditLayer
     * 2. ClassName  : MyPlannerCommunityController.java
     * 3. Comment    : 커뮤니티 수정 레이어
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
    @RequestMapping(value = "${myplanner.community.edit.layer}")
    public ModelAndView communityEditLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 정보
        mv.addObject("planner", SessionsPlanner.getSessionPlanner(request));

        // 커뮤니티 상세
        mv.addAllObjects(myPlannerCommunityService.selectCommunityInfo(commandMap));

        // 작성일
        mv.addObject("today", LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.community.edit.layer");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : communityEditForm
     * 2. ClassName  : MyPlannerCommunityController.java
     * 3. Comment    : 커뮤니티 수정 폼
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
    @RequestMapping(value = "${myplanner.community.edit.page}")
    public ModelAndView communityEditForm(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 플래너 정보
        mv.addObject("planner", SessionsPlanner.getSessionPlanner(request));

        // 커뮤니티 상세
        mv.addAllObjects(myPlannerCommunityService.selectCommunityInfo(commandMap));

        // 작성일
        mv.addObject("today", LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy.MM.dd")));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "myplanner.community.edit.page");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : communityEditAjax
     * 2. ClassName  : MyPlannerCommunityController.java
     * 3. Comment    : 커뮤니티 수정 요청
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
    @RequestMapping(value = "${myplanner.community.edit.ajax}", method = RequestMethod.POST)
    public JSON communityEditAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", this.myPlannerCommunityService.updateCommunity(request, commandMap) > 0);
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : communityRemoveAjax
     * 2. ClassName  : MyPlannerCommunityController.java
     * 3. Comment    : 커뮤니티 삭제 요청
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
    @RequestMapping(value = "${myplanner.community.remove.ajax}", method = RequestMethod.POST)
    public JSON communityRemoveAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", this.myPlannerCommunityService.deleteCommunity(request, commandMap) > 0);
        return json;
    }

}
