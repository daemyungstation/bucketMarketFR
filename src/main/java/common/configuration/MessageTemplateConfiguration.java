package common.configuration;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import egovframework.rte.fdl.property.EgovPropertyService;
import web.message.model.MessageTemplate;

@Configuration
public class MessageTemplateConfiguration {

    @Value("#{resource['front.ssl.domain']}")
    private String pcDomain;

    @Value("#{resource['mobile.ssl.domain']}") 
    private String mobileDomain;
    
    @Value("#{resource['admin.ssl.domain']}")
    private String adminDomain;

    @Resource(name = "urlPropertiesService")
    private EgovPropertyService urlPropertiesService;
    
    // 레디플래너 신청완료
    @Bean(name = "BM003")
    public MessageTemplate BM003() {
        MessageTemplate alim = new MessageTemplate();
        // 타이틀
        alim.setTitle("[버킷마켓] 레디플래너 신청완료");
        // 템플릿 내용
        StringBuilder msg = new StringBuilder();
        msg.append("[버킷마켓]\n");
        msg.append("%1$s 님, 레디플래너 신청에 감사드리며, 담당자의 검토 후 신청 승인이 완료됩니다.\n");
        msg.append("\n");
        msg.append("■플래너번호 : %2$s\n");
        msg.append("\n");
        msg.append("발급된 플래너번호로 임시 로그인 하시면 신청결과를 확인할 수 있으며,\n");
        msg.append("신청승인이 완료되면 다시 한번 안내드릴 예정입니다.\n");
        msg.append("\n");
        msg.append("감사합니다.");
        alim.setMessage(msg.toString());
        // 버튼
        String mobileLinkUrl = this.mobileDomain + urlPropertiesService.getString("planner.login.form");
//        String mobileLinkUrl = "https://tm.bucketmarket.co.kr/fr/planner/plannerLoginForm.do";
        String pcLinkUrl = this.pcDomain + urlPropertiesService.getString("planner.login.form");
//        String pcLinkUrl = "https://twww.bucketmarket.co.kr/fr/planner/plannerLoginForm.do";
        alim.addWebLinkButton("레디플래너 로그인", mobileLinkUrl, pcLinkUrl);
        return alim;
    }

    // 레디플래너 해제요청
    @Bean(name = "BM008")
    public MessageTemplate BM008() {
        MessageTemplate alim = new MessageTemplate();
        // 타이틀
        alim.setTitle("[버킷마켓] 레디플래너 안내");
        // 템플릿 내용
        StringBuilder msg = new StringBuilder();
        msg.append("[버킷마켓]\n");
        msg.append("%1$s 님, 레디플래너 해제요청이 접수되었습니다.\n");
        msg.append("\n");
        msg.append("■해제요청일 : %2$tY-%2$tm-%2$td %2$tH:%2$tM:%2$tS\n");
        msg.append("\n");
        msg.append("담당자가 확인 후, 영업일 2~3일 이내 처리됩니다.\n");
        msg.append("\n");
        msg.append("감사합니다.");
        alim.setMessage(msg.toString());
        // 버튼
        String mobileLinkUrl = this.mobileDomain + urlPropertiesService.getString("myplanner.main.view");
        String pcLinkUrl = this.pcDomain + urlPropertiesService.getString("myplanner.campaign.product.list");
        alim.addWebLinkButton("MY레디플래너", mobileLinkUrl, pcLinkUrl);
        return alim;
    }

