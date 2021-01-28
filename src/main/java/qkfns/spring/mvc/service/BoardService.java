package qkfns.spring.mvc.service;

import qkfns.spring.mvc.vo.BoardVO;

import java.util.List;

public interface BoardService {
    boolean newBoard(BoardVO bvo);
    List<BoardVO> readBoard(String cp);
    BoardVO readOneBoard(String bno);
    boolean modifyBoard(BoardVO bvo);
    boolean deleteBoard(String bno);
    int countBoard();
}
