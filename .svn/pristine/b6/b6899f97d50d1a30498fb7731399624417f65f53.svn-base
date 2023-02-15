package web.fr.mycontract.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import common.code.Code;
import common.dao.CommonDefaultDAO;
import common.session.SessionsUser;
import common.util.IPUtil;
import common.util.StringUtil;
import web.fr.common.service.CommonFileService;
import web.fr.mycontract.service.MyContractCommonService;
import web.message.MessageType;
import web.message.service.MessageService;

@Service("myContractCommonService")
public class MyContractCommonServiceImpl implements MyContractCommonService {

    @Resource(name = "defaultDAO")
    private CommonDefaultDAO defaultDAO;

    @Resource(name = "commonFileService")
    private CommonFileService commonFileService;

    @Resource(name = "messageService")
    private MessageService messageService;

    private static final String UPLOAD_PATH = "mycontract";
    private static final String UPLOAD_ALLOW = "image";
    private static final String UPLOAD_DATE_FOLDER_FLAG = "Y";

    /**
     * <pre>
     * 1. MethodName : selectContractList
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 가입내역 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @see web.fr.mycontract.service.MyContractCommonService#selectContractList(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Map<String, Object>> selectContractList(HttpServletRequest request, Map<String, Object> commandMap) {
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));
        return (List<Map<String, Object>>) defaultDAO.selectList("MyContractCommon.selectContractList", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectContractDetail
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 가입내역 상세 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @see web.fr.mycontract.service.MyContractCommonService#selectContractDetail(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectContractDetail(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));

        // 가입 상태 별 분기
        Map<String, Object> info = defaultDAO.select("MyContractCommon.selectContractInfo", commandMap);

        // 상세 정보 기준이 계약 상태에 따라 달라진다
        // - 접수 : 대명 데이터 우선
        // - 가입대기, 가입 : DLCC 데이터 우선
        int contractStatusCode = StringUtil.getInt(info, "CONTRACT_STATUS", Code.CONTRACT_STATUS_RECEIPT);
        if (contractStatusCode == Code.CONTRACT_STATUS_RECEIPT) {
            info.putAll(defaultDAO.select("MyContractCommon.selectContractReceiptDetail", commandMap));
        } else {
            info.putAll(defaultDAO.select("MyContractCommon.selectContractJoinDetail", commandMap));
        }

        return info;
    }

    /**
     * <pre>
     * 1. MethodName : selectContractInfo
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 가입내역 상세 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @see web.fr.mycontract.service.MyContractCommonService#selectContractInfo(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectContractInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));

        return defaultDAO.select("MyContractCommon.selectContractInfo", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectPaymentList
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 납입/환급 정보 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectPaymentInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));

        // 기본정보
        Map<String, Object> info = defaultDAO.select("MyContractCommon.selectContractInfo", commandMap);
        // 상세정보
        info.putAll(defaultDAO.select("MyContractCommon.selectContractJoinDetail", commandMap));
        // 납입정보
        info.put("paymentList", defaultDAO.selectList("MyContractCommon.selectPaymentList", commandMap));

        return info;
    }

    /**
     * <pre>
     * 1. MethodName : selectContractBenefit
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 혜택정보 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 2.
     * </pre>
     *
     * @see web.fr.mycontract.service.MyContractCommonService#selectContractBenefit(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectContractBenefit(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));

        // 기본정보
        Map<String, Object> info = defaultDAO.select("MyContractCommon.selectContractInfo", commandMap);
        // 상세정보
        info.putAll(defaultDAO.select("MyContractCommon.selectContractJoinDetail", commandMap));
        // 혜택정보
        info.put("benefitList", defaultDAO.selectList("MyContractCommon.selectBenefitList", commandMap));

        return info;
    }

    /**
     * <pre>
     * 1. MethodName : selectContractShipping
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 배송정보 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 2.
     * </pre>
     *
     * @see web.fr.mycontract.service.MyContractCommonService#selectContractShipping(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectContractShipping(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));

        // 기본정보
        Map<String, Object> info = defaultDAO.select("MyContractCommon.selectContractInfo", commandMap);
        // 상세정보
        info.putAll(defaultDAO.select("MyContractCommon.selectContractJoinDetail", commandMap));

        return info;
    }

    /**
     * <pre>
     * 1. MethodName : selectContractGroupInfo
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 가입내역 그룹 상세 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 2.
     * </pre>
     *
     * @see web.fr.mycontract.service.MyContractCommonService#selectContractGroupInfo(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectContractGroupInfo(Map<String, Object> commandMap) throws Exception {
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));

        return defaultDAO.select("MyContractCommon.selectContractGroupInfo", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : insertContractReview
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 가입후기 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @see web.fr.mycontract.service.MyContractCommonService#insertContractReview(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int insertContractReview(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("PRD_REV_REG_IP", IPUtil.getClientIP());

        int result = 0;
        String[] ORD_MST_IDXs = StringUtil.getArray(commandMap, "ORD_MST_IDXs");
        
        int i = 0;
        for (String ORD_MST_IDX : ORD_MST_IDXs) {
            if(i == 0) {
                commandMap.put("ORD_MST_IDX", ORD_MST_IDX);
                result += defaultDAO.insert("MyContractCommon.insertContractReview", commandMap);
                commandMap.put("CMM_FLE_NM", "FILE");
                commandMap.put("CMM_FLE_TB_NM", "T_PRD_REV");
                commandMap.put("CMM_FLE_TB_PK", StringUtil.getString(commandMap.get("PRD_REV_IDX"), ""));
                this.commonFileService.insertCommonFileList(request, commandMap, UPLOAD_PATH, UPLOAD_ALLOW, UPLOAD_DATE_FOLDER_FLAG);
            }
            i++;
        }

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : insertLifeService
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 라이프서비스 변경 요청 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int insertLifeService(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("CLM_LFS_REG_IP", IPUtil.getClientIP());
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));

        // 변경 요청 등록
        int result = this.defaultDAO.insert("MyContractCommon.insertLifeService", commandMap);

        // 알림톡 발송
        if (result > 0) {
            Map<String, Object> message = this.defaultDAO.select("MyContractCommon.selectLifeServiceAlimMessage", commandMap);
            String USER_HP = SessionsUser.getSessionValue("USER_HP");
            String USER_NM = SessionsUser.getSessionValue("USER_NM");
            String PRD_MST_NM = StringUtil.getString(message, "PRD_MST_NM");
            String ACCNT_NO = StringUtil.getString(message, "ACCNT_NO");
            String CLM_LFS_SVC_NM = StringUtil.getString(message, "CLM_LFS_SVC_NM");
            this.messageService.sendAlimTalk(MessageType.CONTRACT_LIFESERVICE_REQUEST, USER_HP, USER_NM, System.currentTimeMillis(), PRD_MST_NM, ACCNT_NO, CLM_LFS_SVC_NM);
        }

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : insertContractCancel
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 해지신청 요청 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @see web.fr.mycontract.service.MyContractCommonService#insertContractCancel(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int insertContractCancel(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("CLM_CCL_REG_IP", IPUtil.getClientIP());
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));

        // 해지 신청
        int result = this.defaultDAO.insert("MyContractCommon.insertContractCancel", commandMap);

        // 알림톡 발송
        if (result > 0) {
            Map<String, Object> message = this.defaultDAO.select("MyContractCommon.selectContractCancelAlimMessage", commandMap);
            String USER_HP = SessionsUser.getSessionValue("USER_HP");
            String USER_NM = SessionsUser.getSessionValue("USER_NM");
            String PRD_MST_NM = StringUtil.getString(message, "PRD_MST_NM");
            String ACCNT_NO = StringUtil.getString(message, "ACCNT_NO");
            this.messageService.sendAlimTalk(MessageType.CONTRACT_CANCEL_REQUEST, USER_HP, USER_NM, System.currentTimeMillis(), PRD_MST_NM, ACCNT_NO);
        }

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : insertContractTransfer
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 양도양수 신청 요청 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @see web.fr.mycontract.service.MyContractCommonService#insertContractTransfer(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int insertContractTransfer(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("CLM_TRS_REG_IP", IPUtil.getClientIP());
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));

        // 양도양수 신청
        int result = this.defaultDAO.insert("MyContractCommon.insertContractTransfer", commandMap);

        // 알림톡 발송
        if (result > 0) {
            Map<String, Object> message = this.defaultDAO.select("MyContractCommon.selectContractTransferAlimMessage", commandMap);
            String USER_HP = SessionsUser.getSessionValue("USER_HP");
            String USER_NM = SessionsUser.getSessionValue("USER_NM");
            String PRD_MST_NM = StringUtil.getString(message, "PRD_MST_NM");
            String ACCNT_NO = StringUtil.getString(message, "ACCNT_NO");
            this.messageService.sendAlimTalk(MessageType.CONTRACT_TRANSFER_REQUEST, USER_HP, USER_NM, System.currentTimeMillis(), PRD_MST_NM, ACCNT_NO);
        }

        return result;
    }

    /**
     * <pre>
     * 1. MethodName : insertCardPaymentMethodChange
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : 카드 결제정보 변경 요청 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 2.
     * </pre>
     *
     * @see web.fr.mycontract.service.MyContractCommonService#insertCardPaymentMethodChange(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int insertCardPaymentMethodChange(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("CLM_ACT_REG_IP", IPUtil.getClientIP());
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));
        return this.defaultDAO.insert("MyContractCommon.insertCardPaymentMethodChange", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : insertCmsPaymentMethodChange
     * 2. ClassName  : MyContractCommonServiceImpl.java
     * 3. Comment    : CMS 결제정보 변경 요청 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 2.
     * </pre>
     *
     * @see web.fr.mycontract.service.MyContractCommonService#insertCmsPaymentMethodChange(javax.servlet.http.HttpServletRequest,
     *      java.util.Map)
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @Override
    public int insertCmsPaymentMethodChange(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
        commandMap.put("CLM_ACT_REG_IP", IPUtil.getClientIP());
        commandMap.put("CI_VAL", SessionsUser.getSessionValue("USER_CI"));
        return this.defaultDAO.insert("MyContractCommon.insertCmsPaymentMethodChange", commandMap);
    }

}
