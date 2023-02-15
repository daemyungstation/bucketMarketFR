package web.fr.board.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.model.Paging;
import common.support.ControllerSupport;
import common.util.DeviceUtil;
import common.viewer.JSON;
import web.fr.board.service.FaqBoardService;
import web.fr.common.service.CommonService;

@Controller
public class FaqBoardController extends ControllerSupport {

    @Resource(name="faqBoardService")
    private FaqBoardService faqBoardService;
    
    @Resource(name="commonService")
    private CommonService commonService;

    /**
     * <pre>
     * 1. MethodName : faqBoardList
     * 2. ClassName  : FaqBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > FAQ > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.faq.list}", method=RequestMethod.GET)
    public ModelAndView faqBoardList(@CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 문의 유형 리스트
        mv.addObject("codeList", this.commonService.selectCode("QUESTION_TYPE_CODE"));
        if (DeviceUtil.isNormal()) {
            int totalCount = this.faqBoardService.selectFaqBoardListCount(commandMap);
            mv.addObject("totalCount", totalCount);
            mv.addObject("paging", new Paging(totalCount, commandMap));
        } else if (DeviceUtil.isMobile()) {
            // 2020.07.20 김혁 
            // - 모바일인 경우 파라미터 삭제
            // 모바일 페이지에서는 모든 FAQ 를 가져와서 탭 형식으로 출력하고 있음. 
            // 레디플래너에서 FAQ를 호출 하는 경우 레디플래너 FAQ 만 조회되어 다른 탭의 FAQ가 나오지 않음
            mv.addObject("searchBrdCmnComIdx", commandMap.get("searchBrdCmnComIdx"));
            commandMap.put("searchBrdCmnComIdx", "");
        }
        // FAQ 목록
        mv.addObject("list", this.faqBoardService.selectFaqBoardList(commandMap));
        mv.addObject("commandMap", commandMap);
        this.setViewName(mv, "board.faq.list");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : faqBoardReadCntModifyAjax
     * 2. ClassName  : FaqBoardController.java
     * 3. Comment    : 프론트 > 고객센터 > FAQ > 조회수 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${board.faq.readcnt.modify.ajax}", method=RequestMethod.POST)
    public JSON faqBoardReadCntModifyAjax(@CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", (this.faqBoardService.updateFaqBoardReadCount(commandMap) > 0));
        return json;
    }
}
