package web.fr.common.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.code.Product;
import common.model.Paging;
import common.support.ControllerSupport;
import common.util.DeviceUtil;
import common.util.StringUtil;
import web.fr.common.service.CommonSearchService;
import web.fr.display.service.KeywordDisplayService;
import web.fr.product.service.BasicProductService;

@Controller
public class CommonSearchController extends ControllerSupport {

    @Resource(name="keywordDisplayService")
    private KeywordDisplayService keywordDisplayService;
    
    @Resource(name="basicProductService")
    private BasicProductService basicProductService;
    
    @Resource(name="commonSearchService")
    private CommonSearchService commonSearchService;
    
    /**
     * <pre>
     * 1. MethodName : searchList
     * 2. ClassName  : CommonSearchController.java
     * 3. Comment    : 프론트 > 검색 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${common.search.list}", method=RequestMethod.GET)
    public ModelAndView searchList(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (!DeviceUtil.isNormal() &&
                "".equals(StringUtil.getString(commandMap, "searchPrdMstNm", "")) &&
                "".equals(StringUtil.getString(commandMap, "searchPrdMstKwd", ""))) {
            String [] searchPrdMstNoArray = commonSearchService.getLatelyBasicProductNoArray();
            if (searchPrdMstNoArray.length > 0) {
                commandMap.put("searchPrdMstNoArray", searchPrdMstNoArray);
                int totalCount = basicProductService.selectBasicProductListCount(commandMap);
                mv.addObject("totalCount", totalCount);
                mv.addObject("paging", new Paging(totalCount, commandMap));
                if (totalCount > 0) {
                    mv.addObject("list", basicProductService.selectBasicProductList(commandMap));
                }
            }
            mv.addObject("keywordList", keywordDisplayService.selectKeywordDisplayList(commandMap));
        } else {
            commandMap.put("prdMstOdr", StringUtil.getString(commandMap, "prdMstOdr", Product.ORDER_BY_HIT_CNT_DESC));
            int totalCount = basicProductService.selectBasicProductListCount(commandMap);
            mv.addObject("totalCount", totalCount);
            mv.addObject("paging", new Paging(totalCount, commandMap));
            if (totalCount > 0) {
                mv.addObject("list", basicProductService.selectBasicProductList(commandMap));
            } else {
                mv.addObject("keywordList", keywordDisplayService.selectKeywordDisplayList(commandMap));
            }
        }
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "common.search.list");
        return mv;
    }
}
