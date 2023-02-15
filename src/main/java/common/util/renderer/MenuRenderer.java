package common.util.renderer;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import common.code.Code;
import common.model.Request;
import common.util.DeviceUtil;
import common.util.JSONUtil;
import common.util.StringUtil;

public class MenuRenderer {

    private static final String PRODUCT_LIST = "product.basic.list";
    
    private static final Map<String, String> BOARD = new LinkedHashMap<String, String>() {
        private static final long serialVersionUID = -8050250505531392230L;
        {
            put("board.notice.list", "공지사항");
            put("board.faq.list", "자주묻는질문(FAQ)");
            put("board.inquiry.form", "1:1 문의");
            put("board.contact.us.form", "제휴문의");
            put("board.comment.list", "상품후기");
        }
    };
    
    private static final Map<String, String> MYPLANNER_MOBILE = new LinkedHashMap<String, String>() {
        private static final long serialVersionUID = -3444488365267121814L;
        {
            put("myplanner.introduce.view", "레디플래너 소개");
            put("myplanner.application.guide.view", "이용가이드");
            put("myplanner.campaign.product.list", "캠페인 생성");
            put("myplanner.performance.view", "실적현황조회");
            put("board.faq.list", "레디플래너 FAQ");
//            put("myplanner.payment.view", "리워드 지급내역");
            put("myplanner.community.list", "커뮤니티");
            put("myplanner.profile.edit", "프로필 관리");
            put("myplanner.notice.list", "공지사항");
        }
    };
    
    private static final Map<String, String> MYPLANNER_PC = new LinkedHashMap<String, String>() {
        private static final long serialVersionUID = -3444488365267121814L;
        {
            put("myplanner.introduce.view", "레디플래너 소개");
            put("myplanner.application.guide.view", "이용가이드");
            put("myplanner.use.term.view", "이용약관");
            put("myplanner.manage.term.view", "운영정책");
            put("myplanner.campaign.product.list", "캠페인 생성");
            put("myplanner.performance.view", "실적현황조회");
            put("board.faq.list", "레디플래너 FAQ");
//            put("myplanner.payment.view", "리워드 지급내역");
            put("myplanner.community.list", "커뮤니티");
            put("myplanner.profile.edit", "프로필 관리");
            put("myplanner.notice.list", "공지사항");
        }
    };
    
    private static final Map<String, String> MYCONTRACT = new LinkedHashMap<String, String>() {
        private static final long serialVersionUID = -4178648683004391057L;
        {
            put("mycontract.info.list.view", "가입내역 조회");
            put("mycontract.paymentrefund.list.view", "납입/환급금 조회");
//            put("mycontract.shipping.list.view", "배송/지원혜택 조회");
            put("mycontract.paymentmethod.list.view", "결제수단 변경 신청");
            put("mycontract.membership.list.view", "맵버십카드 조회");
            put("mycontract.lifeservice.list.view", "라이프서비스 신청");
        }
    };

    /**
     * <pre>
     * 1. MethodName : getMenuSet
     * 2. ClassName  : MenuRenderer.java
     * 3. Comment    : 메뉴 EntrySet을 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @param group
     * @return
     */
    private static Set<Entry<String, String>> getMenuSet(String group) {
        Set<Entry<String, String>> menuSet = null;
        switch (group) {
            case "board":
                menuSet = BOARD.entrySet();
                break;
            case "myplanner":
                menuSet = MYPLANNER_MOBILE.entrySet();
                break;
            case "myplanner_pc":
                menuSet = MYPLANNER_PC.entrySet();
                break;
            case "mycontract":
                menuSet = MYCONTRACT.entrySet();
                break;
            default:
                menuSet = new HashSet<>();
                break;
        }
        return menuSet;
    }
    
    /**
     * <pre>
     * 1. MethodName : getMenuTmpl
     * 2. ClassName  : MenuRenderer.java
     * 3. Comment    : 메뉴 템플릿을 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @param arg
     * @return
     */
    private static String getMenuTmpl (Object...arg) {
        String menuTemplate = "";
        String tag = (DeviceUtil.isNormal() ? "li" : "span");
        menuTemplate += "<" + tag + " class=\"{0}\">";
        menuTemplate += "<a href=\"{1}\">{2}</a>";
        menuTemplate += "</a>";
        menuTemplate += "</" + tag + ">";
        return MessageFormat.format(menuTemplate, arg);
    }
    
