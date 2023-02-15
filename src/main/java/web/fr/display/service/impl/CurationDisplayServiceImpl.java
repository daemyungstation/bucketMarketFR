package web.fr.display.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.fr.display.service.CurationDisplayService;

@Service("curationDisplayService")
public class CurationDisplayServiceImpl implements CurationDisplayService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectCurationDisplayList
     * 2. ClassName  : CurationDisplayServiceImpl.java
     * 3. Comment    : 프론트 > 큐레이션 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 30.
     * </pre>
     *
     * @see web.bo.display.service.CurationDisplayService#selectCurationDisplayList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCurationDisplayList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("CurationDisplay.selectCurationDisplayList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCurationDisplayKeywordList
     * 2. ClassName  : CurationDisplayServiceImpl.java
     * 3. Comment    : 프론트 > 큐레이션 > 키워드 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @see web.fr.display.service.CurationDisplayService#selectCurationDisplayKeywordList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCurationDisplayKeywordList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("CurationDisplay.selectCurationDisplayKeywordList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : insertCurationDisplayHistory
     * 2. ClassName  : CurationDisplayServiceImpl.java
     * 3. Comment    : 프론트 > 큐레이션 > 선택 키워드 히스토리 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 8.
     * </pre>
     *
     * @see web.fr.display.service.CurationDisplayService#insertCurationDisplayHistory(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertCurationDisplayHistory(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.insert("CurationDisplay.insertCurationDisplayHistory", commandMap);
    }
}
