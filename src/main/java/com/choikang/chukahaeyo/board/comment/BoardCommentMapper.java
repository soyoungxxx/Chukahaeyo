package com.choikang.chukahaeyo.board.comment;

import com.choikang.chukahaeyo.board.model.CommentVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;



@Mapper
public interface BoardCommentMapper {
    int count(CommentVO vo);

    List<CommentVO> list(CommentVO vo);
}
