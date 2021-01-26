package qkfns.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import qkfns.spring.mvc.vo.MemberVO;
import qkfns.spring.mvc.vo.ZipcodeVO;

import java.util.List;

@Repository("mdao")
public class MemberDAOImpl implements MemberDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override // 회원정보 추가
    public int insertMember(MemberVO mvo) {
        return sqlSession.insert("member.insertMember", mvo);
    }

    @Override // 우편번호 조회
    public List<ZipcodeVO> selectZipcode(String dong) {
        return sqlSession.selectList("member.zipcode", dong);
    }

    @Override // 아이디 중복조회
    public int selectOneUserid(String uid) {
        return sqlSession.selectOne("member.checkuid",uid);
    };
}
