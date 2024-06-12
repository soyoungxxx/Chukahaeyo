package com.choikang.chukahaeyo.member;

import com.choikang.chukahaeyo.member.model.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    // 로그인
    MemberVO login(MemberVO memberVO);

    // 이메일을 통해 회원 정보 조회
    MemberVO getUserInfoByEmail(String memberEmail);

    // 아이디를 통해서 회원 정보 조회
    MemberVO getUserInfoById(int memberId);

    // 회원 가입
    void register(MemberVO memberVO);

    // 중복 확인
    int checkEmailDuplicate(String memberEmail);

    // 가입 인증
    void memberVerify(int memberId);

    // 회원 탈퇴
    int unsign(MemberVO memberVO);

    // 아이디 패스워드 맞는지 확인, null일 가능성이 있어서 integer
    Integer validatePwd(MemberVO memberVO);
}
