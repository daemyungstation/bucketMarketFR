package web.fr.common.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import common.dao.CommonDefaultDAO;
import common.session.SessionsUser;
import common.util.FileUploadUtil;
import common.util.StringUtil;
import web.fr.common.service.CommonFileService;

@Service("commonFileService")
public class CommonFileServiceImpl implements CommonFileService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Autowired
    private FileUploadUtil fileUpload;
    
    /**
     * <pre>
     * 1. MethodName : uploadCommonFile
     * 2. ClassName  : CommonFileServiceImpl.java
     * 3. Comment    : 파일 업로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @param file
     * @param commandMap
     * @param path
     * @param allow
     * @param dateFolderFlag
     * @return
     * @throws Exception
     */
    private Map<String, Object> uploadCommonFile(CommonsMultipartFile file, Map<String, Object> commandMap, final String path, final String allow, final String dateFolderFlag) throws Exception {
        return fileUpload.execute(commandMap, file, path, allow, dateFolderFlag);
    }

    /**
     * <pre>
     * 1. MethodName : selectCommonFileList
     * 2. ClassName  : CommonFileServiceImpl.java
     * 3. Comment    : 공통 파일 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 16.
     * </pre>
     *
     * @see web.bo.common.service.CommonFileService#selectCommonFileList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCommonFileList(Map<String, Object> commandMap) throws Exception {
        List<Map<String, Object>> list = (List<Map<String, Object>>) defaultDAO.selectList("CommonFile.selectCommonFileList", commandMap);
        return list;
    }

    /**
     * <pre>
     * 1. MethodName : selectCommonFileInfo
     * 2. ClassName  : CommonFileServiceImpl.java
     * 3. Comment    : 공통파일 상세 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.common.service.CommonFileService#selectCommonFileInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCommonFileInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> info = defaultDAO.select("CommonFile.selectCommonFileInfo", commandMap);
        return info;
    }

    /**
     * <pre>
     * 1. MethodName : insertCommonFileList
     * 2. ClassName  : CommonFileServiceImpl.java
     * 3. Comment    : 공통 파일 업로드 및 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 16.
     * </pre>
     *
     * @see web.bo.common.service.CommonFileService#insertCommonFileList(org.springframework.web.multipart.MultipartHttpServletRequest,
     *      java.util.Map, java.lang.String, java.lang.String, java.lang.String)
     * @param request
     * @param commandMap
     * @param path
     * @param allow
     * @param dateFolderFlag
     * @return
     * @throws Exception
     */
    public int insertCommonFileList(MultipartHttpServletRequest request, Map<String, Object> commandMap, final String path, final String allow, final String dateFolderFlag) throws Exception {
        int result = 0;
        String[] CMM_FLE_NMs = StringUtil.getArray(commandMap, "CMM_FLE_NM");
        List<MultipartFile> fileList = (List<MultipartFile>) request.getFiles(StringUtil.getString(CMM_FLE_NMs[0], "FILE"));
        String[] CMM_FLE_TB_TYPEs = StringUtil.getArray(commandMap, "CMM_FLE_TB_TYPEs");
        if (!fileList.isEmpty()) {
            for (int i = 0; i < fileList.size(); i++) {
                MultipartFile file = fileList.get(i);
                if (!file.isEmpty()) {
                    if (fileList.size() == CMM_FLE_TB_TYPEs.length) {
                        commandMap.put("CMM_FLE_TB_TYPE", CMM_FLE_TB_TYPEs[i]);
                    }
                    commandMap.put("CMM_FLE_REG_ID", SessionsUser.getSessionValue(request, "ADM_MST_ID"));
                    commandMap.put("CMM_FLE_SORT", (i + 1));
                    // 파일 등록 및 파일 업로드
                    result += defaultDAO.insert("CommonFile.insertCommonFile", uploadCommonFile((CommonsMultipartFile) file, commandMap, path, allow, dateFolderFlag));
                }
            }
        }
        return result;
    }

    /**
     * <pre>
     * 1. MethodName : updateCommonFileList
     * 2. ClassName  : CommonFileServiceImpl.java
     * 3. Comment    : 공통 파일 삭제, 업로드 및 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 2.
     * </pre>
     *
     * @see web.bo.common.service.CommonFileService#updateCommonFileList(org.springframework.web.multipart.MultipartHttpServletRequest,
     *      java.util.Map, java.lang.String, java.lang.String, java.lang.String)
     * @param request
     * @param commandMap
     * @param path
     * @param allow
     * @param dateFolderFlag
     * @return
     * @throws Exception
     */
    public int updateCommonFileList(MultipartHttpServletRequest request, Map<String, Object> commandMap, final String path, final String allow, final String dateFolderFlag) throws Exception {
        int result = 0;
        result = insertCommonFileList(request, commandMap, path, allow, dateFolderFlag);
        String[] CMM_FLE_DEL_IDXs = StringUtil.getArray(commandMap, "CMM_FLE_DEL_IDXs");
        for (String CMM_FLE_DEL_IDX : CMM_FLE_DEL_IDXs) {
            commandMap.put("CMM_FLE_IDX", CMM_FLE_DEL_IDX);
            Map<String, Object> info = selectCommonFileInfo(commandMap);
            String CMM_FLE_SAVE_PATH = StringUtil.getString(info, "CMM_FLE_SAVE_PATH", "");
            // 파일 DB 수정
            result += defaultDAO.delete("CommonFile.deleteCommonFile", commandMap);
            // 물리적 파일 삭제
            fileUpload.delete(CMM_FLE_SAVE_PATH);
        }
        return result;
    }

    /**
     * <pre>
     * 1. MethodName : updateCommonFileDownCount
     * 2. ClassName  : CommonFileServiceImpl.java
     * 3. Comment    : 파일 다운로드 수 증가 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @see web.bo.common.service.CommonFileService#updateCommonFileDownCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public int updateCommonFileDownCount(Map<String, Object> commandMap) throws Exception {
        return defaultDAO.update("CommonFile.updateCommonFileDownCount", commandMap);
    }
}