package com.choikang.chukahaeyo.card.edit;

import com.choikang.chukahaeyo.card.CardMapper;
import com.choikang.chukahaeyo.card.TemplateMapper;
import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.GuestBookVO;
import com.choikang.chukahaeyo.card.model.TemplateVO;
import com.nhncorp.lucy.security.xss.XssFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
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

    public void insertCardInCart(CardVO cardVO, HttpSession session) {
        // memberID 저장
        cardVO.setMemberID((Integer) session.getAttribute("memberID"));
        // XSS filter 적용해서 html 문법 필터링하기
        XssFilter filter = XssFilter.getInstance("lucy-xss-superset-sax.xml", true);
        cardVO.setCardDesign(filter.doFilter(cardVO.getCardDesign()));

        cardMapper.insertCardInCart(cardVO);
    }

    public CardVO getCompletedCardPage(int cardID) {
        return cardMapper.getCompletedCardPage(cardID);
    }

    public void updateCardLike(int cardID) {
        cardMapper.updateCardLike(cardID);
    }

    public void insertCardGuestBook(GuestBookVO guestBookVO) {
        cardMapper.insertCardGuestBook(guestBookVO);
    }
    public List<GuestBookVO> selectGuestBooks(int cardID) {
        return cardMapper.selectGuestBooks(cardID);
    }
}