package common.session;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.model.Request;

public class SessionsPaymentGate {
    
    private static final String SESSION_PAYMENT_GATE_NM = "__SESSION_PAYMENT_GATE_NM__";
    
    private static HttpSession getSession() {
        HttpServletRequest request = Request.getCurrentRequest();
        return request.getSession();
    }
    
    public static void setSessionPaymentGate(Map<String, Object> data) {
        getSession().setAttribute(SESSION_PAYMENT_GATE_NM, data);
    }
    
    @SuppressWarnings("unchecked")
    public static Map<String, Object> getSessionPaymentGate() {
        return (Map<String, Object>) getSession().getAttribute(SESSION_PAYMENT_GATE_NM);
    }
    
    public static void setSessionPaymentGateClear() {
        getSession().setAttribute(SESSION_PAYMENT_GATE_NM, null);
    }
}
