package com.choikang.chukahaeyo.admin;

import com.choikang.chukahaeyo.payment.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@ResponseBody
public class AdminController {
    @Autowired
    PaymentService paymentService;

    @GetMapping("/admin/payment.do")
    public List<Integer> selectPaymentSum(String date) {
        System.out.println("!!!!!!!!!!!!!!!");
        return paymentService.selectPaymentSum(date);
    }

    @GetMapping("/admin/month/payment.do")
    public List<Integer> selectMonthlySum(String date) {
        return paymentService.selectSixMonthsSum(date);
    }
}
