package com.choikang.chukahaeyo.card.edit;

import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.TemplateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping( "/card")
public class EditController {
    @Autowired
    private EditService service;

    @GetMapping("/edit/{category}")
    public String showEditPage(@PathVariable String category, Model model) {
        int category_id = 3;
        if (category.equals("myCard")) category_id = 1;
        else if (category.equals("myPet")) category_id = 2;

        List<TemplateVO> list = service.selectFrames(category_id);
        model.addAttribute("list", list);
        System.out.println(list);
        model.addAttribute("categoryId", category_id);
        return "card/edit";
    }

    @ResponseBody
    @GetMapping(value="/edit/template.do", produces="text/html; charset=UTF-8")
    public String getPreviewTemplate(int id) {
        return service.selectPreviewFrame(id);
    }

    @PostMapping("/edit/card.do")
    public String getCardInfo(CardVO cardVO, HttpServletRequest request, HttpSession session) {
        cardVO.setMemberID((Integer) session.getAttribute("memberId"));
        service.insertCardInCart(cardVO);
        return "redirect:/cart";
    }
}
