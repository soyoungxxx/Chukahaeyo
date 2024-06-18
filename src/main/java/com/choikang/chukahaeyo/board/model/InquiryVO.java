package com.choikang.chukahaeyo.board.model;

import lombok.Data;

import java.util.Date;


@Data
public class InquiryVO {
    public InquiryVO() {
        this.query = "";
        this.querytype = "all";
        this.page = "1";
    }

    private int inquiryID;
    private String inquiryQuestion;
    private String inquiryQuestionTitle;
    private String inquiryAnswer;
    private Date inquiryPostDate;
    private int memberID;
    private int adminID;


    private String memberEmail;
    private String memberName;


    private String query;
    private String page;
    private String querytype;

    private int startIdx;

    public int getStartIdx() {
        return (Integer.parseInt(page)-1) * 10;
    }
}
