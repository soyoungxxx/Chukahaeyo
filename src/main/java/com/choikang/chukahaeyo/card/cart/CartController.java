package com.choikang.chukahaeyo.card.cart;

import com.choikang.chukahaeyo.card.CardService;
import com.choikang.chukahaeyo.card.model.CardVO;
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

    @GetMapping("/cart")
    public String cart(HttpSession session, Model model) {
        Integer memberID = (Integer) session.getAttribute("memberID");
        String memberEmail = (String) session.getAttribute("memberEmail");
        String memberName = (String) session.getAttribute("memberName");
        if (memberID != null) {
            List<CardVO> cardList = cardService.getPersonalCart(memberID);
            model.addAttribute("cardList", cardList);
        }
        model.addAttribute("memberEmail", memberEmail);
        model.addAttribute("memberName", memberName);
        return "card/cart";
    }

    @GetMapping("/mypage/myCard")
    public String myCard(HttpSession session, Model model) {
        Integer memberID = (Integer) session.getAttribute("memberID");
        if (memberID != null) {
            List<CardVO> cardList = cardService.getPersonalCard(memberID);
            model.addAttribute("cardList", cardList);
        }
        return "mypage/myCard";
    }


    // 카드 삭제 로직
    @PostMapping("/deleteCard")
    @ResponseBody
    public Map<String, String> deleteCard(@RequestParam("cardID") int cardID) {
        Map<String, String> response = new HashMap<>();
        try {
            cardService.deleteCard(cardID);
            response.put("status", "success");
            response.put("message", "카드가 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "카드 삭제 중 오류가 발생했습니다.");
        }
        return response;
    }

    // 결제 여부 업데이트
    @PostMapping("/updateCardPaymentStatus")
    @ResponseBody
    public Map<String, String> updateCardPaymentStatus(@RequestParam("cardID") int cardID) {
        Map<String, String> response = new HashMap<>();
        try {
            cardService.updateCardPaymentStatus(cardID);
            response.put("status", "success");
            response.put("message", "카드 결제 상태가 성공적으로 업데이트되었습니다.");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "카드 결제 상태 업데이트 중 오류가 발생했습니다.");
        }
        return response;
    }
}