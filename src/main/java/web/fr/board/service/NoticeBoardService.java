package web.fr.board.service;

import java.util.List;
import java.util.Map;

public interface NoticeBoardService {

    /**
     * <pre>
     * 1. MethodName : selectNoticeBoardListCount
     * 2. ClassName  : NoticeBoardService.java
     * 3. Comment    : 프론트 > 고객센터 > 공지사항 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectNoticeBoardListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectNoticeBoardList
     * 2. ClassName  : NoticeBoardService.java
     * 3. Comment    : 프론트 > 고객센터 > 공지사항 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectNoticeBoardList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectNoticeBoardInfo
     * 2. ClassName  : NoticeBoardService.java
     * 3. Comment    : 프론트 > 고객센터 > 공지사항 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectNoticeBoardInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateNoticeBoardReadCount
     * 2. ClassName  : NoticeBoardService.java
     * 3. Comment    : 프론트 > 고객센터 > 공지사항 > 조회수 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateNoticeBoardReadCount(Map<String, Object> commandMap) throws Exception;
    
}
