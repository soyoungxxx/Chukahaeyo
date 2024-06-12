package com.choikang.chukahaeyo.card;

import com.choikang.chukahaeyo.card.model.CardVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CardMapper {
    void insertUrl(CardVO cardVO);
    List<CardVO> getCardList(@Param("memberId") int memberId);
    void deleteCard(@Param("cardId") int cardId);
    void insertCardInCart(CardVO cardVO);
}
