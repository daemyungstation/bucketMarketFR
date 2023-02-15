package bucketMarketFR;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import web.fr.dlcc.service.DlccService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:egovframework/spring/context-*.xml" })
public class OrderDtlViewTest {
    
    @Resource(name="dlccService")
    private DlccService dlccService;
    
    @Test
    public void run() throws Exception{
        
        List<String> accntNoList = new ArrayList<String>();
        accntNoList.add("2018AO000738");
        accntNoList.add("000000000000");
        accntNoList.add("000000000001");
        
        dlccService.doJob05(accntNoList);
    }
}
