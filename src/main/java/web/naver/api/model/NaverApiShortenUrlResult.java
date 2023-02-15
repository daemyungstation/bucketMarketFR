package web.naver.api.model;

import lombok.Data;

/**
 * <pre>
 * &#64;PackageName: web.naver.api.model
 * &#64;FileName : NaverApiShortenUrlResult.java
 * &#64;Date : 2020. 5. 22.
 * &#64;프로그램 설명 : 네이버 단축 URL 응답 결과
 * &#64;author upleat
 * </pre>
 */
@Data
public class NaverApiShortenUrlResult {

    private String message; // 메세지
    private Result result; // 결과
    private String code; // 코드

    @Data
    public static class Result {
        private String hash;
        private String url;
        private String orgUrl;
    }
}
