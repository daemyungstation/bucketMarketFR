package web.fr.marketing.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface EventService {

    /**
     * <pre>
     * 1. MethodName : selectEventListCount
     * 2. ClassName  : EventService.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 8.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectEventListCount(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectEventList
     * 2. ClassName  : EventService.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectEventList(Map<String, Object> commandMap) throws Exception;
    /**
     * <pre>
     * 1. MethodName : selectEventInfo
     * 2. ClassName  : EventService.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectEventInfo(Map<String, Object> commandMap) throws Exception;
    /**
     * <pre>
     * 1. MethodName : selectEventReplyListCount
     * 2. ClassName  : EventService.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 댓글 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectEventReplyListCount(Map<String, Object> commandMap) throws Exception;
    /**
     * <pre>
     * 1. MethodName : selectEventReplyList
     * 2. ClassName  : EventService.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 댓글 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectEventReplyList(Map<String, Object> commandMap) throws Exception;
    /**
     * <pre>
     * 1. MethodName : insertEventReply
     * 2. ClassName  : EventService.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 댓글 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @parma request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertEventReply(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    /**
     * <pre>
     * 1. MethodName : selectEventReplyInfo
     * 2. ClassName  : EventService.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 댓글 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectEventReplyInfo(Map<String, Object> commandMap) throws Exception;
    /**
     * <pre>
     * 1. MethodName : updateEventReply
     * 2. ClassName  : EventService.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 댓글 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @parma request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateEventReply(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;
    /**
     * <pre>
     * 1. MethodName : updateEventReply
     * 2. ClassName  : EventService.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 댓글 > 삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateEventReply(Map<String, Object> commandMap) throws Exception;
}
