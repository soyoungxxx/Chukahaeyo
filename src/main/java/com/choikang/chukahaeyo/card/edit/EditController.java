package com.choikang.chukahaeyo.card.edit;

import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.TemplateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
@RequestMapping( "/card")
public class EditController {
    @Autowired
    private EditService service;

    @GetMapping("/edit")
    public String showEditPage(HttpServletRequest request, Model model) {
//      int categoryId = (int) request.getAttribute("categoryId");
        int categoryId = 2;
        List<TemplateVO> list = service.selectFrames(categoryId);
        model.addAttribute("list", list);
        return "card/edit";
    }

    @ResponseBody
    @GetMapping(value="/edit/template.do", produces="text/html; charset=UTF-8")
    public String getPreviewTemplate(int id) {
        return service.selectPreviewFrame(id);
    }


    @PostMapping("/edit/card.do")
    public String getCardInfo(CardVO cardVO) {

        return "redirect:/cart";
    }

//    @Value("${REST_API_KEY}")
//    private String REST_API_KEY;
//    @Value("${API_URL}")
//    private String API_URL;

//    @GetMapping("/map")
//    public String getKakaoApiFromAddress(@RequestParam("query") String roadFullAddr) {
//        try {
//            // 디코딩
//            roadFullAddr = URLDecoder.decode(roadFullAddr, StandardCharsets.UTF_8);
//            // url 생성
//            String addr = API_URL + "?query=" + roadFullAddr;
//            URL url = new URL(addr);
//            // url 커넥션 객체 생성
//            URLConnection conn = url.openConnection();
//            // 헤더값 설정
//            conn.setRequestProperty("Authorization", "KakaoAK" + REST_API_KEY);
//            // string buffer에 값 넣고 string 형태로 변환, jsonString return
//            BufferedReader br = null;
//            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
//
//            StringBuffer docJson = new StringBuffer();
//            String line;
//            while ((line=br.readLine()) != null) {
//                docJson.append(line);
//            }
//
//
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//        return "redirect:/";
//    }
}
