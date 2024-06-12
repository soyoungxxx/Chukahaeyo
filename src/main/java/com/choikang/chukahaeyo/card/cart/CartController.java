package com.choikang.chukahaeyo.card.cart;

import com.choikang.chukahaeyo.card.CardMapper;
import com.choikang.chukahaeyo.card.CardService;
import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.TemplateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {
    @Autowired
    private CardService cardService; // 카드 서비스 의존성 주입

    @Autowired
    private CardMapper cardMapper;

    @GetMapping("/cart")
    public String cart(HttpSession session, Model model) {
        Integer memberId = (Integer) session.getAttribute("memberId");
        if (memberId != null) {
            List<CardVO> cardList = cardService.getPersonalCardList(memberId);
            model.addAttribute("cardList", cardList);
        }
        return "card/cart";
    }

    // 카드 삭제 로직
    @PostMapping("/deleteCard")
    @ResponseBody
    public Map<String, String> deleteCard(@RequestParam("cardId") int cardId) {
        Map<String, String> response = new HashMap<>();
        try {
            cardService.deleteCard(cardId);
            response.put("status", "success");
            response.put("message", "카드가 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "카드 삭제 중 오류가 발생했습니다.");
        }
        return response;
    }
}
