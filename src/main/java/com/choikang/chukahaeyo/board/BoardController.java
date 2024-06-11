package com.choikang.chukahaeyo.board;


import com.choikang.chukahaeyo.board.model.CommunityVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
    public String communityWriteView() throws UnsupportedEncodingException {

        return "board/communityPost";
    }
    @PostMapping("/community/write")
    public String communityWriteInsert(@ModelAttribute CommunityVO vo , HttpServletRequest req ) throws UnsupportedEncodingException {
        System.out.println(vo.getCommTitle());
        System.out.println(vo.getCommContents());

        //세션에서 memberId 넣어주고
        vo.setMemberId("1");

        //서비스 타고 no 받는다.
        boardService.insertCommunity(vo);




        return "redirect:detail?no="+vo.getCommId();
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