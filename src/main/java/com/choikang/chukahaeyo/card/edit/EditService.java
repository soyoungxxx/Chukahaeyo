package com.choikang.chukahaeyo.card.edit;

import com.choikang.chukahaeyo.card.CardMapper;
import com.choikang.chukahaeyo.card.TemplateMapper;
import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.TemplateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EditService {
    @Autowired
    private CardMapper cardMapper;

    @Autowired
    private TemplateMapper templateMapper;

    public List<TemplateVO> selectFrames(int categoryId) {
        return templateMapper.selectFrames(categoryId);
    }

    public String selectPreviewFrame(int templateId) {
        return templateMapper.selectPreviewFrame(templateId);
    }

    public void insertCardInCart(CardVO cardVO) {
        cardMapper.insertCardInCart(cardVO);
    }

    public CardVO getCompletedCardPage(int cardID) {
        return cardMapper.getCompletedCardPage(cardID);
    }

    public void updateCardLike(int cardID) {
        cardMapper.updateCardLike(cardID);
    }
}