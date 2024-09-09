package com.choikang.chukahaeyo.card.url;

import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.model.CustomException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping("/url")
public class ShortUrlController {
    private final ShortUrlService shortUrlService;

    @GetMapping("/origin")
    @ResponseBody
    public String url() {
        return "http://http://54.180.239.33/:9090/payments/success"; // test용으로 URL을 미리 넣어둔 것. 추후 사용자별 카드 URL로 변경 예정
    }

    @GetMapping("/shorts")
    @ResponseBody
    public String shortUrl(@RequestParam int cardID) {
        try {
            return shortUrlService.shortUrl(cardID);
        } catch (Exception e) {
            throw new CustomException(ErrorCode.INTERNAL_SERVER_ERROR, "short URL 응답 생성 실패");
        }
    }
}