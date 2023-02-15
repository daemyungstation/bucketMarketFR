package web.fr.planner.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.model.Planner;

public interface PlannerCommonService {

    /**
     * <pre>
     * 1. MethodName : selectPlannerInfoByPlannerNo
     * 2. ClassName  : PlannerCommonService.java
     * 3. Comment    : 플래너 정보 조회 by 플래너번호
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlannerInfoByPlannerNo(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerInfoByPlannerIdx
     * 2. ClassName  : PlannerCommonService.java
     * 3. Comment    : 플래너 정보 조회 by IDX
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 6.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlannerInfoByPlannerIdx(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerInfoById
     * 2. ClassName  : PlannerCommonService.java
     * 3. Comment    : 플래너 정보 조회 by 아이디
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlannerInfoById(Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerInfoByUser
     * 2. ClassName  : PlannerCommonService.java
     * 3. Comment    : 플래너 정보 조회 by User
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlannerInfoByPlanner(Planner sessionPlanner) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updatePlannerProfileImage
     * 2. ClassName  : PlannerCommonService.java
     * 3. Comment    : 프로필 이미지 업로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePlannerProfileImage(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updatePlannerReleaseRequest
     * 2. ClassName  : PlannerCommonService.java
     * 3. Comment    : 플래너 해제 요청 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @return
     * @throws Exception
     */
    public int updatePlannerReleaseRequest(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updatePlannerPassword
     * 2. ClassName  : PlannerCommonService.java
     * 3. Comment    : 비밀번호 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePlannerPassword(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updatePlannerPhoneNumber
     * 2. ClassName  : PlannerCommonService.java
     * 3. Comment    : 연락처 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 22.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePlannerPhoneNumber(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updatePlannerBankAccount
     * 2. ClassName  : PlannerCommonService.java
     * 3. Comment    : 정산계좌 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    public int updatePlannerBankAccount(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : updatePlannerPhone
     * 2. ClassName  : PlannerCommonService.java
     * 3. Comment    : 전화번호 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    public int updatePlannerPhoneNumber(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPlannerExpectedProfits
     * 2. ClassName  : PlannerCommonService.java
     * 3. Comment    : 이번달 예상 수익 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @return
     * @throws Exception
     */
    public long selectPlannerExpectedProfits() throws Exception;
}
