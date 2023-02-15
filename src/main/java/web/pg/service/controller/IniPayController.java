package web.pg.service.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessRole;
import common.annotation.CommandMap;
import common.model.User.ROLE_USER;
import common.support.ControllerSupport;
import common.util.DeviceUtil;
import common.viewer.JSON;
import web.pg.service.IniPayService;

@Controller
@AccessRole(value=ROLE_USER.contractor)
public class IniPayController extends ControllerSupport {

    @Resource(name="iniPayService")
    private IniPayService inipayService;

    /**
     * <pre>
     * 1. MethodName : requestLayer
     * 2. ClassName  : IniPayController.java
     * 3. Comment    : 프론트 > Payment Gate > 인증 요청 Layer
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${pg.request.layer}", method=RequestMethod.POST)
    public ModelAndView requestLayer(@CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("info", this.inipayService.insertIniPayReq(commandMap));
        this.setPgViewName(mv, "pg.request.layer");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : requestAjax
     * 2. ClassName  : IniPayController.java
     * 3. Comment    : 프론트 > Payment Gate > 인증 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${pg.request.ajax}", method=RequestMethod.POST)
    public JSON requestAjax(@CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("info", this.inipayService.insertIniPayReq(commandMap));
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : requestResult
     * 2. ClassName  : IniPayController.java
     * 3. Comment    : 프론트 > Payment Gate > 인증 결과 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value={"${pg.request.pc.result}", "${pg.request.mb.result}"})
    public ModelAndView requestResult(@CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("result", this.inipayService.insertIniPayReqResult(commandMap));
        if (DeviceUtil.isNormal()) {
            this.setPgViewName(mv, "pg.request.pc.result");
        } else {
            this.setPgViewName(mv, "pg.request.mb.result");
        }
        return mv;
    }
}