package common.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import common.model.User.ROLE_USER;

/**
 * @PackageName: common.annotation
 * @FileName : AccessLevel.java
 * @Date : 2020. 2. 4.
 * @프로그램 설명 : 관리자 권한 레벨 Annotation Class
 * @author upleat
 */
@Documented
@Target({ ElementType.TYPE, ElementType.METHOD })
@Inherited
@Retention(RetentionPolicy.RUNTIME)
public @interface AccessRole {
    ROLE_USER value() default ROLE_USER.guest;
    String key() default "main.index";
    boolean isAttachParameter() default false;
}
