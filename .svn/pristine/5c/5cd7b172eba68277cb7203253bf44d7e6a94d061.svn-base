package web.fr.myplanner.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.util.StringUtil;
import web.fr.common.service.CommonFileService;
import web.fr.myplanner.service.MyPlannerNoticeService;

@Service("myPlannerNoticeService")
public class MyPlannerNoticeServiceImpl implements MyPlannerNoticeService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "commonFileService")
    private CommonFileService commonFileService;

    /**
     * <pre>
     * 1. MethodName : selectNoticeList
     * 2. ClassName  : PlannerNoticeServiceImpl.java
     * 3. Comment    : 공지사항 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerNoticeService#selectNoticeList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectNoticeList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("MyPlannerNotice.selectNoticeList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectNoticeListCount
     * 2. ClassName  : PlannerNoticeServiceImpl.java
     * 3. Comment    : 공지사항 목록 개수 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerNoticeService#selectNoticeListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int selectNoticeListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("MyPlannerNotice.selectNoticeListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectNoticeInfo
     * 2. ClassName  : PlannerNoticeServiceImpl.java
     * 3. Comment    : 공지사항 상세조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerNoticeService#selectNoticeInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectNoticeInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> info = new HashMap<String, Object>();

        // 파일
        commandMap.put("CMM_FLE_TB_NM", "T_RDP_NTS");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("RDP_NTS_IDX"), ""));
        info.put("fileList", this.commonFileService.selectCommonFileList(commandMap));

        // 조회
        info.put("info", defaultDAO.select("MyPlannerNotice.selectNoticeInfo", commandMap));

        return info;
    }

    /**
     * <pre>
     * 1. MethodName : updateNoticeReadCount
     * 2. ClassName  : PlannerNoticeServiceImpl.java
     * 3. Comment    : TODO
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerNoticeService#updateNoticeReadCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updateNoticeReadCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.update("MyPlannerNotice.updateReadCount", commandMap);
    }

}
