package com.choikang.chukahaeyo.card.edit;

import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.TemplateVO;
import com.choikang.chukahaeyo.s3.S3Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping( "/card")
public class EditController {
    @Autowired
    private EditService service;

    @Autowired
    private S3Service imageService;

    @GetMapping("/edit/{category}")
    public String showEditPage(@PathVariable String category, Model model) {
        int category_id = 3;
        if (category.equals("myCard")) category_id = 1;
        else if (category.equals("myPet")) category_id = 2;

        List<TemplateVO> list = service.selectFrames(category_id);
        model.addAttribute("list", list);
        model.addAttribute("categoryId", category_id);
        return "card/edit";
    }

    @ResponseBody
    @GetMapping(value="/edit/template.do", produces="text/html; charset=UTF-8")
    public String getPreviewTemplate(int id) {
        return service.selectPreviewFrame(id);
    }

    @PostMapping("/edit/card.do")
    public String getCardInfo(CardVO cardVO, HttpSession session, @RequestParam(value="imageFile") MultipartFile file) {
        cardVO.setMemberID((Integer) session.getAttribute("memberId"));
        cardVO.setCardImage(imageService.saveFile(file));
        service.insertCardInCart(cardVO);
        return "redirect:/cart";
    }

    @GetMapping("/completedCard/{cardID}")
    public String getCompletedCardPage(@PathVariable int cardID, Model model) {
        String cardDesign = service.getCardDesign(cardID);
        model.addAttribute("cardID", cardID);
        model.addAttribute("cardDesign", cardDesign);
        System.out.println("cardDesign!!! : " + cardDesign);
        return "card/completedCard";
    }
}
