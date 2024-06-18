package com.choikang.chukahaeyo.card.model;

import lombok.Data;

import java.sql.Date;

@Data
public class GuestBookVO {
    private int guestBookID;
    private String guestName; // 방명록 작성한 닉네임
    private String guestBookText; // 방명록 내용
    private Date guestBookPostDate;
    private int cardID;
}
