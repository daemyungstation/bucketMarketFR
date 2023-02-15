package web.fr.product.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.code.Code;
import common.model.Paging;
import common.session.SessionsBoardUser;
import common.session.SessionsUser;
import common.support.ControllerSupport;
import common.util.AesCrypto;
import common.util.StringUtil;
import common.viewer.JSON;
import web.fr.common.service.CommonService;
import web.fr.product.service.BasicProductService;
import web.fr.product.service.ProductQnAService;

@Controller
public class ProductQnAController extends ControllerSupport {

    @Resource(name="productQnAService")
    private ProductQnAService productQnaService;
    
    @Resource(name="basicProductService")
    private BasicProductService basicProductService;
    
    @Resource(name="commonService")
    private CommonService commonService;
    
    /**
     * <pre>
     * 1. MethodName : productQnAListLayer
     * 2. ClassName  : ProductQnAController.java
     * 3. Comment    : 프론트 > 상품상세 > QNA > 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${product.qna.list.layer}", method=RequestMethod.POST)
    public ModelAndView productQnAListLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        SessionsUser.setSessionClear(request);
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "product.qna.list.layer");
        return mv;
    }
    
    
    /**
     * <pre>
     * 1. MethodName : productQnaListAjax
     * 2. ClassName  : ProductQnAController.java
     * 3. Comment    : 프론트 > 상품상세 > QNA > 목록 (Ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${product.qna.list.ajax}", method=RequestMethod.POST)
    public JSON productQnaListAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        String searchPrdQnARplYn = StringUtil.getString(commandMap, "searchPrdQnARplYn", "");
        
        commandMap.put("searchPrdQnARplYn", "Y");
        json.put("answerCount", productQnaService.selectProductQnAListCount(commandMap));
        
        String searchPrdQnAMemNm = StringUtil.getString(SessionsBoardUser.getSessionValue("USER_NM"));
        if (!"".equals(searchPrdQnAMemNm)) {
            commandMap.put("searchPrdQnAMemNm", searchPrdQnAMemNm);
            commandMap.put("searchPrdQnAMemPw", AesCrypto.decrypt(SessionsBoardUser.getSessionValue("USER_PWD")));
        }
        commandMap.put("searchPrdQnARplYn", searchPrdQnARplYn);
        int totalCount = productQnaService.selectProductQnAListCount(commandMap);
        json.put("totalCount", totalCount);
        json.put("paging", new Paging(totalCount, commandMap));
        if (totalCount > 0) {
            json.put("list", productQnaService.selectProductQnAList(commandMap));
        }
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : productQnaLoginAjax
     * 2. ClassName  : ProductQnAController.java
     * 3. Comment    : 프론트 > 상품상세 > QNA > 로그인 (Ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${product.qna.login.ajax}", method=RequestMethod.POST)
    public JSON productQnaLoginAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", (productQnaService.selectProductQnAListCount(commandMap) > 0));
        return json;
    }
    
    /**
     * <pre>
     * 1. MethodName : productQnAFormLayer
     * 2. ClassName  : ProductQnAController.java
     * 3. Comment    : 프론트 > 상품상세 > QNA > 등록 폼
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${product.qna.form.layer}", method=RequestMethod.POST)
    public ModelAndView productQnAFormLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();
        commandMap.put("AGR_MST_GBN", Code.TERM_PERSONAL_INFORMATION_USE_BASIC);
        mv.addObject("basicProductInfo", basicProductService.selectBasicProductInfo(commandMap));
        mv.addObject("termInfo", commonService.selectCommonTermInfo(commandMap).get("term"));
        mv.addObject("commandMap", commandMap);
        setViewName(mv, "product.qna.form.layer");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : productQnARegistAjax
     * 2. ClassName  : ProductQnAController.java
     * 3. Comment    : 프론트 > 상품상세 > QNA > 등록 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="${product.qna.regist.ajax}", method=RequestMethod.POST)
    public JSON productQnARegistAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", (productQnaService.insertProductQnA(commandMap) > 0));
        return json;
    }
}
