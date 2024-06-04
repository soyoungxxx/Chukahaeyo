package com.choikang.chukahaeyo.payment;


import com.choikang.chukahaeyo.payment.model.PaymentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class PaymentService {
    @Autowired
    private PaymentMapper paymentMapper;

    //@Transactional
    public void processPayment(PaymentDTO paymentDTO) {
        System.out.println("서비스dto"+paymentDTO);
        try{
            System.out.println("서비스1");
            PaymentVO paymentVO = PaymentDTO.of(paymentDTO);
            System.out.println("서비스2");
            paymentMapper.insertPayment(paymentVO);
            System.out.println("서비스3");
            System.out.println("[service] DTO를 VO로 변환 완료");
        }catch(Exception e){
            System.out.println("서비스4");
            System.out.println("[service] DTO를 VO로 변환 실패");
            System.out.println("서비스5");
            throw e;
        }
    }

}
