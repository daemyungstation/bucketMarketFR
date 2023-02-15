package common.interceptor;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import common.code.Const;
import common.exception.AuthenticationException;
import common.model.Planner.ROLE_PLANNER;
import common.model.User.ROLE_USER;
import common.session.SessionsKeyword;
import common.session.SessionsPlanner;
import common.session.SessionsSkyscraper;
import common.session.SessionsUser;
import common.util.DeviceUtil;
import common.util.IPUtil;
import common.util.StringUtil;
import lombok.extern.log4j.Log4j2;
import web.fr.common.service.CommonSearchService;
import web.fr.display.service.BannerDisplayService;
import web.fr.display.service.KeywordDisplayService;
import web.fr.product.service.BasicProductService;
import common.model.Request;
import common.model.Utm;
import common.session.SessionsUtm;

@Log4j2
public class WebAccessInterceptor implements HandlerInterceptor {

    @Resource(name = "keywordDisplayService")
    private KeywordDisplayService keywordDisplayService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;
    
    @Resource(name="commonSearchService")
    private CommonSearchService commonSearchService;
    
    @Resource(name="basicProductService")
    private BasicProductService basicProductService;

    private boolean isAccessPage(HttpServletRequest request) {
        boolean isAccessPage = true;
        String[] exemptionPatterns = { "ajax", "layer", "logout", "pg", "error", "/contract" };
        String requestURI = request.getRequestURI().toLowerCase();
        for (String exemptionPattern : exemptionPatterns) {
            if (requestURI.contains(exemptionPattern)) {
                isAccessPage = false;
                break;
            }
        }
        return isAccessPage;
    }

    private void accessInfoLogging(HttpServletRequest request) {
        if (this.isAccessPage(request) && log.isDebugEnabled()) {
            log.debug("============================ ACCESS INFO ============================");
            log.debug("DEVICE : [{}]", Const.DEVICE.get(DeviceUtil.getDeviceChar()));
            if (!DeviceUtil.isNormal()) {
                log.debug("OS : [{}]", Const.OS.get(DeviceUtil.getDeviceOsChar()));
            }
            log.debug("IP : [{}]", IPUtil.getClientIP());
            log.debug("=====================================================================");
        }
    }

    private void setKeywordList(HttpServletRequest request) {
        if (this.isAccessPage(request) && DeviceUtil.isNormal()) {
            List<Map<String, Object>> keywordList = null;
            if (!SessionsKeyword.isExists()) {
                try {
                    keywordList = this.keywordDisplayService.selectKeywordDisplayList(null);
                } catch (Exception e) {
                    if (log.isDebugEnabled()) {
                        e.printStackTrace();
                    } else {
                        log.error(Arrays.toString(e.getStackTrace()));
                    }
                }
                SessionsKeyword.setSessionKeyword(keywordList);
            } else {
                keywordList = SessionsKeyword.getSessionKeyword();
            }
            request.setAttribute("commonKeywordList", keywordList);
        }
    }

    private void setSkyscraper(HttpServletRequest request) {
        if (this.isAccessPage(request) && DeviceUtil.isNormal()) {
            List<Map<String, Object>> bannerList = null;
            if (!SessionsSkyscraper.isExists()) {
                try {
                    bannerList = this.bannerDisplayService.selectBannerDisplayList("DISPLAY_SKYSCRAPER");
                } catch (Exception e) {
                    if (log.isDebugEnabled()) {
                        e.printStackTrace();
                    } else {
                        log.error(Arrays.toString(e.getStackTrace()));
                    }
                }
                SessionsSkyscraper.setSessionSkyscraper(bannerList);
            } else {
                bannerList = SessionsSkyscraper.getSessionSkyscraper();
            }
            request.setAttribute("commonSkyscraperList", bannerList);
        }
    }
    
    private void setLatelyBasicProduct(HttpServletRequest request) {
        if (this.isAccessPage(request)) {
            try {
                String [] searchPrdMstNoArray = this.commonSearchService.getLatelyBasicProductNoArray();
                if (DeviceUtil.isNormal()) {
                    if (searchPrdMstNoArray.length > 0) {
                        Map<String, Object> commandMap = new HashMap<>();
                        commandMap.put("searchPrdMstNoArray", searchPrdMstNoArray);
                        request.setAttribute("comonLatelyBasicProductList", basicProductService.selectBasicProductList(commandMap));
                    }
                } else {
                    request.setAttribute("comonLatelyBasicProductCount", searchPrdMstNoArray.length);
                }
            } catch (Exception e) {
                if (log.isDebugEnabled()) {
                    e.printStackTrace();
                } else {
                    log.error(Arrays.toString(e.getStackTrace()));
                }
            }
        }
    }

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        this.accessInfoLogging(request);
        this.setKeywordList(request);
        this.setSkyscraper(request);
        this.setLatelyBasicProduct(request);
        request.setAttribute("device", DeviceUtil.getDeviceChar());
        request.setAttribute("deviceOs", DeviceUtil.getDeviceOsChar());
        request.setAttribute("SessionsUser", SessionsUser.getSessionUser(request));
        request.setAttribute("SessionsPlanner", SessionsPlanner.getSessionPlanner(request));
        request.setAttribute("isPlannerLogin", SessionsPlanner.isLogin(ROLE_PLANNER.planner));
        request.setAttribute("isUserLogin", SessionsUser.isLogin(ROLE_USER.contractor));
        // multiPartRequest로 넘어온 파라미터를 request.getParameter 로 가능하게 하도록 설정
        if (request instanceof MultipartHttpServletRequest) {
            RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(request));
        }
        
        String UTM_SOURCE = (request.getParameterValues("utm_source") != null) ? request.getParameterValues("utm_source")[0] : "";
        String UTM_MEDIUM = (request.getParameterValues("utm_medium") != null) ? request.getParameterValues("utm_medium")[0] : "";
        String UTM_CAMPAIGN = (request.getParameterValues("utm_campaign") != null) ? request.getParameterValues("utm_campaign")[0] : "";
        String UTM_TERM = (request.getParameterValues("utm_term") != null) ? request.getParameterValues("utm_term")[0] : "";
        String UTM_CONTENT = (request.getParameterValues("utm_content") != null) ? request.getParameterValues("utm_content")[0] : "";
        
        Utm utm = new Utm();
        if(!UTM_SOURCE.isEmpty()) utm.setUTM_SOURCE(UTM_SOURCE);
        if(!UTM_MEDIUM.isEmpty()) utm.setUTM_MEDIUM(UTM_MEDIUM);
        if(!UTM_CAMPAIGN.isEmpty()) utm.setUTM_CAMPAIGN(UTM_CAMPAIGN);
        if(!UTM_TERM.isEmpty()) utm.setUTM_TERM(UTM_TERM);
        if(!UTM_CONTENT.isEmpty()) utm.setUTM_CONTENT(UTM_CONTENT);
        
        if(!UTM_SOURCE.isEmpty() && !UTM_MEDIUM.isEmpty() && !UTM_CAMPAIGN.isEmpty() && !UTM_TERM.isEmpty() && !UTM_CONTENT.isEmpty()) {
            SessionsUtm.setSessionUtm(Request.getCurrentRequest(), utm);
        }

        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws AuthenticationException {
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
