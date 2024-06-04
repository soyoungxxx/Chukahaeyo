package com.choikang.chukahaeyo.member;

import com.choikang.chukahaeyo.member.model.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    // 로그인
    MemberVO login(MemberVO memberVO);

    //회원 정보 조회
    MemberVO detail(MemberVO memberVO);
}
