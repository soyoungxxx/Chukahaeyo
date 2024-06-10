package com.choikang.chukahaeyo.card.model;

import lombok.Data;

import java.sql.Date;

@Data
public class CardVO {
    private int card_id;
    private String card_name;
    private boolean isPublic;
    private int like_cnt;
    private int cost;
    private String receiver;
    private String start_date;
    private String end_date;
    private String text;
    private String img;
    private String emoji1;
    private String emoji2;
    private String emoji3;
    private String emoji4;
    private String design;
    private int category_id;
    private String start_time;
    private String end_time;
    private String addr1;
    private String addr2;
    private String x;
    private String y;
    private String preparation;
    private String bank;
    private String account;
    private int pay_id;
    private String url;
    private boolean isPayed;
    private int user_id;
}
