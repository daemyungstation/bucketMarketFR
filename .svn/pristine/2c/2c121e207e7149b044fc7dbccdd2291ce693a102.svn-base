package web.fr.common.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.support.ControllerSupport;
import common.util.StringUtil;

@Controller
public class CommonErrorController extends ControllerSupport {

    /**
     * <pre>
     * 1. MethodName : errorNotFund
     * 2. ClassName  : CommonErrorController.java
     * 3. Comment    : 404 ERROR 핸들링
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${common.error.not.found}")
    public ModelAndView errorNotFund() throws Exception {
        ModelAndView mv = new ModelAndView();
        setCommonViewName(mv, "common.error.not.found");
        return mv;
    }
    /**
     * <pre>
     * 1. MethodName : error
     * 2. ClassName  : CommonErrorController.java
     * 3. Comment    : 500 ERROR 핸들링
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${common.error.default}")
    public ModelAndView defaultError() throws Exception {
        ModelAndView mv = new ModelAndView();
        setCommonViewName(mv, "common.error.default");
        return mv;
    }
    /**
     * <pre>
     * 1. MethodName : errorAuthentication
     * 2. ClassName  : CommonErrorController.java
     * 3. Comment    : 로그인 세션 만료 ERROR 핸들링
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${common.error.authentication}")
    public ModelAndView errorAuthentication(@CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> exception = new HashMap<>();
        exception.put("key", StringUtil.getString(commandMap, "key"));
        exception.put("params", StringUtil.getString(commandMap, "params"));
        mv.addObject("exception", exception);
        setCommonViewName(mv, "common.error.authentication");
        return mv;
    } 
}
