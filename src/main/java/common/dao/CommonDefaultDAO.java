package common.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.util.StringUtil;

@Repository("defaultDAO")
public class CommonDefaultDAO {

    @Autowired
    @Resource(name = "sqlSession")
    private SqlSession sqlSession;
    
    @Autowired
    @Resource(name="sqlSessionForDlcc")
    private SqlSession sqlSessionForDlcc;
    
    /**
     * <pre>
     * 1. MethodName : insert
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 등록한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     * @throws Exception
     */
    public int insert(String queryID, Map<String, Object> param) throws Exception {
        return StringUtil.getInt(sqlSession.insert(queryID, (Object) param));
    }
    
    /**
     * <pre>
     * 1. MethodName : insert
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 등록한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     * @throws Exception
     */
    public int insert(String queryID, Object param) throws Exception {
        return StringUtil.getInt(sqlSession.insert(queryID, param));
    }

    /**
     * <pre>
     * 1. MethodName : update
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 수정한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     * @throws Exception
     */
    public int update(String queryID, Map<String, Object> param) throws Exception {
        return StringUtil.getInt(sqlSession.update(queryID, (Object) param));
    }

    /**
     * <pre>
     * 1. MethodName : update
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 수정한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     * @throws Exception
     */
    public int update(String queryID, Object param) throws Exception {
        return StringUtil.getInt(sqlSession.update(queryID, param));
    }
    
    /**
     * <pre>
     * 1. MethodName : delete
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 삭제한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     * @throws Exception
     */
    public int delete(String queryID, Map<String, Object> param) throws Exception {
        return StringUtil.getInt(sqlSession.delete(queryID, param));
    }
    
    /**
     * <pre>
     * 1. MethodName : delete
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 삭제한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     * @throws Exception
     */
    public int delete(String queryID, Object param) throws Exception {
        return StringUtil.getInt(sqlSession.delete(queryID, param));
    }
    
    /**
     * <pre>
     * 1. MethodName : select
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 조회한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public Map<String, Object> select(String queryID, Map<String, Object> param) throws Exception {
        return (Map<String, Object>) sqlSession.selectOne(queryID, param);
    }

    /**
     * <pre>
     * 1. MethodName : select
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 조회한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     * @throws Exception
     */
    public Object select(String queryID, Object param) throws Exception {
        return sqlSession.selectOne(queryID, param);
    }

    /**
     * <pre>
     * 1. MethodName : selectStr
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 문자열 데이터 조회한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     * @throws Exception
     */
    public String selectStr(String queryID,  Map<String, Object> param) throws Exception {
        return StringUtil.getString(sqlSession.selectOne(queryID, param));
    }
    
    
    /**
     * <pre>
     * 1. MethodName : selectStr
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 문자열 데이터 조회한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     * @throws Exception
     */
    public String selectStr(String queryID, Object param) throws Exception {
        return StringUtil.getString(sqlSession.selectOne(queryID, param));
    }

    /**
     * <pre>
     * 1. MethodName : selectList
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 목록을 조회한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     */
    public List<?> selectList(String queryID, Map<String, Object> param) {
        List<?> returnList = sqlSession.selectList(queryID, param);
        if (returnList == null) {
            returnList = new ArrayList<>();
        }
        return returnList;
    }

    /**
     * <pre>
     * 1. MethodName : selectList
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 목록을 조회한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     * @throws Exception
     */
    public List<?> selectList(String queryID, Object param) throws Exception {
        List<?> returnList = sqlSession.selectList(queryID, param);
        if (returnList == null) {
            returnList = new ArrayList<>();
        }
        return returnList;
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCount
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 총 갯수를 조회한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     */
    public int selectCount(String queryID, Map<String, Object> param) {
        return StringUtil.getInt(sqlSession.selectOne(queryID, param));
    }
    
    /**
     * <pre>
     * 1. MethodName : selectCount
     * 2. ClassName  : CommonDefaultDAO.java
     * 3. Comment    : 데이터 총 갯수를 조회한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 4. 13.
     * </pre>
     *
     * @param queryID
     * @param param
     * @return
     */
    public int selectCount(String queryID, Object param) {
        return StringUtil.getInt(sqlSession.selectOne(queryID, param));
    }
    
    public SqlSession getSqlSession() {
        return sqlSession;
    }
    /**
     * DLCC 접속용 SQL Session을 반환한다.
     */
    public SqlSession getSqlSessionForDlcc() {
        return sqlSessionForDlcc;
    }
}