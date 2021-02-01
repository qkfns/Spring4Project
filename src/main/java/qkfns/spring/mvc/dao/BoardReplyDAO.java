package qkfns.spring.mvc.dao;

import qkfns.spring.mvc.vo.ReplyVO;

import java.util.List;

public interface BoardReplyDAO {
    List<ReplyVO> selectReply(int bno);


    int insertReply(ReplyVO rvo);
}
