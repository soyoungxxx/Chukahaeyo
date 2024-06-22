package com.choikang.chukahaeyo.visitor;

import com.choikang.chukahaeyo.visitor.model.VisitorVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VisitorService {
    @Autowired
    VisitorMapper visitorMapper;

    public void insertCookie(VisitorVO visitorVO, String cookieValue) {
        visitorVO.setVisitorCookie(cookieValue);
        visitorMapper.insertCookie(visitorVO);
    }

    public List<Integer> selectVisitor(VisitorVO visitorVO) {
        return visitorMapper.selectVisitor(visitorVO);
    }
}
