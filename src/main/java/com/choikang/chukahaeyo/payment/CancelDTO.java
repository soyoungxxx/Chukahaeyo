package com.choikang.chukahaeyo.payment;

import com.choikang.chukahaeyo.payment.model.PaymentVO;
import lombok.Data;

@Data
public class CancelDTO {
    private long canceledAt;
    private String failReason;
    private String cancelReceiptURL;

    public static PaymentVO of(CancelDTO cancelDTO) {
        PaymentVO paymentVO = new PaymentVO();
        paymentVO.setCanceledAt(cancelDTO.getCanceledAt());
        paymentVO.setFailReason(cancelDTO.getFailReason());
        paymentVO.setCancelReceiptURL(cancelDTO.getCancelReceiptURL());

        return paymentVO;
    }
}
