package com.choikang.chukahaeyo.card;

import com.choikang.chukahaeyo.card.model.CardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardService {
    @Autowired
    private CardMapper cardMapper;

    public void deleteCard(int cardID) {
        cardMapper.deleteCard(cardID);
    }

    public List<CardVO> getPersonalCart(int memberID) {
        return cardMapper.getPersonalCart(memberID);
    }
    public List<CardVO> getPersonalCard(int memberID) {
        return cardMapper.getPersonalCard(memberID);
    }

    public List<CardVO> getPublicCardList() {
        return cardMapper.getPublicCardList();
    }

    public List<CardVO> getTop3CardList() {
        return cardMapper.getTop3CardList();
    }

    public List<CardVO> getLatest3CardList() {
        return cardMapper.getLatest3CardList();
    }

    public void updateCardPaymentStatus(int cardID) {
        cardMapper.updateCardPaymentStatus(cardID);
    }
}