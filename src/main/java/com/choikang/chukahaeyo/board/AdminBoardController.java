package com.choikang.chukahaeyo.board;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {


    @GetMapping("/inquiry/list")
    public String inquiryList() {

        return "admin/inquiry/allInquiryList";
    }



    @GetMapping("/inquiry/write")
    public String inquiryWrite() {

        return "admin/inquiry/inquiryPostReply";
    }

}