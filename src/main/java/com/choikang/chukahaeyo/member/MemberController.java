package com.choikang.chukahaeyo.member;

import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.member.model.AdminVO;
import com.choikang.chukahaeyo.member.model.MemberVO;
import com.choikang.chukahaeyo.payment.model.PaymentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

@Controller
public class MemberController {

    @Autowired
    private MemberService service;

    // 로그인: 페이지 접근
    @GetMapping("/member/login")
    public void login() {
    }

    // 회원가입: 페이지 접근
    @GetMapping("/member/register")
    public void register() {
    }

    // 관리자 로그인
    @PostMapping("/adminLogin")
    public String adminLogin(Model model, AdminVO adminVO, HttpSession session) {
        AdminVO login = service.adminLogin(adminVO);
        if (login == null) {
            model.addAttribute("msg", "아이디 혹은 비밀번호를 다시 확인하세요.");
            model.addAttribute("url", "/admin/adminLogin");
            return "include/alert";
        } else {
            session.setAttribute("login", login); // login 객체 또는 true 설정
            session.setAttribute("adminID", login.getAdminID());
            session.setAttribute("adminEmail", login.getAdminEmail());

            // 리다이렉트할 URI 확인
            String redirectURI = (String) session.getAttribute("redirectURI");
            if (redirectURI != null) {
                session.removeAttribute("redirectURI");
                return "redirect:" + redirectURI;
            } else {
                return "redirect:/admin/adminPage";
            }
        }
    }

    // 로그인
    // 로그인: 회원인 유저 로그인
    @PostMapping("/member/login")
    public String login(Model model, MemberVO memberVO, HttpSession session) {
        MemberVO login = service.login(memberVO);
        if (login == null) {
            model.addAttribute("msg", "아이디 혹은 비밀번호를 다시 확인하세요.");
            model.addAttribute("url", "/member/login");
            return "include/alert";
        } else if (!login.isMemberAuth()) {
            model.addAttribute("msg", "인증되지 않은 회원입니다. 메일 인증을 완료해주세요.");
            model.addAttribute("url", "/member/login");
            return "include/alert";
        } else if (login.isMemberWithdraw()) {
            model.addAttribute("msg", "탈퇴한 회원입니다.");
            model.addAttribute("url", "/member/login");
            return "include/alert";
        } else {
            session.setAttribute("login", login); // login 객체 또는 true 설정
            session.setAttribute("memberID", login.getMemberID());
            session.setAttribute("memberEmail", login.getMemberEmail());
            session.setAttribute("memberName", login.getMemberName());

            // System.out.println으로 로그 출력
            System.out.println("Logged-in user ID: " + login.getMemberID());
            System.out.println("Logged-in user details: " + login);

            // 리다이렉트할 URI 확인
            String redirectURI = (String) session.getAttribute("redirectURI");
            if (redirectURI != null) {
                session.removeAttribute("redirectURI");
                return "redirect:" + redirectURI;
            } else {
                return "redirect:/";
            }
        }
    }

    // 회원가입
    // 회원가입 : DB에 회원 정보 등록
    @PostMapping("/member/register")
    public String register(MemberVO memberVO, Model model) {
        service.register(memberVO);
        return "redirect:/member/login"; // 로그인 페이지로 리다이렉션
    }

    // 회원가입 : 이메일 중복체크
    @ResponseBody
    @GetMapping("/member/register/checkEmailDuplicate")
    public boolean checkEmailDuplicate(String memberEmail) {
        return service.checkEmailDuplicate(memberEmail) > 0;
    }

    // 회원가입 : 멤버 인증, 인증 링크 이메일 발송
    @ResponseBody
    @PostMapping("/member/emailAuth")
    public void mailCheck(String memberEmail, String memberName) {
        service.mailAuthCheck(memberEmail, memberName);
    }

