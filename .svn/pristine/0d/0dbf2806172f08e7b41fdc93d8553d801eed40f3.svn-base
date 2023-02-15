package web.fr.board.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.model.Paging;
import common.support.ControllerSupport;
import web.fr.board.service.NoticeBoardService;

@Controller
public class NoticeBoardController extends ControllerSupport {
    
    @Resource(name="noticeBoardService")
    private NoticeBoardService noticeBoardService;
    
    private static final int TOP_NOTICE_COUNT = 5;
    
    /**
     * <pre>
     * 1. MethodName : noticeBoardList
     * 2. ClassName  : NoticeBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > 공지사항 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param device
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.notice.list}", method=RequestMethod.GET)
    public ModelAndView noticeBoardList(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        commandMap.put("BRD_NTS_TOP_YN", "Y");
        commandMap.put("startNum", 1);
        commandMap.put("endNum", TOP_NOTICE_COUNT);
        mv.addObject("topList", noticeBoardService.selectNoticeBoardList(commandMap));
        commandMap.put("BRD_NTS_TOP_YN", "");
        int totalCount = noticeBoardService.selectNoticeBoardListCount(commandMap);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        mv.addObject("totalCount", totalCount);
        if (totalCount > 0) {
            mv.addObject("list", noticeBoardService.selectNoticeBoardList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "board.notice.list");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : noticeBoardView
     * 2. ClassName  : NoticeBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > 공지사항 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @param device
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.notice.view}", method=RequestMethod.GET)
    public ModelAndView noticeBoardView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        int result = noticeBoardService.updateNoticeBoardReadCount(commandMap);
        if (result > 0) {
            mv.addAllObjects(noticeBoardService.selectNoticeBoardInfo(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "board.notice.view");
        return mv;
    }
}
