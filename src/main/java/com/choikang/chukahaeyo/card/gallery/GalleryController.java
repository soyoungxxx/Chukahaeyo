package com.choikang.chukahaeyo.card.gallery;

import com.choikang.chukahaeyo.card.CardService;
import com.choikang.chukahaeyo.card.model.CardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class GalleryController {

    @Autowired
    private CardService cardService;

    @GetMapping("/gallery")
    public String gallery(Model model) {
        List<CardVO> cards = cardService.getPublicCardList();
        model.addAttribute("cards", cards);
        return "card/gallery";
    }
}
