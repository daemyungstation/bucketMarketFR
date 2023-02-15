package web.fr.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import web.fr.board.service.CommentBoardService;

@Service("commentBoardService")
public class CommentBoardServiceImpl implements CommentBoardService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    
    /**
     * <pre>
     * 1. MethodName : selectCommentBoardListCount
     * 2. ClassName  : CommentBoardServiceImpl.java
     * 3. Comment    : 프론트 > 상품 상세/마이페이지 > 가입후기 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 28.
     * </pre>
     *
     * @see web.fr.board.service.CommentBoardService#selectCommentBoardListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommentBoardListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("CommentBoard.selectCommentBoardListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCommentBoardList
     * 2. ClassName  : CommentBoardServiceImpl.java
     * 3. Comment    : 프론트 > 상품 상세/마이페이지 > 가입후기 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 28.
     * </pre>
     *
     * @see web.fr.board.service.CommentBoardService#selectCommentBoardList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCommentBoardList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("CommentBoard.selectCommentBoardList", commandMap);
    }

}
