package common.exception;

import java.util.Map;

/**
 * <pre>
 * &#64;PackageName: common.exception
 * &#64;FileName : AuthenticationException.java
 * &#64;Date : 2020. 7. 2.
 * &#64;프로그램 설명 : TODO
 * &#64;author upleat
 * </pre>
 */
public class AuthenticationException extends RuntimeException {

    private static final long serialVersionUID = 3498506098023809550L;

    private String key;
    private Map<String, Object> commandMap;
    private boolean redirect;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Map<String, Object> getCommandMap() {
        return commandMap;
    }

    public void setCommandMap(Map<String, Object> commandMap) {
        this.commandMap = commandMap;
    }

    public AuthenticationException() {
    }

    public boolean isRedirect() {
        return redirect;
    }

    public void setRedirect(boolean redirect) {
        this.redirect = redirect;
    }

    public AuthenticationException(String key) {
        this.key = key;
    }

    public AuthenticationException(String key, Map<String, Object> commandMap) {
        this.key = key;
        this.commandMap = commandMap;
    }

    public AuthenticationException(String key, boolean redirect) {
        this.key = key;
        this.redirect = redirect;
    }

    public AuthenticationException(String key, Map<String, Object> commandMap, boolean redirect) {
        this.key = key;
        this.commandMap = commandMap;
        this.redirect = redirect;
    }

    @Override
    public String toString() {
        return "AuthenticationException [key=" + key + ", commandMap=" + commandMap + ", redirect=" + redirect + "]";
    }

}