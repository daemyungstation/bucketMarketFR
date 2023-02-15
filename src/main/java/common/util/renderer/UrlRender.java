package common.util.renderer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import common.util.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;


@Component
public class UrlRender {

    @Resource(name="urlPropertiesService")
    private EgovPropertyService urlPropertiesService;
    
    public List<Map<String, Object>> renderUrl() throws Exception {
        Iterator<?> keys = urlPropertiesService.getKeys();
        List<Map<String, Object>> list = new ArrayList<>();
        while(keys.hasNext()) {
            Map<String, Object> map = new HashMap<>();
            String key = StringUtil.getString(keys.next());
            map.put(key, urlPropertiesService.getString(key));
            list.add(map);
        }
        return list;
    }

}
