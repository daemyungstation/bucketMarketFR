package common.resolvers;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.navercorp.lucy.security.xss.servletfilter.XssEscapeFilter;

import common.annotation.CommandMap;
/**
 * <pre>
 * @PackageName: common.resolvers
 * @FileName : CommandMapArgumentResolver.java
 * @Date : 2020. 4. 8.
 * @프로그램 설명 : HTTP request 객체에 있는 파라미터이름과 값을 commandMap에 담는다.
 * @author upleat
 * </pre>
 */
public class CommandMapArgumentResolver implements HandlerMethodArgumentResolver {
    
    private XssEscapeFilter xssEscapeFilter = XssEscapeFilter.getInstance();

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return (Map.class.isAssignableFrom(parameter.getParameterType()) && parameter.hasParameterAnnotation(CommandMap.class));
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        Map<String, Object> commandMap = new HashMap<String, Object>();
        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        Enumeration<?> enumeration = request.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String key = (String) enumeration.nextElement();
            String[] values = request.getParameterValues(key);
            if (values != null) {
                if (values.length > 1) {
                    if (request instanceof MultipartHttpServletRequest) {
                        for (String value : values) {
                            value = xssEscapeFilter.doFilter(request.getRequestURI(), key, value);
                        }
                    }
                    commandMap.put(key, values);
                } else {
                    if (request instanceof MultipartHttpServletRequest) {
                        commandMap.put(key, xssEscapeFilter.doFilter(request.getRequestURI(), key, values[0]));
                    } else {
                        commandMap.put(key, values[0]);
                    }
                }
            }
        }
        return commandMap;
    }
}
