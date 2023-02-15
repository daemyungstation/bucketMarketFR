package web.fr.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.CommandMap;
import common.code.Code;
import common.code.Product;
import common.exception.CustomHandleException;
import common.session.SessionsBoardUser;
import common.support.ControllerSupport;
import common.util.StringUtil;
import common.viewer.JSON;
import lombok.extern.log4j.Log4j2;
import web.fr.board.service.NoticeBoardService;
import web.fr.contract.controller.ContractController;
import web.fr.display.service.BannerDisplayService;
import web.fr.display.service.CategoryProductDisplayService;
import web.fr.display.service.KeywordDisplayService;
import web.fr.display.service.PopupDisplayService;
import web.fr.display.service.ProductDisplayService;
import web.fr.product.service.BasicProductService;

@Log4j2
@Controller
public class IndexController extends ControllerSupport {

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;

    @Resource(name = "popupDisplayService")
    private PopupDisplayService popupDisplayService;

    @Resource(name = "productDisplayService")
    private ProductDisplayService productDisplayService;

    @Resource(name = "keywordDisplayService")
    private KeywordDisplayService keywordDisplayService;

    @Resource(name = "categoryProductDisplayService")
    private CategoryProductDisplayService categoryProductDisplayService;

    @Resource(name = "noticeBoardService")
    private NoticeBoardService noticeBoardService;
    
    @Resource(name="basicProductService")
    private BasicProductService basicProductService;

    /**
     * <pre>
     * 1. MethodName : index
     * 2. ClassName  : IndexController.java
     * 3. Comment    : 메인 페이지
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 27.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${main.index}", method = RequestMethod.GET)
    public ModelAndView index(@CommandMap Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();

        Map<String, Object> info = new HashMap<>();

        Map<String, String[]> seoMetaMap = Code.SEO;
        String[] seoMeta = (String[]) seoMetaMap.get("main");
        mv.addObject("seoMeta", seoMeta);

        // TOP 배너
        info.put("top", this.bannerDisplayService.selectBannerDisplayList("BANNER_MAIN_TOP"));
        // 메인 프로모션 배너
        info.put("promotion", this.bannerDisplayService.selectBannerDisplayList("BANNER_MAIN_PROMOTION"));
        // 퀵 배너
        info.put("quick", this.bannerDisplayService.selectBannerDisplayList("BANNER_MAIN_QUICK"));
        // 기획전 배너
        info.put("exhibition", this.bannerDisplayService.selectBannerDisplayList("BANNER_MAIN_EXHIBITION"));
        // 중단 배너
        info.put("middle", this.bannerDisplayService.selectBannerDisplayList("BANNER_MAIN_MIDDLE"));
        // 하단 배너
        info.put("bottom", this.bannerDisplayService.selectBannerDisplayList("BANNER_MAIN_BOTTOM"));

        // 베스트 상품
        info.put("best", this.productDisplayService.selectProductDisplayListByCode(String.valueOf(Code.PRODUCT_MAIN_BEST), 4));
        // 키워드 상품
        info.put("keyword", this.productDisplayService.selectProductDisplayListByCode(String.valueOf(Code.PRODUCT_MAIN_KEYWORD), null, false));
        // 인기 키워드 목록
        info.put("keywordList", this.keywordDisplayService.selectKeywordDisplayList(commandMap));

        // 추천 상품 대상 카테고리 목록
        List<Map<String, Object>> recommendCategoryList = this.productDisplayService.selectProductDisplayCategoryList();
        info.put("recommendCategoryList", recommendCategoryList);
        // 랜덤 카테고리
        if (recommendCategoryList != null) {
            if (recommendCategoryList.size() > 0) {
                int randmoRecommendCategory = new Random().nextInt(recommendCategoryList.size());
                info.put("randmoRecommendCategory", randmoRecommendCategory);
                if (recommendCategoryList != null && recommendCategoryList.size() > 0) {
                    info.put("recommendProductList", this.productDisplayService.selectProductDisplayListByCode(StringUtil.getString(recommendCategoryList.get(randmoRecommendCategory), "CMN_COM_IDX"), 6, false));
                }
            }
        }
        
        try {
            basicProductService.setBasicProductPlannerKey(commandMap);
        } catch (CustomHandleException e) {
            setErrorView(mv, e, Product.class);
        }

        // 카테고리
        commandMap.put("PRD_CTG_UP_IDX", "0");
        info.put("categoryList", categoryProductDisplayService.selectCategoryProductDisplayList(commandMap));

        // 공지사항 목록
        commandMap.put("startNum", "1");
        commandMap.put("endNum", "4");
        info.put("noticeList", noticeBoardService.selectNoticeBoardList(commandMap));

        // 팝업
        info.put("popupList", popupDisplayService.selectPopupDisplayList());

        mv.addObject("info", info);
        setViewName(mv, "main.index");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : reloadRecommendProduct
     * 2. ClassName  : IndexController.java
     * 3. Comment    : 추천상품 목록 불러오기
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 8.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "${main.reload.recommend.product.ajax}", method = RequestMethod.POST)
    public JSON reloadRecommendProduct(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("recommendProductList", this.productDisplayService.selectProductDisplayListByCode(StringUtil.getString(commandMap, "CMN_COM_IDX"), 6, Boolean.valueOf(StringUtil.getString(commandMap, "random", "false"))));
        return json;
    }
}
