//package com.choikang.chukahaeyo.filter;
//
//import com.choikang.chukahaeyo.visitor.VisitorService;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.UUID;
//
//@WebFilter("/*")
//public class CookieFilter implements Filter {
//    VisitorService visitorService;
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        // 필터 초기화 코드
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        checkCookie((HttpServletRequest) request, (HttpServletResponse) response);
//    }
//
//    private void checkCookie(HttpServletRequest request, HttpServletResponse response) {
//        if (request.getCookies() != null) {
//            return;
//        }
//        createCookie(response);
//        // 쿠키값 인서트
//    }
//
//    private void createCookie(HttpServletResponse response) {
//        UUID uuid = UUID.randomUUID();
//        String token = uuid.toString();
//        Cookie visitorCookie = new Cookie("visitor", token);
//        visitorCookie.setPath("/");
//        visitorCookie.setHttpOnly(true); // HTTP ONLY 로 설정해서 XSS 방지
//        visitorCookie.setMaxAge(60 * 60 * 3); // 3시간 단위로 쿠키 삭제
//        response.addCookie(visitorCookie); // response에 쿠키 담아 반환
//    }
//
//    @Override
//    public void destroy() {
//        // 필터 소멸 코드
//    }
//}
//
