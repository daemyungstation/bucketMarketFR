package web.fr.display.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.fr.display.service.KeywordDisplayService;

@Service("keywordDisplayService")
public class KeywordDisplayServiceImpl implements KeywordDisplayService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectKeywordDisplayList
     * 2. ClassName  : KeywordDisplayServiceImpl.java
     * 3. Comment    : 프론트 > 검색 > 인기키워드 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectKeywordDisplayList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("KeywordDisplay.selectKeywordDisplayList", commandMap);
    }
    
}
