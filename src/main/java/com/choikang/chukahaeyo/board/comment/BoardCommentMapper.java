package com.choikang.chukahaeyo.board.comment;

import com.choikang.chukahaeyo.board.model.ReplyVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardCommentMapper {
    int count(ReplyVO vo);

    List<ReplyVO> list(ReplyVO vo);

    int mainInsert(ReplyVO vo);

    int maxGno(ReplyVO vo);

    int updateOno(ReplyVO vo);

    int subInsert(ReplyVO vo);

    ReplyVO getCorrectLine(ReplyVO vo);

    int getCorrectOno(ReplyVO vo);

    int deleteComment(ReplyVO replyVO);
}
