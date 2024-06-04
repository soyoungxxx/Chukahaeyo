package com.choikang.chukahaeyo.payment;

import com.choikang.chukahaeyo.payment.model.PaymentVO;
import lombok.Data;

import java.util.Date;
@Data
public class PaymentDTO {
    private String applyNum; //카드 승인 번호
    private String buyer_email; //구매자 이메일 주소
    private String impUid; // 아임포트 결제 고유 번호
    private String merchantUid; //가맹점 주문 번호. 각 주문 건에 대해 유일한 식별자를 가짐
    private int paidAmount; //실제로 결제 된 금액
    private Date paidAt; // 결제 완료 시간
    private String status; // 결제 여부
    private String receiptUrl; //영수증 url

    public static PaymentVO of(PaymentDTO paymentDTO){
        PaymentVO paymentVO = new PaymentVO();
        paymentVO.setApplyNum(paymentDTO.getApplyNum());
        paymentVO.setBuyerEmail(paymentDTO.getBuyer_email());
        paymentVO.setImpUid(paymentDTO.getImpUid());
        paymentVO.setMerchantUid(paymentDTO.getMerchantUid());
        paymentVO.setPaidAmount(paymentDTO.getPaidAmount());
        paymentVO.setPaidAt(paymentDTO.getPaidAt());
        paymentVO.setStatus(paymentDTO.getStatus());
        paymentVO.setReceiptUrl(paymentDTO.getReceiptUrl());
        return paymentVO;
    }
}
