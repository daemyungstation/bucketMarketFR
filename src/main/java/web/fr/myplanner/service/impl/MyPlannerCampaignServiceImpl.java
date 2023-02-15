package web.fr.myplanner.service.impl;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsPlanner;
import common.util.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import web.fr.myplanner.service.MyPlannerCampaignService;
import web.naver.api.service.NaverApiService;

/**
 * 
 * <pre>
 * &#64;PackageName: web.fr.myplanner.service.impl
 * &#64;FileName : MyPlannerCampaignServiceImpl.java
 * &#64;Date : 2020. 5. 18.
 * &#64;프로그램 설명 : 캠페인 생성
 * &#64;author upleat
 * </pre>
 */
@Log4j2
@Service("myPlannerCampaignService")
public class MyPlannerCampaignServiceImpl implements MyPlannerCampaignService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "naverApiService")
    private NaverApiService naverApiService;

    @Resource(name = "urlPropertiesService")
    private EgovPropertyService urlPropertiesService;

    @Value("#{resource['front.ssl.domain']}")
    private String pcDomain;

    /**
     * <pre>
     * 1. MethodName : selectProductCategoryList
     * 2. ClassName  : MyPlannerCampaignServiceImpl.java
     * 3. Comment    : 캠페인 상품 카테고리 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 18.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCampaignService#selectProductCategoryList()
     * @param
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectProductCategoryList() throws Exception {
        return (List<Map<String, Object>>) this.defaultDAO.selectList("MyPlannerCampaign.selectProductCategoryList", null);
    }

    /**
     * <pre>
     * 1. MethodName : selectProductList
     * 2. ClassName  : MyPlannerCampaignServiceImpl.java
     * 3. Comment    : 캠페인 상품 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 18.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCampaignService#selectProductList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectProductList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) this.defaultDAO.selectList("MyPlannerCampaign.selectProductList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectProductListCount
     * 2. ClassName  : MyPlannerCampaignServiceImpl.java
     * 3. Comment    : 캠페인 상품 목록 개수
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 18.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCampaignService#selectProductListCount(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int selectProductListCount(Map<String, Object> commandMap) throws Exception {
        return this.defaultDAO.selectCount("MyPlannerCampaign.selectProductListCount", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectProductInfo
     * 2. ClassName  : MyPlannerCampaignServiceImpl.java
     * 3. Comment    : 캠페인 상품 상세
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 18.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCampaignService#selectProductInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectProductInfo(Map<String, Object> commandMap) throws Exception {
        String RDP_MST_NO = SessionsPlanner.getSessionValue("RDP_MST_NO");

        // 상품 상세
        commandMap.put("PRP_RDP_MST_NO", RDP_MST_NO);
        Map<String, Object> info = this.defaultDAO.select("MyPlannerCampaign.selectProductInfo", commandMap);

        String fullUrl = this.pcDomain + urlPropertiesService.getString("product.basic.view") + "?PRD_MST_NO=" + StringUtil.getString(info, "PRD_MST_NO", "") + "&plannerNo=" + RDP_MST_NO;
        String shortenUrl = this.naverApiService.getShortenUrl(fullUrl);
        // 단축 URL 생성
        info.put("CAMPAIGN_SHORTEN_URL", shortenUrl);
        info.put("CAMPAIGN_URL", fullUrl);

        return info;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectProductMainInfo
     * 2. ClassName  : MyPlannerCampaignServiceImpl.java
     * 3. Comment    : 캠페인 메인
     * 4. 작성자       : inus
     * 5. 작성일       : 2021. 5. 7.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCampaignService#selectProductInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectProductMainInfo(Map<String, Object> commandMap) throws Exception {
        String RDP_MST_NO = SessionsPlanner.getSessionValue("RDP_MST_NO");

        Map<String, Object> info = new HashMap<String, Object>();
        // 단축 URL 생성
        info.put("CAMPAIGN_SHORTEN_URL", this.naverApiService.getShortenUrl(this.pcDomain + "?plannerNo=" + RDP_MST_NO));
        info.put("CAMPAIGN_URL", this.pcDomain + "?plannerNo=" + RDP_MST_NO);
        return info;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectProductIntroInfo
     * 2. ClassName  : MyPlannerCampaignServiceImpl.java
     * 3. Comment    : 캠페인 소개
     * 4. 작성자       : inus
     * 5. 작성일       : 2021. 11. 26.
     * </pre>
     *
     * @see web.fr.myplanner.service.MyPlannerCampaignService#selectProductInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectProductIntroInfo(Map<String, Object> commandMap) throws Exception {
        String RDP_MST_NO = SessionsPlanner.getSessionValue("RDP_MST_NO");

        Map<String, Object> info = new HashMap<String, Object>();
        // 단축 URL 생성
        info.put("CAMPAIGN_SHORTEN_URL", this.naverApiService.getShortenUrl(this.pcDomain + "/fr/contents/introductionView.do?plannerNo=" + RDP_MST_NO));
        info.put("CAMPAIGN_URL", this.pcDomain + "/fr/contents/introductionView.do?plannerNo=" + RDP_MST_NO);
        //info.put("CAMPAIGN_SHORTEN_URL", "https://twww.bucketmarket.co.kr/fr/contents/introductionView.do?plannerNo=" + RDP_MST_NO);
        //info.put("CAMPAIGN_URL", "https://twww.bucketmarket.co.kr/fr/contents/introductionView.do?plannerNo=" + RDP_MST_NO);
        return info;
    }

    /**
     * <pre>
     * 1. MethodName : selectCampaignSellerShortUrlList
     * 2. ClassName  : MyPlannerCampaignService.java
     * 3. Comment    : 캠페인 판매자 단축 URL 조회
     * 4. 작성자       : inus
     * 5. 작성일       : 2022. 03. 04.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> selectCampaignSellerShortenUrlList(Map<String, Object> commandMap) throws Exception {
        List<Map<String, Object>> list = null;
        //이름이 넘어온 경우 단축 URL 생성
        String sellerName = (String)commandMap.get("SELLER_NAME");;
        String RDP_MST_NO = SessionsPlanner.getSessionValue("RDP_MST_NO");
        String PRD_MST_NO = StringUtil.getString(commandMap, "PRD_MST_NO", "");
        commandMap.put("PRD_MST_NO", PRD_MST_NO);
        commandMap.put("RDP_MST_NO", RDP_MST_NO);
        if(!StringUtils.isEmpty(sellerName)) {
            // 단축 URL 생성
//            String newSellerUrl = this.pcDomain + "/fr/contents/introductionView.do?plannerNo=" + RDP_MST_NO + "&sellerName=" + sellerName;
//            String newSellerShortenUrl=  this.naverApiService.getShortenUrl(newSellerUrl);
            String newSellerUrl = this.pcDomain + urlPropertiesService.getString("product.basic.view") + "?PRD_MST_NO=" + PRD_MST_NO + "&plannerNo=" + RDP_MST_NO+ "&sellerName=" + sellerName;
            String newSellerShortenUrl =  this.naverApiService.getShortenUrl(newSellerUrl);
            commandMap.put("SELLER_SHORTEN_URL", newSellerShortenUrl);
            commandMap.put("SELLER_ORIGIN_URL", newSellerUrl);
            if( !StringUtils.isEmpty(newSellerShortenUrl)) {
                try {
                    this.defaultDAO.insert("MyPlannerCampaign.newSellerShortenUrl", commandMap);
                }
                catch(SQLIntegrityConstraintViolationException e)
                {
                    log.warn("Oops : 중복 에러 , UI에서 처리가 미흡한 UI에서 중복 처리");
                } catch(DataIntegrityViolationException e){
                    if( e.getCause() instanceof SQLIntegrityConstraintViolationException) {
                        log.warn("Oops : 중복 에러 , UI에서 처리가 미흡한 UI에서 중복 처리");
                    } else {
                        throw e;
                    }
                }
            }
        }
        list = (List<Map<String, Object>>)this.defaultDAO.selectList("MyPlannerCampaign.selectSellerShortenUrlList", commandMap);
        log.debug(" SelectCampaignSellerShortenUrlList : {}, {}", commandMap, list.size());
        return list;
    }

}
