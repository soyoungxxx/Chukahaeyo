package com.choikang.chukahaeyo.card.edit;

import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.GuestBookVO;
import com.choikang.chukahaeyo.card.model.TemplateVO;
import com.choikang.chukahaeyo.card.url.ShortUrlService;
import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.SuccessCode;
import com.choikang.chukahaeyo.s3.S3Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/card")
public class EditController {
    @Autowired
    private EditService editService;

    @Autowired
    private S3Service imageService;

    @Autowired
    private ShortUrlService shortUrlService;

    @GetMapping("/edit/{category}")
    public String showEditPage(@PathVariable String category, Model model) {
        List<TemplateVO> list = editService.selectFrames(category); // 서비스 호출
        model.addAttribute("list", list); // 뷰에 값 전달
        model.addAttribute("categoryPath", category);
        return "card/edit";
    }

    @ResponseBody
    @GetMapping(value = "/edit/template.do", produces = "text/html; charset=UTF-8")
    public String getPreviewTemplate(int id) {
        return editService.selectPreviewFrame(id); // 서비스 호출
    }

    @PostMapping("/edit/card.do")
    public String insertCardInDatabase(CardVO cardVO, HttpSession session, @RequestParam(value="imageFile") MultipartFile file, Model model) {
        // image s3 위치 가져와서 저장. imageService 호출
        cardVO.setCardImage(imageService.saveFile(file));
        // db에 카드 데이터 저장. editService 호출
        editService.insertCardInDatabase(cardVO, session);
        // db에 URL 업데이트. shortURLService 호출
        String shortUrl = shortUrlService.shortUrl(cardVO.getCardID());
        String redirectURL; // URL 결정
        if (cardVO.getCardIsPaid()) {
            redirectURL = "/payments/success";
            model.addAttribute("shortUrl", shortUrl); // 뷰에 값 전달
        } else {
            redirectURL = "/cart";
        }
        return "redirect:" + redirectURL;
    }

    @PostMapping("/completedCard/{cardID}")
    public String getCompletedCardPage(@PathVariable int cardID, Model model) {
        // 카드 정보, editService 호출 후 뷰에 값 전달
        CardVO cardVO = editService.getCompletedCardPage(cardID);
        model.addAttribute("cardVO", cardVO);

        // 카드의 css 정보
        String css = cardVO.getTemplateThumbnail().substring(25, cardVO.getTemplateThumbnail().length() - 4);
        model.addAttribute("css", css);

        // 방명록 정보, editService 호출 후 뷰에 값 전달
        List<GuestBookVO> guestBooks = editService.selectGuestBooks(cardVO.getCardID());
        model.addAttribute("guestBooks", guestBooks);

        return "card/completedCard";
    }

    @PostMapping("/completedCard/like.do")
    public ResponseEntity<String> updateCardLike(int cardID) {
        try {
            editService.updateCardLike(cardID);
            return new ResponseEntity<>(SuccessCode.LIKE_UPDATE_SUCCESS.getMessage(), SuccessCode.LIKE_UPDATE_SUCCESS.getHttpStatus());
        } catch (Exception e) {
            return new ResponseEntity<>(ErrorCode.INTERNAL_SERVER_ERROR.getMessage(), ErrorCode.INTERNAL_SERVER_ERROR.getHttpStatus());
        }
    }

    @PostMapping("/completedCard/guestBook.do")
    public ResponseEntity<String> insertCardGuestBook(@RequestBody GuestBookVO guestBookVO) {
        try {
            editService.insertCardGuestBook(guestBookVO);
            return new ResponseEntity<>(SuccessCode.GUESTBOOK_CREATE_SUCCESS.getMessage(), SuccessCode.GUESTBOOK_CREATE_SUCCESS.getHttpStatus());
        } catch(Exception e) {
            return new ResponseEntity<>(ErrorCode.INTERNAL_SERVER_ERROR.getMessage(), ErrorCode.INTERNAL_SERVER_ERROR.getHttpStatus());
        }
    }

}