    // 간편가입 신청완료 (=주문완료)_월지원/렌탈/즉발
    @Bean(name = "BM010")
    public MessageTemplate BM010() {
        MessageTemplate alim = new MessageTemplate();
        // 타이틀
        alim.setTitle("[버킷마켓] 간편가입 신청완료");
        // 템플릿 내용
        StringBuilder msg = new StringBuilder();
        msg.append("[버킷마켓]\n");
        msg.append("%1$s 님, 상품가입 신청이 완료되었습니다.\n");
        msg.append("\n");
        msg.append("■신청자 : %1$s\n");
        msg.append("■신청일시 : %2$tY-%2$tm-%2$td %2$tH:%2$tM:%2$tS\n");
        msg.append("■상품명 : %3$s\n");
        msg.append("■지원혜택 : %4$s\n");
        msg.append("■해피콜 상담시간 : %5$s\n");
        msg.append("\n");
        msg.append("영업일 1~2일 이내 전문 상담원이 신청한 해피콜 상담시간에 전화를 드릴 예정입니다.\n");
        msg.append("상담원과의 통화완료 후 최종 가입이 완료됩니다.\n");
        msg.append("\n");
        msg.append("감사합니다.");
        alim.setMessage(msg.toString());
        // 버튼
        String mobileLinkUrl = this.mobileDomain + urlPropertiesService.getString("mycontract.info.list.view");
        String pcLinkUrl = this.pcDomain + urlPropertiesService.getString("mycontract.info.list.view");
        alim.addWebLinkButton("가입후기 작성하기", mobileLinkUrl, pcLinkUrl);
        
//        StringBuilder msg = new StringBuilder();
//        msg.append("[버킷마켓]\n");
//        msg.append("★상담만 받아도 커피 or 아이스크림을 드려요★");
//        msg.append("\n");
//        msg.append("1) 스타벅스 아메리카노\n");
//        msg.append("2) 베스킨라빈스 싱글 아이스크림\n");
//        msg.append("상담을 완료하신 고객님께 드려요. (1분 이상 상담)\n");
//        msg.append("상담이 끝날 때 원하는 혜택을 말씀해주세요!\n");
//        msg.append("\n");
//        msg.append("영업일 1~2일 이내 전문 상담원이 전화드릴 예정입니다.\n");
//        msg.append("상담원과의 통화 완료 후 최종 가입이 완료됩니다.\n");
//        msg.append("버킷마켓 고객센터(☎1644-8399) 전화를 꼭 받아주세요.\n");
//        msg.append("\n");
//        msg.append("■신청자 : %1$s\n");
//        msg.append("■신청일시 : %2$tY-%2$tm-%2$td %2$tH:%2$tM:%2$tS\n");
//        msg.append("■상품명 : %3$s\n");
//        msg.append("■지원혜택 : %4$s\n");
//        msg.append("■해피콜 상담시간 : %5$s\n");
//        msg.append("\n");
//        msg.append("감사합니다.");
//        alim.setMessage(msg.toString());
//        // 버튼
//        String mobileLinkUrl = this.mobileDomain + urlPropertiesService.getString("mycontract.info.list.view");
//        String pcLinkUrl = this.pcDomain + urlPropertiesService.getString("mycontract.info.list.view");
//        alim.addWebLinkButton("가입후기 작성하기", mobileLinkUrl, pcLinkUrl);
        
        return alim;
    }

