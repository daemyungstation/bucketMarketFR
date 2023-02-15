package common.model;

import java.io.Serializable;

import lombok.Data;

/**
 * <pre>
 * &#64;PackageName: common.model
 * &#64;FileName : OneSelfCheck.java
 * &#64;Date : 2020. 5. 22.
 * &#64;프로그램 설명 : 본인확인 정보
 * &#64;author upleat
 * </pre>
 */
@Data
public class OneSelfCheck implements Serializable {
    private static final long serialVersionUID = -3675456010543204562L;

    // 본인확인 정보
    private String ONE_SELF_CI;
    private String ONE_SELF_NM;
    private String ONE_SELF_HP;
    private String ONE_SELF_SEX;
}