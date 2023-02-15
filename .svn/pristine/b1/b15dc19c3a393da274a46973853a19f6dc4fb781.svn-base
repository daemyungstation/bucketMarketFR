package web.fr.myplanner.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsPlanner;
import common.util.IPUtil;
import web.fr.common.service.CommonFileService;
import web.fr.myplanner.service.MyPlannerCommunityService;

@Service("myPlannerCommunityService")
public class MyPlannerCommunityServiceImpl implements MyPlannerCommunityService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "commonFileService")
    private CommonFileService commonFileService;

    /**
     * <pre>
     * 1. MethodName : selectCommunityList
     * 2. ClassName  : PlannerCommunityServiceImpl.java
     * 3. Comment    : 커뮤니티 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCommunityService#selectCommunityList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectCommunityList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("MyPlannerCommunity.selectCommunityList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectCommunityListCount
     * 2. ClassName  : PlannerCommunityServiceImpl.java
     * 3. Comment    : 커뮤니티 목록 개수 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCommunityService#selectCommunityListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int selectCommunityListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("MyPlannerCommunity.selectCommunityListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectCommunityInfo
     * 2. ClassName  : PlannerCommunityServiceImpl.java
     * 3. Comment    : 커뮤니티 상세조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCommunityService#selectCommunityInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectCommunityInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> info = new HashMap<String, Object>();

        // 조회
        info.put("info", defaultDAO.select("MyPlannerCommunity.selectCommunityInfo", commandMap));

        return info;
    }

    /**
     * <pre>
     * 1. MethodName : updateCommunityReadCount
     * 2. ClassName  : PlannerCommunityServiceImpl.java
     * 3. Comment    : 커뮤니티 조회수 증가
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCommunityService#updateCommunityReadCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updateCommunityReadCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.update("MyPlannerCommunity.updateReadCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : insertCommunity
     * 2. ClassName  : MyPlannerCommunityServiceImpl.java
     * 3. Comment    : 커뮤니티 글 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCommunityService#insertCommunity(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int insertCommunity(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_BBS_REG_IP", IPUtil.getClientIP());
        commandMap.put("RDP_BBS_REG_ID", SessionsPlanner.getSessionValue("RDP_MST_ID"));
        return defaultDAO.insert("MyPlannerCommunity.insertCommunity", commandMap);
    }

    /**
     * <pre>
     *     
     * 1. MethodName : updateCommunity
     * 2. ClassName  : MyPlannerCommunityServiceImpl.java
     * 3. Comment    : 커뮤니티 글 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCommunityService#updateCommunity(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updateCommunity(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_BBS_UPD_IP", IPUtil.getClientIP());
        commandMap.put("RDP_BBS_UPD_ID", SessionsPlanner.getSessionValue("RDP_MST_ID"));
        return defaultDAO.update("MyPlannerCommunity.updateCommunity", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : deleteCommunity
     * 2. ClassName  : MyPlannerCommunityServiceImpl.java
     * 3. Comment    : 커뮤니티 글 삭제
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCommunityService#deleteCommunity(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int deleteCommunity(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_BBS_UPD_IP", IPUtil.getClientIP());
        commandMap.put("RDP_BBS_UPD_ID", SessionsPlanner.getSessionValue("RDP_MST_ID"));
        return defaultDAO.update("MyPlannerCommunity.deleteCommunity", commandMap);
    }

}
