import com.choikang.chukahaeyo.s3.S3Service;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {config.MvcConfig.class})
@WebAppConfiguration
@Slf4j
public class S3Test {
    @Autowired
    S3Service s3Service;

    @Test
    public void cancelTest(){
        s3Service.deleteFile("d26e29fe-fb0b-4807-bb1d-.png");
    }
}
