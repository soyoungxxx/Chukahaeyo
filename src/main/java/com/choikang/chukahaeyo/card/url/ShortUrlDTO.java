package com.choikang.chukahaeyo.card.url;

import com.choikang.chukahaeyo.card.model.CardVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ShortUrlDTO {
    private String cardUrl; //단축 url
    private String cardQR;

    public static CardVO of(ShortUrlDTO shortUrlDTO) {
        CardVO cardVO = new CardVO();
        cardVO.setCardURL(shortUrlDTO.getCardUrl());
        cardVO.setCardQR(shortUrlDTO.getCardQR());
        return cardVO;
    }
}