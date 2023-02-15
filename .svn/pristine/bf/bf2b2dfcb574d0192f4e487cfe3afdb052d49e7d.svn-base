package web.fr.marketing.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.code.Const;
import common.dao.CommonDefaultDAO;
import common.exception.CustomHandleException;
import common.util.DeviceUtil;
import common.util.IPUtil;
import common.util.StringUtil;
import web.fr.marketing.service.PlanService;

@Service("planService")
public class PlanServiceImpl implements PlanService {
    
    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectPlanListCount
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 기획전 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.PlanService#selectPlanListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlanListCount(Map<String, Object> commandMap) throws Exception {
        commandMap.put("CMM_FLE_TB_TYPE", DeviceUtil.isNormal() ? Const.PC : Const.MOBILE);
        return defaultDAO.selectCount("Plan.selectPlanListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectPlanList
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 기획전 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.PlanService#selectPlanList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectPlanList(Map<String, Object> commandMap) throws Exception {
        commandMap.put("CMM_FLE_TB_TYPE", DeviceUtil.isNormal() ? Const.PC : Const.MOBILE);
        return (List<Map<String, Object>>) defaultDAO.selectList("Plan.selectPlanList", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectPlanInfo
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 기획전 > 상세 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.PlanService#selectPlanInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlanInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        Map<String, Object> info = defaultDAO.select("Plan.selectPlanInfo", commandMap);
        if (info == null) {
            throw new CustomHandleException(Const.ERROR.E404, Const.class);
        }
        returnMap.put("info", info);
        if (DeviceUtil.isNormal()) {
            returnMap.put("planList", this.selectPlanList(commandMap));
        }
        if ("Y".equals(StringUtil.getString(info, "PLN_MST_PRD_DPL_YN", "N"))) {
            if (!DeviceUtil.isNormal()) {
                returnMap.put("planGroupTitleList", defaultDAO.selectList("Plan.selectPlanGroupTitleList", commandMap));
            }
            returnMap.put("planGroupList", defaultDAO.selectList("Plan.selectPlanGroupList", commandMap));
        }
        return returnMap;
    }
    /**
     * <pre>
     * 1. MethodName : selectPlanReplyListCount
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 기획전 > 상세 > 댓글 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.PlanService#selectPlanReplyListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectPlanReplyListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Plan.selectPlanReplyListCount", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectPlanReplyList
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 기획전 > 상세 > 댓글 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.PlanService#selectPlanReplyList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectPlanReplyList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("Plan.selectPlanReplyList", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : insertPlanReply
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 기획전 > 상세 > 댓글 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.PlanService#insertPlanReply(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertPlanReply(Map<String, Object> commandMap) throws Exception {
        commandMap.put("PLN_RPL_REG_IP", IPUtil.getClientIP());
        return defaultDAO.insert("Plan.insertPlanReply", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectPlanReplyInfo
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 기획전 > 상세 > 댓글 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.PlanService#selectPlanReplyInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectPlanReplyInfo(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.select("Plan.selectPlanReplyInfo", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : updatePlanReply
     * 2. ClassName  : PlanServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 기획전 > 상세 > 댓글 > 수정/삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.PlanService#updatePlanReply(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updatePlanReply(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.update("Plan.updatePlanReply", commandMap);
    }
}