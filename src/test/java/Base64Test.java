import com.choikang.chukahaeyo.card.edit.EditService;
import com.choikang.chukahaeyo.common.Base64Util;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    EditService editService;

    @Test
    public void encoding() {
        encodeStr = Base64Util.encode(input);
    }

    @Test
    public void decoding() {
        encodeStr = Base64Util.encode(input);
        decodeStr = Base64Util.decode(encodeStr);
    }

    @Test
    public void equalsOrNot() {
        encodeStr = Base64Util.encode(input);
        decodeStr = Base64Util.decode(encodeStr);
    }
}
