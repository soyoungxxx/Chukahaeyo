package com.choikang.chukahaeyo.card.url;

import com.choikang.chukahaeyo.card.model.CardVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ShortUrlDTO {
    private String url; //단축 url
    private String qr;

    public static CardVO of(ShortUrlDTO shortUrlDTO){
        CardVO cardVO = new CardVO();
        cardVO.setUrl(shortUrlDTO.getUrl());
        cardVO.setQr(shortUrlDTO.getQr());
        return cardVO;
    }
}