package com.choikang.chukahaeyo.board.comment;


import com.choikang.chukahaeyo.board.model.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;



@Controller
@RequestMapping("/board")
public class BoardCommentController {

    @Autowired
    BoardCommentService boardCommentService;



    @ResponseBody
    @GetMapping("/comment/list")
    public Map commentList(ReplyVO vo , Model model) {

        
        

        return boardCommentService.index(vo);
    }


    @ResponseBody
    @PostMapping("/comment/mainwrite")
    public int commentMainWrite(ReplyVO vo , HttpSession session) {


        vo.setMemberID(String.valueOf((int)session.getAttribute("memberID")));
        return boardCommentService.mainInsert(vo);
    }

    @ResponseBody
    @PostMapping("/comment/subwrite")
    public int commentSubWrite(ReplyVO vo , HttpSession session) {


        vo.setMemberID(String.valueOf((int)session.getAttribute("memberID")));
        return boardCommentService.subInsert(vo);
    }



}
