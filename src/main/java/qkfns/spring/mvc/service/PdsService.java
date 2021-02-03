package qkfns.spring.mvc.service;


import qkfns.spring.mvc.vo.BoardVO;
import qkfns.spring.mvc.vo.PdsVO;

import java.util.List;
import java.util.Map;

public interface PdsService {
    boolean newPds(Map<String, String> frmdata, PdsVO pvo);

    List<PdsVO> readBoard(String cp);

    int countBoard();

    PdsVO readOnePds(String pno);

    PdsVO readOneFname(String pno, String order);
}
