package com.choikang.chukahaeyo.card;

import com.choikang.chukahaeyo.card.model.TemplateVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TemplateMapper {
    // 템플릿 불러오기
    List<TemplateVO> selectFrames(int categoryId);

    // 프레임 프리뷰에 띄우기
    String selectPreviewFrame(int templateId);

}
