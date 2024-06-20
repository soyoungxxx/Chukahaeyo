package com.choikang.chukahaeyo.visitor;

import com.choikang.chukahaeyo.visitor.model.VisitorVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VisitorMapper {
    void insertCookie(VisitorVO visitorVO);
    List<Integer> selectVisitor(VisitorVO visitorVO);
}
