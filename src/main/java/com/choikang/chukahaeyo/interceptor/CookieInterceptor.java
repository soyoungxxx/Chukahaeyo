package com.choikang.chukahaeyo.interceptor;

import com.choikang.chukahaeyo.visitor.VisitorService;
import com.choikang.chukahaeyo.visitor.model.VisitorVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Component
public class CookieInterceptor implements HandlerInterceptor {
    @Autowired
    private VisitorService visitorService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return checkCookie(request, response);
    }

    private boolean checkCookie(HttpServletRequest request, HttpServletResponse response) {
        if (request.getCookies() ==  null) { // 쿠키가 있으면 return false
            createCookie(response);
        }
        return true;
    }

    private void createCookie(HttpServletResponse response) {
        UUID uuid = UUID.randomUUID();
        String token = uuid.toString();
        Cookie visitorCookie = new Cookie("visitor", token);
        visitorCookie.setPath("/");
        visitorCookie.setHttpOnly(true); // HTTP ONLY 로 설정해서 XSS 방지
        visitorCookie.setMaxAge(60 * 60 * 3); // 3시간 단위로 쿠키 삭제
        response.addCookie(visitorCookie); // response에 쿠키 담아 반환
        visitorService.insertCookie(new VisitorVO(), token); // DB에 값 삽입
    }
}

