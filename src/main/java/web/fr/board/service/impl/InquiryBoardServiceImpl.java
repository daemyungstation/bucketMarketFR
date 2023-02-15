package web.fr.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.util.IPUtil;
import web.fr.board.service.InquiryBoardService;

@Service("inquiryBoardService")
public class InquiryBoardServiceImpl implements InquiryBoardService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : insertInquiryBoard
     * 2. ClassName  : InquiryBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @see web.fr.board.service.InquiryBoardService#insertInquiryBoard(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertInquiryBoard(Map<String, Object> commandMap) throws Exception {
        commandMap.put("MEM_ADV_REG_IP", IPUtil.getClientIP());
        return defaultDAO.insert("InquiryBoard.insertInquiryBoard", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectInquiryBoardListCount
     * 2. ClassName  : InquiryBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @see web.fr.board.service.InquiryBoardService#selectInquiryBoardListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int selectInquiryBoardListCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.selectCount("InquiryBoard.selectInquiryBoardListCount", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectInquiryBoardList
     * 2. ClassName  : InquiryBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @see web.fr.board.service.InquiryBoardService#selectInquiryBoardList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectInquiryBoardList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("InquiryBoard.selectInquiryBoardList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : updateInquiryBoardReadCount
     * 2. ClassName  : InquiryBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > 1:1문의 > 목록 > 조회수 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 13.
     * </pre>
     *
     * @see web.fr.board.service.InquiryBoardService#updateInquiryBoardReadCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateInquiryBoardReadCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.update("InquiryBoard.updateInquiryBoardReadCount", commandMap);
    }
}
