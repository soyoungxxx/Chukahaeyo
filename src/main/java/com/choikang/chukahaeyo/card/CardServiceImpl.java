package com.choikang.chukahaeyo.card;

import com.choikang.chukahaeyo.card.model.CardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardServiceImpl implements CardService {

    @Autowired
    private CardMapper cardMapper;

    @Override
    public List<CardVO> getPersonalCardList(int memberId) {
        return cardMapper.getPersonalCardList(memberId);
    }

    @Override
    public void deleteCard(int cardId) {
        cardMapper.deleteCard(cardId);
    }

    @Override
    public List<CardVO> getPublicCardList() {
        return cardMapper.getPublicCardList();
    }
}
