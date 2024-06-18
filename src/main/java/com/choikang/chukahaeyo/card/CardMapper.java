package com.choikang.chukahaeyo.card;

import com.choikang.chukahaeyo.card.model.CardVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CardMapper {
    void insertUrl(CardVO cardVO);
    void deleteCard(int cardID);
    void insertCardInCart(CardVO cardVO);
  
    String getCardDesign(int cardID);
    List<CardVO> getPersonalCart(int memberID);
    List<CardVO> getPublicCardList();
    List<CardVO> getTop3CardList();
    List<CardVO> getLatest3CardList();
    CardVO getCompletedCardPage(int cardID);
    void updateCardLike(int cardID);
    void updateCardPaymentStatus(int cardID);

}
