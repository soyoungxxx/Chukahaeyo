import com.nhncorp.lucy.security.xss.XssFilter;
import org.junit.Test;
import org.testng.Assert;

public class XSSFilterTest {
    XssFilter filter = XssFilter.getInstance("lucy-xss-superset-sax.xml", true);

    @Test
    public void testDirtyCodeFiltering() {
        String dirty = "<script></script>";
        String clean = filter.doFilter(dirty);
        String expected = "&lt;script&gt;&lt;/script&gt;"; // 예상 문자열
        Assert.assertEquals(clean, expected);
    }
}
