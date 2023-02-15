package common.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.ResampleOp;

import common.exception.FileUploadException;
import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Component
public class FileUploadUtil {

    @Resource(name="filePropertiesService")
    protected EgovPropertyService filePropertiesService;

    @Value("#{resource['cdn.domain']}")
    private String cndDomain;
    
    @Value("#{resource['cdn.ssl.domain']}")
    private String cdnSslDomain;
    
    @Value("#{resource['cdn.domain.editor']}")
    private String cdnEditorDomain;
    
    @Value("#{resource['cdn.ssl.domain.editor']}")
    private String cdnSslEditorDomain;

    private static final int MAX_UPLOAD_SIZE = 20971520;
    
    /**
     * <pre>
     * 1. MethodName : getUploadPath
     * 2. ClassName  : FileUpload.java
     * 3. Comment    : 파일 유형에 따라 저장소 위치를 resource properties에서 호출하기 위한 NAME값 반환
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 6. 20.
     * </pre>
     *
     * @param n
     * @return
     */
    private String getUploadPath(String n) {
        String p = "file.path.default";
        if (!"".equals(n)) {
            p = "file.path." + n;
        }
        return filePropertiesService.getString(p);
    }

    /**
     * <pre>
     * 1. MethodName : getCheckFileType
     * 2. ClassName  : FileUpload.java
     * 3. Comment    : 업로드 가능한 확장자를 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 5. 16.
     * </pre>
     *
     * @param a
     * @return
     */
    private String getCheckFileType(String a) {
        String p = "file.allowed.extensions.default";
        if (!"".equals(a)) {
            p = "file.allowed.extensions." + a;
        }
        return filePropertiesService.getString(p);
    }
    
    /**
     * <pre>
     * 1. MethodName : getMaxFileSize
     * 2. ClassName  : FileUpload.java
     * 3. Comment    : 업로드 가능한 용량을 반환한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 5. 16.
     * </pre>
     *
     * @param a
     * @return
     */
    private int getMaxFileSize(String a) {
        String p = "file.max.byte.size.default";
        if (!"".equals(a)) {
            p = "file.max.byte.size." + a;
        }
        return filePropertiesService.getInt(p, MAX_UPLOAD_SIZE);
    }
    
    /**
     * <pre>
     * 1. MethodName : makePath
     * 2. ClassName  : FileUploadUtil.java
     * 3. Comment    : 폴더 PATH 생성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param pathType
     * @param dateFolderFlag
     * @return
     */
    private String makePath(String pathType, String dateFolderFlag) {
        String path = "";
        path += path + getUploadPath(pathType) + "/";
        if ("Y".equals(dateFolderFlag)) {
            String month = String.valueOf(Calendar.getInstance().get(Calendar.MONTH) + 1);
            if (month.length() == 1)
                month = "0" + month;

            String day = String.valueOf(Calendar.getInstance().get(Calendar.DATE));
            if (day.length() == 1)
                day = "0" + day;

            path += Calendar.getInstance().get(Calendar.YEAR);
            path += "/" + month + "/";
            path += day + "/";
        }
        return path;
    }
    
    /**
     * <pre>
     * 1. MethodName : makeFileName
     * 2. ClassName  : FileUploadUtil.java
     * 3. Comment    : 파일명 생성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param fileExt
     * @return
     */
    private String makeFileName(String fileExt) {
        return UUID.randomUUID().toString() + "." + fileExt;
    }
    
