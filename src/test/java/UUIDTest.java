import org.junit.Test;

import java.util.UUID;

public class UUIDTest {
    @Test
    public void createTest() {
        UUID uuid = UUID.randomUUID();
        String str = uuid.toString();
        System.out.println(str);
    }
}
