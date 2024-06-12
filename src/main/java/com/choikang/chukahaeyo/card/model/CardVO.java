package com.choikang.chukahaeyo.card.model;

import lombok.Data;

import java.sql.Date;

@Data
public class CardVO {
    private int cardId;
    private String cardName;
    private boolean cardIsPublic;
    private int cardLikeCnt;
    private int cardPrice;
    private Date cardDate;
    private String cardStartDate;
    private String cardEndDate;
    private String cardDesign;
    private String templateThumbnail;
    private int categoryId;
    private int payId;
    private String cardUrl; //단축 url
    private String cardQR; //qr코드. 단축 URL의 끝에 .qr을 붙이면 그것이 이미지 주소
    private boolean isPayed;
    private int memberId;

    public boolean getCardIsPublic() {
        return cardIsPublic;
    }
}