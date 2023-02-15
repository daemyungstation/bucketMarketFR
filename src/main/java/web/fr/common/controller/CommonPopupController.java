package web.fr.common.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.support.ControllerSupport;

@Controller
public class CommonPopupController extends ControllerSupport {

    
    /**
     * <pre>
     * 1. MethodName : basicProductSearchLayer
     * 2. ClassName  : CommonPopupController.java
     * 3. Comment    : 본인인증 요청 팝업
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 20.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${common.oneself.req.popup}", method = RequestMethod.GET)
    public ModelAndView basicProductSearchLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "common.oneself.req.popup");
        return mv;
    }
    
}
