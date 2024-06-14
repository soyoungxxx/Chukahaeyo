package com.choikang.chukahaeyo.payment;


import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.SuccessCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping(value = "/payments", produces = "application/text; charset=utf8")
public class PaymentController {
    @Autowired
    private PaymentService paymentService;

    @PostMapping("/process")
    public ResponseEntity<String> processPayment(@RequestBody PaymentDTO paymentDTO, HttpSession session) {
        System.out.println(paymentDTO);
        try {
            paymentDTO.setMemberID((Integer) session.getAttribute("memberId"));
            paymentService.processPayment(paymentDTO);
            return new ResponseEntity<>(SuccessCode.PAYMENT_SUCCESS.getMessage(), SuccessCode.PAYMENT_SUCCESS.getHttpStatus());
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(ErrorCode.INTERNAL_SERVER_ERROR.getMessage(), ErrorCode.INTERNAL_SERVER_ERROR.getHttpStatus());
        }
    }

    @GetMapping("/success")
    public String showSuccess() {
        return "/card/successPay";
    }

//토큰 가져오는 controller 주석 처리. 만약 추후에 필요하면 사용 예정. 현재로서는 서비스단에서 token을 받아오기 때문에 문제 없음
//    @PostMapping("/getToken")
//    public ResponseEntity<String> getToken() {
//        try {
//            paymentService.getToken();
//            return new ResponseEntity<>(SuccessCode.GET_ACCESS_TOKEN.getMessage(), SuccessCode.GET_ACCESS_TOKEN.getHttpStatus());
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<>(ErrorCode.INTERNAL_SERVER_ERROR.getMessage(), ErrorCode.INTERNAL_SERVER_ERROR.getHttpStatus());
//        }
//    }

    @PostMapping("/cancel")
    public ResponseEntity<String> cancelPayment(@RequestParam String payNo) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");
        try {
            paymentService.cancelPayment(payNo);
            return new ResponseEntity<>(SuccessCode.CANCEL_SUCCESS.getMessage(), headers, SuccessCode.CANCEL_SUCCESS.getHttpStatus());
        } catch (Exception e) {
            return new ResponseEntity<>(ErrorCode.INTERNAL_SERVER_ERROR.getMessage(), headers, ErrorCode.INTERNAL_SERVER_ERROR.getHttpStatus());
        }
    }
}