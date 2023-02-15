package web.fr.display.service;

import java.util.List;
import java.util.Map;

public interface PopupDisplayService {

    /**
     * <pre>
     * 1. MethodName : selectPopupDisplayList
     * 2. ClassName  : PopupDisplayService.java
     * 3. Comment    : 프론트 > 전시 > 팝업 > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectPopupDisplayList() throws Exception;
}
