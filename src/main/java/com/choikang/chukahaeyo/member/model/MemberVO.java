package com.choikang.chukahaeyo.member.model;

import lombok.Data;

import java.sql.Date;

@Data
public class MemberVO {
    private int memberID;
    private String memberEmail;
    private String memberPwd;
    private String memberName;
    private Date memberRegisterDate;
    private boolean memberAuth;
}
