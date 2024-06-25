import com.choikang.chukahaeyo.common.Base64Util;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.Objects;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {config.MvcConfig.class})
@WebAppConfiguration
@Slf4j
public class Base64Test {
    String input = "/completedCard/104";
    String encodeStr = "";
    String decodeStr = "";

    @Test
    public void encoding() {
        encodeStr = Base64Util.encode(input);
        System.out.println("인코딩 문자열 : " + encodeStr);
    }

    @Test
    public void decoding() {
        encodeStr = Base64Util.encode(input);
        decodeStr = Base64Util.decode(encodeStr);
        System.out.println("디코딩 문자열 : " + decodeStr);
    }

    @Test
    public void equalsOrNot() {
        encodeStr = Base64Util.encode(input);
        decodeStr = Base64Util.decode(encodeStr);
        System.out.println("같은 값인가 : " + Objects.equals(input, decodeStr));
    }
}
