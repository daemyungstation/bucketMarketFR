package web.fr.main.service;

import java.util.List;
import java.util.Map;

public interface IndexService {
    /**
     * <pre>
     * 1. MethodName : selectMainBannerInfo
     * 2. ClassName  : IndexService.java
     * 3. Comment    : 메인 배너/카테고리 정보 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 5.
     * </pre>
     *
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMainBannerInfo() throws Exception;
}
