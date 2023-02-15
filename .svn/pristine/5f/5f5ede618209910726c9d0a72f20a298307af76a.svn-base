package web.fr.planner.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.code.Code;
import common.code.Const;
import common.dao.CommonDefaultDAO;
import common.model.Planner;
import common.session.SessionsPlanner;
import common.util.StringUtil;
import web.fr.common.service.CommonFileService;
import web.fr.planner.service.PlannerCommonService;
import web.message.MessageType;
import web.message.service.MessageService;

@Service("plannerCommonService")
public class PlannerCommonServiceImpl implements PlannerCommonService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "commonFileService")
    private CommonFileService commonFileService;

    @Resource(name = "messageService")
    private MessageService messageService;

    @Resource(name = "plannerCommonService")
    private PlannerCommonService plannerCommonService;

    private static final String UPLOAD_PATH = "planner";
    private static final String UPLOAD_ALLOW = "image";
    private static final String UPLOAD_DATE_FOLDER_FLAG = "Y";

    /**
     * <pre>
     * 1. MethodName : selectPlannerInfoByPlannerNo
     * 2. ClassName  : PlannerCommonServiceImpl.java
     * 3. Comment    : 플래너 정보 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerCommonService#selectPlannerInfoByPlannerNo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectPlannerInfoByPlannerNo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("PlannerCommon.selectPlannerInfoByPlannerNo", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerInfoByPlannerIdx
     * 2. ClassName  : PlannerCommonServiceImpl.java
     * 3. Comment    : 플래너 정보 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerCommonService#selectPlannerInfoByPlannerIdx(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectPlannerInfoByPlannerIdx(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("PlannerCommon.selectPlannerInfoByPlannerIdx", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerInfoById
     * 2. ClassName  : PlannerCommonServiceImpl.java
     * 3. Comment    : 플래너 정보 조회 by 아이디
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerLoginService#selectPlannerInfoById(java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectPlannerInfoById(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("PlannerCommon.selectPlannerInfoById", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerInfoByUser
     * 2. ClassName  : PlannerCommonServiceImpl.java
     * 3. Comment    : 플래너 정보 조회 by User
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 11.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerLoginService#selectPlannerInfoById(java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectPlannerInfoByPlanner(Planner planner) throws Exception {
        Map<String, Object> param = new HashMap<>();
        param.put("RDP_MST_IDX", planner.getRDP_MST_IDX());
        return this.selectPlannerInfoByPlannerIdx(param);
    }

    /**
     * <pre>
     * 1. MethodName : updatePlannerReleaseRequest
     * 2. ClassName  : PlannerCommonServiceImpl.java
     * 3. Comment    : 플래너 해제 요청
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerCommonService#updatePlannerReleaseRequest(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updatePlannerReleaseRequest(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        Planner planner = SessionsPlanner.getSessionPlanner(request); // 사용자
        commandMap.put("RDP_MST_IDX", planner.getRDP_MST_IDX());
        commandMap.put("RDP_MST_STATE", Code.PLANNER_STATE_REQUEST_RELEASE); // 해제 요청

        // 알림톡 발송
        Map<String, Object> info = this.plannerCommonService.selectPlannerInfoByPlanner(planner);
        String RDP_MST_NO = StringUtil.getString(info, "RDP_MST_NO");
        String RDP_MST_HP = StringUtil.getString(info, "RDP_MST_HP1") + StringUtil.getString(info, "RDP_MST_HP2") + StringUtil.getString(info, "RDP_MST_HP3");
        String RDP_MST_MEM_NM = StringUtil.getString(info, "RDP_MST_MEM_NM");
        this.messageService.sendAlimTalk(MessageType.PLANNER_RELEASE_REQUEST, RDP_MST_HP, RDP_MST_MEM_NM, System.currentTimeMillis());
        // 앱푸시 발송
        this.messageService.sendAppPush(MessageType.PLANNER_RELEASE_REQUEST, RDP_MST_NO, RDP_MST_MEM_NM, System.currentTimeMillis());

        return this.defaultDAO.update("PlannerCommon.updateState", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updatePlannerProfileImage
     * 2. ClassName  : PlannerCommonServiceImpl.java
     * 3. Comment    : 프로필 이미지 업로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerCommonService#updatePlannerProfileImage(org.springframework.web.multipart.MultipartHttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updatePlannerProfileImage(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        Planner planner = SessionsPlanner.getSessionPlanner(request); // 사용자

        // 기존 프로필 이미지 파일 삭제
        commandMap.put("CMM_FLE_TB_NM", "T_RDP_MST");
        commandMap.put("CMM_FLE_TB_PK", planner.getRDP_MST_IDX());
        commandMap.put("CMM_FLE_TB_TYPE", Const.PLANNER_PROFILE_IMAGE);
        List<Map<String, Object>> delFileList = commonFileService.selectCommonFileList(commandMap);
        if (CollectionUtils.isNotEmpty(delFileList)) {
            commandMap.put("CMM_FLE_DEL_IDXs", delFileList.stream().map(df -> df.get("CMM_FLE_IDX").toString()).toArray(String[]::new));
        }

        // 프로필 이미지 파일 추가
        commandMap.put("CMM_FLE_NM", "FILE");
        return commonFileService.updateCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
    }

    /**
     * <pre>
     * 1. MethodName : updatePlannerPassword
     * 2. ClassName  : PlannerCommonServiceImpl.java
     * 3. Comment    : 비밀번호 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerCommonService#updatePlannerPassword(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updatePlannerPassword(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        Planner planner = SessionsPlanner.getSessionPlanner(request); // 사용자
        commandMap.put("RDP_MST_IDX", planner.getRDP_MST_IDX());
        return this.defaultDAO.update("PlannerCommon.updatePlannerPassword", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updatePlannerPhoneNumber
     * 2. ClassName  : PlannerCommonServiceImpl.java
     * 3. Comment    : 연락처 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 22.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerCommonService#updatePlannerPhoneNumber(org.springframework.web.multipart.MultipartHttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updatePlannerPhoneNumber(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        Planner planner = SessionsPlanner.getSessionPlanner(request); // 사용자
        commandMap.put("RDP_MST_IDX", planner.getRDP_MST_IDX());
        return this.defaultDAO.update("PlannerCommon.updatePlannerPhoneNumber", commandMap);
    }

    /**
     * 
     * <pre>
     * 1. MethodName : updatePlannerBankAccount
     * 2. ClassName  : PlannerCommonServiceImpl.java
     * 3. Comment    : 정산계좌 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerCommonService#updatePlannerBankAccount(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     */
    @Override
    public int updatePlannerBankAccount(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        Planner planner = SessionsPlanner.getSessionPlanner(request); // 사용자
        commandMap.put("RDP_MST_IDX", planner.getRDP_MST_IDX());
        return this.defaultDAO.update("PlannerCommon.updatePlannerBankAccount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : updatePlannerPhone
     * 2. ClassName  : PlannerCommonServiceImpl.java
     * 3. Comment    : 연락처 변경
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerCommonService#updatePlannerPhoneNumber(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     */
    @Override
    public int updatePlannerPhoneNumber(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        Planner planner = SessionsPlanner.getSessionPlanner(request); // 사용자
        commandMap.put("RDP_MST_IDX", planner.getRDP_MST_IDX());
        return this.defaultDAO.update("PlannerCommon.updatePlannerPhoneNumber", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerExpectedProfits
     * 2. ClassName  : PlannerCommonServiceImpl.java
     * 3. Comment    : 이번달 예상 수익
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 3.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerCommonService#selectPlannerExpectedProfits()
     * @return
     * @throws Exception
     */
    @Override
    public long selectPlannerExpectedProfits() throws Exception {
        Map<String, Object> commandMap = new HashMap<>();
        commandMap.put("RDP_MST_IDX", SessionsPlanner.getSessionValue("RDP_MST_IDX"));
        Map<String, Object> info = this.defaultDAO.select("PlannerCommon.selectPlannerExpectedProfits", commandMap);
        return StringUtil.getLong(info, "EXPECTED_PROFITS", 0L);
    }

}
