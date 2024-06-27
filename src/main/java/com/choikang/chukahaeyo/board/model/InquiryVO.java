package com.choikang.chukahaeyo.board.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class InquiryVO {
    public InquiryVO() {
        this.query = "";
        this.querytype = "all";
        this.page = "1";
        this.sort = "all";
    }

    public int getStartIdx() {
        return (Integer.parseInt(page)-1) * 10;
    }

    private int inquiryID;
    private String inquiryQuestion;
    private String inquiryQuestionTitle;
    private String inquiryAnswer;
    private Timestamp inquiryPostDate;
    private int memberID;
    private int adminID;

    private String memberEmail;
    private String memberName;

    private String query;
    private String page;
    private String querytype;

    private String sort;

    private int startIdx;

}
