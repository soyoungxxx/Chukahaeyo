package com.choikang.chukahaeyo.card.gallery;

import lombok.Getter;

@Getter
public class CardTest {
    private final String name;
    private final String date;
    private final int likes;
    private final String imageUrl;
    private final String template;

    public CardTest(String name, String date, int likes, String imageUrl, String template) {
        this.name = name;
        this.date = date;
        this.likes = likes;
        this.imageUrl = imageUrl;
        this.template = template;
    }
}
