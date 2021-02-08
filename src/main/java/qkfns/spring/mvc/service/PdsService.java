package qkfns.spring.mvc.service;


import org.springframework.web.multipart.MultipartFile;
import qkfns.spring.mvc.vo.PdsVO;

import java.util.List;
import java.util.Map;

public interface PdsService {
    boolean newPds(Map<String, String> frmdata, PdsVO pvo);
    boolean newPds(PdsVO pvo, MultipartFile[] file);
    List<PdsVO> readBoard(String cp);

    int countBoard();

    PdsVO readOnePds(String pno);

    PdsVO readOneFname(String pno, String order);

    boolean downCountPds(String pno, String order);


}
