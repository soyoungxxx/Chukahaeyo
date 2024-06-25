package com.choikang.chukahaeyo.board.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommunityVO {
    private int commID;
    private int memberID;
    private String commTitle;
    private String commContents;
    private String commViewCount;
    private String isTop;
    private String sort;
    private String ismy;
    private Timestamp commPostDate;
    private Timestamp commEditedDate;

    public CommunityVO() {
        this.query = "";
        this.querytype = "all";
        this.page = "1";
        this.sort = "date";
        this.ismy = "";
    }

    private String isRed;
    private String boardLike;
    private String memberEmail;
    private String memberPwd;
    private String memberName;
    private String query;
    private String page;
    private String querytype;
    private int startIdx;
    private String replyCount;
}