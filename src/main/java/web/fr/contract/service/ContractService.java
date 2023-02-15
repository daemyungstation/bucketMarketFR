package web.fr.contract.service;

import java.util.List;
import java.util.Map;

import common.code.Contract.JOIN_STEP;

public interface ContractService {
    
    /**
     * <pre>
     * 1. MethodName : selectContractTermList
     * 2. ClassName  : ContractService.java
     * 3. Comment    : 프론트 > 간편가입 > 약관동의 > 약관 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectContractTermList(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectContractInfo
     * 2. ClassName  : ContractService.java
     * 3. Comment    : 프론트 > 간편가입 > 계약 상품 정보
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27.
     * </pre>
     *
     * @param commandMap
     * @param joinStep
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectContractInfo(Map<String, Object> commandMap, JOIN_STEP joinStep) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectContractMasterKeyStr
     * 2. ClassName  : ContractService.java
     * 3. Comment    : 프론트 > 간편가입 > 주문번호 생성
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 2.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public String selectContractMasterKeyStr(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : insertContractJoin
     * 2. ClassName  : ContractService.java
     * 3. Comment    : 프론트 > 간편가입 > 가입정보 등록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27.
     * </pre>
     *
     * @param commandMap
     * @throws Exception
     */
    public void insertContractJoin(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectContractInfo
     * 2. ClassName  : ContractService.java
     * 3. Comment    : 프론트 > 간편가입 > 가입 완료 > 가입 정보 상세
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectContractInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectContractUserAccountNoList
     * 2. ClassName  : ContractService.java
     * 3. Comment    : 프론트 > 로그인 > 계약 번호 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 22.
     * </pre>
     *
     * @return
     * @throws Exception
     */
    public List<String> selectContractUserAccountNoList() throws Exception;
}
