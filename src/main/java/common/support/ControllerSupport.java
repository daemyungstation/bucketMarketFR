package common.support;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import common.code.Const;
import common.code.Contract;
import common.code.Product;
import common.exception.CustomHandleException;
import common.model.Request;
import common.util.DeviceUtil;
import common.util.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Component
public class ControllerSupport {

    @Resource(name = "urlPropertiesService")
    private EgovPropertyService urlPropertiesService;

    @Value("#{resource['front.ssl.domain']}")
    private String pcDomain;

    @Value("#{resource['mobile.ssl.domain']}")
    private String mobileDomain;
    
    @Value("${spring.profiles.active:prd}")
    private String activeProfile;

    private static final String SERVER_PATH = "/fr";

    private boolean isNormal () {
        if ("local".equals(activeProfile)) {
            return DeviceUtil.isNormal();
        } else {
            HttpServletRequest request = Request.getCurrentRequest();
            return pcDomain.contains(request.getServerName());
        }
    }
    
    /**
     * <pre>
     * 1. MethodName : setViewName
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : 접속 Device에 따라 ViewPage를 설정한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @param mv
     * @param key
     */
    protected void setViewName(ModelAndView mv, String key) {
        String viewName = urlPropertiesService.getString(key).replaceAll(".do", "");
        if (isNormal()) {
            viewName = viewName.replace(SERVER_PATH, Const.PATH.PC.getPath());
        } else {
            viewName = viewName.replace(SERVER_PATH, Const.PATH.MOBILE.getPath());
        }
        mv.setViewName(viewName);
    }

    /**
     * <pre>
     * 1. MethodName : setCommonViewName
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : 공통 ViewPage를 설정한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param mv
     * @param key
     */
    protected void setCommonViewName(ModelAndView mv, String key) {
        String viewName = urlPropertiesService.getString(key).replaceAll(".do", "");
        viewName = viewName.replace(SERVER_PATH + "/", "");
        mv.setViewName(viewName);
    }

    /**
     * <pre>
     * 1. MethodName : setPgViewName
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : PG ViewPage를 설정한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 15.
     * </pre>
     *
     * @param mv
     * @param key
     */
    protected void setPgViewName(ModelAndView mv, String key) {
        String viewName = urlPropertiesService.getString(key).replaceAll(".do", "").replaceAll("Pc", "").replaceAll("Mb", "");
        viewName = viewName.replace(SERVER_PATH + "/", "");
        mv.setViewName(viewName);
    }
    
    /**
     * <pre>
     * 1. MethodName : setPcViewName
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : PC ViewPage를 설정한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 2.
     * </pre>
     *
     * @param mv
     * @param key
     */
    protected void setPcViewName(ModelAndView mv, String key) {
        String viewName = urlPropertiesService.getString(key).replaceAll(".do", "");
        mv.setViewName(viewName.replace(SERVER_PATH, Const.PATH.PC.getPath()));
    }
    
    /**
     * <pre>
     * 1. MethodName : setMobileViewName
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : Mobile ViewPage를 설정한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 7. 2.
     * </pre>
     *
     * @param mv
     * @param key
     */
    protected void setMobileViewName(ModelAndView mv, String key) {
        String viewName = urlPropertiesService.getString(key).replaceAll(".do", "");
        mv.setViewName(viewName.replace(SERVER_PATH, Const.PATH.MOBILE.getPath()));
    }

    /**
     * <pre>
     * 1. MethodName : setResultView
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : 결과 페이지 설정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @param mv
     * @param key
     */
    protected void setResultView(ModelAndView mv, String key) {
        if (isNormal()) {
            mv.addObject("returnUrl", pcDomain + urlPropertiesService.getString(key));
        } else {
            mv.addObject("returnUrl", mobileDomain + urlPropertiesService.getString(key));
        }
        mv.setViewName("common/result");
    }

    /**
     * <pre>
     * 1. MethodName : setResultView
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : 결과 페이지 설정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param mv
     */
    protected void setResultView(ModelAndView mv) {
        mv.setViewName("common/result");
    }