    // 간편가입 신청완료 (=주문완료)_할부지원형
    @Bean(name = "BM011")
    public MessageTemplate BM011() {
        MessageTemplate alim = new MessageTemplate();
        // 타이틀
        alim.setTitle("[버킷마켓] 간편가입 신청완료");
        // 템플릿 내용
        StringBuilder msg = new StringBuilder();
        msg.append("[버킷마켓]\n");
        msg.append("%1$s 님, 상품가입 신청이 완료되었습니다.\n");
        msg.append("\n");
        msg.append("■신청자 : %1$s\n");
        msg.append("■신청일시 : %2$tY-%2$tm-%2$td %2$tH:%2$tM:%2$tS\n");
        msg.append("■상품명 : %3$s\n");
        msg.append("■지원혜택 : %4$s\n");
        msg.append("■지원혜택 결제정보 : %5$s, %6$s할부\n");
        msg.append("■결제일시 : %7$s\n");
        msg.append("■해피콜 상담시간 : %8$s\n");
        msg.append("\n");
        msg.append("영업일 1~2일 이내 전문 상담원이 신청한 해피콜 상담시간에 전화를 드릴 예정입니다.\n");
        msg.append("상담원과의 통화완료 후 최종 가입이 완료됩니다.\n");
        msg.append("\n");
        msg.append("감사합니다.");
        alim.setMessage(msg.toString());
        // 버튼
        String mobileLinkUrl = this.mobileDomain + urlPropertiesService.getString("mycontract.info.list.view");
        String pcLinkUrl = this.pcDomain + urlPropertiesService.getString("mycontract.info.list.view");
        alim.addWebLinkButton("가입후기 작성하기", mobileLinkUrl, pcLinkUrl);
        
        
//        StringBuilder msg = new StringBuilder();
//        msg.append("[버킷마켓]\n");
//        msg.append("★상담만 받아도 커피 or 아이스크림을 드려요★");
//        msg.append("\n");
//        msg.append("1) 스타벅스 아메리카노\n");
//        msg.append("2) 베스킨라빈스 싱글 아이스크림\n");
//        msg.append("상담을 완료하신 고객님께 드려요. (1분 이상 상담)\n");
//        msg.append("상담이 끝날 때 원하는 혜택을 말씀해주세요!\n");
//        msg.append("\n");
//        msg.append("영업일 1~2일 이내 전문 상담원이 전화드릴 예정입니다.\n");
//        msg.append("상담원과의 통화 완료 후 최종 가입이 완료됩니다.\n");
//        msg.append("버킷마켓 고객센터(☎1644-8399) 전화를 꼭 받아주세요.\n");
//        msg.append("\n");
//        msg.append("■신청자 : %1$s\n");
//        msg.append("■신청일시 : %2$tY-%2$tm-%2$td %2$tH:%2$tM:%2$tS\n");
//        msg.append("■상품명 : %3$s\n");
//        msg.append("■지원혜택 : %4$s\n");
//        msg.append("■지원혜택 결제정보 : %5$s, %6$s할부\n");
//        msg.append("■결제일시 : %7$s\n");
//        msg.append("■해피콜 상담시간 : %5$s\n");
//        msg.append("\n");
//        msg.append("감사합니다.");
//        alim.setMessage(msg.toString());
//        // 버튼
//        String mobileLinkUrl = this.mobileDomain + urlPropertiesService.getString("mycontract.info.list.view");
//        String pcLinkUrl = this.pcDomain + urlPropertiesService.getString("mycontract.info.list.view");
//        alim.addWebLinkButton("가입후기 작성하기", mobileLinkUrl, pcLinkUrl);
        
        return alim;
    }

    // 해지신청 완료
    @Bean(name = "BM012")
    public MessageTemplate BM012() {
        MessageTemplate alim = new MessageTemplate();
        // 타이틀
        alim.setTitle("[버킷마켓] 해지신청완료");
        // 템플릿 내용
        StringBuilder msg = new StringBuilder();
        msg.append("[버킷마켓]\n");
        msg.append("%1$s 님, 상품 해지신청이 완료되었습니다.\n");
        msg.append("\n");
        msg.append("■신청자 : %1$s\n");
        msg.append("■신청일시 : %2$tY-%2$tm-%2$td %2$tH:%2$tM:%2$tS\n");
        msg.append("■회원번호 : %3$s\n");
        msg.append("■상품명 : %4$s\n");
        msg.append("\n");
        msg.append("영업일 2~3일 이내 전문 상담원이 전화를 드릴 예정입니다.\n");
        msg.append("\n");
        msg.append("감사합니다.");
        alim.setMessage(msg.toString());
        // 버튼
        String mobileLinkUrl = this.mobileDomain;
        String pcLinkUrl = this.pcDomain;
        alim.addWebLinkButton("버킷마켓 바로가기", mobileLinkUrl, pcLinkUrl);
        return alim;
    }

