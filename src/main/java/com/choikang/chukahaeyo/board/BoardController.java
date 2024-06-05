package com.choikang.chukahaeyo.board;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;


@Controller
@RequestMapping("/board")
public class BoardController {


    @GetMapping("/community/list")
    public String communityList() {

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

}