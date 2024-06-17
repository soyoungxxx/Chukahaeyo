package com.choikang.chukahaeyo.board.inquiry;


import com.choikang.chukahaeyo.board.model.InquiryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/board")
public class BoardInquiryController {

    @Autowired
    BoardInquiryService boardInquiryService;


    @GetMapping("/inquiry/list")
    public String inquiryList(HttpSession session , Model model , InquiryVO vo) {


        model.addAttribute("map", boardInquiryService.getInquiryList(vo));

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