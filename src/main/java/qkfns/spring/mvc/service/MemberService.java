package qkfns.spring.mvc.service;

import qkfns.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpSession;

public interface MemberService {
    String newMember(MemberVO mvo);

    // 동이름으로 우편번호 검색
    String findZipcode(String dong);

    String checkUserid(String uid);

    boolean checkLogin(MemberVO mvo, HttpSession sess);
}
