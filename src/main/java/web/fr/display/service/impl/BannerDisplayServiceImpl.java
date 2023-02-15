package web.fr.display.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.code.Code;
import common.code.Const;
import common.dao.CommonDefaultDAO;
import common.util.DeviceUtil;
import web.fr.display.service.BannerDisplayService;

@Service("bannerDisplayService")
public class BannerDisplayServiceImpl implements BannerDisplayService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;
    
    /**
     * <pre>
     * 1. MethodName : selectBannerDisplayList
     * 2. ClassName  : BannerDisplayServiceImpl.java
     * 3. Comment    : 프론트 > 전시 > 배너 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @see web.fr.display.service.BannerDisplayService#selectBannerDisplayList(java.lang.String)
     * @param code
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBannerDisplayList(String code) throws Exception {
        Map<String, Object> commandMap = new HashMap<>();
        commandMap.put("CMN_COM_IDX", Code.class.getDeclaredField(code).get(Code.class).toString());
        commandMap.put("CMM_FLE_TB_TYPE", DeviceUtil.isNormal() ? Const.PC : Const.MOBILE);
        return (List<Map<String, Object>>) defaultDAO.selectList("BannerDisplay.selectBannerDisplayList", commandMap);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectBannerDisplayList
     * 2. ClassName  : BannerDisplayServiceImpl.java
     * 3. Comment    : 프론트 > 전시 > 배너 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @see web.fr.display.service.BannerDisplayService#selectBannerDisplayList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectBannerDisplayList(Map<String, Object> commandMap) throws Exception {
        commandMap.put("CMM_FLE_TB_TYPE", DeviceUtil.isNormal() ? Const.PC : Const.MOBILE);
        return (List<Map<String, Object>>) defaultDAO.selectList("BannerDisplay.selectBannerDisplayList", commandMap);
    }
}
