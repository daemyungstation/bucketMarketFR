package common.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import common.model.Planner.ROLE_PLANNER;

/**
 * @PackageName: common.annotation
 * @FileName : AccessLevel.java
 * @Date : 2020. 2. 4.
 * @프로그램 설명 : 레디플래너 레벨 Annotation Class
 * @author upleat
 */
@Documented
@Target({ ElementType.TYPE, ElementType.METHOD })
@Inherited
@Retention(RetentionPolicy.RUNTIME)
public @interface AccessPlannerRole {

    ROLE_PLANNER value() default ROLE_PLANNER.planner;
}
