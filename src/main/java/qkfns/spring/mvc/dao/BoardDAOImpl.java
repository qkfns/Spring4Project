package qkfns.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import qkfns.spring.mvc.vo.BoardVO;

import java.util.List;

@Repository("bdao")
public class BoardDAOImpl implements BoardDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insertBoard(BoardVO bvo) {

        return sqlSession.insert("board.insertBoard",bvo);
    }

    @Override
    public List<BoardVO> selectBoard(int snum) {
        return sqlSession.selectList("board.selectList", snum);
    }

    @Override
    public BoardVO selectOneBoard(String bno) {

        return sqlSession.selectOne("board.selectOne",bno);
    }

    @Override
    public int updateBoard(BoardVO bvo) {
        return 0;
    }

    @Override
    public int deleteBoard(String bno) {
        return 0;
    }

    public int selectCountBoard() {
        return sqlSession.selectOne("board.countBoard");
    }
}
