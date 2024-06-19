package com.choikang.chukahaeyo.card.gallery;

import com.choikang.chukahaeyo.card.CardService;
//import com.choikang.chukahaeyo.visitor.VisitorService;
import com.choikang.chukahaeyo.card.model.CardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class GalleryController {

    @Autowired
    private CardService cardService;

//    @Autowired
//    private VisitorService cookieService;

    @GetMapping("/gallery")
    public String gallery(Model model) {
        List<CardVO> cards = cardService.getPublicCardList();
        model.addAttribute("cards", cards);
        return "card/gallery";
    }

    @GetMapping("/")
    public String index(Model model) {
        List<CardVO> top3Cards = cardService.getTop3CardList();
        model.addAttribute("top3Cards", top3Cards);
        System.out.println("Top 3 Cards: " + top3Cards);

        List<CardVO> latest3Cards = cardService.getLatest3CardList();
        model.addAttribute("latest3Cards", latest3Cards);
        System.out.println("Latest 3 Cards: " + latest3Cards);
        return "index";
    }
}