package com.choikang.chukahaeyo.board.model;

import lombok.Data;

import java.util.Date;

@Data
public class CommentVO {






    private String replyId;
    private String replyContent;
    private int replyGno;
    private int replyOno;
    private int replyNested;
    private Date replyPostDate;
    private String memberId;
    private String boardId;
    private String memberName;


}
