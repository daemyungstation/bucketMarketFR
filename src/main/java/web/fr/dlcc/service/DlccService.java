package web.fr.dlcc.service;

import java.util.List;

public interface DlccService {

    /**
     * 05. 상세납입
     * 
     * <pre>
     * 1. MethodName : doJob05
     * 2. ClassName  : DlccService.java
     * 3. Comment    : 실명인증 Success후 해당 CI의 ACCNT_NO(회원번호)의 상세납입 정보를 Megre 한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 14.
     * </pre>
     *
     * @param accntNoList
     * @throws Exception
     */
    public void doJob05(List<String> accntNoList) throws Exception;

}
