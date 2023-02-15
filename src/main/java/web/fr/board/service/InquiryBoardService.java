package web.fr.board.service;

import java.util.List;
import java.util.Map;

public interface InquiryBoardService {

    /**
     * <pre>
     * 1. MethodName : insertInquiryBoard
     * 2. ClassName  : InquiryBoardService.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertInquiryBoard(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectInquiryBoardListCount
     * 2. ClassName  : InquiryBoardService.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectInquiryBoardListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectInquiryBoardList
     * 2. ClassName  : InquiryBoardService.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectInquiryBoardList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : updateInquiryBoardReadCount
     * 2. ClassName  : InquiryBoardService.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 목록 > 조회수 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateInquiryBoardReadCount(Map<String, Object> commandMap) throws Exception;
}