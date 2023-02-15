package web.fr.display.controller;

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
import common.util.StringUtil;
import web.fr.display.service.CurationDisplayService;
import web.fr.product.service.BasicProductService;


@Controller
public class CurationDisplayController extends ControllerSupport {
    
    @Resource(name="curationDisplayService")
    private CurationDisplayService curationDisplayService;
    
    @Resource(name="basicProductService")
    private BasicProductService basicProductService;
    
    /**
     * <pre>
     * 1. MethodName : curationDisplayList
     * 2. ClassName  : CurationDisplayController.java
     * 3. Comment    : 프론트 > 큐레이션 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${display.curation.list}", method=RequestMethod.GET)
    public ModelAndView curationDisplayList(HttpServletRequest request, @CommandMap() Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        String [] searchCrtKwdIdxs = StringUtil.getArray(commandMap, "searchCrtKwdIdxs");
        commandMap.put("searchCrtKwdIdxs", searchCrtKwdIdxs);
        
        String [] searchCrtKwdIdxArys = StringUtil.getArray(commandMap, "searchCrtKwdIdxArys");
        String [][] searchCrtKwdIdxCmds = new String[searchCrtKwdIdxArys.length][]; 
        for(int i = 0; i < searchCrtKwdIdxArys.length; i++) {
            searchCrtKwdIdxCmds[i] = searchCrtKwdIdxArys[i].split(",");
        }
        commandMap.put("searchCrtKwdIdxArys", searchCrtKwdIdxCmds);
        
        if (searchCrtKwdIdxs.length == 0) {
            mv.addObject("curationList", curationDisplayService.selectCurationDisplayList(commandMap));
        } else {
            // 프론트 > 큐레이션 > 키워드 목록
            mv.addObject("curationKeywordList", curationDisplayService.selectCurationDisplayKeywordList(commandMap));
            // 프론트 > 큐레이션 > 선택 키워드 히스토리 > 등록
            curationDisplayService.insertCurationDisplayHistory(commandMap);
            int totalCount = basicProductService.selectBasicProductListCount(commandMap);
            mv.addObject("totalCount", totalCount);
            mv.addObject("paging", new Paging(totalCount, commandMap));
            if (totalCount > 0) {
                mv.addObject("list", basicProductService.selectBasicProductList(commandMap));
            }
        }
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "display.curation.list");
        return mv;
    }
}
