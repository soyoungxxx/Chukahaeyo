package com.choikang.chukahaeyo.member;

import com.choikang.chukahaeyo.board.model.InquiryVO;
import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.member.model.AdminVO;
import com.choikang.chukahaeyo.member.model.MemberVO;
import com.choikang.chukahaeyo.payment.model.PaymentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.internet.MimeMessage;
import java.lang.reflect.Member;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberService {
    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private JavaMailSender mailSender;

    // 회원가입: 인증 메일 링크 생성 시 사용되는 키. 길이를 16, 24, 32바이트 중 하나로 설정해야함
    private static final String SECRET_KEY = "chukahaeyochoikang2teamshinhands";

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

        String encryptedData = encrypt(memberID + ":" + memberEmail);
//        if (encryptedData != null && encryptedData.contains("/")) {
//            encryptedData = encryptedData.replace('/', '@');
//        }

        // 회원가입 인증 링크
        String verifyURL = "http://http://54.180.239.33/:9090/member/verify?data=" + encryptedData;
//        String verifyURL = "http://localhost:9090/member/verify?data=" + encryptedData;
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

    // 회원가입: 메일 인증 링크 url에 id입력해서 접근 불가능하도록 암호화
    private String encrypt(String strToEncrypt) {
        try {
            SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            //return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
            //Base64Utils.encodeToUrlSafeString()
            return Base64Utils.encodeToUrlSafeString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 회원가입: 암호화 된 링크 접속 가능하도록 복호화
    public String decrypt(String strToDecrypt) {
        try {
            SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            String temp = new String(cipher.doFinal(Base64Utils.decodeFromUrlSafeString(strToDecrypt)));
            return temp.split(":")[0];
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
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
    public int changeMemberInfo(int memberID, MemberVO changeInfo) {
        return memberMapper.changeMemberInfo(memberID, changeInfo);
    }

    // 카드 내역 가져오기
    public List<CardVO> getCardList(int memberID) {
        return memberMapper.getCardList(memberID);
    }

    // 결제내역 가져오기
    public List<PaymentVO> getPaymentAllList() {
        return memberMapper.getPaymentAllList();
    }

    // 사용자 결제내역 가져오기
    public List<PaymentVO> getMemberPaymentAllList(int memberID){
        return memberMapper.getMemberPaymentAllList(memberID);
    }

    // 카드 전체 내역 가져오기
    public List<CardVO> getCardAllList() {return memberMapper.getCardAllList();}

    // 필터링된 결제 내역 가져오기
    public List<PaymentVO> getFilteredPaymentList(String startDate, String endDate, String status, String search) {
        return memberMapper.getFilteredPaymentList(startDate, endDate, status, search);
    }

    // 관리자 로그인
    public AdminVO adminLogin(AdminVO adminVO) {
        return memberMapper.adminLogin(adminVO);
    }

    // 관리자: 회원정보 가져오기
    public List<MemberVO> getMemberAllList() {
        return memberMapper.getMemberAllList();
    }

    // 관리자: 답변해야할 리스트 가져오기
    public List<InquiryVO> getNotAnsweredInquiryList() {
        return memberMapper.getNotAnsweredInquiryList();
    }

    // 결제내역 페이지네이션
    public Map<String, Object> paginationPayment(int page, int size, List<PaymentVO> paymentList, int memberID) {
        // return으로 전달할 Map 객체
        Map<String, Object> map = new HashMap<>();

        // 전체 paymentList조회
        if (paymentList == null && memberID == 0) {
            paymentList = getPaymentAllList();
        } else if (paymentList == null) {
            paymentList = getMemberPaymentAllList(memberID);
        }

        int totalPayments = paymentList.size();
        int totalPages = (int) Math.ceil((double) totalPayments / size);
        int start = (page - 1) * size;
        int end = Math.min(start + size, totalPayments);

        List<PaymentVO> payments = paymentList.subList(start, end);

        map.put("paymentList", payments);
        map.put("totalPages", totalPages);

        return map;
    }

    // 결제내역: 2일이내 목록 필터
    public List<PaymentVO> checkCancelable(List<PaymentVO> payments) {
        Timestamp twoDaysAgo = new Timestamp(System.currentTimeMillis() - 2L * 24 * 60 * 60 * 1000); // 2일 전의 Timestamp 계산
        for (PaymentVO payment : payments) {
            Timestamp tempDate = payment.getPayDate();
            if (tempDate != null && twoDaysAgo.before(tempDate)) {
                payment.setIsWithinTwoDays(1);
            } else {
                payment.setIsWithinTwoDays(0);
            }
        }
        return payments;
    }

    public void withdrawMember(MemberVO memberVO) {
        memberMapper.withdrawMember(memberVO);
    }

    public int selectTodayRegisterMember(String date) {
        return memberMapper.selectTodayRegisterMember(date);
    }
}
