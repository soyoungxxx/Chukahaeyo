package com.choikang.chukahaeyo.visitor;

import com.choikang.chukahaeyo.visitor.model.VisitorVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class VisitorController {
    @Autowired
    VisitorService visitorService;

    @GetMapping("/admin/visitor.do")
    @ResponseBody
    public List<Integer> selectVisitor(VisitorVO visitorVO) {
        return visitorService.selectVisitor(visitorVO);
    }
}
