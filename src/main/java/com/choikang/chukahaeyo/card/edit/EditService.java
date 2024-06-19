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

    public List<TemplateVO> selectFrames(String category) {
        int categoryID = 0;
        if (category.equals("myCard")) { // 카테고리 아이디 결정
            categoryID = 1;
        } else if (category.equals("myPet")) {
            categoryID = 2;
        } else if (category.equals("invitation")) {
            categoryID = 3;
        }
        return templateMapper.selectFrames(categoryID);
    }

    public String selectPreviewFrame(int templateId) {
        return templateMapper.selectPreviewFrame(templateId);
    }

    public void insertCardInDatabase(CardVO cardVO, HttpSession session) {
        // payID가 0이면 없는 걸로 간주, null 저장
        if (cardVO.getPayID() == 0) {
            cardVO.setPayID(null);
        }
        // memberID 저장
        cardVO.setMemberID((Integer) session.getAttribute("memberID"));
        // XSS filter 적용해서 html 문법 필터링하기
        XssFilter filter = XssFilter.getInstance("lucy-xss-superset-sax.xml", true);
        cardVO.setCardDesign(filter.doFilter(cardVO.getCardDesign()));

        cardMapper.insertCardInDatabase(cardVO);
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