package com.choikang.chukahaeyo.payment;

import com.choikang.chukahaeyo.payment.model.PaymentVO;
import lombok.Data;

@Data
public class CancelDTO {
    private String cancleStatus; //결제 취소 내역 상태(FAILED, REQUESTED, SUCCEEDED)
    private String cancleId; //취소 내역 id
    private int cancelTotalAmount; //취소 총 금액
    private String cancelReason; //취소 사유

    public static PaymentVO of(CancelDTO cancelDTO) {
        PaymentVO paymentVO = new PaymentVO();
        paymentVO.setCancleStatus(cancelDTO.getCancleStatus());
        paymentVO.setCancleId(cancelDTO.getCancleId());
        paymentVO.setCancelTotalAmount(cancelDTO.getCancelTotalAmount());
        paymentVO.setCancelReason(cancelDTO.getCancelReason());

        return paymentVO;
    }
}
