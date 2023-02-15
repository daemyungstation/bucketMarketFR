package web.fr.common.service.impl;

import java.net.URLDecoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import common.code.CookieName;
import common.model.Request;
import common.util.CookieUtil;
import lombok.extern.log4j.Log4j2;
import web.fr.common.service.CommonSearchService;

@Log4j2
@Service("commonSearchService")
public class CommonSearchServiceImpl implements CommonSearchService {

    /**
     * <pre>
     * 1. MethodName : getLatelyBasicProductNoArray
     * 2. ClassName  : CommonSearchServiceImpl.java
     * 3. Comment    : 프론트 > 검색 > 최근본 상품 > 상품 코드 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 25.
     * </pre>
     *
     * @see web.fr.common.service.CommonSearchService#getLatelyBasicProductNoArray()
     * @return
     * @throws Exception
     */
    public String [] getLatelyBasicProductNoArray() throws Exception {
        HttpServletRequest request = Request.getCurrentRequest();
        CookieUtil cookieUtil = new CookieUtil(request);
        if (cookieUtil.isExist(CookieName.LATELY_PRODUCT_LIST_NM)) {
            Cookie cookie = cookieUtil.getCookie(CookieName.LATELY_PRODUCT_LIST_NM);
            String [] latelyBasicProductNoArray = URLDecoder.decode(cookie.getValue(), "UTF-8").split("-");
            for (String latelyBasicProductNo : latelyBasicProductNoArray) {
                log.debug("latelyBasicProductNo : [{}]", latelyBasicProductNo);
            }
            return latelyBasicProductNoArray;
        } else {
            return new String[0];
        }
    }
    
}
