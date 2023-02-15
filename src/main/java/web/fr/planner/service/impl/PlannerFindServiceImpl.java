package web.fr.planner.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import common.dao.CommonDefaultDAO;
import common.util.StringUtil;
import web.fr.planner.service.PlannerFindService;

/**
 * <pre>
 * &#64;PackageName: web.fr.planner.service.impl
 * &#64;FileName : PlannerFindServiceImpl.java
 * &#64;Date : 2020. 5. 12.
 * &#64;프로그램 설명 : 플래너 아이디/비밀번호 찾기
 * &#64;author upleat
 * </pre>
 */
@Service("plannerFindService")
public class PlannerFindServiceImpl implements PlannerFindService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectPlannerByCi
     * 2. ClassName  : PlannerFindServiceImpl.java
     * 3. Comment    : 플래너 정보 조회 by CI
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerFindService#selectPlannerByCi(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectPlannerByCi(Map<String, Object> commandMap) throws Exception {
        String RDP_MST_CI = StringUtil.getString(commandMap, "RDP_MST_CI", "");
        if (StringUtils.isNotBlank(RDP_MST_CI)) {
            return defaultDAO.select("PlannerFind.selectPlannerByCi", commandMap);
        } else {
            return null;
        }
    }

    /**
     * <pre>
     * 1. MethodName : selectPlannerByIdAndCi
     * 2. ClassName  : PlannerFindServiceImpl.java
     * 3. Comment    : 플래너 정보 조회 by 아이디 + CI
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerFindService#selectPlannerByIdAndCi(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectPlannerById(Map<String, Object> commandMap) throws Exception {
        String RDP_MST_ID = StringUtil.getString(commandMap, "RDP_MST_ID", "");
        if (StringUtils.isNotBlank(RDP_MST_ID)) {
            return defaultDAO.select("PlannerFind.selectPlannerById", commandMap);
        } else {
            return null;
        }
    }

    /**
     * <pre>
     * 1. MethodName : updatePlannerPassword
     * 2. ClassName  : PlannerFindServiceImpl.java
     * 3. Comment    : 플래너 비밀번호 수정
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 12.
     * </pre>
     *
     * @see web.fr.planner.service.PlannerFindService#updatePlannerPassword(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int updatePlannerPassword(Map<String, Object> commandMap) throws Exception {
        String RDP_MST_NO = StringUtil.getString(commandMap, "RDP_MST_NO", "");
        if (StringUtils.isNotBlank(RDP_MST_NO)) {
            return defaultDAO.update("PlannerFind.updatePlannerPassword", commandMap);
        } else {
            return 0;
        }
    }

}
