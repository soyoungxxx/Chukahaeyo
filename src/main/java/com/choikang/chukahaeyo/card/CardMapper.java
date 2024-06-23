package com.choikang.chukahaeyo.card;

import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.GuestBookVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface CardMapper {
    void insertUrl(CardVO cardVO);
    void deleteCard(int cardID);
    void insertCardInDatabase(CardVO cardVO);
    void updateCardPaymentStatus(int cardID);
    void updateCardLike(int cardID);
    void insertCardGuestBook(GuestBookVO guestBookVO);

    void togglePublicStatus(int cardID);

    String getCardDesign(int cardID);
    CardVO getCompletedCardPage(int cardID);

    List<CardVO> getPersonalCart(int memberID);
    List<CardVO> getPersonalCard(int memberID);
    List<CardVO> getPublicCardList();
    List<CardVO> getTop3CardList();
    List<CardVO> getLatest3CardList();
    List<GuestBookVO> selectGuestBooks(int cardID);
}
