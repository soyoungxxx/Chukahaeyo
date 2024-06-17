package com.choikang.chukahaeyo.board.inquiry;


import com.choikang.chukahaeyo.board.model.InquiryVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardInquiryMapper {
    List<InquiryVO> getInquiryList(InquiryVO inquiryVO);

    int count(InquiryVO inquiryVO);

    int insertInquiry(InquiryVO vo);

    InquiryVO getInquiryDetail(InquiryVO vo);
}
