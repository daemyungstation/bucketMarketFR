package common.matcher;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.security.web.util.matcher.OrRequestMatcher;
import org.springframework.security.web.util.matcher.RegexRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import common.util.StringUtil;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class CsrfRequestMatcher implements RequestMatcher {
    
    private Pattern allowedMethods = Pattern.compile("^(GET|HEAD|TRACE|OPTIONS)$");
    private List<RequestMatcher> matcherList = new ArrayList<RequestMatcher>() {
        private static final long serialVersionUID = -7196862630415763679L;
        {
            add(new RegexRequestMatcher("/fr/common/oneselfReqNumAjax.do", null, true));
            add(new RegexRequestMatcher("/fr/common/oneselfReqAjax.do", null, true));
            add(new RegexRequestMatcher("/fr/common/oneselfReqPopup.do", null, true));
            add(new RegexRequestMatcher("/fr/common/oneselfResult.do", null, true));
            add(new RegexRequestMatcher("/fr/common/oneselfResultAjax.do", null, true));
            add(new RegexRequestMatcher("/fr/contract/joinFormSaveAjax.do", null, true));
            add(new RegexRequestMatcher("/fr/contract/joinFormDataExistsAjax.do", null, true));
            add(new RegexRequestMatcher("/fr/pg/requestPcResult.do", null, true));
            add(new RegexRequestMatcher("/fr/pg/requestMbResult.do", null, true));
            add(new RegexRequestMatcher("/fr/contract/joinRegist.do", null, true));
            add(new RegexRequestMatcher("/fr/contract/joinStep2Form.do", null, true));
            add(new RegexRequestMatcher("/fr/planner/plannerJoinStep2Form.do", null, true));
            add(new RegexRequestMatcher("/fr/mycontract/infoListView.do", null, true));
            add(new RegexRequestMatcher("/fr/planner/plannerFindIdResultView.do", null, true));
            add(new RegexRequestMatcher("/fr/planner/plannerFindPwResetForm.do", null, true));
            add(new RegexRequestMatcher("/fr/myplanner/myplannerChangePhoneFormAjax.do", null, true));
            add(new RegexRequestMatcher("/fr/display/categoryProductDisplayListAjax.do", null, true));
        }
    };
    
    private RequestMatcher unprotectedMatcher = new OrRequestMatcher(matcherList);
    
    @Override
    public boolean matches(HttpServletRequest request) {
        if (!allowedMethods.matcher(request.getMethod()).matches() && !unprotectedMatcher.matches(request)) {
            CsrfToken token = new HttpSessionCsrfTokenRepository().loadToken(request);
            log.debug("========================== CSRF TOKEN INFO ==========================");
            
            if (Boolean.parseBoolean(request.getHeader("isAjax"))) {
                log.debug("RequestURI : [{}]", request.getRequestURI());
                log.debug("Server token : [{}]      Request token : [{}]", StringUtil.getString(token.getToken()), request.getHeader(StringUtil.getString(token.getHeaderName())));
            } else {
                log.debug("RequestURI : [{}]", request.getRequestURI());
                log.debug("Server token : [{}]      Request token : [{}]", StringUtil.getString(token.getToken()), request.getParameter(StringUtil.getString(token.getParameterName())));
            }
            log.debug("=====================================================================");
        } 
        
        if (allowedMethods.matcher(request.getMethod()).matches()) {
            return false;
        }
        return !unprotectedMatcher.matches(request);
    }
}