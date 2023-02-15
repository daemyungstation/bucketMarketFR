package web.fr.contents.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.support.ControllerSupport;
import common.util.DeviceUtil;
import web.fr.display.service.BannerDisplayService;
import web.fr.product.service.BasicProductService;

@Controller
public class IntroductionController extends ControllerSupport {

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;
    
    @Resource(name = "basicProductService")
    private BasicProductService basicProductService;
    
    @RequestMapping(value="${contents.introduction.view}", method=RequestMethod.GET)
    public ModelAndView introductionView(HttpServletRequest request, HttpServletResponse response, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (DeviceUtil.isNormal()) {
            // TOP 배너
            mv.addObject("top", this.bannerDisplayService.selectBannerDisplayList("BANNER_MAIN_TOP"));
        } 
        
//        String[] PRD_MST_NOs = {"DMBK2020073000760147", "DMBK2020072900630069", "DMBK2020111601610162", "DMBK2020121401630165"};
        String[] PRD_MST_NOs = {"DMBK2020073000760147", "DMBK2021070502550256","DMBK2020072900630069", "DMBK2020121401630165","DMBK2020111601610162", "DMBK2021102702570258"};
//        String[] PRD_MST_NOs_top = {"DMBK2020072900630069", "DMBK2020073000760147"};
        String[] PRD_MST_NOs_top = {"DMBK2020072900630069", "DMBK2020073000760147","DMBK2020072900630069", "DMBK2020073000760147"};
        List<Map<String, Object>> productList = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> productList_top = new ArrayList<Map<String, Object>>();
        for(String PRD_MST_NO : PRD_MST_NOs) {
            Map<String, Object> cmdMap = new HashMap<String, Object>();
            Map<String, Object> product = new HashMap<String, Object>();
            
            cmdMap.put("PRD_MST_NO", PRD_MST_NO);
            product.put("product", basicProductService.selectBasicProductInfo(request, response, cmdMap));
            productList.add(product);
        }
        for(String PRD_MST_NO_top : PRD_MST_NOs_top) {
            Map<String, Object> cmdMap = new HashMap<String, Object>();
            Map<String, Object> product_top = new HashMap<String, Object>();
            
            cmdMap.put("PRD_MST_NO", PRD_MST_NO_top);
            product_top.put("product_top", basicProductService.selectBasicProductInfo(request, response, cmdMap));
            productList_top.add(product_top);
        }
        mv.addObject("productList",  productList);
        mv.addObject("productList_top",  productList_top);
        
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "contents.introduction.view");
        return mv;
    }
    
}
