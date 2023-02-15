package web.fr.display.service;

import java.util.List;
import java.util.Map;

public interface KeywordDisplayService {
    
    /**
     * <pre>
     * 1. MethodName : selectKeywordDisplayList
     * 2. ClassName  : KeywordDisplayService.java
     * 3. Comment    : 프론트 > 검색 > 인기키워드 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectKeywordDisplayList(Map<String, Object> commandMap) throws Exception;

}
