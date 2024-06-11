package com.choikang.chukahaeyo.board;


import com.choikang.chukahaeyo.board.model.CommunityVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;


@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    BoardService boardService;



    @GetMapping("/service")
    public String serviceFaq() {

        return "board/service/faq";
    }


    @GetMapping("/community/list")
    public String communityList(@ModelAttribute CommunityVO vo , HttpServletRequest req) {



        req.setAttribute("map",boardService.getCommunityList(vo));



        return "board/comunityList";
    }


    @GetMapping("/community/detail")
    public String communityDetail() {

        return "board/communityDetail";
    }



    @GetMapping("/community/write")
    public String communityWrite(HttpServletRequest req) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");
        return "board/communityPost";
    }



    @GetMapping("/inquiry/list")
    public String inquiryList() {

        return "mypage/inquiry/inquiryList";
    }



    @GetMapping("/inquiry/write")
    public String inquiryWrite() {

        return "mypage/inquiry/inquiryPost";
    }


    @GetMapping("/inquiry/detail")
    public String inquiryDetail() {

        return "mypage/inquiry/inquiryDetail";
    }

}