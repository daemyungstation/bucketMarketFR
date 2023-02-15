package web.fr.board.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.dao.CommonDefaultDAO;
import common.util.IPUtil;
import common.util.StringUtil;
import web.fr.board.service.ContactUsBoardService;
import web.fr.common.service.CommonFileService;

@Service("contactUsBoardService")
public class ContactUsBoardServiceImpl implements ContactUsBoardService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    @Resource(name="commonFileService")
    private CommonFileService commonFileService;
    
    private static final String UPLOAD_PATH = "board";
    private static final String UPLOAD_ALLOW = "default";
    private static final String UPLOAD_DATE_FOLDER_FLAG = "Y";
    
    /**
     * <pre>
     * 1. MethodName : insertContactUsBoard
     * 2. ClassName  : ContactUsBoardServiceImpl.java
     * 3. Comment    : 프론트 > 고객센터 > 제휴문의 > 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 18.
     * </pre>
     *
     * @see web.fr.board.service.ContactUsBoardService#insertContactUsBoard(org.springframework.web.multipart.MultipartHttpServletRequest, java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int insertContactUsBoard(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        int result = 0;
        commandMap.put("CTT_US_REG_IP", IPUtil.getClientIP());
        result += defaultDAO.insert("ContactUsBoard.insertContactUsBoard", commandMap);
        commandMap.put("CMM_FLE_NM", "FILE");
        commandMap.put("CMM_FLE_TB_NM", "T_CTT_US");
        commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("CTT_US_IDX"), ""));
        result += commonFileService.insertCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
        commandMap.clear();
        return result;
    }
    
}
