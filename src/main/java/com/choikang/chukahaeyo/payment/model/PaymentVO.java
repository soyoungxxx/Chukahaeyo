package com.choikang.chukahaeyo.payment.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class PaymentVO {
    private int payID; //결제 id -> 기본 생성
    private Timestamp payDate; // 결제 시간
    private String payNo; // 아임포트 결제 고유 번호
    private int payAmount; //실제로 결제 된 금액
    private int memberID; // 추후에 member table과 join
    private String receiptURL; //영수증 url
    private String merchantUid; //가맹점 주문 번호. 각 주문 건에 대해 유일한 식별자를 가짐

    // DB 외 데이터
    private String orderAmount; // 주문 가격
    private boolean isOrdered; // 주문 여부 -> 주문 요청이 들어가면 true(결제 창이 켜지는 경우)
    private String applyNum; //카드 승인 번호
    private String memberEmail; //구매자 이메일 주소
    private String memberName; //구매자 이름
    private Timestamp paidAt; // 결제 완료 시간
    private String status; // 결제 여부
    private int isWithinTwoDays; // 결제일이 오늘로부터 이틀 이내인지 저장

    private long canceledAt; // 결제 취소 일시
    private String failReason; // 결제 취소 실패 이유
    private String cancelReceiptURL; // 취소 영수증 url
}