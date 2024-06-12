package com.choikang.chukahaeyo.board.model;

import lombok.Data;

import java.sql.Date;

@Data
public class InquiryVO {
    private int inquiryID;
    private String inquiryQuestion;
    private String inquiryQuestionTitle;
    private String inquiryAnswer;
    private Date inquiryPostDate;
    private int memberID;
    private int adminID;
}
