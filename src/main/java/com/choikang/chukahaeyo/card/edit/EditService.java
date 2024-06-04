package com.choikang.chukahaeyo.card.edit;

import com.choikang.chukahaeyo.card.CardMapper;
import com.choikang.chukahaeyo.card.TemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EditService {
    @Autowired
    private CardMapper cardMapper;

    @Autowired
    private TemplateMapper templateMapper;

    public String selectTemplate(int category_id) {
        return templateMapper.selectTemplate(category_id);
    }

    public String updateTemplate(String design) {
        return cardMapper.updateTemplate(design);
    }
}