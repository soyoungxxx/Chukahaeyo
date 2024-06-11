package com.choikang.chukahaeyo.member;

import com.choikang.chukahaeyo.member.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    private MemberMapper memberMapper;

    // 로그인
    public MemberVO login(MemberVO memberVO) {
        return memberMapper.login(memberVO);
    }

    // 회원가입 시 이메일 중복체크
    public int checkEmailDuplicate(String memberEmail) {
        return memberMapper.checkEmailDuplicate(memberEmail);
    }

    // 회원가입
    public void register(MemberVO memberVO) {
        memberMapper.register(memberVO);
    }

}
