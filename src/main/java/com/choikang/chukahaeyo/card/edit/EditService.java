package com.choikang.chukahaeyo.card.edit;

import com.choikang.chukahaeyo.card.CardMapper;
import com.choikang.chukahaeyo.card.TemplateMapper;
import com.choikang.chukahaeyo.card.model.TemplateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EditService {
//    @Autowired
//    private CardMapper cardMapper;

    @Autowired
    private TemplateMapper templateMapper;

    public List<TemplateVO> selectFrames(int categoryId) {
        return templateMapper.selectFrames(categoryId);
    }

    public String selectPreviewFrame(int templateId) {
        System.out.println(templateMapper.selectPreviewFrame(templateId));
        return templateMapper.selectPreviewFrame(templateId);
    }
}