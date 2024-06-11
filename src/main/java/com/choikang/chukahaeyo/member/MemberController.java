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

    @ResponseBody
    @PostMapping("/member/emailAuth")
    public int emailAuth(String memberEmail) {
        System.out.println("전달받은 이메일 주소: " + memberEmail);

        Random random = new Random();
        int checkNum = random.nextInt(888888)+111111;

        //이메일 보낼 양식
        String setFrom = "(cms0755@naver.com)"; //2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
        String toMail = memberEmail;
        String title = "회원가입 인증 이메일 입니다.";
        String content = "인증 코드는 " + checkNum + " 입니다." +
                "<br>" +
                "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
        try {
            MimeMessage message = mailSender.createMimeMessage(); //Spring에서 제공하는 mail API
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("랜덤숫자 : " + checkNum);
        return checkNum;
    }

}
