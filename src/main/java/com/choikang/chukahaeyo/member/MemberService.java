package com.choikang.chukahaeyo.member;

import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.member.model.AdminVO;
import com.choikang.chukahaeyo.member.model.MemberVO;
import com.choikang.chukahaeyo.payment.CancelDTO;
import com.choikang.chukahaeyo.payment.PaymentDTO;
import com.choikang.chukahaeyo.payment.model.PaymentVO;
import com.siot.IamportRestClient.response.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private JavaMailSender mailSender;

    // 로그인
    public MemberVO login(MemberVO memberVO) {
        return memberMapper.login(memberVO);
    }

    // 이메일을 통해 회원 정보 조회
    public MemberVO getUserInfoByEmail(String memberEmail) {
        return memberMapper.getUserInfoByEmail(memberEmail);
    }

    // id를 통해서 회원 정보 조회
    public MemberVO getUserInfoById(int memberID) {
        return memberMapper.getUserInfoById(memberID);
    }

    // 회원가입 시 이메일 중복체크
    public int checkEmailDuplicate(String memberEmail) {
        return memberMapper.checkEmailDuplicate(memberEmail);
    }

    // 회원가입
    public void register(MemberVO memberVO) {
        memberMapper.register(memberVO);
    }

    // 이메일을 통해 멤버 아이디 조회
    public int selectMemberId(String memberEmail) {
        return getUserInfoByEmail(memberEmail).getMemberID();
    }

    // 가입 인증, 메일 체크
    public void mailAuthCheck(String memberEmail, String memberName) {
        int memberID = selectMemberId(memberEmail);

        // 회원가입 인증 링크
        String verifyURL = "http://3.36.97.132:9090/member/verify?memberID=" + memberID;
        String from = "dawndawnchoi@naver.com";//보내는 사람 메일주소
        String to = memberEmail; // 회원 가입 한 사람 메일 주소
        String title = "[축하해요] 회원가입 인증을 완료해주세요."; // 메일 제목
        String content = "<!DOCTYPE html>"
                + "<html lang='ko'>" + "<head>" + "<meta charset='UTF-8'>"
                + "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
                + "</head>"
                + "<body style='line-height: 1.6;'>"
                + "<div style='font-size: 14px; max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; text-align: center;'>"
                + "<p>안녕하세요, " + memberName + "님.</p>" + "<p>축하해요 서비스 회원가입 인증을 진행하기 위해 아래 버튼을 클릭해주세요.</p>"
                + "<h3 style='color: #4B5CFF;'><a href='" + verifyURL + "' style='display: inline-block; padding: 10px 20px; margin: 10px 0; background-color: #4B5CFF; color: white; text-decoration: none; border-radius: 5px;'>인증</a></h3>"
                + "<p>또는 아래 링크를 복사하여 브라우저에 붙여넣기 하세요. </p>"
                + "<p><a href='" + verifyURL + "' style='color: #4B5CFF;'>" + verifyURL + "</a><br>감사합니다.</p>"
                + "<p style='color:red;'><br> ※ 본인이 회원가입 신청을 하지 않았다면 축하해요 홈페이지에서 문의글 작성바랍니다.</p>"
                + "</div>"
                + "</body>" + "</html>";
        try {
            // 메일 설정 및 전송
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(title);
            mailHelper.setText(content, true);
            mailSender.send(mail);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 가입 인증
    public void memberVerify(int memberID) {
        memberMapper.memberVerify(memberID);
    }

    // 패스워드 확인 후 회원 탈퇴
    public int unsign(MemberVO memberVO) {
        return memberMapper.unsign(memberVO);
    }

    // 아이디와 패스워드 일치하는지 조회 후 아이디 반환
    public Integer validatePwd(MemberVO memberVO) {
        return memberMapper.validatePwd(memberVO);
    }

    // 회원 정보 수정
    public int changeMemberInfo(MemberVO memberVO) {
        return memberMapper.changeMemberInfo(memberVO);
    }

    // 카드 내역 가져오기
    public List<CardVO> getCardList(int memberID){
        return memberMapper.getCardList(memberID);
    }

    // 결제 내역 가져오기
    public List<PaymentVO> getPaymentList(int memberID){
        return memberMapper.getPaymentList(memberID);
    }

    public List<PaymentVO> getPaymentAllList(){
        return memberMapper.getPaymentAllList();
    }

    // 관리자 로그인
    public AdminVO adminLogin(AdminVO adminVO){return memberMapper.adminLogin(adminVO);}

    // 관리자: 회원정보 가져오기
    public List<MemberVO> getMemberAllList(){return memberMapper.getMemberAllList();}

    public void withdrawMember(MemberVO memberVO){memberMapper.withdrawMember(memberVO);}

    public int selectTodayRegisterMember(String date) {
        return memberMapper.selectTodayRegisterMember(date);
    }
}
