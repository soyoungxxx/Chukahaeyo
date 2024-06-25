import com.choikang.chukahaeyo.common.DecodeUniCode;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {config.MvcConfig.class})
@WebAppConfiguration
@Slf4j
public class DecodeUniCodeTest {

    @Test
    public void getDecode() {
        String a = DecodeUniCode.unicodeDecode("\\uc548\\ub155\\ud558\\uc138\\uc694");
        System.out.println("decode:" + a);
    }
}
