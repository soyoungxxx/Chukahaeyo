package com.choikang.chukahaeyo.payment;


import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.model.CustomException;
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
        try {
            PaymentVO paymentVO = PaymentDTO.of(paymentDTO);
            paymentMapper.insertPayment(paymentVO);
            System.out.println("[service] DTO를 VO로 변환 완료");
        } catch (Exception e) {
            throw new CustomException(ErrorCode.INTERNAL_SERVER_ERROR, "PaymentDTO를 PaymentVO로 변환 실패");
        }
    }
}