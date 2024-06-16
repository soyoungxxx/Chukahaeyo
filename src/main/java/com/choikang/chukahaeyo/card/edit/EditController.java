package com.choikang.chukahaeyo.card.edit;

import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.TemplateVO;
import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.SuccessCode;
import com.choikang.chukahaeyo.s3.S3Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
        String categoryName = null;
        int category_id = 0;

        if (category.equals("myCard")) {
            category_id = 1;
            categoryName = "생일 카드";
        }
        else if (category.equals("myPet")) {
            category_id = 2;
            categoryName = "반려동물 생일 카드";
        }
        else if (category.equals("invitation")) {
            category_id = 3;
            categoryName = "파티 초대 카드";
        }

        List<TemplateVO> list = service.selectFrames(category_id);
        model.addAttribute("list", list);
        model.addAttribute("categoryId", category_id);
        model.addAttribute("categoryName", categoryName);
        return "card/edit";
    }

    @ResponseBody
    @GetMapping(value="/edit/template.do", produces="text/html; charset=UTF-8")
    public String getPreviewTemplate(int id) {
        return service.selectPreviewFrame(id);
    }

    @PostMapping("/edit/card.do")
    public String getCardInfo(CardVO cardVO, HttpSession session, @RequestParam(value="imageFile") MultipartFile file) {
        String redirectURL;
        cardVO.setMemberID((Integer) session.getAttribute("memberId"));
        cardVO.setCardImage(imageService.saveFile(file));
        if (cardVO.getCardIsPayed()) {
            redirectURL = "/payments/success";
        } else {
            redirectURL = "/cart";
        }
        service.insertCardInCart(cardVO);
        return "redirect:" + redirectURL;
    }

    @GetMapping("/completedCard/{cardID}")
    public String getCompletedCardPage(@PathVariable int cardID, Model model) {
        CardVO cardVO = service.getCompletedCardPage(cardID);

        model.addAttribute("cardVO", cardVO);

        String css = cardVO.getTemplateThumbnail().substring(25, cardVO.getTemplateThumbnail().length() - 4);
        model.addAttribute("css", css);
        return "card/completedCard";
    }

//    @ResponseBody
    @PostMapping("/like.do")
    public ResponseEntity<String> updateCardLike(int cardID) {
        try {
            service.updateCardLike(cardID);
            return new ResponseEntity<>(SuccessCode.LIKE_UPDATE_SUCCESS.getMessage(), SuccessCode.LIKE_UPDATE_SUCCESS.getHttpStatus());
        } catch(Exception e) {
            return new ResponseEntity<>(ErrorCode.INTERNAL_SERVER_ERROR.getMessage(), ErrorCode.INTERNAL_SERVER_ERROR.getHttpStatus());
        }
    }
}