    // 양도/양수신청 완료
    @Bean(name = "BM013")
    public MessageTemplate BM013() {
        MessageTemplate alim = new MessageTemplate();
        // 타이틀
        alim.setTitle("[버킷마켓] 양도/양수신청 완료");
        // 템플릿 내용
        StringBuilder msg = new StringBuilder();
        msg.append("[버킷마켓]\n");
        msg.append("%1$s 님, 양도/양수 신청이 완료되었습니다. \n");
        msg.append("\n");
        msg.append("■신청자 : %1$s\n");
        msg.append("■신청일시 : %2$tY-%2$tm-%2$td %2$tH:%2$tM:%2$tS\n");
        msg.append("■상품명 : %3$s\n");
        msg.append("■회원번호 : %4$s\n");
        msg.append("\n");
        msg.append("영업일 2~3일 이내 전문 상담원이 전화를 드립니다. \n");
        msg.append("\n");
        msg.append("감사합니다.");
        alim.setMessage(msg.toString());
        // 버튼
        String mobileLinkUrl = this.mobileDomain;
        String pcLinkUrl = this.pcDomain;
        alim.addWebLinkButton("버킷마켓 바로가기", mobileLinkUrl, pcLinkUrl);
        return alim;
    }

    // 라이프서비스 신청
    @Bean(name = "BM014")
    public MessageTemplate BM014() {
        MessageTemplate alim = new MessageTemplate();
        // 타이틀
        alim.setTitle("[버킷마켓] 라이프서비스 신청 완료");
        // 템플릿 내용
        StringBuilder msg = new StringBuilder();
        msg.append("[버킷마켓]\n");
        msg.append("%1$s 님, 라이프서비스 사용 신청이 완료되었습니다.\n");
        msg.append("\n");
        msg.append("■신청자 : %1$s\n");
        msg.append("■신청일시 : %2$tY-%2$tm-%2$td %2$tH:%2$tM:%2$tS\n");
        msg.append("■상품명 : %3$s\n");
        msg.append("■회원번호 : %4$s\n");
        msg.append("■신청희망 서비스 : %5$s\n");
        msg.append("\n");
        msg.append("영업일 1~2일 이내 전문 상담원이 전화를 드립니다. \n");
        msg.append("\n");
        msg.append("감사합니다.");
        alim.setMessage(msg.toString());
        // 버튼
        String mobileLinkUrl = this.mobileDomain;
        String pcLinkUrl = this.pcDomain;
        alim.addWebLinkButton("버킷마켓 바로가기", mobileLinkUrl, pcLinkUrl);
        return alim;
    }
    
    // 레디플래너 신청완료 후 관리자 알림톡 전송
    @Bean(name = "BM020")
    public MessageTemplate BM020() {
        MessageTemplate alim = new MessageTemplate();
        // 타이틀
        alim.setTitle("[버킷마켓] 레디플래너 신청 접수");
        // 템플릿 내용
        StringBuilder msg = new StringBuilder();
        msg.append("[버킷마켓]\n");
        msg.append("%1$s 님, 레디플래너 신청이 접수되었습니다.\n");
        msg.append("신청 승인을 위해 관리자의 검토가 필요합니다.\n");
        msg.append("\n");
        msg.append("■ 신청자 성함 : %2$s\n");
        msg.append("■ 신청자 연락처 : %3$s\n");
        msg.append("■ 신청일시 : %4$s\n");
        alim.setMessage(msg.toString());
        // 버튼
//        String mobileLinkUrl = "https://bo.bucketmarket.co.kr/bo/manager/login.do";
        String mobileLinkUrl = this.adminDomain + "/bo/manager/login.do";
//        String pcLinkUrl = "https://bo.bucketmarket.co.kr/bo/manager/login.do";
        String pcLinkUrl = this.adminDomain + "/bo/manager/login.do";
        String target = "out";
        alim.addWebLinkButton("버킷마켓 관리자 바로가기", mobileLinkUrl, pcLinkUrl, target);
        return alim;
    }
    
}
