package common.util;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;

import common.code.Const;
import common.model.Request;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class DeviceUtil {
    
    private static final String APP_AGENT = "bucketmarketApp";
    private static final String APP_AGENT_ANDROID = "bucketmarketAppAndroid";
    private static final String APP_AGENT_IOS = "bucketmarketAppIOS";
    private static final String OS_ANDROID = "Android";
    private static final String OS_IOS_PHONE = "iPhone OS";
    private static final String OS_IOS_IPAD = "iPad";
    /**
     * <pre>
     * 1. MethodName : getDevice
     * 2. ClassName  : DeviceUtil.java
     * 3. Comment    : Device 객체를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @return
     */
    private static Device getDevice() {
//        log.debug("================== DeviceUtil.Request ==================");
//        log.debug("Request : [{}]", Request.getCurrentRequest());
//        log.debug("========================================================");
        return DeviceUtils.getCurrentDevice(Request.getCurrentRequest());
    }
    /**
     * <pre>
     * 1. MethodName : getUserAgent
     * 2. ClassName  : DeviceUtil.java
     * 3. Comment    : Agent를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 17.
     * </pre>
     *
     * @return
     */
    private static String getUserAgent() {
        return Request.getCurrentRequest().getHeader("user-agent");
    }
    /**
     * <pre>
     * 1. MethodName : isNormal
     * 2. ClassName  : DeviceUtil.java
     * 3. Comment    : Device가 PC 인지 여부를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @return
     */
    public static boolean isNormal() {
        return getDevice().isNormal();
    }
    /**
     * <pre>
     * 1. MethodName : isMobile
     * 2. ClassName  : DeviceUtil.java
     * 3. Comment    : Device가 MOBILE 인지 여부를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @return
     */
    public static boolean isMobile() {
        return getDevice().isMobile();
    }
    /**
     * <pre>
     * 1. MethodName : isTablet
     * 2. ClassName  : DeviceUtil.java
     * 3. Comment    : Device가 TABLET 인지 여부를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @return
     */
    public static boolean isTablet() {
        return getDevice().isTablet();
    }
    /**
     * <pre>
     * 1. MethodName : isApp
     * 2. ClassName  : DeviceUtil.java
     * 3. Comment    : Device가 APP 인지 여부를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @return
     */
    public static boolean isApp() {
        boolean isApp = false;
        if (!getDevice().isNormal()) {
            
            isApp = getUserAgent().contains(APP_AGENT);
        }
        return isApp;
    }
    
    /**
     * <pre>
     * 1. MethodName : isAndroid
     * 2. ClassName  : DeviceUtil.java
     * 3. Comment    : Device가 APP 일 경우 안드로이드 여부를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 17.
     * </pre>
     *
     * @return
     */
    public static boolean isAndroid() {
        boolean isAndroid = false;
        if (isApp()) {
            isAndroid = getUserAgent().contains(APP_AGENT_ANDROID);
        } else {
            isAndroid = getUserAgent().contains(OS_ANDROID);
        }
        return isAndroid;
    }
    
    /**
     * <pre>
     * 1. MethodName : isIos
     * 2. ClassName  : DeviceUtil.java
     * 3. Comment    : Device가 APP 일 경우 IOS 여부를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 17.
     * </pre>
     *
     * @return
     */
    public static boolean isIos() {
        boolean isIos = false;
        if (isApp()) {
            isIos = getUserAgent().contains(APP_AGENT_IOS);
        } else {
            isIos = (getUserAgent().contains(OS_IOS_PHONE) || getUserAgent().contains(OS_IOS_IPAD));
        }
        return isIos;
    }
    
    /**
     * <pre>
     * 1. MethodName : getDeviceChar
     * 2. ClassName  : DeviceUtil.java
     * 3. Comment    : Device에 맞는 문자열을 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @return
     */
    public static String getDeviceChar() {
        if (isNormal()) {
            return Const.PC;
        } else if (isApp()) {
            return Const.APP;
        } else {
            return Const.MOBILE;
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : getDeviceOsChar
     * 2. ClassName  : DeviceUtil.java
     * 3. Comment    : Device OS 정보를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 17.
     * </pre>
     *
     * @return
     */
    public static String getDeviceOsChar () {
        if (isAndroid()) {
            return Const.OS_APP_ANDROID;
        } else if (isIos()) {
            return Const.OS_APP_IOS;
        } else {
            return Const.OS_DEFAULT;
        }
    }
}
