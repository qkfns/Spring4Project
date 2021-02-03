package qkfns.spring.mvc.dao;

import qkfns.spring.mvc.vo.BoardVO;
import qkfns.spring.mvc.vo.PdsVO;

import java.util.List;

public interface PdsDAO {
    int insertPds(PdsVO pvo);

    List<PdsVO> selectPds(int snum);

    int selectCountPds();

    PdsVO selectOnePds(String pno);

    PdsVO selectOnePds(String pno, String order);
}
