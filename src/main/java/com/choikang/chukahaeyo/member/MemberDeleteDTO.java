package com.choikang.chukahaeyo.member;

import java.util.List;

public class MemberDeleteDTO {
    private List<String> memberIds;

    // 기본 생성자
    public MemberDeleteDTO() {}

    // getter와 setter
    public List<String> getMemberIds() {
        return memberIds;
    }

    public void setMemberIds(List<String> memberIds) {
        this.memberIds = memberIds;
    }
}
