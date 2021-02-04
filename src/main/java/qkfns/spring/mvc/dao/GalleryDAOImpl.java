package qkfns.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import qkfns.spring.mvc.vo.GalleryVO;

@Repository("gdao")
public class GalleryDAOImpl implements GalleryDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int insertGallery(GalleryVO gvo) {
        return sqlSession.insert("gallery.insertGallery", gvo);
    }
}
