package com.choikang.chukahaeyo.card.edit;

import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.GuestBookVO;
import com.choikang.chukahaeyo.card.model.TemplateVO;
import com.choikang.chukahaeyo.card.url.ShortUrlService;
import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.SuccessCode;
import com.choikang.chukahaeyo.payment.PaymentService;
import com.choikang.chukahaeyo.s3.S3Service;
import com.google.gson.Gson;
import com.nhncorp.lucy.security.xss.XssFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/card")
public class EditController {
    @Autowired
    private EditService service;

    @Autowired
    private S3Service imageService;

    @Autowired
    private ShortUrlService shortUrlService;

    @GetMapping("/edit/{category}")
    public String showEditPage(@PathVariable String category, Model model) {
        List<TemplateVO> list = service.selectFrames(category);
        model.addAttribute("list", list);
        model.addAttribute("categoryPath", category);
        return "card/edit";
    }

    @ResponseBody
    @GetMapping(value = "/edit/template.do", produces = "text/html; charset=UTF-8")
    public String getPreviewTemplate(int id) {
        return service.selectPreviewFrame(id);
    }

    @PostMapping("/edit/card.do")
    public String getCardInfo(CardVO cardVO, HttpSession session, @RequestParam(value="imageFile") MultipartFile file, Model model) {
        String redirectURL; // URL 결정
        if (cardVO.getCardIsPaid()) {
            redirectURL = "/payments/success";
        } else {
            redirectURL = "/cart";
        }
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        if (cardVO.getPayID() == 0) {
            cardVO.setPayID(null);
        }
        // image s3 위치 가져와서 저장
        cardVO.setCardImage(imageService.saveFile(file));
        service.insertCardInCart(cardVO, session);
        String shortUrl = shortUrlService.shortUrl(cardVO.getCardID());
        model.addAttribute("shortUrl", shortUrl);
        return "redirect:" + redirectURL;
    }

    @GetMapping("/completedCard/{cardID}")
    public String getCompletedCardPage(@PathVariable int cardID, Model model) {
        // 카드 정보
        CardVO cardVO = service.getCompletedCardPage(cardID);
        model.addAttribute("cardVO", cardVO);

        // 카드의 css 정보
        String css = cardVO.getTemplateThumbnail().substring(25, cardVO.getTemplateThumbnail().length() - 4);
        model.addAttribute("css", css);

        // 방명록 정보
        List<GuestBookVO> guestBooks = service.selectGuestBooks(cardVO.getCardID());
        model.addAttribute("guestBooks", guestBooks);
        return "card/completedCard";
    }

    @PostMapping("/completedCard/like.do")
    public ResponseEntity<String> updateCardLike(int cardID) {
        try {
            service.updateCardLike(cardID);
            return new ResponseEntity<>(SuccessCode.LIKE_UPDATE_SUCCESS.getMessage(), SuccessCode.LIKE_UPDATE_SUCCESS.getHttpStatus());
        } catch (Exception e) {
            return new ResponseEntity<>(ErrorCode.INTERNAL_SERVER_ERROR.getMessage(), ErrorCode.INTERNAL_SERVER_ERROR.getHttpStatus());
        }
    }

    @PostMapping("/completedCard/guestBook.do")
    public ResponseEntity<String> insertCardGuestBook(@RequestBody GuestBookVO guestBookVO) {
        try {
            service.insertCardGuestBook(guestBookVO);
            return new ResponseEntity<>(SuccessCode.GUESTBOOK_CREATE_SUCCESS.getMessage(), SuccessCode.GUESTBOOK_CREATE_SUCCESS.getHttpStatus());
        } catch(Exception e) {
            return new ResponseEntity<>(ErrorCode.INTERNAL_SERVER_ERROR.getMessage(), ErrorCode.INTERNAL_SERVER_ERROR.getHttpStatus());
        }
    }
}