    /**
     * <pre>
     * 1. MethodName : execute
     * 2. ClassName  : FileUploadUtil.java
     * 3. Comment    : 파일 업로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param commandMap
     * @param multipartFile
     * @param pathType
     * @param allow
     * @param dateFolderFlag
     * @return
     * @throws FileUploadException
     * @throws IOException
     */
    public Map<String, Object> execute(Map<String, Object> commandMap, CommonsMultipartFile multipartFile, String pathType, String allow, String dateFolderFlag) throws FileUploadException, IOException {
        String originalFilename = multipartFile.getOriginalFilename();
        if (StringUtils.hasLength(originalFilename)) {

            String fileExt = StringUtils.getFilenameExtension(originalFilename).toLowerCase();
            String exceptionMessage = "";
            String checkFileExts = getCheckFileType(allow);
            if (!checkFileExts.contains(fileExt)) {
                exceptionMessage = checkFileExts.replaceAll("\\|", ", ");
                log.error("======================== 파일업로드 ========================");
                log.error("업로드 확장자 : [{}]", fileExt);
                log.error("업로드 가능 확장자 : [{}]", checkFileExts);
                log.error("========================================================");
                throw new FileUploadException("업로드 불가능한 확장자 입니다.\\n첨부파일 확장자를 확인 후 다시 시도 해 주십시오.\\n업로드 가능한 확장자[ " + exceptionMessage + " ]");
            }

            long fileSize = multipartFile.getSize();
            if (fileSize > getMaxFileSize(allow) || fileSize > MAX_UPLOAD_SIZE) {
                log.error("업로드 사이즈 : [{}]", FormatUtil.byteCal(StringUtil.getString(fileSize)));
                log.error("업로드 가능 사이즈 : [{}]", FormatUtil.byteCal(StringUtil.getString(getMaxFileSize(allow))));
                throw new FileUploadException("업로드 용량이 초과되었습니다.\\n첨부파일의 용량을 확인 후 다시 시도 해 주십시오.\\n최대 업로드 용량[ " + FormatUtil.byteCal(StringUtil.getString(getMaxFileSize(allow))) + " ]");
            }
            String webDomain = "";
            String uploadPath = filePropertiesService.getString("file.docs.upload.path");
            if ("image".equals(allow)) {
                webDomain = cdnSslDomain;
                uploadPath = filePropertiesService.getString("file.cdn.upload.path");
            } else if ("editor".equals(allow)) {
                webDomain = cdnSslEditorDomain;
                uploadPath = filePropertiesService.getString("file.cdn.upload.path.editor");
            }
            String attachPath = makePath(pathType, dateFolderFlag);
            String destFileDir = uploadPath + attachPath;
            File destFile = new File(destFileDir);
            if (!destFile.exists()) {
                destFile.mkdirs();
            }
            
            String fileName = makeFileName(fileExt);
            String serverFileName = destFileDir + fileName;

            try {
                multipartFile.transferTo(new File(serverFileName));
            } catch (IllegalStateException e) {
                if (log.isDebugEnabled()) {
                    e.printStackTrace();
                } else {
                    log.error(Arrays.toString(e.getStackTrace()));
                }
            } catch (IOException e) {
                if (log.isDebugEnabled()) {
                    e.printStackTrace();
                } else {
                    log.error(Arrays.toString(e.getStackTrace()));
                }
            }

            Map<String, Object> resultMap = new HashMap<>();
            /** 결과 값 반환 */
            Iterator<String> iterator = commandMap.keySet().iterator();
            while (iterator.hasNext()) {
                String key = (String) iterator.next();
                resultMap.put(key, commandMap.get(key));
            }
            resultMap.put("CMM_FLE_SYS_PATH", uploadPath);
            resultMap.put("CMM_FLE_ATT_PATH", attachPath);
            resultMap.put("CMM_FLE_ORG_NM", originalFilename);
            resultMap.put("CMM_FLE_SYS_NM", fileName);
            resultMap.put("CMM_FLE_ATT_SIZE", fileSize);
            resultMap.put("CMM_FLE_ATT_EXT", fileExt);
            resultMap.put("CMM_FLE_USE_YN", "Y");
            resultMap.put("CMM_FLE_WEB_PATH", webDomain + attachPath + fileName);
            resultMap.put("SUCCESS_YN", !multipartFile.isEmpty() ? "Y" : "N");

            // 사용자가 올린 이미지 리사이즈
            if ("Y".equals(StringUtil.getString(resultMap, "CMM_FLE_TUMBNAIL_YN", "N"))) {
                makeThumbnail(commandMap);
            }
            return resultMap;
        } else {
            throw new FileUploadException("업로드 파일이 누락되었습니다.");
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : delete
     * 2. ClassName  : FileUpload.java
     * 3. Comment    : 첨부파일을 삭제한다. 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 5. 16.
     * </pre>
     *
     * @param targetFile
     */
    public void delete(String targetFile) {
        File file = new File(targetFile);
        if (file.exists()) {
            if (file.delete()) {
                log.error("========================================================================");
                log.error("======================== File delete successful ========================");
                log.error("========================================================================");
            } else {
                log.error("========================================================================");
                log.error("=========================== File delete fail ===========================");
                log.error("========================================================================");
            }
        }
    }

    /**
     * <pre>
     * 1. MethodName : makeThumbnail
     * 2. ClassName  : FileUploadUtil.java
     * 3. Comment    : 프론트 사용자 등록 이미지 리사이즈
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param thumbnailWidth
     * @param resultFile
     * @throws IOException
     */
    public void makeThumbnail(Map<String, Object> commandMap) throws IOException {
        String serverFileName = StringUtil.getString(commandMap, "CMM_FLE_SYS_PATH", "");
        serverFileName += StringUtil.getString(commandMap, "CMM_FLE_ORG_NM", "");
        int thumbnailWidth = StringUtil.getInt(commandMap, "CMM_FLE_THUMBNAIL_WIDTH");
        File f = new File(serverFileName);
        BufferedImage src = ImageIO.read(f);

        Image srcImg = null;
        srcImg = ImageIO.read(f);

        int imageWidth = srcImg.getWidth(null);// 이미지 가로사이즈
        int imageHeight = srcImg.getHeight(null);// 이미지 세로사이즈

        // 비율 설정
        double ratio = 1.0;

        // 이미지가 원하는 크기보다 큰 경우(width값만 체크)만 리사이즈
        if (imageWidth > thumbnailWidth) {
            ratio = (double) thumbnailWidth / (double) imageWidth;
        }

        int destWidth = (int) (imageWidth * ratio);
        int destHeight = (int) (imageHeight * ratio);

        ResampleOp resampleOp = new ResampleOp(destWidth, destHeight);
        resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.VerySharp);
        BufferedImage rescaled = resampleOp.filter(src, null);

        ImageIO.write(rescaled, "png", new File(serverFileName)); // 기존 파일에 덮어쓴다.
    }
}