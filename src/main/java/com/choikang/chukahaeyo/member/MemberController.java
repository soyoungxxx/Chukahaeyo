package com.choikang.chukahaeyo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

    @Autowired
    private MemberService service;

    @GetMapping("/login")
    public void login() {

    }

}
