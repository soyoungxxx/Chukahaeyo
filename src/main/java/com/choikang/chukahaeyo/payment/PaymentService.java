package com.choikang.chukahaeyo.payment;

import com.choikang.chukahaeyo.payment.model.PaymentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class PaymentService {
    @Autowired
    private PaymentMapper paymentMapper;

    @Transactional
    public void processPayment(PaymentDTO paymentDTO) {
        PaymentVO paymentVO = new PaymentVO();
        paymentVO.setApplyNum(paymentDTO.getApplyNum());
        paymentVO.setBuyer_email(paymentDTO.getBuyer_email());
        paymentVO.setImpUid(paymentDTO.getImpUid());
        paymentVO.setMerchantUid(paymentDTO.getMerchantUid());
        paymentVO.setPaidAmount(paymentDTO.getPaidAmount());
        paymentVO.setPaidAt(paymentDTO.getPaidAt());
        paymentVO.setStatus(paymentDTO.getStatus());
        paymentVO.setReceiptUrl(paymentDTO.getReceiptUrl());

        paymentMapper.insertPayment(paymentVO);
    }

}
