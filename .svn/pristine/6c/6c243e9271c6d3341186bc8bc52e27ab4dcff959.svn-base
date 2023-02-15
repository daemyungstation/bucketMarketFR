package bucketMarketFR;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:egovframework/spring/context-*.xml" })
public class SingleThreadTest {
    

    @Test
    public void run(){
        
        /*
        Runnable runnable = () -> {
            try {
                String name = Thread.currentThread().getName();
                System.out.println("Foo " + name);
               // TimeUnit.SECONDS.sleep(30);
                System.out.println("Bar " + name);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        };

        Thread thread = new Thread(runnable);
        thread.start();
        
        
        System.out.println("########################################## END....");
        System.out.println( ">>>>" + thread.isAlive() );
        */
        
        ExecutorService executor = Executors.newSingleThreadExecutor();
        Runnable task = () -> {
            try {
                
                String name = Thread.currentThread().getName();
                System.out.println("Foo " + name);
              //  TimeUnit.SECONDS.sleep(3);
                System.out.println("Bar " + name);
                
                executor.shutdown();
            }
            catch (Exception e) {
                System.err.println("task interrupted");
            }
        };
        
        executor.execute(task);
        System.out.println("########################################## END....");
        
     //  executor.scheduleWithFixedDelay(task, 0, 1, TimeUnit.SECONDS);
    }
}
