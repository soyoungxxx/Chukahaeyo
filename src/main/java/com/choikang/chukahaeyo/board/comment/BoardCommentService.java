package com.choikang.chukahaeyo.board.comment;


import com.choikang.chukahaeyo.board.model.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardCommentService {

    @Autowired
    BoardCommentMapper boardCommentMapper;

    public Map index(ReplyVO vo) {
        int totalCount = boardCommentMapper.count(vo); // 총 게시물 수
        System.out.println(totalCount);
        List<ReplyVO> list = boardCommentMapper.list(vo); // 목록

        System.out.println(list);
        Map map = new HashMap();
        map.put("totalCount", totalCount);
        map.put("list", list); // 모델에 직접 넣어줘도 됨


        return map;


    }

    public int mainInsert(ReplyVO vo) {
        vo.setReplyGno(boardCommentMapper.maxGno(vo));
        boardCommentMapper.mainInsert(vo);

        return Integer.parseInt(vo.getReplyID());




    }

    public int subInsert(ReplyVO vo) {

        ReplyVO correctLine = boardCommentMapper.getCorrectLine(vo);
        if(correctLine == null) {
            int correctOno = boardCommentMapper.getCorrectOno(vo);
            vo.setReplyOno(correctOno);
        }else {
            vo.setReplyOno(correctLine.getReplyOno());
        }
        boardCommentMapper.updateOno(vo);

        boardCommentMapper.subInsert(vo);



        return Integer.parseInt(vo.getReplyID());
    }
}
