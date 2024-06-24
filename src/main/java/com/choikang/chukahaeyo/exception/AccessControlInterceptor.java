package com.choikang.chukahaeyo.exception;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class AccessControlInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String uri = request.getRequestURI();

        // 로그인 상태 체크
        boolean isLoggedIn = session.getAttribute("login") != null;

        // 비로그인 상태에서 접근할 수 없는 경로
        if (!isLoggedIn && (uri.startsWith("/mypage/") || uri.startsWith("/cart") || uri.startsWith("/card/edit/") || uri.startsWith("/payments/") || uri.startsWith("/board/community/write"))) {
            String queryString = request.getQueryString();
            String target = uri + (queryString == null ? "" : "?" + queryString);

            session.setAttribute("redirectURI", target);
            session.setAttribute("msg", "로그인이 필요합니다.");
            response.sendRedirect(request.getContextPath() + "/member/login");
            return false;
        }

        // 로그인 상태에서 접근할 수 없는 경로
        if (isLoggedIn && (uri.equals("/member/login") || uri.equals("/member/register") || uri.equals("/member/emailAuth") || uri.equals("/member/verify"))) {
            response.sendRedirect(request.getContextPath() + "/");
            return false;
        }

        return true;
    }
}