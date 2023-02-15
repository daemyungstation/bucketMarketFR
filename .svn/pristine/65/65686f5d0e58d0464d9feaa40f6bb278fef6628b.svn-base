package web.fr.display.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import common.annotation.CommandMap;
import common.session.SessionsCategory;
import common.util.DeviceUtil;
import common.viewer.JSON;
import web.fr.display.service.CategoryProductDisplayService;

@Controller
public class CategoryProductDisplayController {

    @Resource(name="categoryProductDisplayService")
    private CategoryProductDisplayService categoryProductDisplayService;
    
    /**
     * <pre>
     * 1. MethodName : categoryProductDisplayListAjax
     * 2. ClassName  : CategoryProductDisplayController.java
     * 3. Comment    : 프론트 > 전시 > 카테고리 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${display.category.product.list.ajax}", method=RequestMethod.POST)
    public JSON categoryProductDisplayListAjax (@CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        List<Map<String, Object>> list = null;
        if (SessionsCategory.isEmpty()) {
            if (DeviceUtil.isNormal()) {
                list = categoryProductDisplayService.selectCategoryProductDisplayHierarchicalList(commandMap);
            } else {
                commandMap.put("PRD_CTG_UP_IDX", "0");
                list = categoryProductDisplayService.selectCategoryProductDisplayList(commandMap);
            }
            SessionsCategory.setSessionCategory(list);
        } else {
            list = SessionsCategory.getSessionCategory();
        }
        json.put("list", list);
        return json;
    } 
    
}
