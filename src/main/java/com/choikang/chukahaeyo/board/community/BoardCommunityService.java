package com.choikang.chukahaeyo.board.community;

import com.choikang.chukahaeyo.board.comment.BoardCommentMapper;
import com.choikang.chukahaeyo.board.model.CommunityVO;
import com.choikang.chukahaeyo.board.model.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardCommunityService {

    @Autowired
    BoardCommunityMapper boardCommunityMapper;

    @Autowired
    BoardCommentMapper boardCommentMapper;

    public Map<String, Object> getCommunityList(CommunityVO vo) {
        int count = boardCommunityMapper.count(vo); // 총개수
        // 총페이지수
        int totalPage = count / 10;
        if (count % 10 > 0) totalPage++;
        List<CommunityVO> list = boardCommunityMapper.getCommunityList(vo); // 목록

        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        map.put("list", list);

        // 하단에 페이징처리
        int endPage = (int)(Math.ceil(Integer.parseInt(vo.getPage())/10.0)*10);
        int startPage = endPage - 9;
        if (endPage > totalPage) endPage = totalPage;
        boolean isPrev = startPage > 1;
        boolean isNext = endPage < totalPage;
        map.put("endPage", endPage);
        map.put("startPage", startPage);
        map.put("isPrev", isPrev);
        map.put("isNext", isNext);
        return map;
    }

    public void insertCommunity(CommunityVO vo) {
        boardCommunityMapper.insertCommunity(vo);


    }

    public CommunityVO getCommunityDetail(CommunityVO vo) {
        boardCommunityMapper.updateCommunityViewCount(vo);
        return boardCommunityMapper.getCommunityDetail(vo);
    }

    public int deleteHeart(CommunityVO vo) {
        boardCommunityMapper.deleteHeart(vo);

        return boardCommunityMapper.getRedCount(vo);

    }

    public int getLikeCount(CommunityVO vo) {
        return boardCommunityMapper.getLikeCount(vo);
    }

    public Object insertHeart(CommunityVO vo) {
        boardCommunityMapper.insertHeart(vo);

        return boardCommunityMapper.getRedCount(vo);
    }

    public int updateCommunity(CommunityVO vo) {
        return boardCommunityMapper.updateCommunity(vo);
    }

    public void deleteCommunity(CommunityVO vo) {

        ReplyVO replyVO = new ReplyVO();
        replyVO.setCommID(vo.getCommID());
        boardCommentMapper.deleteComment(replyVO);
        boardCommunityMapper.deleteLike(vo);
        boardCommunityMapper.deleteCommunity(vo);
    }
}
