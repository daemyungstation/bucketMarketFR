package web.fr.product.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.fr.product.service.ProductTemplateService;

@Service("productTemplateService")
public class ProductTemplateServiceImpl implements ProductTemplateService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectProductTemplateTypeInfo
     * 2. ClassName  : ProductTemplateServiceImpl.java
     * 3. Comment    : 프론트 > 상품템플릿 > 상품유형소개 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectProductTemplateTypeInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("ProductTemplate.selectProductTemplateTypeInfo", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectProductTemplateLifeServiceList
     * 2. ClassName  : ProductTemplateServiceImpl.java
     * 3. Comment    : 프론트 > 상품템플릿 > 라이프서비스 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductTemplateLifeServiceList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("ProductTemplate.selectProductTemplateLifeServiceList", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectProductTemplateMembershipInfo
     * 2. ClassName  : ProductTemplateServiceImpl.java
     * 3. Comment    : 프론트 > 상품템플릿 > 멤버쉽 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @see web.fr.product.service.ProductTemplateService#selectProductTemplateMembershipInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectProductTemplateMembershipInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("ProductTemplate.selectProductTemplateMembershipInfo", commandMap);
    }
}
