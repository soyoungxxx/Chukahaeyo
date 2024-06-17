package com.choikang.chukahaeyo.board.inquiry;

import com.choikang.chukahaeyo.board.model.InquiryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardInquiryService {
    @Autowired
    BoardInquiryMapper boardInquiryMapper;


    public Map getInquiryList(InquiryVO inquiryVO) {
        int count = boardInquiryMapper.count(inquiryVO); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<InquiryVO> list = boardInquiryMapper.getInquiryList(inquiryVO); // 목록

        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);

        // 하단에 페이징처리
        int endPage = (int)(Math.ceil(Integer.parseInt(inquiryVO.getPage())/10.0)*10);
        int startPage = endPage - 9;
        if (endPage > totalPage) endPage = totalPage;
        boolean isPrev = startPage > 1;
        boolean isNext = endPage < totalPage;
        map.put("endPage", endPage);
        map.put("startPage", startPage);
        map.put("isPrev", isPrev);
        map.put("isNext", isNext);
        return map;
    }
}