    // 회원가입: 멤버 인증, 이메일을 통해 링크 인증 완료 시 DB상의 isAuth 상태 변경
    @GetMapping("/member/verify")
    public String verify(Model model, @RequestParam("memberID") int memberID) {
        if (service.getUserInfoById(memberID).isMemberAuth()) {
            model.addAttribute("msg", "이미 인증된 회원입니다.");
            model.addAttribute("closeWindow", true);
        } else {
            service.memberVerify(memberID);
            model.addAttribute("msg", "인증이 완료되었습니다.");
            model.addAttribute("url", "/member/login");
        }
        return "include/alert";
    }

    // 회원 정보 수정
    // 회원 정보 수정: 페이지 접근 전 이메일 조회
    @GetMapping("/mypage/changeInfo")
    public String changeInfo(HttpSession session, Model model) {
        int id = (int) session.getAttribute("memberID");
        String memberEmail = (service.getUserInfoById(id)).getMemberEmail();
        model.addAttribute("memberEmail", memberEmail);
        return "/mypage/changeInfo";
    }

    // 회원 정보 수정: 비밀번호 인증
    @PostMapping("/mypage/changeInfo/checkPwd")
    @ResponseBody
    public int validatePwd(HttpSession session, String memberCheckPwd) {
        // 세션에 있는 id값 가져옴
        int id = (int) session.getAttribute("memberID");
        MemberVO memberVO = new MemberVO();
        memberVO.setMemberID(id);
        memberVO.setMemberPwd(memberCheckPwd);

        Integer result = service.validatePwd(memberVO);
        if (result == null) {
            return 0;
        }
        return result;
    }

    // 회원 정보 수정: 회원 정보 수정
    @PostMapping("/mypage/changeInfo")
    public String changeMemberInfo(HttpSession session, Model model, MemberVO memberVO) {
        int id = (int) session.getAttribute("memberID");
        memberVO.setMemberID(id);
        System.out.println(memberVO);

        if (service.changeMemberInfo(memberVO) != 0) {
            model.addAttribute("msg", "회원 정보가 수정되었습니다");
            model.addAttribute("url", "/");
            return "include/alert";
        } else {
            model.addAttribute("msg", "저장 중 오류가 발생했습니다. 다시 시도해주세요.");
            model.addAttribute("url", "/mypage/changeInfo");
            return "include/alert";
        }
    }

    // 결제내역: 회원의 결제 내역 가져오기
    @GetMapping("/mypage/myHistory")
    public String getPayHistoryCard(HttpSession session, Model model) {
        int memberID = (int) session.getAttribute("memberID");
        List<CardVO> cardList = service.getCardList(memberID);
        List<PaymentVO> paymentList = service.getPaymentList(memberID);

        Timestamp twoDaysAgo = new Timestamp(System.currentTimeMillis() - 2L * 24 * 60 * 60 * 1000); // 2일 전의 Timestamp 계산
        for (PaymentVO payment : paymentList) {
            Timestamp tempDate = payment.getPayDate();
            if (tempDate != null && twoDaysAgo.before(tempDate)) {
                payment.setIsWithinTwoDays(1);
            } else {
                payment.setIsWithinTwoDays(0);
            }
        }
        model.addAttribute("cardList", cardList);
        model.addAttribute("paymentList", paymentList);
        return "/mypage/myHistory";
    }

    // 관리자: 결제 내역 가져오기
    @GetMapping("/admin/adminOrderList")
    public String getAllPaymentList(Model model, @RequestParam(defaultValue = "1") int page,
                                    @RequestParam(defaultValue = "10") int size) {
        List<PaymentVO> paymentList = service.getPaymentAllList();

        int totalPayments = paymentList.size();
        int totalPages = (int) Math.ceil((double) totalPayments / size);

        int start = (page - 1) * size;
        int end = Math.min(start + size, totalPayments);

        List<PaymentVO> payments = paymentList.subList(start, end);

        model.addAttribute("payments", payments);

        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", size);
        model.addAttribute("totalPages", totalPages);

        return "/admin/adminOrderList";
    }

