package com.choikang.chukahaeyo.card;

import com.choikang.chukahaeyo.card.model.CardVO;

import java.util.List;

public interface CardService {
    List<CardVO> getCardList(int memberId); // 카드 리스트 조회
    void deleteCard(int cardId);  // 카드 삭제 메서드 정의
}