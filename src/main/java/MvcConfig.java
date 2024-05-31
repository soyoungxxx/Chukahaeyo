
import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
@MapperScan(annotationClass = Mapper.class)
@EnableWebMvc
@EnableTransactionManagement
public class MvcConfig implements WebMvcConfigurer {

    // db.properties에 있는 속성
    @Value("${db.driver}")
    private String driver;
    @Value("${db.url}")
    private String url;
    @Value("${db.username}")
    private String username;
    @Value("${db.password}")
    private String password;

    // ViewResolver 설정(JSP 경로)
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/WEB-INF/views/", ".jsp");
    }

    // 정적페이지 처리(컨트롤러가 아니라 톰캣에서 처리하기 위해)
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    // 비즈니스 로직이 필요없는 URL 매핑
    @Override
    public void addViewControllers(ViewControllerRegistry reg) {
        reg.addViewController("/member/event.do");
    }

    // HikariCP
    @Bean
    public HikariDataSource dataSource() {
        HikariDataSource dataSource = new HikariDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setJdbcUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

    // MyBatis
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean ssf = new SqlSessionFactoryBean();
        ssf.setDataSource(dataSource()); // CP 객체 주입

        return ssf.getObject();
    }


    // 트랜잭션 설정
    @Bean
    public PlatformTransactionManager transactionManager() { // 메소드 이름 = bean의 이름
        DataSourceTransactionManager dtm = new DataSourceTransactionManager(dataSource());
        return dtm;
    }

    // properties 설정
    @Bean
    public static PropertyPlaceholderConfigurer properties() {
        PropertyPlaceholderConfigurer config = new PropertyPlaceholderConfigurer();
        config.setLocation(new ClassPathResource("db.properties"));
        return config;
    }

    // 파일 업로드
    @Bean
    public CommonsMultipartResolver multipartResolver() { //bean 이름을 꼭 이거로 해 주어야 함
        CommonsMultipartResolver multipart = new CommonsMultipartResolver();

        // 파일 size(용량)
        multipart.setMaxUploadSize(1024 * 1024 * 5);
        multipart.setDefaultEncoding("utf-8");
        return multipart;
    }
}
