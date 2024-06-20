package com.choikang.chukahaeyo.visitor;

import com.choikang.chukahaeyo.visitor.model.VisitorVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitorService {
    @Autowired
    VisitorMapper visitorMapper;

    public void insertCookie(VisitorVO visitorVO, String cookieValue) {
        visitorVO.setVisitorCookie(cookieValue);
        visitorMapper.insertCookie(visitorVO);
    }
}
