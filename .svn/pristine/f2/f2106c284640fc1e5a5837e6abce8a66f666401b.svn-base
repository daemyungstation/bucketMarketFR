package web.fr.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.util.StringUtil;
import web.fr.board.service.NoticeBoardService;
import web.fr.common.service.CommonFileService;

@Service("noticeBoardService")
public class NoticeBoardServiceImpl implements NoticeBoardService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "commonFileService")
    private CommonFileService commonFileService;

    /**
     * <pre>
     * 1. MethodName : selectNoticeBoardListCount
     * 2. ClassName  : NoticeBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > 공지사항 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @see web.fr.board.service.NoticeBoardService#selectNoticeBoardListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectNoticeBoardListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("NoticeBoard.selectNoticeBoardListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectNoticeBoardList
     * 2. ClassName  : NoticeBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > 공지사항 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @see web.fr.board.service.NoticeBoardService#selectNoticeBoardList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectNoticeBoardList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("NoticeBoard.selectNoticeBoardList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectNoticeBoardInfo
     * 2. ClassName  : NoticeBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > 공지사항 > 상세정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @see web.fr.board.service.NoticeBoardService#selectNoticeBoardInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectNoticeBoardInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("info", defaultDAO.select("NoticeBoard.selectNoticeBoardInfo", commandMap));
        commandMap.put("CMM_FLE_TB_NM", "T_BRD_NTS");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap, "BRD_NTS_IDX", ""));
        returnMap.put("fileList", commonFileService.selectCommonFileList(commandMap));
        return returnMap;
    }

    /**
     * <pre>
     * 1. MethodName : updateNoticeBoardReadCount
     * 2. ClassName  : NoticeBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > 공지사항 > 조회수 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @see web.fr.board.service.NoticeBoardService#updateNoticeBoardReadCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateNoticeBoardReadCount(Map<String, Object> commandMap) throws Exception {
        int result = 0;
        result += defaultDAO.update("NoticeBoard.updateNoticeBoardReadCount", commandMap);
        return result;
    }
}