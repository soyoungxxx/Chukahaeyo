package com.choikang.chukahaeyo.admin;

import com.choikang.chukahaeyo.card.CardService;
import com.choikang.chukahaeyo.member.MemberService;
import com.choikang.chukahaeyo.payment.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    PaymentService paymentService;

    @Autowired
    CardService cardService;

    @Autowired
    MemberService memberService;

    @GetMapping("/payment.do")
    public List<Integer> selectPaymentSum(String date) {
        return paymentService.selectPaymentSum(date);
    }

    @GetMapping("/month/payment.do")
    public List<Integer> selectMonthlySum(String date) {
        return paymentService.selectSixMonthsSum(date);
    }

    @GetMapping("/category/payment.do")
    public List<Integer> selectCardsByCategory(String date) {
        return cardService.selectCardsByCategory(date);
    }

    @GetMapping("/member/count.do")
    public int selectTodayRegisterMember(String date) {
        return memberService.selectTodayRegisterMember(date);
    }
}
