package com.choikang.chukahaeyo.card.url;

import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.model.CustomException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@Slf4j
@RequiredArgsConstructor
public class ShortUrlService {
    @Value("${my.naver.client-id}")
    private String clientId;

    @Value("${my.naver.client-secret}")
    private String clientSecret;

    private final RestTemplate restTemplate;

    public String shortUrl(String originUrl) throws ParseException { // originUrl을 네이버 API로 보내는 메소드
        // API로 보낼 URL 설정
        String apiUrl = "https://openapi.naver.com/v1/util/shorturl?url=" + originUrl;

        // 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("X-Naver-Client-Id", clientId);
        headers.set("X-Naver-Client-Secret", clientSecret);

        // HttpEntity 객체 생성 (본문 없이 헤더만 포함)
        HttpEntity<String> entity = new HttpEntity<>(headers);

        // GET 요청 보내기
        ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);

        if (responseEntity.getStatusCode() == HttpStatus.OK) { // 응답이 성공적으로 반환되었으면
            // 응답 본문을 JSON 형태로 변환하여 필요한 데이터 추출
            String responseBody = responseEntity.getBody();
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(responseBody);
            JSONObject resultObject = (JSONObject) jsonObject.get("result");
            String shortUrl = (String) resultObject.get("url");
            return shortUrl;
        } else {
            throw new CustomException(ErrorCode.INTERNAL_SERVER_ERROR, ErrorCode.INTERNAL_SERVER_ERROR.getMessage());
        }
    }
}
