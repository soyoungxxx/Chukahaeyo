package com.choikang.chukahaeyo.card.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CardVO {
    private int cardID;
    private String cardName;
    private boolean cardIsPublic;
    private boolean isCanceled;
    private int cardLikeCnt;
    private int cardPrice;
    private Timestamp cardDate;
    private String cardStartDate;
    private String cardEndDate;
    private String cardImage;
    private String cardEmojis;
    private String cardDesign;
    private String templateThumbnail;
    private int categoryID;
    private Integer payID;
    private String cardURL; //단축 url
    private String cardQR; //qr코드. 단축 URL의 끝에 .qr을 붙이면 그것이 이미지 주소
    private boolean cardIsPaid;
    private int memberID;

    public boolean getCardIsPaid() {
        return cardIsPaid;
    }
}