package com.choikang.chukahaeyo.url;

import com.choikang.chukahaeyo.url.model.ShortUrlVO;
import lombok.Data;

@Data
public class ShortUrlDTO {
    private int id;
    private String shortUrl; //단축 url
    private String originUrl; //원래 url

    public static ShortUrlVO of(ShortUrlDTO shortUrlDTO){
        ShortUrlVO shortUrlVO = new ShortUrlVO();
        shortUrlVO.setShortUrl(shortUrlDTO.getShortUrl());
        shortUrlVO.setOriginUrl(shortUrlVO.getOriginUrl());
        return shortUrlVO;
    }
}
