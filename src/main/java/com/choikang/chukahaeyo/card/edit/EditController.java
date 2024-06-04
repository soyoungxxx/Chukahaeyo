package com.choikang.chukahaeyo.card.edit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EditController {
    @GetMapping("/payments/edit")
    public String showEditPage() {
        return "card/edit";
    }

    @GetMapping("/payments/edit/template")
    public String getPreviewTemplate() {
        return "card/edit";
    }
}
