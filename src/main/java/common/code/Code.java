package common.code;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * @Package Name : common.code
 * @Class Name : Code.java
 * @author : upleat
 * @Date : 2018. 9. 10.
 * @Description : 공통코드를 모음
 */
public class Code {
    /**************************************************************************
     * 01. 공통 관련 코드 그룹
     **************************************************************************/
    
    /**************************************************************************
     * 02. 상품 관련 코드 그룹
     **************************************************************************/
    static public final int PRODUCT_TYPE_CODE = 3188; // 상품유형 코드
    static public final int PRODUCT_TYPE_MONTHLY_SUPPORT = 3200; // 상품 유형 > 월지원
    static public final int PRODUCT_TYPE_IMMEDIATELY_ISSUE = 3201; // 상품 유형 > 즉발
    static public final int PRODUCT_TYPE_MONTHLY_INSTALLMENT_PLAN = 3202; // 상품 유형 > 장기할부
    static public final int PRODUCT_TYPE_RENTAL = 3203; // 상품 유형 > 렌탈
    static public final int PRODUCT_TYPE_DAEMYUG = 3358; // 상품 유형 > 상조
    
    static public final int LIFE_SERVICE_INTERDEPENDENCE = 3190; // 라이프서비스 > 상조
    static public final int LIFE_SERVICE_TRAVEL = 3205; // 라이프서비스 > 해외여행
    static public final int LIFE_SERVICE_CRUISE = 3191; // 라이프서비스 > 크루즈
    static public final int LIFE_SERVICE_GOLF = 3192; // 라이프서비스 > 골프
    static public final int LIFE_SERVICE_LANGUAGE_STUDY_ABROAD = 3193; // 라이프서비스 > 어학연수
    static public final int LIFE_SERVICE_WEDDING = 3194; // 라이프서비스 > 웨딩
    static public final int LIFE_SERVICE_JEWALRY = 3213; // 라이프서비스 > 주얼리
    /**************************************************************************
     * 03. 계약 관련 코드 그룹
     **************************************************************************/
    static public final int PAY_TYPE = 3143; // 결제유형
    static public final int PAY_TYPE_CARD = 3221; // 결제유형 - 카드
    static public final int PAY_TYPE_CMS = 3220; // 결제유형 - CMS
    static public final int INICIS_CARD_CODE = 3221; // INICIS 신용카드
    static public final int INICIS_BANK_CODE = 3220; // INICIS 은행 코드
    static public final int CONTRACT_STATUS_RECEIPT = 3224; // 계약 상태 - 접수
    static public final int CONTRACT_STATUS_WAITING_TO_JOIN = 3225; // 계약 상태 - 가입대기
    static public final int CONTRACT_STATUS_JOIN = 3226; // 계약 상태 - 가입
    static public final int CONTRACT_STATUS_CANCEL = 3227; // 계약 상태 - 해약
    static public final int CONTRACT_STATUS_USE = 3228; // 계약 상태 - 행사
    static public final int HAPP_CALL = 3241; // 계약 > 해피콜 시간대
    
    /**************************************************************************
     * 04. 전시 관련 코드 그룹
     **************************************************************************/
    static public final int DISPLAY_PRODUCT_AREA_CODE = 2994; // 전시 상품 영역
    static public final int DISPLAY_PRODUCT_BEST_AREA_CODE = 3338; // 전시 상품 영역 > 베스트 랭킹
    static public final int DISPLAY_PRODUCT_BEST_AREA_DEFAULT = 3330; // 전시 상품 영역 > 베스트 랭킹 > 기본 코드 값
    
