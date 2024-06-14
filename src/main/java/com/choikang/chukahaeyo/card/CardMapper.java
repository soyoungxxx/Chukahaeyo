package com.choikang.chukahaeyo.card;

import com.choikang.chukahaeyo.card.model.CardVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CardMapper {
    void insertUrl(CardVO cardVO);
    void deleteCard(int cardId);
    void insertCardInCart(CardVO cardVO);
    String getCardDesign(int cardID);
    List<CardVO> getPersonalCardList(int memberId);
    List<CardVO> getPublicCardList();
    List<CardVO> getTop3CardList();
    List<CardVO> getLatest3CardList();
}
