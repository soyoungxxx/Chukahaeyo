package config;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan(basePackages = { "com.choikang.chukahaeyo" })
@EnableWebMvc
@MapperScan(basePackages = { "com.choikang.chukahaeyo" }, annotationClass = Mapper.class) // 인터페이스 스캔
//@EnableTransactionManagement
//@PropertySource("classpath:db.properties")
public class MvcConfig implements WebMvcConfigurer {

    @Value("${db.driver}")
    private String driver;
    @Value("${db.url}")
    private String url;
    @Value("${db.memberName}")
    private String memberName;
    @Value("${db.password}")
    private String password;

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
        reg.addViewController("/member/register");
        reg.addViewController("/mypage/myPage");
        reg.addViewController("/mypage/myCard");
        reg.addViewController("/card/edit");
        reg.addViewController("/admin/adminPage");
        reg.addViewController("/mypage/changeInfo");
        reg.addViewController("/mypage/unregister");
        reg.addViewController("/mypage/myHistory");

        reg.addViewController("/url/origin");
        reg.addViewController("/url/short");

        reg.addViewController("/errorPage/404");
        reg.addViewController("/errorPage/500");

    }

    @Bean
    public HikariDataSource dataSource() {
        HikariDataSource dataSource = new HikariDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setJdbcUrl(url);
        dataSource.setUsername(memberName);
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
        config.setLocations(new ClassPathResource("db.properties"));
        return config;
    }
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}