package bucketMarketFR;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import web.message.MessageType;
import web.message.model.MessageButton;
import web.message.model.MessageButtonType;
import web.message.model.MessageTemplate;
import web.message.service.MessageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:egovframework/spring/context-*.xml" })
@ActiveProfiles("dev")
public class KakaoAlimTalkTest {

    @Resource(name = "messageService")
    MessageService messageService;

    @Autowired
    Map<String, MessageTemplate> templates;

    @Test
    public void run(){
        try {
            this.messageService.sendAlimTalk(MessageType.PLANNER_APPLY_COMPLETE, "01027068614", "김원섭", "P01203123213");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
//    @Test
    public void test2() throws Exception {
        try{
        this.messageService.sendAlimTalk(MessageType.PLANNER_APPLY_COMPLETE, "01027068614", "김원섭", "P01203123213");
//        this.messageService.sendAlimTalk(AlimTalkType.BM006, "01020630874", "김혁", System.currentTimeMillis(), "너 정지 ㅋㅋ");
        } catch(Exception e) {
            
            e.printStackTrace();
            
        }
    }

    //    @Test
    public void test1() throws JsonProcessingException {

        MessageButton button = new MessageButton();
        button.setType(MessageButtonType.WEB_LINK);

        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(button);

        System.out.println(json);
    }
}
