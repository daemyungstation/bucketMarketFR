package web.fr.board.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.code.Code;
import common.support.ControllerSupport;
import common.viewer.JSON;
import web.fr.board.service.ContactUsBoardService;
import web.fr.common.service.CommonService;

@Controller
public class ContactUsBoardController extends ControllerSupport {

    @Resource(name="contactUsBoardService")
    private ContactUsBoardService contactUsBoardService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    /**
     * <pre>
     * 1. MethodName : contactUsForm
     * 2. ClassName  : ContactUsBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > 제휴문의 > 등록 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 18.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.contact.us.form}", method=RequestMethod.GET)
    public ModelAndView contactUsForm(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        commandMap.put("AGR_MST_GBN", Code.TERM_PERSONAL_INFORMATION_USE_BASIC);
        mv.addObject("termInfo", commonService.selectCommonTermInfo(commandMap).get("term"));
        setViewName(mv, "board.contact.us.form");
        return mv;
    } 
    
    /**
     * <pre>
     * 1. MethodName : contactUsRegistAjax
     * 2. ClassName  : ContactUsBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > 제휴문의 > 등록  (ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 18.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.contact.us.registAjax}", method=RequestMethod.POST)
    public JSON contactUsRegistAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", contactUsBoardService.insertContactUsBoard((MultipartHttpServletRequest) request, commandMap) > 0);
        return json;
    } 
}
