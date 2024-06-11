package com.choikang.chukahaeyo.member;

import com.choikang.chukahaeyo.member.model.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    // 로그인
    MemberVO login(MemberVO memberVO);

    // 회원 정보 조회
    MemberVO detail(MemberVO memberVO);

    // 회원 가입
    void register(MemberVO memberVO);

    // 중복 확인
    int checkEmailDuplicate(String memberEmail);

    // 이메일을 통해 멤버 아이디 조회
    int selectMemberId(String memberEmail);

    // 가입 인증
    void memberVerify(int memberId);
}
