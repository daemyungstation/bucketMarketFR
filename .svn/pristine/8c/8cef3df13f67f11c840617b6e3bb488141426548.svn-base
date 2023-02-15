package web.fr.mycontract.controller;

import java.security.Key;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import common.annotation.AccessRole;
import common.annotation.CommandMap;
import common.code.Code;
import common.model.User.ROLE_USER;
import common.session.SessionsUser;
import common.support.ControllerSupport;
import common.util.DeviceUtil;
import common.util.StringUtil;
import common.viewer.JSON;
import web.fr.display.service.BannerDisplayService;
import web.fr.mycontract.service.MyContractCommonService;

/**
 * <pre>
 * &#64;PackageName: web.fr.mycontract.controller
 * &#64;FileName : MyContractInfoController.java
 * &#64;Date : 2020. 5. 28.
 * &#64;프로그램 설명 : 마이 계약 > 가입내역
 * &#64;author upleat
 * </pre>
 */
@Controller
public class MyContractInfoController extends ControllerSupport {

    @Resource(name = "myContractCommonService")
    private MyContractCommonService myContractCommonService;

    @Resource(name = "bannerDisplayService")
    private BannerDisplayService bannerDisplayService;
    
    String _ivKey = "imready___bucket";

    /**
     * <pre>
     * 1. MethodName : index
     * 2. ClassName  : MyContractInfoController.java
     * 3. Comment    : 가입내역 목록
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.info.list.view}")
    public ModelAndView index(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 상태가 '접수', '가입대기', '가입' 인 계약만 조회
        commandMap.put("searchContractStatusList", Arrays.asList(new Integer[] { Code.CONTRACT_STATUS_RECEIPT, Code.CONTRACT_STATUS_WAITING_TO_JOIN, Code.CONTRACT_STATUS_JOIN }));

        // 목록
        List<Map<String, Object>> list = this.myContractCommonService.selectContractList(request, commandMap);
        for(Map<String, Object>row : list) {
            row.put("encAccntNo", this.encAccntNo(StringUtil.getString(row, "ACCNT_NO", "")));
        }
        mv.addObject("list", list);

        // 배너
        if (DeviceUtil.isNormal()) {
            mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_MY_CONTRACT"));
        }

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.info.list.view");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : detail
     * 2. ClassName  : MyContractInfoController.java
     * 3. Comment    : 가입내역 상세
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.info.detail.view}")
    public ModelAndView detail(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 목록
        Map<String, Object> info = this.myContractCommonService.selectContractDetail(request, commandMap);
        info.put("encAccntNo", this.encAccntNo(StringUtil.getString(info, "ACCNT_NO", "")));
        mv.addObject("info", info);

        // 배너
        if (DeviceUtil.isNormal()) {
            mv.addObject("banner", this.bannerDisplayService.selectBannerDisplayList("BANNER_MY_CONTRACT"));
        }

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.info.detail.view");
        return mv;
    }
    
    /**
     * <pre>
     * 1. MethodName : encAccntNo
     * 2. ClassName  : MyContractInfoController.java
     * 3. Comment    : 회원번호 암호화
     * 4. 작성자       : inuscommunity
     * 5. 작성일       : 2021. 3. 9.
     * </pre>
     *
     * @param String accntNo
     * @return String encAccntNo
     * @throws Exception
     */
    private String encAccntNo(String accntNo) throws Exception {
        if (!"".equals(accntNo)) {
            Key keySpecEnc;
            byte[] keyBytes = new byte[16];
            byte[] b = _ivKey.getBytes("UTF-8");
            int len = b.length;
          
            if (len > keyBytes.length) {
                len = keyBytes.length;
            }
            System.arraycopy(b, 0, keyBytes, 0, len);
            keySpecEnc = new SecretKeySpec(keyBytes, "AES");
            
            //암호화 시작
            Cipher cipherEnc = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipherEnc.init(Cipher.ENCRYPT_MODE, keySpecEnc, new IvParameterSpec(this._ivKey.getBytes("UTF-8")));
            
            byte[] encBuf = cipherEnc.doFinal(accntNo.getBytes("UTF-8"));
            StringBuffer encStrBuf = new StringBuffer(encBuf.length * 2);
            for (int i = 0; i < encBuf.length; i++) {
                if (((int) encBuf[i] & 0xff) < 0x10) {
                    encStrBuf.append("0");
                }
                encStrBuf.append(Long.toString((int) encBuf[i] & 0xff, 16));
            }
            accntNo = encStrBuf.toString();
          }
        return accntNo;
    }

