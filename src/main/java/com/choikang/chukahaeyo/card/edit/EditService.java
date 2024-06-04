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

    public List<TemplateVO> selectFrames(int category_id) {
        return templateMapper.selectFrames(category_id);
    }

    public String selectPreviewFrame(int template_id) {
        return templateMapper.selectPreviewFrame(template_id);
    }
}