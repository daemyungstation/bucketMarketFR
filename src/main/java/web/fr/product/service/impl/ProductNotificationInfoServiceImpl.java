package web.fr.product.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.fr.product.service.ProductNotificationInfoService;

@Service("productNotificationInfoService")
public class ProductNotificationInfoServiceImpl implements ProductNotificationInfoService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectProductNotificationInfoList
     * 2. ClassName  : ProductNotificationInfoServiceImpl.java
     * 3. Comment    : 프론트 > 상품  > 고시정보 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @see web.fr.product.service.ProductNotificationInfoService#selectProductNotificationInfoList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectProductNotificationInfoList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("ProductNotificationInfo.selectProductNotificationInfoList", commandMap);
    }
    
}
