package com.choikang.chukahaeyo.board.comment;

import com.choikang.chukahaeyo.board.model.ReplyVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;



@Mapper
public interface BoardCommentMapper {
    int count(ReplyVO vo);

    List<ReplyVO> list(ReplyVO vo);
}