    static public final int DISPLAY_PRODUCT_BEST_TOP = 3330; // 전시 상품 영역 > 베스트 랭킹 > TOP10 
    static public final int DISPLAY_PRODUCT_BEST_ITEM1 = 3331; // 전시 상품 영역 > 베스트 랭킹 > 가전렌탈
    static public final int DISPLAY_PRODUCT_BEST_ITEM2 = 3332; // 전시 상품 영역 > 베스트 랭킹 > 통신
    static public final int DISPLAY_PRODUCT_BEST_ITEM3 = 3333; // 전시 상품 영역 > 베스트 랭킹 > 생활쇼핑
    static public final int DISPLAY_PRODUCT_BEST_ITEM4 = 3336; // 전시 상품 영역 > 베스트 랭킹 > 소형가전
    static public final int DISPLAY_PRODUCT_BEST_ITEM5 = 3334; // 전시 상품 영역 > 베스트 랭킹 > 유아동용품
    static public final int DISPLAY_PRODUCT_BEST_ITEM6 = 3335; // 전시 상품 영역 > 베스트 랭킹 > 이미용용품
    static public final int DISPLAY_PRODUCT_BEST_ITEM7 = 3337; // 전시 상품 영역 > 베스트 랭킹 > 라이프스타일
    
    
    static public final int BANNER_PRODUCT_LIST = 3206; // 전시배너 > 상품 목록
    static public final int BANNER_PRODUCT_VIEW = 3204; // 전시배너 > 상품 상세
    
    static public final int BANNER_MAIN_TOP = 3256; // 전시배너 > 메인 > TOP 배너
    static public final int BANNER_MAIN_PROMOTION = 3257; // 전시배너 > 메인 > 프로모션 배너
    static public final int BANNER_MAIN_QUICK = 3258; // 전시배너 > 메인 > 퀵 배너
    static public final int BANNER_MAIN_EXHIBITION = 3259; // 전시배너 > 메인 > 기획전 배너
    static public final int BANNER_MAIN_MIDDLE = 3260; // 전시배너 > 메인 > 중단 배너
    static public final int BANNER_MAIN_BOTTOM = 3261; // 전시배너 > 메인 > 하단 배너
    static public final int BANNER_MY_CONTRACT = 3263; // 전시배너 > MY 계약 > MY 계약 배너
    static public final int BANNER_READY_PLANNER = 3265; // 전시배너 > 레디플래너 > 레디플래너 배너
    
    static public final int PRODUCT_MAIN_BEST = 3279; // 메인 > 베스트 상품
    static public final int PRODUCT_MAIN_KEYWORD = 3280; // 메인 > 키워드 상품
    static public final int PRODUCT_MAIN_RECOMMEND_GROUP = 3281; // 메인 > 추천 상품 그룹
    
    static public final int DISPLAY_SKYSCRAPER = 3340; // PC 전용 > 스카이스크랩퍼
    
    /**************************************************************************
     * 05. 고객센터 관련 코드 그룹
     **************************************************************************/
    static public final int QUESTION_TYPE_CODE = 2981; // FAQ, 1:1 문의 유형 코드
    static public final int QUESTION_TYPE_PLANNER = 3349; // FAQ, 1:1 문의 유형 > 레디플레너
    static public final int QUESTION_TYPE_PRODUCT_CODE = 2983; // FAQ, 1:1 문의 유형 코드 > 상품가입
    /**************************************************************************
     * 06. 약관 관련 코드 그룹
     **************************************************************************/
    static public final int TERM_CODE = 2941; // 약관 코드
    static public final int TEMR_PERSONAL_INFORMATION_HANDLING = 2973; // 약관 > 개인정보 > 개인정보 처리방침
    static public final int TERM_PERSONAL_INFORMATION_USE = 2974; // 약관 > 개인정보 > 개인정보 수집 및 이용(계약)
    static public final int TERM_PERSONAL_INFORMATION_USE_BASIC = 3354; // 약관 > 개인정보 > 개인정보 수집 및 이용(일반)
    static public final int TERM_PERSONAL_INFORMATION_TRUST = 2975; // 약관 > 개인정보 > 개인정보 제3자 제공 및 처리 위탁
    static public final int TERM_CARD_WITHDRAWAL = 2976; // 약관 > 개인정보 > 카드출금 이체약관 
    
    static public final int TERM_MARKETING = 2949; // 약관 > 마케팅 활용 동의
    static public final int TERM_IMPORTANT_NOTICE = 2944; // 약관 > 중요 고지
    static public final int TERM_LAW_NOTICE = 2945; // 약관 > 법적 고지
    
