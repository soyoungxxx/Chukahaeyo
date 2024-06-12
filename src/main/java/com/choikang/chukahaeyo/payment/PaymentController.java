package com.choikang.chukahaeyo.payment;


import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.SuccessCode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping(value = "/payments", produces = "application/text; charset=utf8")
public class  PaymentController {
    @Autowired
    private PaymentService paymentService;

    @PostMapping("/process")
    public ResponseEntity<String> processPayment(@RequestBody PaymentDTO paymentDTO) {
        System.out.println(paymentDTO);
        try{
            paymentService.processPayment(paymentDTO);
            return new ResponseEntity<>(SuccessCode.PAYMENT_SUCCESS.getMessage(),SuccessCode.PAYMENT_SUCCESS.getHttpStatus());
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<>(ErrorCode.INTERNAL_SERVER_ERROR.getMessage(), ErrorCode.INTERNAL_SERVER_ERROR.getHttpStatus());
        }
    }
    @GetMapping("/success")
    public String showSuccess(){
        return "/card/successPay";
    }

//    @PostMapping("/cancle")
//    public void cancelPayment(@RequestParam("payID") int paymentId,@RequestBody PaymentDTO paymentDTO){
//
//    }
//
//    @Value("${imp.key}")
//    private String key;
//
//    @Value("${imp.secret}")
//    private String secretKey;
//
//    @PostMapping("/getToken")
//    public ResponseEntity<String> getToken(){
//
//        System.out.println("key : " + key);
//        System.out.println("secret Key : " + secretKey);
//
//        try{
//            String apiUrl = "https://api.iamport.kr/users/getToken"; //요청을 보낼 api 주소
//
//            RestTemplate restTemplate = new RestTemplate(); //body 설정
//
//            HttpHeaders headers = new HttpHeaders(); //header 설정
//            headers.setContentType(MediaType.APPLICATION_JSON); //콘텐츠 타입을 JSON으로 설정
//
//            Map<String, String> keyMap = new HashMap<>();
//            keyMap.put("imp_key",key);
//            keyMap.put("imp_secret", secretKey);
//            ObjectMapper objectMapper = new ObjectMapper();
//            String keyJson = objectMapper.writeValueAsString(keyMap);
//            System.out.println(keyJson);
//            HttpEntity<String> requestEntity = new HttpEntity<>(keyJson, headers); //HttpEntity 객체 생성
//
//            return restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, String.class);
//        }catch (Exception e){
//            e.printStackTrace();
//            return ResponseEntity.status(500).body("토큰 발급에 실패하였습니다.");
//        }
//    }
}