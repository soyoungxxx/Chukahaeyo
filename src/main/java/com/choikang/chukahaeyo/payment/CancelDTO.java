package com.choikang.chukahaeyo.payment;

import com.choikang.chukahaeyo.payment.model.PaymentVO;
import lombok.Data;

@Data
public class CancelDTO {
    private long canceledAt;
    private String failReason;
    private String receiptUrl;

    public static PaymentVO of(CancelDTO cancelDTO) {
        PaymentVO paymentVO = new PaymentVO();
        paymentVO.setCanceledAt(cancelDTO.getCanceledAt());
        paymentVO.setFailReason(cancelDTO.getFailReason());
        paymentVO.setReceiptURL(cancelDTO.getReceiptUrl());

        return paymentVO;
    }
}
