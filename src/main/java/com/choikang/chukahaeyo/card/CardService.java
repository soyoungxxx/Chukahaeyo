package com.choikang.chukahaeyo.card;

import com.choikang.chukahaeyo.card.model.CardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CardService {
    @Autowired
    private CardMapper cardMapper;

    public List<CardVO> getPublicCardList() {
        return cardMapper.getPublicCardList();
    }

    // main
    public List<CardVO> getTop3CardList() {
        return cardMapper.getTop3CardList();
    }

    public List<CardVO> getLatest3CardList() {
        return cardMapper.getLatest3CardList();
    }

    // myCard
    public List<CardVO> getPersonalCard(int memberID) {
        return cardMapper.getPersonalCard(memberID);
    }

    public CardVO togglePublicStatus(int cardID) {
        CardVO card = cardMapper.getCompletedCardPage(cardID);
        boolean newStatus = !card.isCardIsPublic(); // 현재 공개 상태 반전
        card.setCardIsPublic(newStatus);
        cardMapper.togglePublicStatus(cardID);
        return card;
    }

    // Cart
    public List<CardVO> getPersonalCart(int memberID) {
        return cardMapper.getPersonalCart(memberID);
    }

    public void deleteCard(int cardID) {
        cardMapper.deleteCard(cardID);
    }

    public void updateCardPaymentStatus(int cardID) {
        cardMapper.updateCardPaymentStatus(cardID);
    }

    public List<Integer> selectCardsByCategory(String date) {
        return cardMapper.selectCardsByCategory(date);
    }

    public boolean selectCardIsPublic(int cardID) {
        return cardMapper.selectCardIsPublic(cardID);
    }
}