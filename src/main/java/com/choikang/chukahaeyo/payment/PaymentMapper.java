package com.choikang.chukahaeyo.payment;

import com.choikang.chukahaeyo.payment.model.PaymentVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface PaymentMapper {
    void insertPayment(PaymentVO paymentVO); //결제 정보를 DB에 저장
    void cancelPayment(PaymentVO paymentVO);

    // select 매출
    int selectPaymentDaySum(String date);
    int selectPaymentMonthSum(String date);
    int selectPaymentYearSum(String date);

    List<Integer> selectSixMonthsSum(String date);
}