    /**
     * <pre>
     * 1. MethodName : infoReviewLayer
     * 2. ClassName  : MyContractInfoController.java
     * 3. Comment    : 가입후기 작성 (layer)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.info.review.layer}")
    public ModelAndView infoReviewLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 계약자 정보
        mv.addObject("contractor", SessionsUser.getSessionUser(request));
        if (!"".equals(StringUtil.getString(commandMap, "ORD_MST_IDX", ""))) {
            // 가입내역 정보
            mv.addObject("info", this.myContractCommonService.selectContractInfo(request, commandMap));
        } else if (!"".equals(StringUtil.getString(commandMap, "ORD_MST_GRP_IDX", ""))) {
            // 가입내역 정보
            mv.addObject("info", this.myContractCommonService.selectContractGroupInfo(commandMap));
        }

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.info.review.layer");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : infoReviewAjax
     * 2. ClassName  : MyContractInfoController.java
     * 3. Comment    : 가입후기 작성 (ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 28.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.info.review.ajax}", method = RequestMethod.POST)
    public JSON infoReviewAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", this.myContractCommonService.insertContractReview((MultipartHttpServletRequest) request, commandMap) > 0);
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : contractCancelLayer
     * 2. ClassName  : MyContractInfoController.java
     * 3. Comment    : 해지 신청 (layer)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.info.contract.cancel.layer}")
    public ModelAndView contractCancelLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 가입내역 정보
        mv.addObject("info", this.myContractCommonService.selectContractInfo(request, commandMap));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.info.contract.cancel.layer");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : contractCancelAjax
     * 2. ClassName  : MyContractInfoController.java
     * 3. Comment    : 해지 신청 (ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.info.contract.cancel.ajax}", method = RequestMethod.POST)
    public JSON contractCancelAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", this.myContractCommonService.insertContractCancel(request, commandMap) > 0);
        return json;
    }

    /**
     * <pre>
     * 1. MethodName : contractTransferLayer
     * 2. ClassName  : MyContractInfoController.java
     * 3. Comment    : 양도/양수 신청 (layer)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.info.contract.transfer.layer}")
    public ModelAndView contractTransferLayer(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        // 가입내역 정보
        mv.addObject("info", this.myContractCommonService.selectContractInfo(request, commandMap));

        mv.addObject("commandMap", commandMap);
        setViewName(mv, "mycontract.info.contract.transfer.layer");
        return mv;
    }

    /**
     * <pre>
     * 1. MethodName : contractTransferAjax
     * 2. ClassName  : MyContractInfoController.java
     * 3. Comment    : 양도/양수 신청 (ajax)
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 6. 1.
     * </pre>
     *
     * @param request
     * @param commandMap
     * @return
     * @throws Exception
     */
    @AccessRole(value = ROLE_USER.contractor, key = "mycontract.oneself.form")
    @RequestMapping(value = "${mycontract.info.contract.transfer.ajax}", method = RequestMethod.POST)
    public JSON contractTransferAjax(HttpServletRequest request, @CommandMap Map<String, Object> commandMap) throws Exception {
        JSON json = new JSON();
        json.put("isSuccess", this.myContractCommonService.insertContractTransfer(request, commandMap) > 0);
        return json;
    }
}
