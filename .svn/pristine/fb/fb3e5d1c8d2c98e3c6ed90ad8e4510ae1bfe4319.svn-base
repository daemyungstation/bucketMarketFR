package web.fr.common.controller;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.support.ControllerSupport;
import common.util.DeviceUtil;
import common.util.StringUtil;
import web.fr.common.service.CommonFileService;

@Controller
public class CommonFileController extends ControllerSupport {
    
    @Resource(name="commonFileService")
    private CommonFileService commonFileService;
    
    /**
     * <pre>
     * 1. MethodName : commonFileDownload
     * 2. ClassName  : CommonFileController.java
     * 3. Comment    : 파일 다운로드
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 17.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${common.file.download}")
    public ModelAndView commonFileDownload(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        boolean isExists = false;
        File file = null;
        String orgFileName = "";
        if (!"".equals(StringUtil.getString(commandMap.get("CMM_FLE_IDX"), ""))) {
            // 파일 다운로드 수 증가
            int result = this.commonFileService.updateCommonFileDownCount(commandMap);
            if (result > 0) {
                Map<String, Object> info = this.commonFileService.selectCommonFileInfo(commandMap);
                file = new File(StringUtil.getString(info, "CMM_FLE_SAVE_PATH", ""));
                isExists = file.exists();
                orgFileName = StringUtil.getString(info, "CMM_FLE_ORG_NM", "");
            }
        }
        if (isExists) {
            ModelAndView mv = new ModelAndView("downloadView");
            mv.addObject("downloadFile", file);
            mv.addObject("orgFileName", orgFileName);
            return mv;
        } else {
            ModelAndView mv = new ModelAndView();
            if (DeviceUtil.isNormal()) {
                mv.addObject("alertMsg", "첨부파일이 존재하지 않습니다.");
                mv.addObject("historyBack", true);
            } else {
                mv.addObject("closeMsg", "첨부파일이 존재하지 않습니다.");
            }
            this.setResultView(mv);
            return mv;
        }
    }
}
