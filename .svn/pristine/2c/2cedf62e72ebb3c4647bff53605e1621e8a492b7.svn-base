package web.fr.board.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.code.Code;
import common.model.Paging;
import common.support.ControllerSupport;
import common.util.DeviceUtil;
import common.viewer.JSON;
import web.fr.board.service.InquiryBoardService;
import web.fr.common.service.CommonService;

@Controller
public class InquiryBoardController extends ControllerSupport {

    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name="inquiryBoardService")
    private InquiryBoardService inquiryBoardService;
    
    /**
     * <pre>
     * 1. MethodName : inquiryForm
     * 2. ClassName  : InquiryBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 등록 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.inquiry.form}", method=RequestMethod.GET)
    public ModelAndView inquiryForm(@CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.addObject("codeList", commonService.selectCode("QUESTION_TYPE_CODE"));
        commandMap.put("AGR_MST_GBN", Code.TERM_PERSONAL_INFORMATION_USE_BASIC);
        mv.addObject("termInfo", commonService.selectCommonTermInfo(commandMap).get("term"));
        this.setViewName(mv, "board.inquiry.form");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : inquiryRegistAjax
     * 2. ClassName  : InquiryBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.inquiry.regist.ajax}", method=RequestMethod.POST)
    public JSON inquiryRegistAjax(@CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", inquiryBoardService.insertInquiryBoard(commandMap) > 0);
        return json;
    }
    /**
     * <pre>
     * 1. MethodName : inquiryLoginAjax
     * 2. ClassName  : InquiryBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 로그인 (ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.inquiry.login.ajax}", method=RequestMethod.POST)
    public JSON inquiryLoginAjax(@CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", inquiryBoardService.selectInquiryBoardListCount(commandMap) > 0);
        return json;
    }
    /**
     * <pre>
     * 1. MethodName : inquiryBoardListAjax
     * 2. ClassName  : InquiryBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 목록 (ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.inquiry.list.ajax}", method=RequestMethod.POST)
    public JSON inquiryBoardListAjax(@CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        if (DeviceUtil.isNormal()) {
            int totalCount = inquiryBoardService.selectInquiryBoardListCount(commandMap);
            json.put("totalCount", totalCount);
            json.put("paging", new Paging(totalCount, commandMap));
        }
        json.put("list", inquiryBoardService.selectInquiryBoardList(commandMap));
        return json;
    }
    /**
     * <pre>
     * 1. MethodName : inquiryBoardReadCntModifyAjax
     * 2. ClassName  : InquiryBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 조회수 수정 (ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.inquiry.readcnt.modify.ajax}", method=RequestMethod.POST)
    public JSON inquiryBoardReadCntModifyAjax(@CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", inquiryBoardService.updateInquiryBoardReadCount(commandMap) > 0);
        return json;
    }
}
