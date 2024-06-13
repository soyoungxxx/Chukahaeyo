package com.choikang.chukahaeyo.card.url;

import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.model.CustomException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping("/url")
public class ShortUrlController {
    private final ShortUrlService shortUrlService;

    @GetMapping("/origin") // 카드를 저장한 URL을 반환하는 컨트롤러. 추후 사용자별 다른 URL을 반환하도록 수정
    @ResponseBody
    public String url() {
        return "http://localhost.com:9090/payments/success"; // test용으로 URL을 미리 넣어둔 것. 추후 사용자별 카드 URL로 변경 예정
    }

    @GetMapping("/short")
    @ResponseBody
    public String shortUrl(Model model) {
        String originUrl = url(); // origin에서 받아온 URL
        try {
            String shortUrl = shortUrlService.shortUrl(originUrl);
            model.addAttribute("shortUrl", shortUrl);
            return "successPay";
        } catch (Exception e) {
            throw new CustomException(ErrorCode.INTERNAL_SERVER_ERROR, "short URL 응답 생성 실패");
        }
    }
}