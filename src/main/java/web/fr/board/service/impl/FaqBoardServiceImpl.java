package web.fr.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.fr.board.service.FaqBoardService;

@Service("faqBoardService")
public class FaqBoardServiceImpl implements FaqBoardService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectFaqBoardListCount
     * 2. ClassName  : FaqBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > FAQ > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @see web.fr.board.service.FaqBoardService#selectFaqBoardListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectFaqBoardListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("FaqBoard.selectFaqBoardListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectFaqBoardList
     * 2. ClassName  : FaqBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > FAQ > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @see web.fr.board.service.FaqBoardService#selectFaqBoardList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectFaqBoardList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("FaqBoard.selectFaqBoardList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updateFaqBoardReadCount
     * 2. ClassName  : FaqBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > FAQ > 조회수 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @see web.fr.board.service.FaqBoardService#updateFaqBoardReadCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateFaqBoardReadCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.update("FaqBoard.updateFaqBoardReadCount", commandMap);
    }
}
