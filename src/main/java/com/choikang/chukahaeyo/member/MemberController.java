package com.choikang.chukahaeyo.member;

import com.choikang.chukahaeyo.member.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.util.Random;

@Controller
public class MemberController {
    @Autowired
    private MemberService service;

    @Autowired
    private JavaMailSender mailSender;

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
    public boolean checkEmailDuplicate(String memberEmail) {
        if(service.checkEmailDuplicate(memberEmail) == 0) {
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

    @ResponseBody
    @PostMapping("/member/emailAuth")
    public String mailChcek(String memberEmail) throws Exception{
        int code = (int)((Math.random()*(99999-10000+1))+10000);
        String from = "dawndawnchoi@naver.com";//보내는 이 메일주소
        String to = memberEmail;
        String title = "회원가입시 필요한 인증번호 입니다.";
        String content = "[인증번호] "+ code +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
        String num = "";
        try {
            System.out.println("진짜 되라 왜 안될까??");
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(title);
            mailHelper.setText(content, true);

            mailSender.send(mail);
            num = Integer.toString(code);

        } catch(Exception e) {
            e.printStackTrace();
        }
        return num;

    }
}
