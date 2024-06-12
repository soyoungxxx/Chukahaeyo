package com.choikang.chukahaeyo.exception;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") == null) {
            String uri = request.getRequestURI();
            String queryString = request.getQueryString();
            String target = uri + (queryString == null ? "" : "?" + queryString);

            session.setAttribute("redirectURI", target);
            session.setAttribute("msg", "로그인이 필요합니다.");
            response.sendRedirect(request.getContextPath() + "/member/login");
            return false;
        }
        return true;
    }
}