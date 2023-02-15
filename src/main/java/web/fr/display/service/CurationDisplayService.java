package web.fr.display.service;

import java.util.List;
import java.util.Map;
public interface CurationDisplayService {

    /**
     * <pre>
     * 1. MethodName : selectCurationDisplayList
     * 2. ClassName  : CurationDisplayService.java
     * 3. Comment    : 프론트 > 큐레이션 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCurationDisplayList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCurationDisplayKeywordList
     * 2. ClassName  : CurationDisplayService.java
     * 3. Comment    : 프론트 > 큐레이션 > 키워드 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCurationDisplayKeywordList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertCurationDisplayHistory
     * 2. ClassName  : CurationDisplayService.java
     * 3. Comment    : 프론트 > 큐레이션 > 선택 키워드 히스토리 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertCurationDisplayHistory(Map<String, Object> commandMap) throws Exception;
}
