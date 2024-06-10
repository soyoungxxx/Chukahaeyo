package com.choikang.chukahaeyo.card.edit;

import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.TemplateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value = "/card", produces = "application/text; charset=utf8")
public class EditController {
    @Autowired
    private EditService service;

    @GetMapping("/edit")
    public String showEditPage(HttpServletRequest request, Model model) {
//      int category_id = (int) request.getAttribute("category_id");
        int category_id = 2;
        List<TemplateVO> list = service.selectFrames(category_id);
        model.addAttribute("list", list);
        return "card/edit";
    }

    @ResponseBody
    @GetMapping(value="/edit/template.do", produces="text/html; charset=UTF-8")
    public String getPreviewTemplate(int id, HttpServletResponse response) {
//        System.out.println(service.selectPreviewFrame(id));
//        response.setCharacterEncoding("UTF-8");
        return service.selectPreviewFrame(id);
    }

    @GetMapping("/edit/card.do")
    public String getCardInfo(CardVO cardVO) {
        System.out.println("!!!!!!!!!!!1");
        System.out.println(cardVO.getBank());
        return "card/edit";
    }

}
