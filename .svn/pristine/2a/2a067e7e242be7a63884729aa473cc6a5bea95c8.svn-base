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
import common.session.SessionsUser;
import common.support.ControllerSupport;
import common.viewer.JSON;
import web.fr.board.service.CommentBoardService;
import web.fr.common.service.CommonService;

@Controller
public class CommentBoardController extends ControllerSupport {

    @Resource(name="commentBoardService")
    private CommentBoardService commentBoardService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    
    /**
     * <pre>
     * 1. MethodName : commentBoardList
     * 2. ClassName  : CommentBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > 가입후기 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 18.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.comment.list}", method=RequestMethod.GET)
    public ModelAndView commentBoardList(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        commandMap.put("searchPrdRevBstYn", "Y");
        int totalCount = commentBoardService.selectCommentBoardListCount(commandMap);
        mv.addObject("totalCount", totalCount);
        mv.addObject("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            mv.addObject("list", commentBoardService.selectCommentBoardList(commandMap));
        }
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "board.comment.list");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : commentBoardListLayer
     * 2. ClassName  : CommentBoardController.java
     * 3. Comment    : 프론트 > 상품상세 > 가입후기 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.comment.list.layer}", method=RequestMethod.POST)
    public ModelAndView commentBoardListLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        SessionsUser.setSessionClear(request);
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "board.comment.list.layer");
        return mv;
    }
    
    
    /**
     * <pre>
     * 1. MethodName : commentBoardListAjax
     * 2. ClassName  : CommentBoardController.java
     * 3. Comment    : 프론트 > 상품상세 > 가입후기 > 목록 (Ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.comment.list.ajax}", method=RequestMethod.POST)
    public JSON commentBoardListAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        int totalCount = commentBoardService.selectCommentBoardListCount(commandMap);
        json.put("totalCount", totalCount);
        json.put("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            json.put("list", commentBoardService.selectCommentBoardList(commandMap));
        }
        return json;
    }
}
