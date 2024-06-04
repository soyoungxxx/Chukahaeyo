package com.choikang.chukahaeyo.member.model;

import lombok.Data;

import java.sql.Date;

@Data
public class MemberVO {
    private int userId;
    private String userEmail;
    private String userPwd;
    private String userName;
    private Date registerDate;
    private boolean auth;
}