    static public final int TERM_CONTRACT_CODE = 2946; // 약관 > 계약 약관
    static public final int TERM_CONTRACT_CONFIRM_FIRST_A = 2977; // 약관 > 계약 약관 > 상품인지동의1 월지원/렌탈(비채권)
    static public final int TERM_CONTRACT_CONFIRM_FIRST_B = 2978; // 약관 > 계약 약관 > 상품인지동의1 할부지원(채권)
    static public final int TERM_CONTRACT_CONFIRM_FIRST_C = 2979; // 약관 > 계약 약관 > 상품인지동의1 즉발(채권)
    static public final int TERM_CONTRACT_CONFIRM_FIRST_D = 2980; // 약관 > 계약 약관 > 상품인지동의1 즉발(비채권)
    static public final int TERM_CONTRACT_CONFIRM_FIRST_E = 3360; // 약관 > 계약 약관 > 상품인지동의1 상조
    static public final int TERM_CONTRACT_CONFIRM_SECOND = 3180; // 약관 > 계약 약관 > 인지동의 2
    static public final int TERM_CONTRACT_LIFE_SERVICE = 3184; // 약관 > 계약 약관 > 라이프서비스

    static public final int TERM_CONTRACT_POINT1 = 3181; // 약관 > 계약 약관 > 포인트 구매 계약 1
    static public final int TERM_CONTRACT_POINT2 = 3182; // 약관 > 계약 약관 > 포인트 구매 계약 2
    static public final int TERM_CONTRACT_HOME_APPLIANCES = 3183; // 약관 > 계약 약관 > 가전판매 계약
    static public final int TERM_CONTRACT_HOME_DAEMYUNG = 3186; // 약관 > 계약 약관 > 가전판매 계약

    static public final int TERM_BUCKET_MARKET_USE = 2942; // 약관 > 버킷마켓 이용 약관
    
    static public final int TERM_READY_PLANNER_CODE = 2948; // 약관 > 레디플래너 약관
    static public final int TERM_READY_PLANNER_USE = 3341; // 약관 > 레디플래너 이용약관
    static public final int TERM_READY_PLANNER_SERVICE = 3342; // 약관 > 레디플래너 운영정책
    static public final int TERM_READY_PLANNER_PERSONAL_INFORMATION_TRUST = 3351; // 약관 > 레디플래너 개인정보 처리 방침
    
    /**************************************************************************
     * 07. 클레임 상담 조회 관련 코드 그룹
     **************************************************************************/
    static public final int CLAIM_PROGRESS_APPLY = 3021; // 접수
    static public final int CLAIM_PROGRESS_COMPLETED = 3022; // 처리 완료 
    
    static public final int CLAIM_PAYMENT_METHOD_PAY_DT = 3230; // 납부일자
    
    /**************************************************************************
     * 08. 레디플래너 관련 코드 그룹
     **************************************************************************/
    static public final int PLANNER_STATE = 3005; // 사용상태 그룹
    static public final int PLANNER_STATE_APPLY = 3006; // 신청 - 승인 대기
    static public final int PLANNER_STATE_APPLY_KAKAO_ADMIN = 17; // 신청 - 관리자 카카오알림톡 발송 그룹 권한
    static public final int PLANNER_STATE_REJECT = 3007; // 반려 - 승인 반려
    static public final int PLANNER_STATE_APPROVAL = 3008; // 승인 - 활동대기, 추가정보 입력
    static public final int PLANNER_STATE_INACTIVE = 3009; // 활동대기 - 활동대기, 교육이수 입력
    static public final int PLANNER_STATE_ACTIVE = 3010; // 정상
    static public final int PLANNER_STATE_STOP = 3011; // 정지 - 이용제한
    static public final int PLANNER_STATE_REQUEST_RELEASE = 3156; // 해제요청 - 이용제한 해제 요청
    static public final int PLANNER_BUSINESS_CLASS = 3152; // 사업자 유형 그룹
    static public final int PLANNER_BUSINESS_CLASS_PRIVATE = 3153; // 개인
    static public final int PLANNER_BUSINESS_CLASS_NATURAL_PERSON = 3154; // 개인사업자
    static public final int PLANNER_BUSINESS_CLASS_LEGAL_PERSON = 3155; // 법인사업자
    static public final int PLANNER_GRADE_TERM = 3176; // 등급산정 기준
    static public final int PLANNER_SUBJECT = 3023; // 홍보사이트 주제
    
