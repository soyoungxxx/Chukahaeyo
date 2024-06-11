package com.choikang.chukahaeyo.board;


import com.choikang.chukahaeyo.board.model.CommunityVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<CommunityVO> getCommunityList(CommunityVO communityVO);


    int count(CommunityVO vo);
}
