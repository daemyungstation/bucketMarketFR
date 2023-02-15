package web.fr.common.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import common.code.Code;
import common.dao.CommonDefaultDAO;
import common.model.BoardUser;
import common.model.Request;
import common.session.SessionsBoardUser;
import common.util.AesCrypto;
import common.util.StringUtil;
import web.fr.common.service.CommonService;

@Service("commonService")
public class CommonServiceImpl implements CommonService {

    @Resource(name="defaultDAO")
    private CommonDefaultDAO defaultDAO;

    /**
     * <pre>
     * 1. MethodName : selectCode
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 공통코드 조회 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 24.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCode(String code) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("Common.selectCodeList", Code.class.getDeclaredField(code).get(Code.class).toString());
    }

    /**
     * <pre>
     * 1. MethodName : selectCodeByCode
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 공통코드 조회 (코드받아서)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2015. 10. 23.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCodeByCode(String code) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("Common.selectCodeList", code);
    }

    /**
     * <pre>
     * 1. MethodName : selectCodes
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 공통코드 묶음
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 3. 28.
     * </pre>
     *
     * @param codes
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCodes(String[] codes) throws Exception {
        Map<String, Object> codeMap = new HashMap<String, Object>();

        for (int i = 0; i < codes.length; i++) {
            codeMap.put(codes[i].toString(), defaultDAO.selectList("Common.selectCodeList", Code.class.getDeclaredField(codes[i]).get(Code.class).toString()));
        }
        return codeMap;
    }

    /**
     * <pre>
     * 1. MethodName : selectCodeInfo
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 공통코드 상세 정보 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 18.
     * </pre>
     *
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCodeInfo(Map<String, Object> commandMap) throws Exception {
        return (Map<String, Object>) defaultDAO.select("Common.selectCodeInfo", commandMap);
    }

    /**
     * <pre>
     * 1. MethodName : selectTopCode
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 공통코드 조회  
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 4.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectTopCode(String code) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("Common.selectTopCodeList", Code.class.getDeclaredField(code).get(Code.class).toString());
    }

    /**
     * <pre>
     * 1. MethodName : selectHierarchyCodeList
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 공통코드 현재 미포함 하위 코드 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 3. 23.
     * </pre>
     *
     * @param code
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectHierarchyCodeList(String code) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("Common.selectHierarchyCodeList", Code.class.getDeclaredField(code).get(Code.class).toString());
    }
    
    /**
     * <pre>
     * 1. MethodName : selectTopCodes
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 공통코드 묶음 
     * 4. 작성자       : upleat
     * 5. 작성일       : 2014. 4. 4.
     * </pre>
     *
     * @param codes
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectTopCodes(String[] codes) throws Exception {
        Map<String, Object> codeMap = new HashMap<String, Object>();

        for (int i = 0; i < codes.length; i++) {
            codeMap.put(codes[i].toString(), defaultDAO.selectList("Common.selectTopCodeList", Code.class.getDeclaredField(codes[i]).get(Code.class).toString()));
        }
        return codeMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : boardLogin
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 게시판 로그인
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 28.
     * </pre>
     *
     * @see web.fr.common.service.CommonService#boardLogin(java.util.Map)
     * @param commandMap
     * @throws Exception
     */
    public void boardLogin(Map<String, Object> commandMap) throws Exception {
        String USER_NM = StringUtil.getString(commandMap, "USER_NM", "");
        String USER_PWD = AesCrypto.encrypt(StringUtil.getString(commandMap, "USER_PWD", ""));
        BoardUser boardUser = new BoardUser();
        boardUser.setUSER_NM(USER_NM);
        boardUser.setUSER_PWD(USER_PWD);
        SessionsBoardUser.setSessionBoardUser(Request.getCurrentRequest(), boardUser);
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCommonTermInfo
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 약관 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 28.
     * </pre>
     *
     * @see web.fr.common.service.CommonService#selectCommonTermInfo(Map<String, Object>)
     * @param commandMap
     * @return
     * @throws Exception
     */
    public Map<String, Object> selectCommonTermInfo(Map<String, Object> commandMap) throws Exception {
        Map<String, Object> returnMap = new HashMap<>();
        Map<String, Object> term = defaultDAO.select("Common.selectCommonTermInfo", commandMap);
        returnMap.put("term", term);
//        String historyYn = (String)commandMap.get("history");
//        if( "Y".equals(historyYn) ) {
//            List<Map<String, Object>> termHistory = (List<Map<String, Object>>) defaultDAO.selectList("Common.selectCommonTermInfoHistory", commandMap);
//            returnMap.put("termHistory", termHistory);
//        }
        if ("Y".equals(StringUtil.getString(term, "AGR_MST_PRE_YN"))
                && ( StringUtil.getInt(commandMap, "AGR_MST_TYPE") == Code.TERM_BUCKET_MARKET_USE  ||
                StringUtil.getInt(commandMap, "AGR_MST_GBN") == Code.TEMR_PERSONAL_INFORMATION_HANDLING)) {
            returnMap.put("termPrevList", defaultDAO.selectList("Common.selectCommonTermPrevList", commandMap));
        }
        return returnMap;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCommonCancellationAmountList
     * 2. ClassName  : CommonServiceImpl.java
     * 3. Comment    : 해약 환급급 목록 조회
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 27.
     * </pre>
     *
     * @see web.fr.common.service.CommonService#selectCommonCancellationAmountList(java.util.Map)
     * @param commandMap
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectCommonCancellationAmountList(Map<String, Object> commandMap) throws Exception {
        return (List<Map<String, Object>>) defaultDAO.selectList("Common.selectCommonCancellationAmountList", commandMap);
    }
}
