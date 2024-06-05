package com.choikang.chukahaeyo.url.model;


import lombok.Data;

@Data
public class ShortUrlVO {
    private int id;
    private String shortUrl; //단축 url
    private String originUrl; //원래 url
}
