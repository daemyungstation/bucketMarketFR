package web.fr.product.service;

import java.util.List;
import java.util.Map;

public interface ProductQnAService {

    
    /**
     * <pre>
     * 1. MethodName : selectProductQnAListCount
     * 2. ClassName  : ProductQnAService.java
     * 3. Comment    : 프론트 > 상품상세 > QNA > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectProductQnAListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectProductQnAList
     * 2. ClassName  : ProductQnAService.java
     * 3. Comment    : 프론트 > 상품상세 > QNA > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectProductQnAList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertProductQnA
     * 2. ClassName  : ProductQnAService.java
     * 3. Comment    : 프론트 > 상품상세 > QNA > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertProductQnA(Map<String, Object> commandMap) throws Exception;
    
}
