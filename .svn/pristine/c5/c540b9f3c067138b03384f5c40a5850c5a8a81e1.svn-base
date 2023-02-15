package web.fr.marketing.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.code.Code;
import common.code.Const;
import common.dao.CommonDefaultDAO;
import common.exception.CustomHandleException;
import common.util.DeviceUtil;
import common.util.IPUtil;
import common.util.StringUtil;
import web.fr.common.service.CommonFileService;
import web.fr.common.service.CommonService;
import web.fr.marketing.service.EventService;

@Service("eventService")
public class EventServiceImpl implements EventService {
    
    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    @Resource(name="commonFileService")
    private CommonFileService commonFileService;
    
    private static final String UPLOAD_PATH = "marketing";
    private static final String UPLOAD_ALLOW = "image";
    private static final String UPLOAD_DATE_FOLDER_FLAG = "Y";
    
    
    /**
     * <pre>
     * 1. MethodName : selectEventListCount
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 8.
     * </pre>
     *
     * @see web.fr.marketing.service.EventService#selectEventListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectEventListCount(Map<String, Object> commandMap) throws Exception {
        commandMap.put("CMM_FLE_TB_TYPE", DeviceUtil.isNormal() ? Const.PC : Const.MOBILE);
        return defaultDAO.selectCount("Event.selectEventListCount", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectEventList
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.EventService#selectEventList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectEventList(Map<String, Object> commandMap) throws Exception {
        commandMap.put("CMM_FLE_TB_TYPE", DeviceUtil.isNormal() ? Const.PC : Const.MOBILE);
        return (List<Map<String, Object>>) defaultDAO.selectList("Event.selectEventList", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectEventInfo
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.EventService#selectEventInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectEventInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        Map<String, Object> info = defaultDAO.select("Event.selectEventInfo", commandMap);
        if (info == null) {
            throw new CustomHandleException(Const.ERROR.E404, Const.class);
        }
        returnMap.put("info", info);
        if (DeviceUtil.isNormal()) {
            returnMap.put("eventList", this.selectEventList(commandMap));
            commandMap.put("AGR_MST_GBN", Code.TERM_PERSONAL_INFORMATION_USE_BASIC);
            returnMap.put("personalInfomationUseTermInfo", commonService.selectCommonTermInfo(commandMap).get("term"));
            commandMap.remove("AGR_MST_GBN");
            commandMap.put("AGR_MST_TYPE", Code.TERM_MARKETING);
            returnMap.put("marketingTermInfo", commonService.selectCommonTermInfo(commandMap).get("term"));
            commandMap.remove("AGR_MST_TYPE");
        }
        return returnMap;
    }
    /**
     * <pre>
     * 1. MethodName : selectEventReplyListCount
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 댓글 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.EventService#selectEventReplyListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectEventReplyListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("Event.selectEventReplyListCount", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : selectEventReplyList
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 댓글 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.EventService#selectEventReplyList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectEventReplyList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("Event.selectEventReplyList", commandMap);
    }
    /**
     * <pre>
     * 1. MethodName : insertEventReply
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 댓글 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.EventService#insertEventReply(org.springframework.web.multipart.MultipartHttpServletRequest, java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertEventReply(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("EVT_RPL_REG_IP", IPUtil.getClientIP());
        int result = 0;
        result += defaultDAO.insert("Event.insertEventReply", commandMap);
        commandMap.put("CMM_FLE_NM", "FILE");
        commandMap.put("CMM_FLE_TB_NM", "T_EVT_RPL");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_RPL_IDX"), ""));
        result += commonFileService.insertCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        commandMap.clear();
        return result;
    }
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
    public Map<String, Object> selectEventReplyInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("info", defaultDAO.select("Event.selectEventReplyInfo", commandMap));
        commandMap.put("CMM_FLE_TB_NM", "T_EVT_RPL");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_RPL_IDX"), ""));
        returnMap.put("fileList", commonFileService.selectCommonFileList(commandMap));
        commandMap.remove("CMM_FLE_TB_NM");
        commandMap.remove("CMM_FLE_TB_PK");
        return returnMap;
    }
    /**
     * <pre>
     * 1. MethodName : updateEventReply
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 댓글 > 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.EventService#updateEventReply(org.springframework.web.multipart.MultipartHttpServletRequest, java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateEventReply(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        commandMap.put("method", "modify");
        result += defaultDAO.update("Event.updateEventReply", commandMap);
        commandMap.put("CMM_FLE_NM", "FILE");
        commandMap.put("CMM_FLE_TB_NM", "T_EVT_RPL");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("EVT_RPL_IDX"), ""));
        result += commonFileService.updateCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        commandMap.clear();
        return result;
    }
    /**
     * <pre>
     * 1. MethodName : updateEventReply
     * 2. ClassName  : EventServiceImpl.java
     * 3. Comment    : 프론트 > 프로모션 > 이벤트 > 상세 > 댓글 > 삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 7.
     * </pre>
     *
     * @see web.fr.marketing.service.EventService#updateEventReply(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateEventReply(Map<String, Object> commandMap) throws Exception {
        commandMap.put("method", "remove");
        return defaultDAO.update("Event.updateEventReply", commandMap);
    }
}
