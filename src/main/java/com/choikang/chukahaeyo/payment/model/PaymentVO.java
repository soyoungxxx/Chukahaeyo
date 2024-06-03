package com.choikang.chukahaeyo.payment.model;

import lombok.Data;

import java.util.Date;

@Data
public class PaymentVO {
    private int id; //결제 id -> 기본 생성
    private Date orderDate; // 주문 시간
    private String orderAmount; // 주문 가격
    private boolean isOrdered; // 주문 여부 -> 주문 요청이 들어가면 true(결제 창이 켜지는 경우)

    private String applyNum; //카드 승인 번호
    private String buyer_email; //구매자 이메일 주소
    private String impUid; // 아임포트 결제 고유 번호
    private String merchantUid; //가맹점 주문 번호. 각 주문 건에 대해 유일한 식별자를 가짐
    private int paidAmount; //실제로 결제 된 금액
    private Date paidAt; // 결제 완료 시간
    private String status; // 결제 여부
    private String receiptUrl; //영수증 url

    private int userId; // 추후에 table join으로 변경
}