package com.choikang.chukahaeyo.member;

import com.choikang.chukahaeyo.member.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    private MemberService service;

    @GetMapping("/member/login")
    public void login() {
    }

    @GetMapping("/member/register")
    public void register() {
    }


    // 로그인
    @PostMapping("/member/login")
    public String login(Model model, MemberVO memberVO, HttpSession session) {
        MemberVO login = service.login(memberVO);
        if (login == null) {
            model.addAttribute("msg", "아이디 혹은 비밀번호를 다시 확인하세요.");
            model.addAttribute("url", "/");
            return "include/alert";
        } else {
            session.setAttribute("login", login); // login 객체 또는 true 설정
//            session.setAttribute("memberId", 1);
            session.setAttribute("memberId", login.getMemberId());

            // System.out.println으로 로그 출력
            System.out.println("Logged-in user ID: " + login.getMemberId());
            System.out.println("Logged-in user details: " + login);

            return "redirect:/";
        }
    }

    // 회원가입
    @PostMapping("/member/register")
    public String register(MemberVO memberVO, Model model) {
        if (service.checkEmailDuplicate(memberVO.getMemberEmail()) > 0) {
            model.addAttribute("msg", "이미 사용 중인 이메일입니다.");
            model.addAttribute("url", "/member/register");
            return "alert"; // 알림 페이지로 리다이렉트
        }
        service.register(memberVO);
        return "redirect:/member/login"; // 로그인 페이지로 리다이렉션
    }

    // 회원가입 시 이메일 중복체크
    @ResponseBody
    @GetMapping("/member/register/checkEmailDuplicate")
    public boolean checkEmailDuplicate(String email) {
        return service.checkEmailDuplicate(email) > 0;
    }


}
