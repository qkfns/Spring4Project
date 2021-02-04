package qkfns.spring.mvc.dao;

import qkfns.spring.mvc.vo.PdsVO;

import java.util.List;
import java.util.Map;

public interface PdsDAO {
    int insertPds(PdsVO pvo);

    List<PdsVO> selectPds(int snum);

    int selectCountPds();

    PdsVO selectOnePds(String pno);

    PdsVO selectOnePds(String pno, String order);

    int updateDownCount(Map<String, String> param);
}
