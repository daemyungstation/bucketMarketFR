package web.naver.api.service;

import web.naver.api.model.NaverApiShortenUrlResult;

public interface NaverApiService {

    /**
     * <pre>
     * 1. MethodName : getShortenUrl
     * 2. ClassName  : NaverApiService.java
     * 3. Comment    : 단축 URL 생성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 22.
     * </pre>
     *
     * @param url
     */
    public String getShortenUrl(String url);
}
