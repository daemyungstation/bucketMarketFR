package web.fr.common.service;

import java.util.List;
import java.util.Map;

public interface CommonService {

    /**
     * <pre>
     * 1. MethodName : selectCommonList
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 공통코드 하위코드 조회 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 24.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCode(String code) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectCodeByCode
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 공통코드 조회 (코드받아서)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2015. 10. 23.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCodeByCode(String code) throws Exception;

    /**
     * <pre>
    * 1. MethodName : selectCodes
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 공통 코드 묶음 하위 코드 조회 
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 4. 4.
     * </pre>
     *
     * @param codes
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCodes(String[] codes) throws Exception;

    /**
     * <pre>
    * 1. MethodName : selectTopCode
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 공통코드 하위코드 조회 
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 4. 4.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectTopCode(String code) throws Exception;

    /**
     * <pre>
     * 1. MethodName : selectHierarchyCodeList
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 공통코드 현재 미포함 하위 코드 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectHierarchyCodeList(String code) throws Exception;
    
    /**
     * <pre>
    * 1. MethodName : selectTopCodes
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 공통 코드 묶음 하위 코드 조회
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 4. 4.
     * </pre>
     *
     * @param codes
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectTopCodes(String[] codes) throws Exception;

    /**
     * <pre>
    * 1. MethodName : selectCodeInfo
    * 2. ClassName  : CommonService.java
    * 3. Comment    : 공통 코드 상세 정보 
    * 4. 작성자       : upleat
    * 5. 작성일       : 2014. 4. 17.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCodeInfo(Map<String, Object> commandMap) throws Exception;
    
    
    /**
     * <pre>
     * 1. MethodName : boardLogin
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 로그인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 28.
     * </pre>
     *
     * @param commandMap
     * @throws Exception
     */
    public void boardLogin(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCommonTermInfo
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 약관 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 28.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCommonTermInfo(Map<String, Object> commandMap) throws Exception;
    
    /**
     * <pre>
     * 1. MethodName : selectCommonCancellationAmountList
     * 2. ClassName  : CommonService.java
     * 3. Comment    : 해약 환급급 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCommonCancellationAmountList(Map<String, Object> commandMap) throws Exception;
}