    /**************************************************************************
     * 10. 템플릿 관련 코드 그룹
     **************************************************************************/
    static public final int TEMPLATE_CODE = 3186; // 템플릿 코드
    static public final int LIFE_SERVICE = 3187; // 템플릿  > 라이프 서비스
    static public final int PRODUCT_TYPE = 3188; // 템플릿 > 상품 유형
    static public final int MEMBERSHIP = 3189;// 템플릿 > 멤버쉽
    
    /**************************************************************************
     * 11. 배송 관련 코드 그룹
     **************************************************************************/
    static public final int DELIVERY = 3208; // 배송 그룹 코드
    static public final int DELIVERY_READY = 3209; // 배송준비 코드
    static public final int DELIVERY_ING = 3210; // 배송중 코드    
    static public final int DELIVERY_COMPLETE = 3211; // 배송완료 코드
    static public final int DELIVERY_HOLD = 3212; // 배송보류 코드    

    /**************************************************************************
     * 13. DLCC 납입 방법 코드 그룹
     **************************************************************************/
    static public final int PAYMENT_TYPE = 3219; // 납입방법 그룹 코드
    
    /**************************************************************************
     * 14. 제휴사 렌탈승인 코드 그룹
     **************************************************************************/
    static public final int SCM_RENTAL = 3248; // 렌탈승인 그룹 코드        
    static public final int RENTAL_TM = 3249; // 통화대기
    static public final int RENTAL_READY = 3250; // 렌탈대기
    static public final int RENTAL_APPROVAL = 3251; // 렌탈승인
    static public final int RENTAL_CANCEL = 3252; // 렌탈취소
    static public final int RENTAL_REJECT = 3253; // 렌탈불가
    static public final int RENTAL_NO = 3254; // 해당없음
    
