package web.fr.display.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.code.Const;
import common.code.Product;
import common.dao.CommonDefaultDAO;
import common.exception.CustomHandleException;
import common.util.DeviceUtil;
import common.util.StringUtil;
import web.fr.display.service.CategoryProductDisplayService;

@Service("categoryProductDisplayService")
public class CategoryProductDisplayServiceImpl implements CategoryProductDisplayService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectCategoryProductDisplayHierarchicalList
     * 2. ClassName  : CategoryProductDisplayServiceImpl.java
     * 3. Comment    : 프론트 > 전시 > 카테고리 > 계층형 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 9.
     * </pre>
     *
     * @see web.fr.display.service.CategoryProductDisplayService#selectCategoryProductDisplayHierarchicalList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCategoryProductDisplayHierarchicalList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("CategoryProductDisplay.selectCategoryProductDisplayHierarchicalList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCategoryProductDisplayList
     * 2. ClassName  : CategoryProductDisplayServiceImpl.java
     * 3. Comment    : 프론트 > 전시 > 카테고리 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @see web.fr.display.service.CategoryProductDisplayService#selectCategoryProductDisplayList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCategoryProductDisplayList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("CategoryProductDisplay.selectCategoryProductDisplayList", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectCategoryProductDisplayKeywordList
     * 2. ClassName  : CategoryProductDisplayServiceImpl.java
     * 3. Comment    : 프론트 > 전시 > 카테고리 > 키워드 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @see web.fr.display.service.CategoryProductDisplayService#selectCategoryProductDisplayKeywordList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCategoryProductDisplayKeywordList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("CategoryProductDisplay.selectCategoryProductDisplayKeywordList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCategoryProductDisplayInfo
     * 2. ClassName  : CategoryProductDisplayServiceImpl.java
     * 3. Comment    : 프론트 > 전시 > 카테고리 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @see web.fr.display.service.CategoryProductDisplayService#selectCategoryProductDisplayInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCategoryProductDisplayInfo(Map<String, Object> commandMap, int level) throws Exception {
        if ("".equals(StringUtil.getString(commandMap, "PRD_CTG_IDX", ""))) {
            throw new CustomHandleException(Product.ERROR.E498);
        }
        Map<String, Object> returnMap = new HashMap<>();
        Map<String, Object> paramMap = new HashMap<>();
        String PRD_CTG_IDX = StringUtil.getString(commandMap, "PRD_CTG_IDX", "");
        paramMap.put("PRD_CTG_IDX", PRD_CTG_IDX);
        if (!DeviceUtil.isNormal()) {
            returnMap.put("categoryProductDisplayList", selectCategoryProductDisplayList(paramMap));
        }
        returnMap.put("categoryProductDisplayKeywordList", selectCategoryProductDisplayKeywordList(paramMap));
        if (level == Const.CATEGORY_TOP_LEVEL) {
            paramMap.clear();
            paramMap.put("PRD_CTG_UP_IDX", PRD_CTG_IDX);
            returnMap.put("categoryProductDisplaySubList", selectCategoryProductDisplayList(paramMap));
        }
        return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCategoryProductDisplayNaviInfo
     * 2. ClassName  : CategoryProductDisplayServiceImpl.java
     * 3. Comment    : 프론트 > 전시 > 카테고리 > 네비 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 9.
     * </pre>
     *
     * @see web.fr.display.service.CategoryProductDisplayService#selectCategoryProductDisplayNaviInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> selectCategoryProductDisplayNaviInfo(Map<String, Object> commandMap) throws Exception {
        if ("".equals(StringUtil.getString(commandMap, "PRD_CTG_IDX", ""))) {
            throw new CustomHandleException(Product.ERROR.E498);
        }
        Map<String, Object> returnMap = new HashMap<>();
        List<Map<String, Object>> naviList = (List<Map<String, Object>>) defaultDAO.selectList("CategoryProductDisplay.selectCategoryProductDisplayNaviList", commandMap);
        Map<String, Object> categoryProductDisplayNaviInfo = new HashMap<>();
        if (naviList != null) {
            if (naviList.size() > 0) {
                categoryProductDisplayNaviInfo = naviList.get(naviList.size() - 1);
            }
        }
        returnMap.put("categoryProductDisplayNaviInfo", categoryProductDisplayNaviInfo);
        if (DeviceUtil.isNormal()) {
            returnMap.put("categoryProductDisplayNaviList", naviList);
        }
        returnMap.put("categoryProductDisplayLevel", StringUtil.getInt(categoryProductDisplayNaviInfo, "PRD_CTG_LEVEL"));
        return returnMap;
    }
}
