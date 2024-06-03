package com.choikang.chukahaeyo.card.edit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {
    @GetMapping("/cart")
    public String edit() {
        return "card/cart";
    }
}