    /**
     * <pre>
     * 1. MethodName : setRedirectView
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : 리다이렉트 페이지를 설정한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @param mv
     * @param key
     */
    protected void setRedirectView(ModelAndView mv, String key) {
        mv.setViewName("redirect:" + urlPropertiesService.getString(key));
    }

    /**
     * <pre>
     * 1. MethodName : setRedirectView
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : 리다이렉트 페이지를 설정한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 14.
     * </pre>
     *
     * @param mv
     * @param rv
     * @param key
     * @param params
     */
    protected void setRedirectView(ModelAndView mv, String key, Map<String, Object> params) {
        String queryString = "";
        int i = 0;
        for (String paramKey : params.keySet()) {
            if (params.get(paramKey).getClass().isArray()) {
                String[] array = StringUtil.getArray(params, paramKey);
                for (String str : array) {
                    queryString += (i > 0) ? "&" : "?";
                    queryString += paramKey;
                    queryString += "=";
                    queryString += StringUtil.getString(str);
                }
            } else {
                queryString += (i > 0) ? "&" : "?";
                queryString += paramKey;
                queryString += "=";
                queryString += StringUtil.getString(params, paramKey, "");
            }
            i++;
        }
        log.debug("queryString : [{}]", queryString);

        RedirectView rv = null;
        if (isNormal()) {
            rv = new RedirectView(pcDomain + urlPropertiesService.getString(key) + queryString);
        } else {
            rv = new RedirectView(mobileDomain + urlPropertiesService.getString(key) + queryString);
        }
        mv.setView(rv);
    }

    /**
     * <pre>
     * 1. MethodName : setErrorView
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : 사용자가 핸들링하는 오류 결과페이지 설정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param mv
     * @param e
     * @param clazz
     */
    protected void setErrorView(ModelAndView mv, CustomHandleException e, Class<?> clazz) {
        String alertMsg = Const.ERROR.E500.getMessage();
        if (clazz.equals(Const.class)) {
            Const.ERROR error = (Const.ERROR) e.getError();
            alertMsg = error.getMessage();
        } else if (clazz.equals(Product.class)) {
            Product.ERROR error = (Product.ERROR) e.getError();
            alertMsg = error.getMessage();
        } else if (clazz.equals(Contract.class)) {
            Contract.ERROR error = (Contract.ERROR) e.getError();
            alertMsg = error.getMessage();
        }

        mv.addObject("alertMsg", alertMsg);
        mv.addObject("historyBack", true);
        setResultView(mv);
    }

    /**
     * <pre>
     * 1. MethodName : setErrorView
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : 사용자가 핸들링하는 오류 결과페이지 설정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param mv
     * @param key
     * @param e
     * @param clazz
     */
    protected void setErrorView(ModelAndView mv, String key, CustomHandleException e, Class<?> clazz) {
        String alertMsg = Const.ERROR.E500.getMessage();
        if (clazz.equals(Const.class)) {
            Const.ERROR error = (Const.ERROR) e.getError();
            alertMsg = error.getMessage();
        } else if (clazz.equals(Product.class)) {
            Product.ERROR error = (Product.ERROR) e.getError();
            alertMsg = error.getMessage();
        } else if (clazz.equals(Contract.class)) {
            Contract.ERROR error = (Contract.ERROR) e.getError();
            alertMsg = error.getMessage();
        }
        mv.addObject("alertMsg", alertMsg);
        setResultView(mv, key);
    }

    /**
     * <pre>
     * 1. MethodName : setErrorView
     * 2. ClassName  : ControllerSupport.java
     * 3. Comment    : 사용자가 핸들링하는 오류 결과페이지 설정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 20.
     * </pre>
     *
     * @param mv
     * @param key
     * @param commandMap
     * @param e
     * @param clazz
     */
    protected void setErrorView(ModelAndView mv, String key, Map<String, Object> commandMap, CustomHandleException e, Class<?> clazz) {
        mv.addObject("commandMap", commandMap);
        setErrorView(mv, key, e, clazz);
        if (!"".equals(StringUtil.getString(e.getMsg()))) {
            mv.addObject("alertMsg", e.getMsg());
        }
    }
}
