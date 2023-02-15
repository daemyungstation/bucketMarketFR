package web.fr.contents.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.support.ControllerSupport;

@Controller
public class TermsController extends ControllerSupport {

    @RequestMapping(value="${contents.terms.use.view}", method=RequestMethod.GET)
    public ModelAndView useTermsView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "contents.terms.use.view");
        return mv;
    }
    
    @RequestMapping(value="${contents.terms.privacy.view}", method=RequestMethod.GET)
    public ModelAndView privacyTermsView(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "contents.terms.privacy.view");
        return mv;
    }
    
}
