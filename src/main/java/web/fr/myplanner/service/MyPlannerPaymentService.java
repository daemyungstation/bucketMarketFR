package web.fr.myplanner.service;

import java.util.List;
import java.util.Map;

/**
 * <pre>
 * &#64;PackageName: web.fr.myplanner.service
 * &#64;FileName : MyPlannerCampaignService.java
 * &#64;Date : 2020. 5. 18.
 * &#64;프로그램 설명 : 캠페인 실적
 * &#64;author upleat
 * </pre>
 */
public interface MyPlannerPaymentService {

    public List<Map<String, Object>> selectPaymentList(Map<String, Object> commandMap) throws Exception;

    public Map<String, Object> selectPaymentDetailSummary(Map<String, Object> commandMap) throws Exception;

    public List<Map<String, Object>> selectPaymentDetailList(Map<String, Object> commandMap) throws Exception;
}
