package com.choikang.chukahaeyo.board.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReplyVO {
    private String replyID;
    private String replyContent;
    private int replyGno;
    private int replyOno;
    private int replyNested;
    private Timestamp replyPostDate;
    private String memberID;
    private String commID;

    private String memberName;
}
