package web.fr.dlcc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import lombok.extern.log4j.Log4j2;
import web.fr.contract.service.ContractService;
import web.fr.dlcc.model.OrderDtlModel;
import web.fr.dlcc.service.DlccService;

/**
 * 
 * <pre>
 * &#64;PackageName: web.fr.dlcc.service.impl
 * &#64;FileName : DlccServiceImpl.java
 * &#64;Date : 2020. 5. 14.
 * &#64;프로그램 설명 : DLCC 상세납입 정보
 * &#64;author 장성철
 * </pre>
 */
@Log4j2
@Service("dlccService")
public class DlccServiceImpl implements DlccService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "contractService")
    private ContractService contractService;

    @Async("dlccThreadPool")
    @Override
    public void doJob05(List<String> accntNoList) throws Exception {

        log.info(" == [doJob05 : 상세납입 정보 Start] ================================= ");

        try {
            if (CollectionUtils.isNotEmpty(accntNoList)) {
                List<OrderDtlModel> orderDtlList = this.defaultDAO.getSqlSessionForDlcc().selectList("DlccViewMapper.selectOrderDtlList", accntNoList);
                orderDtlList.forEach(model -> {
                    defaultDAO.getSqlSession().insert("DlccMergeMapper.mergeOrderDtl", model);
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        log.info(" == [doJob05 : 상세납입 정보 End] ================================= ");
    }
}
