package com.choikang.chukahaeyo.visitor;

import com.choikang.chukahaeyo.visitor.model.VisitorVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VisitorMapper {
    void insertCookie(VisitorVO visitorVO);
}
