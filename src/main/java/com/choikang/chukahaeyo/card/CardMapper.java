package com.choikang.chukahaeyo.card;

import com.choikang.chukahaeyo.card.model.CardVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CardMapper {
    void insertUrl(CardVO cardVO);
}
