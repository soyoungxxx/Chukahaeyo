package com.choikang.chukahaeyo.card;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TemplateMapper {
    // 템플릿 불러오기
    String selectTemplate(int category_id);
}
