package web.fr.mycontract.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * <pre>
 * &#64;PackageName: web.fr.mycontract.service
 * &#64;FileName : MyContractCommonService.java
 * &#64;Date : 2020. 5. 28.
 * &#64;프로그램 설명 : 마이계약 공통 서비스
 * &#64;author upleat
 * </pre>
 */
public interface MyContractCommonService {

    /**
     * <pre>
     * 1. MethodName : selectContractList
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    :  가입내역 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    List<Map<String, Object>> selectContractList(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectContractDetail
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    : 가입내역 상세 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    Map<String, Object> selectContractDetail(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectContractInfo
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    : 가입내역 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    Map<String, Object> selectContractInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectPaymentInfo
     * 2. ClassName  : MyContractCommonService.java
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
    public Map<String, Object> selectPaymentInfo(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectContractGroupInfo
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    : 가입내역 그룹 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectContractGroupInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertContractReview
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    : 가입후기 작성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    int insertContractReview(MultipartHttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertContractReview
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    : 라이프서비스 변경 요청 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    int insertLifeService(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertContractReview
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    : 해지 신청 요청 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    int insertContractCancel(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertContractReview
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    : 양도/양수 신청 요청 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    int insertContractTransfer(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertCardPaymentMethodChange
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    : 카드 결제정보 변경 요청 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    int insertCardPaymentMethodChange(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : insertCmsPaymentMethodChange
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    : CMS 결제정보 변경 요청 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    int insertCmsPaymentMethodChange(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectContractBenefit
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    : 지원혜택 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    Map<String, Object> selectContractBenefit(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectContractShipping
     * 2. ClassName  : MyContractCommonService.java
     * 3. Comment    : 배송 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 2.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     */
    Map<String, Object> selectContractShipping(HttpServletRequest request, Map<String, Object> commandMap) throws Exception;

}
