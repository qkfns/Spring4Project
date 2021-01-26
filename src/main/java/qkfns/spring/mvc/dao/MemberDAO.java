package qkfns.spring.mvc.dao;

import qkfns.spring.mvc.vo.MemberVO;
import qkfns.spring.mvc.vo.ZipcodeVO;

import java.util.List;

public interface MemberDAO {
    int insertMember(MemberVO mvo);

    List<ZipcodeVO> selectZipcode(String dong);

    int selectOneUserid(String uid);
}
