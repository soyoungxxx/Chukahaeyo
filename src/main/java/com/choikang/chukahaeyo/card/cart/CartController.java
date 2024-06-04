package com.choikang.chukahaeyo.card.cart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {
    @GetMapping("/cart")
    public String cart() {
        return "card/cart";
    }
}
