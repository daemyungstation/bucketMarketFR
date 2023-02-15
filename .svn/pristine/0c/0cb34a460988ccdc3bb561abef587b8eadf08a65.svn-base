package web.fr.display.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import common.model.Planner;
import common.session.SessionsPlanner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.code.Code;
import common.support.ControllerSupport;
import common.util.StringUtil;
import web.fr.common.service.CommonService;
import web.fr.display.service.ProductDisplayService;

@Controller
public class ProductDisplayController extends ControllerSupport {

    @Resource(name="productDisplayService")
    private ProductDisplayService productDisplayService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    /**
     * <pre>
     * 1. MethodName : productDisplayList
     * 2. ClassName  : ProductDisplayController.java
     * 3. Comment    : 프론트 > 베스트 랭킹 > 전시 상품 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${display.product.list}", method=RequestMethod.GET)
    public ModelAndView productDisplayList(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        Map<String, String[]> seoMetaMap = Code.SEO;
        String[] seoMeta = (String[]) seoMetaMap.get("bestranking");
        mv.addObject("seoMeta", seoMeta);
        //List<Map<String, Object>> codeList = commonService.selectCode("DISPLAY_PRODUCT_BEST_AREA_CODE");        
        List<Map<String, Object>> codeList = productDisplayService.selectCategroyListByBestProduct("DISPLAY_PRODUCT_BEST_AREA_CODE");
        mv.addObject("codeList", codeList);

        Planner sessionPlanner = SessionsPlanner.getSessionPlanner(request);
        if( sessionPlanner != null ) {
            commandMap.put("PRP_RDP_MST_NO", sessionPlanner.getRDP_MST_NO());
        }
        commandMap.put("searchCmnComIdx", StringUtil.getInt(commandMap, "searchCmnComIdx", Code.DISPLAY_PRODUCT_BEST_AREA_DEFAULT));
        mv.addObject("list", productDisplayService.selectProductDisplayList(commandMap));
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "display.product.list");
        return mv;
    }
}
