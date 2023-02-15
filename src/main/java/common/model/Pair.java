package common.model;

import lombok.Data;

/**
 * <pre>
 * &#64;PackageName: common.model
 * &#64;FileName : Pair.java
 * &#64;Date : 2020. 5. 11.
 * &#64;프로그램 설명 : 페어 클래스
 * &#64;author upleat
 * </pre>
 */
@Data
public class Pair<L, R> {

    private L left;
    private R right;

    public Pair(L left) {
        super();
        this.left = left;
    }

    public Pair(L left, R right) {
        super();
        this.left = left;
        this.right = right;
    }

}
