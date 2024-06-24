package com.choikang.chukahaeyo.payment;

import com.choikang.chukahaeyo.payment.model.PaymentVO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface PaymentMapper {
    void insertPayment(PaymentVO paymentVO); //결제 정보를 DB에 저장
    void cancelPayment(PaymentVO paymentVO);
    void deletePayment(PaymentVO paymentVO);
}