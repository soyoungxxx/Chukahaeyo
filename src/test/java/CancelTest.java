import com.choikang.chukahaeyo.payment.PaymentService;
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
public class CancelTest {
    @Autowired
    PaymentService paymentService;

    @Test
    public void cancelTest() {
//        paymentService.cancelPayment("imp_817444192380");
    }

    @Test
    public void tokenTest() {
        String token = paymentService.getToken();
        log.debug(token);
    }
}