    // 관리자: 결제 내역 필터해서 가져오기
    @PostMapping("/admin/adminOrderList")
    public String getFilteredPaymentList(Model model,
                                         @RequestParam(name = "page", required = false, defaultValue = "1") int page,
                                         @RequestParam(name = "size", required = false, defaultValue = "10") int size,
                                         @RequestParam(required = false) String startDate,
                                         @RequestParam(required = false) String endDate,
                                         @RequestParam(required = false) String status,
                                         @RequestParam(required = false) String search) {
        // required: false로 하지않으면 필수 요소로 설정됨.
        List<PaymentVO> paymentList = service.getFilteredPaymentList(startDate, endDate, status, search);

        int totalPayments = paymentList.size();
        int totalPages = (int) Math.ceil((double) totalPayments / size);

        int start = (page - 1) * size;
        int end = Math.min(start + size, totalPayments);

        List<PaymentVO> payments = paymentList.subList(start, end);

        model.addAttribute("payments", payments);
        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", size);
        model.addAttribute("totalPages", totalPages);

        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("status", status);
        model.addAttribute("search", search);

        return "/admin/adminOrderList";
    }


    // 관리자: 멤버 모든 목록 가져오기
    @GetMapping("/admin/adminMemberList")
    public String getAllMemberList(Model model) {
        List<MemberVO> memberList = service.getMemberAllList();
        model.addAttribute("memberList", memberList);
        return "/admin/adminMemberList";
    }

    // 회원 탈퇴
    @ResponseBody
    @PostMapping("/admin/memberDelete")
    public ResponseEntity<String> memberDelete(@RequestBody MemberDeleteDTO selectedMembers) {
        try {
            MemberVO memberVO = new MemberVO();
            for (String memberId : selectedMembers.getMemberIds()) {
                memberVO.setMemberID(Integer.parseInt(memberId));
                service.withdrawMember(memberVO);
            }
            return new ResponseEntity<>("회원 삭제가 완료되었습니다.", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("회원 삭제 중 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 로그아웃(일반 회원, 관리자)
    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletRequest request, Model model) {
        session.invalidate();
        String beforePage = request.getHeader("Referer");
        model.addAttribute("msg", "로그아웃 되었습니다.");
        if (beforePage.contains("admin")) {
            model.addAttribute("url", "/admin/adminLogin");
        } else {
            model.addAttribute("url", "/");
        }
        return "include/alert";
    }

    // 회원탈퇴
    // 회원탈퇴: 로그인한 유저 email 조회
    @GetMapping("/mypage/unregister")
    public String getLoginMemberEmail(HttpSession session, Model model) {
        int id = (int) session.getAttribute("memberID");
        String memberEmail = (service.getUserInfoById(id)).getMemberEmail();
        model.addAttribute("memberEmail", memberEmail);
        return "/mypage/unregister";
    }

    // 회원탈퇴 : 비밀번호 확인 일치하는 경우 탈퇴
    @PostMapping("/mypage/unregister")
    public String unregister(HttpSession session, Model model, String memberPwd, RedirectAttributes redirectAttributes) {
        int id = (int) session.getAttribute("memberID");
        MemberVO memberVO = new MemberVO();
        memberVO.setMemberID(id);
        memberVO.setMemberPwd(memberPwd);
        // 패스워드 확인
        if (service.unsign(memberVO) == 1) {
            session.invalidate();
            redirectAttributes.addFlashAttribute("msg", "회원탈퇴 되었습니다.");
            return "redirect:/unsign-msg";
        }
        model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
        model.addAttribute("url", "/mypage/unregister");
        return "include/alert";
    }

    // 회원탈퇴 : 탈퇴 후 alert 띄어줌
    @GetMapping("/unsign-msg")
    public String mainPage(Model model, @ModelAttribute("msg") String msg) {
        model.addAttribute("msg", msg);
        model.addAttribute("url", "/");
        return "include/alert";
    }
}