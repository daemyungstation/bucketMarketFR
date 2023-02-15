package web.fr.myplanner.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MyPlannerCommunityService {

    /**
     * <pre>
     * 1. MethodName : selectCommunityList
     * 2. ClassName  : PlannerCommunityService.java
     * 3. Comment    : 커뮤니티 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCommunityList(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectCommunityListCount
     * 2. ClassName  : PlannerCommunityService.java
     * 3. Comment    : 커뮤니티 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectCommunityListCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectCommunityInfo
     * 2. ClassName  : PlannerCommunityService.java
     * 3. Comment    : 커뮤니티 상세 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCommunityInfo(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateCommunityReadCount
     * 2. ClassName  : PlannerCommunityService.java
     * 3. Comment    : 조회 카운트 증가
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCommunityReadCount(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertCommunity
     * 2. ClassName  : PlannerCommunityService.java
     * 3. Comment    : 커뮤니티 글 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertCommunity(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateCommunity
     * 2. ClassName  : PlannerCommunityService.java
     * 3. Comment    : 커뮤니티 글 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCommunity(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : deleteCommunity
     * 2. ClassName  : PlannerCommunityService.java
     * 3. Comment    : 커뮤니티 글 삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int deleteCommunity(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

}
