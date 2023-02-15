package web.fr.product.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.util.IPUtil;
import web.fr.product.service.ProductQnAService;

@Service("productQnAService")
public class ProductQnAServiceImpl implements ProductQnAService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectProductQnAListCount
     * 2. ClassName  : ProductQnAServiceImpl.java
     * 3. Comment    : 프론트 > 상품상세 > QNA > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @see web.fr.product.service.ProductQnAService#selectProductQnAListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectProductQnAListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("ProductQnA.selectProductQnAListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectProductQnAList
     * 2. ClassName  : ProductQnAServiceImpl.java
     * 3. Comment    : 프론트 > 상품상세 > QNA > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @see web.fr.product.service.ProductQnAService#selectProductQnAList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductQnAList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("ProductQnA.selectProductQnAList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : insertProductQnA
     * 2. ClassName  : ProductQnAServiceImpl.java
     * 3. Comment    : 프론트 > 상품상세 > QNA > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @see web.fr.product.service.ProductQnAService#insertProductQnA(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertProductQnA(Map<String, Object> commandMap) throws Exception {
        commandMap.put("PRD_QNA_REG_IP", IPUtil.getClientIP());
        return defaultDAO.insert("ProductQnA.insertProductQnA", commandMap);
    }
}
