package com.choikang.chukahaeyo.board.model;

import lombok.Data;

import java.util.Date;

@Data
public class ReplyVO {
    private String replyID;
    private String replyContent;
    private int replyGno;
    private int replyOno;
    private int replyNested;
    private Date replyPostDate;
    private String memberID;
    private String commID;

    private String memberName;
}