    static public final Map<String, String[]> SEO =
        Collections.unmodifiableMap(new HashMap<String, String[]>() {{
            put("main", new String[] {"버킷마켓", "꿈꾸던 삶을 담다.생활혜택 지원으로 일상의 부담은 덜고 맞춤 라이프 서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓방법,버킷마켓후기"});
            put("PRD_CTG_IDX_1", new String[] {"버킷마켓 가전렌탈", "꿈꾸던 삶을 담다. 가전렌탈비 전액지원 받고 인생에 꼭 필요한 라이프 서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓가전렌탈,버킷마켓가전지원"});
            put("PRD_CTG_IDX_2", new String[] {"버킷마켓 생활쇼핑", "꿈꾸던 삶을 담다. 월 3만원의 생활비를 지원받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓생활비,버킷마켓생활비지원,버킷마켓제휴처"});
            put("PRD_CTG_IDX_7", new String[] {"버킷마켓 통신", "꿈꾸던 삶을 담다. LGU플러스라면 누구나, 월 4만원의 통신비를 지원받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓엘지유플러스,버킷마켓통신비할인,버킷마켓통신비지원"});
            put("PRD_CTG_IDX_3", new String[] {"버킷마켓 소형가전", "꿈꾸던 삶을 담다. 인기 소형가전 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓소형가전,버킷마켓소형가전지원"});
            put("PRD_CTG_IDX_4", new String[] {"버킷마켓 출산유아동", "꿈꾸던 삶을 담다. 맘카페 입소문템 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("PRD_CTG_IDX_5", new String[] {"버킷마켓 패션뷰티", "꿈꾸던 삶을 담다. 인기 뷰티가전 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓소형가전,버킷마켓뷰티가전,버킷마켓마스크지원"});
            put("PRD_CTG_IDX_50", new String[] {"버킷마켓 특별기획", "꿈꾸던 삶을 담다. 인기 신혼가전 전액지원 받으며 웨딩에 꼭 필요한 서비스를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓신혼가전,버킷마켓신혼가전지원,버킷마켓웨딩"});
            put("PRD_CTG_IDX_9", new String[] {"버킷마켓 세탁기렌탈", "꿈꾸던 삶을 담다. 세탁기 렌탈비용 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원"});
            put("PRD_CTG_IDX_10", new String[] {"버킷마켓 건조기렌탈", "꿈꾸던 삶을 담다. 건조기 렌탈비용 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원"});
            put("PRD_CTG_IDX_11", new String[] {"버킷마켓 안마의자렌탈", "꿈꾸던 삶을 담다. 안마의자 렌탈비용 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원"});
            put("PRD_CTG_IDX_12", new String[] {"버킷마켓 TV렌탈", "꿈꾸던 삶을 담다. TV 렌탈비용 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원"});
            put("PRD_CTG_IDX_14", new String[] {"버킷마켓 냉장고렌탈", "꿈꾸던 삶을 담다. 냉장고 렌탈비용 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원"});
            put("PRD_CTG_IDX_17", new String[] {"버킷마켓 통합포인트", "꿈꾸던 삶을 담다. 월 3만원의 생활비를 지원받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓생활비,버킷마켓생활비지원,버킷마켓제휴처"});
            put("PRD_CTG_IDX_48", new String[] {"버킷마켓 통신비", "꿈꾸던 삶을 담다. LGU플러스라면 누구나, 월 4만원의 통신비를 지원받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓엘지유플러스,버킷마켓통신비할인,버킷마켓통신비지원"});
            put("PRD_CTG_IDX_25", new String[] {"버킷마켓 주방가전", "꿈꾸던 삶을 담다. 인기 주방가전 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓주방가전지원,버킷마켓주방가전"});
            put("PRD_CTG_IDX_20", new String[] {"버킷마켓 소형가전", "꿈꾸던 삶을 담다. 인기 소형가전 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓소형가전지원,버킷마켓소형가전"});
            put("PRD_CTG_IDX_34", new String[] {"버킷마켓 육아 생활용품", "꿈꾸던 삶을 담다. 맘카페 입소문템 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("PRD_CTG_IDX_36", new String[] {"버킷마켓 육아 가전가구", "꿈꾸던 삶을 담다. 맘카페 입소문템 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("PRD_CTG_IDX_37", new String[] {"버킷마켓 장난감", "꿈꾸던 삶을 담다. 맘카페 입소문템 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("PRD_CTG_IDX_35", new String[] {"버킷마켓 임산부 산모용품", "꿈꾸던 삶을 담다. 맘카페 입소문템 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("PRD_CTG_IDX_42", new String[] {"버킷마켓 마사지기", "꿈꾸던 삶을 담다. 인기 뷰티가전 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓소형가전,버킷마켓뷰티가전,버킷마켓마스크지원"});
            put("PRD_CTG_IDX_51", new String[] {"버킷마켓 혼수가전", "꿈꾸던 삶을 담다. 인기 신혼가전 전액지원 받으며 웨딩에 꼭 필요한 서비스를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓신혼가전,버킷마켓신혼가전지원,버킷마켓웨딩"});
            put("DMBK2020072900630069", new String[] {"버킷마켓 생활포인트", "꿈꾸던 삶을 담다. 월 3만원의 생활비를 지원받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓생활비,버킷마켓생활비지원,버킷마켓제휴처"});
            put("DMBK2020073000760147", new String[] {"버킷마켓 통신비지원", "꿈꾸던 삶을 담다. LGU플러스라면 누구나, 월 4만원의 통신비를 지원받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓엘지유플러스,버킷마켓통신비할인,버킷마켓통신비지원"});
            put("DMBK2020073101200130", new String[] {"버킷마켓 쿠쿠전자전기밥솥", "꿈꾸던 삶을 담다. 쿠쿠 전기밥솥 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓소형가전,버킷마켓소형가전지원"});
            put("DMBK2020073101210129", new String[] {"버킷마켓 마샬스피커", "꿈꾸던 삶을 담다. 마샬스피커 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓소형가전,버킷마켓소형가전지원"});
            put("DMBK2020073101220131", new String[] {"버킷마켓 브리츠스피커", "꿈꾸던 삶을 담다. 브리츠스피커 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓소형가전,버킷마켓소형가전지원"});
            put("DMBK2020092501500157", new String[] {"버킷마켓 유모차힙시트", "꿈꾸던 삶을 담다. 유모차,힙시트 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("DMBK2020073101180124", new String[] {"버킷마켓 두나리키트라이크S3", "꿈꾸던 삶을 담다. 두나 접이식 자전거 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("DMBK2020073101190125", new String[] {"버킷마켓 듀클핀회전형카시트", "꿈꾸던 삶을 담다. 듀클핀 회전형 카시트 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("DMBK2020092501480154", new String[] {"버킷마켓 젖병소독기식기세척기", "꿈꾸던 삶을 담다. 젖병소독기, 식기세척기 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("DMBK2020092501530160", new String[] {"버킷마켓 크림하우스매트", "꿈꾸던 삶을 담다. 크림하우스매트 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("DMBK2020092501520159", new String[] {"버킷마켓 유아교구교재지원", "꿈꾸던 삶을 담다. 각종 유아 교구, 교재 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("DMBK2020092501510158", new String[] {"버킷마켓 젖병소독기매트전동유축기", "꿈꾸던 삶을 담다. 젖병소독기, 전동유축기, 유아매트 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓육아용품,버킷마켓유아용품"});
            put("DMBK2020073101170127", new String[] {"버킷마켓 DCPLED마스크", "꿈꾸던 삶을 담다. LED 마스트 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓소형가전,버킷마켓뷰티가전,버킷마켓마스크지원"});
            put("DMBK2020091101370145", new String[] {"버킷마켓 삼성드럼세탁기", "꿈꾸던 삶을 담다. 삼성 드럼세탁기 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원,버킷마켓삼성가전"});
            put("DMBK2020091101330134", new String[] {"버킷마켓 삼성TV", "꿈꾸던 삶을 담다. 삼성 TV 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원,버킷마켓삼성가전"});
            put("DMBK2020091101350146", new String[] {"버킷마켓 삼성김치냉장고", "꿈꾸던 삶을 담다. 삼성 김치냉장고 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원,버킷마켓삼성가전"});
            put("DMBK2020091101360141", new String[] {"버킷마켓 삼성양문형냉장고", "꿈꾸던 삶을 담다. 삼성 양문형 냉장고 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원,버킷마켓삼성가전"});
            put("DMBK2020091101400143", new String[] {"버킷마켓 삼성무선청소기", "꿈꾸던 삶을 담다. 삼성 무선청소기 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원,버킷마켓삼성가전"});
            put("DMBK2020091101380144", new String[] {"버킷마켓 삼성건조기", "꿈꾸던 삶을 담다. 삼성 건조기 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원,버킷마켓삼성가전"});
            put("DMBK2020091101390142", new String[] {"버킷마켓 삼성무풍에어컨", "꿈꾸던 삶을 담다. 삼성 무풍에어컨 전액지원 받으며 인생에 꼭 필요한 라이프서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓렌탈,버킷마켓렌탈비지원,버킷마켓삼성가전"});
            put("bestranking", new String[] {"버킷마켓 베스트랭킹", "꿈꾸던 삶을 담다.생활혜택 지원으로 일상의 부담은 덜고 맞춤 라이프 서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓방법,버킷마켓후기"});
            put("planlist", new String[] {"버킷마켓 기획전목록", "꿈꾸던 삶을 담다.생활혜택 지원으로 일상의 부담은 덜고 맞춤 라이프 서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓방법,버킷마켓후기"});
            put("planview_3", new String[] {"버킷마켓 기획전상세", "꿈꾸던 삶을 담다. 웨딩에 필요한 서비스와 신혼가전을 함께 받는 서비스로 현재와 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓방법,버킷마켓웨딩"});
            put("eventlist", new String[] {"버킷마켓 이벤트목록", "꿈꾸던 삶을 담다.생활혜택 지원으로 일상의 부담은 덜고 맞춤 라이프 서비스로 미래를 준비합니다.", "버킷마켓,대명버킷마켓,버킷마켓서비스,버킷마켓방법,버킷마켓후기"});
        }});
}
