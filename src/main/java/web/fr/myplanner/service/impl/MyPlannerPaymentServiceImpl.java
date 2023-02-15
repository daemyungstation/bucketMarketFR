package web.fr.myplanner.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.session.SessionsPlanner;
import web.fr.myplanner.service.MyPlannerPaymentService;

/**
 * 
 * <pre>
 * &#64;PackageName: web.fr.myplanner.service.impl
 * &#64;FileName : MyPlannerCampaignServiceImpl.java
 * &#64;Date : 2020. 5. 18.
 * &#64;프로그램 설명 : 마이플래너 지급내역
 * &#64;author upleat
 * </pre>
 */
@Service("myPlannerPaymentService")
public class MyPlannerPaymentServiceImpl implements MyPlannerPaymentService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPaymentList(Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_MST_IDX", SessionsPlanner.getSessionValue("RDP_MST_IDX"));
        return (List<Map<String, Object>>) this.defaultDAO.selectList("MyPlannerPayment.selectPaymentList", commandMap);
    }

    @Override
    public Map<String, Object> selectPaymentDetailSummary(Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_MST_IDX", SessionsPlanner.getSessionValue("RDP_MST_IDX"));
        return this.defaultDAO.select("MyPlannerPayment.selectPaymentDetailSummary", commandMap);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectPaymentDetailList(Map<String, Object> commandMap) throws Exception {
        commandMap.put("RDP_MST_IDX", SessionsPlanner.getSessionValue("RDP_MST_IDX"));
        return (List<Map<String, Object>>) this.defaultDAO.selectList("MyPlannerPayment.selectPaymentDetailList", commandMap);
    }

}
