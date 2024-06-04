package com.choikang.chukahaeyo.payment;


import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.SuccessCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/payments")
public class PaymentController {
    @Autowired
    private PaymentService paymentService;

    @GetMapping("/edit")
    public String showEditPage() {
        return "card/edit";
    }

    @PostMapping("/process")
    public ResponseEntity<String> processPayment(@RequestBody PaymentDTO paymentDTO) {
        System.out.println("1");
        System.out.println(paymentDTO);
        try{
            System.out.println("2");
            paymentService.processPayment(paymentDTO);
            System.out.println("3");
            return new ResponseEntity<>(SuccessCode.PAYMENT_SUCCESS.getMessage(),SuccessCode.PAYMENT_SUCCESS.getHttpStatus());
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("4");
            return new ResponseEntity<>(ErrorCode.INTERNAL_SERVER_ERROR.getMessage(), ErrorCode.INTERNAL_SERVER_ERROR.getHttpStatus());
        }
    }
    @GetMapping("/success")
    public String showSuccess(){
        return "/card/successPay";
    }
}