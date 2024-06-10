package com.choikang.chukahaeyo.member;

import com.choikang.chukahaeyo.member.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
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
            model.addAttribute("url", "");
            return "include/alert";
        } else if (!login.isMemberAuth()){
            model.addAttribute("msg", "인증되지 않은 유저입니다. 메일 인증을 완료해주세요.");
            model.addAttribute("url", "");
            return "include/alert";
        }
        else {
            session.setAttribute("login", login);
            return "redirect:/";
        }
    }

    // 회원가입 시 이메일 중복체크
    @ResponseBody
    @GetMapping("/member/register/checkEmailDuplicate")
    public boolean checkEmailDuplicate(String email) {
        if(service.checkEmailDuplicate(email) == 0) {
            return false;
        }
        return true;
    }

    // 회원가입
    @ResponseBody
    @PostMapping("/member/register")
    public boolean register(MemberVO memberVO) {
        service.register(memberVO);
        return true;
    }

}
