package web.fr.planner.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * <pre>
 * &#64;PackageName: web.fr.planner.service.impl
 * &#64;FileName : PlannerJoinServiceImpl.java
 * &#64;Date : 2020. 5. 4.
 * &#64;프로그램 설명 : 플래너 가입
 * &#64;author upleat
 * </pre>
 */
public interface PlannerJoinService {

    /**
     * <pre>
     * 1. MethodName : checkDuplicateEmail
     * 2. ClassName  : PlannerJoinService.java
     * 3. Comment    : 플래너 가입 > 이메일 중복 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int checkDuplicateEmail(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : checkDuplicateEmail
     * 2. ClassName  : PlannerJoinService.java
     * 3. Comment    : 플래너 가입 > CI 중복 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int checkDuplicateCi(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : checkDuplicateId
     * 2. ClassName  : PlannerJoinService.java
     * 3. Comment    : 플래너 가입 > 아이디 중복 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int checkDuplicateId(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : checkDuplicateSite
     * 2. ClassName  : PlannerJoinService.java
     * 3. Comment    : 플래너 가입 > 홍보사이트 중복 확인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int checkDuplicateSite(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertApplyPlanner
     * 2. ClassName  : PlannerJoinService.java
     * 3. Comment    : 플래너 가입 > 신청 플래너 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertApplyPlanner(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateReapplyPlanner
     * 2. ClassName  : PlannerJoinService.java
     * 3. Comment    : 플래너 가입 > 신청 플래너 수정 (재신청)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateApplyPlanner(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectApplyPlannerInfo
     * 2. ClassName  : PlannerJoinService.java
     * 3. Comment    : 플래너 가입 > 신청 플래너 정보 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param plannerNo
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectApplyPlannerInfo(String plannerNo) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerReapplyInfoByPlannerNo
     * 2. ClassName  : PlannerJoinService.java
     * 3. Comment    : 재신청 정보 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlannerReapplyInfoByPlannerNo(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateApplyPlannerAdditionalInfo
     * 2. ClassName  : PlannerJoinService.java
     * 3. Comment    : 추가정보 업데이트
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateApplyPlannerAdditionalInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerQuiz
     * 2. ClassName  : PlannerJoinService.java
     * 3. Comment    : 플래너 교육이수 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPlannerQuizGroupList() throws Exception;

    /**
     * <pre>
     * 1. MethodName : updateReapplyPlanner
     * 2. ClassName  : PlannerJoinService.java
     * 3. Comment    : 교육이수 완료 및 상태 업데이트
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateApplyPlannerQuizComplete(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

}
