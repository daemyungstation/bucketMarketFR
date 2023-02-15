package web.fr.display.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.code.Const;
import common.dao.CommonDefaultDAO;
import common.util.DeviceUtil;
import web.fr.display.service.PopupDisplayService;

@Service("popupDisplayService")
public class PopupDisplayServiceImpl implements PopupDisplayService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPopupDisplayList() throws Exception {
        Map<String, Object> commandMap = new HashMap<>();
        commandMap.put("POP_MST_CHN_GBN", DeviceUtil.isNormal() ? Const.PC : Const.MOBILE);
        return (List<Map<String, Object>>) defaultDAO.selectList("PopupDisplay.selectPopupDisplayList", commandMap);
    }
}