    /**
     * <pre>
     * 1. MethodName : getClass
     * 2. ClassName  : MenuRenderer.java
     * 3. Comment    : 메뉴에 active 되는 클래스를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @param key
     * @return
     */
    private static String getClass(String key) {
        HttpServletRequest request = Request.getCurrentRequest();
        String requestUri = request.getRequestURI();
        String activeClass = "";
        if (requestUri.toLowerCase().contains(key.split("\\.")[1].toLowerCase())) {
            activeClass = "on";
        }
        return activeClass;
    }
    /**
     * <pre>
     * 1. MethodName : getClass
     * 2. ClassName  : MenuRenderer.java
     * 3. Comment    : 메뉴에 active 되는 클래스를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @param curentKey
     * @param key
     * @return
     */
    private static String getClass(String curentKey, String key) {
        String activeClass = "";
        if (curentKey.equals(key)) {
            activeClass = "on";
        }
        return activeClass;
    }
    
    /**
     * <pre>
     * 1. MethodName : getHref
     * 2. ClassName  : MenuRenderer.java
     * 3. Comment    : 메뉴의 링크를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @param key
     * @return
     */
    private static String getHref(String key) {
        return MessageFormat.format("javascript:$.requestPage($.action.{0}());", key);
    }
    /**
     * <pre>
     * 1. MethodName : getHref
     * 2. ClassName  : MenuRenderer.java
     * 3. Comment    : 메뉴의 링크를 반환한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @param key
     * @param params
     * @return
     */
    private static String getHref(String key, Map<String, Object> params) {
        String paramStr = JSONUtil.convJSONObjectToString(JSONUtil.convMapToJSONObject(params));
        paramStr = paramStr.replaceAll("\"", "'");
        return MessageFormat.format("javascript:$.requestPage($.action.{0}(), {1});", key, paramStr);
    }
    
    /**
     * <pre>
     * 1. MethodName : renderMenu
     * 2. ClassName  : MenuRenderer.java
     * 3. Comment    : 메뉴를 작성한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @param group
     * @return
     */
    public static String renderMenu(String group) {
        StringBuffer sb = new StringBuffer();
        for (Map.Entry<String, String> elem : getMenuSet(group)) {
            if (group.contains("myplanner") && elem.getKey().equals("board.faq.list")) {
                Map<String, Object> params = new HashMap<>();
                params.put("searchBrdCmnComIdx", Code.QUESTION_TYPE_PLANNER);
                sb.append(getMenuTmpl(getClass(elem.getKey()), getHref(elem.getKey(), params), elem.getValue()));
            } else {
                sb.append(getMenuTmpl(getClass(elem.getKey()), getHref(elem.getKey()), elem.getValue()));
            }
        }
        return sb.toString();
    }
    
    /**
     * <pre>
     * 1. MethodName : renderCategoryMenu
     * 2. ClassName  : MenuRenderer.java
     * 3. Comment    : 카테고리 메뉴를 작성한다.
     * 4. 작성자       : upleat
     * 5. 작성일       : 2020. 5. 21.
     * </pre>
     *
     * @param group
     * @param categoryList
     * @return
     */
    public static String renderCategoryMenu(String group, List<Map<String, Object>> categoryList) {
        StringBuffer sb = new StringBuffer();
        Map<String, Object> params = new HashMap<>();
        for (Map<String, Object> categoryInfo : categoryList) {
            String PRD_CTG_IDX = StringUtil.getString(categoryInfo, "PRD_CTG_IDX", "");
            params.put("PRD_CTG_IDX", PRD_CTG_IDX);
            sb.append(getMenuTmpl(getClass(StringUtil.getString(categoryInfo, "PRD_CTG_CRT_IDX", ""), PRD_CTG_IDX),
                    getHref(PRODUCT_LIST, params),
                    StringUtil.getString(categoryInfo, "PRD_CTG_NM", "")));
        }
        return sb.toString();
    }

}
