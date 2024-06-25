package com.choikang.chukahaeyo.board.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReplyVO {
    private int replyID;
    private String replyContent;
    private String memberName;
    private int replyGno;
    private int replyOno;
    private int replyNested;
    private Timestamp replyPostDate;
    private int memberID;
    private int commID;

}