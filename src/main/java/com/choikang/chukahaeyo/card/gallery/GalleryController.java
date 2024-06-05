package com.choikang.chukahaeyo.card.gallery;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class GalleryController {

    @GetMapping("/gallery")
    public String gallery(Model model) {
        List<CardTest> cards = new ArrayList<>();
        cards.add(new CardTest("💌 Card 1", "2023-06-01", 10, "", "template01"));
        cards.add(new CardTest("💌 Card 2", "2023-05-15", 20, "", "template02"));
        cards.add(new CardTest("💌 Card 3", "2023-04-30", 5, "", "template03"));

        model.addAttribute("cards", cards);
        return "card/gallery";
    }
}
