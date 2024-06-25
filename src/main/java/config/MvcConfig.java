package config;

import com.choikang.chukahaeyo.interceptor.CompletedCardInterceptor;
import com.choikang.chukahaeyo.interceptor.CookieInterceptor;
import com.choikang.chukahaeyo.interceptor.AccessControlInterceptor;
import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;

import java.util.Properties;

@Configuration
@ComponentScan(basePackages = {"com.choikang.chukahaeyo"})
@EnableWebMvc
@MapperScan(basePackages = {"com.choikang.chukahaeyo"}, annotationClass = Mapper.class) // 인터페이스 스캔
//@EnableTransactionManagement
//@PropertySource("classpath:db.properties")
public class MvcConfig implements WebMvcConfigurer {

    @Value("${db.driver}")
    private String driver;
    @Value("${db.url}")
    private String url;
    @Value("${db.username}")
    private String username;
    @Value("${db.password}")
    private String password;

    @Value("${spring.mail.host}")
    private String mailHost;
    @Value("${spring.mail.port}")
    private int mailPort;
    @Value("${spring.mail.username}")
    private String mailUser;
    @Value("${spring.mail.password}")
    private String mailPassword;

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/WEB-INF/view/", ".jsp");
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void addViewControllers(ViewControllerRegistry reg) {
        reg.addViewController("/mypage/myPage");
        reg.addViewController("/mypage/myCard");
        reg.addViewController("/card/edit");
        reg.addViewController("/admin/adminPage");
        reg.addViewController("/admin/adminLogin");
        reg.addViewController("/mypage/myHistory");
    }

    @Autowired
    private AccessControlInterceptor accessControlInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(accessControlInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/resources/**", "/static/**", "/public/**");

        registry.addInterceptor(cookieInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/admin/**");
//        registry.addInterceptor(completedCardInterceptor())
//                .addPathPatterns("/card/completedCard/**");
    }


    @Bean
    public CookieInterceptor cookieInterceptor() {
        return new CookieInterceptor();
    }

    @Bean
    public CompletedCardInterceptor completedCardInterceptor() {
        return new CompletedCardInterceptor();
    }

    @Bean
    public HikariDataSource dataSource() {
        HikariDataSource dataSource = new HikariDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setJdbcUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean ssf = new SqlSessionFactoryBean();
        ssf.setDataSource(dataSource()); // CP 객체 주입
        return ssf.getObject();
    }

    @Bean
    public static PropertyPlaceholderConfigurer propreties() {
        PropertyPlaceholderConfigurer config = new PropertyPlaceholderConfigurer();
        String value = System.getProperty("spring.profiles.active");
        if ("aws".equals(value)) {
            config.setLocations(new FileSystemResource("/home/ubuntu/shinhan_team2_chukahaeyo/apache-tomcat-9.0.89/webapps/application.properties"));
        } else {
            config.setLocations(new ClassPathResource("application.properties"));
        }
        return config;
    }

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(mailHost);
        mailSender.setPort(mailPort);
        mailSender.setUsername(mailUser);
        mailSender.setPassword(mailPassword);

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }

    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(10485760); // 10MB
        return multipartResolver;
    }
}