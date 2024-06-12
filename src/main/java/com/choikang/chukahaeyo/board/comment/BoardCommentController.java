package com.choikang.chukahaeyo.board.comment;


import com.choikang.chukahaeyo.board.model.CommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;



@Controller
@RequestMapping("/board")
public class BoardCommentController {

    @Autowired
    BoardCommentService boardCommentService;



    @ResponseBody
    @GetMapping("/comment/list")
    public Map commentList(CommentVO vo , Model model) {
        
        //vo 안에 boardId 있어야 함
        vo.setBoardId("2");
        
        

        return boardCommentService.index(vo);
    }
}
