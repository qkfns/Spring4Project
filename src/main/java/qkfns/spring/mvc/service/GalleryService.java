package qkfns.spring.mvc.service;

import org.springframework.web.multipart.MultipartFile;
import qkfns.spring.mvc.vo.GalleryVO;

import java.util.List;

public interface GalleryService {
    boolean newGallery(GalleryVO gvo, MultipartFile[] img);

    List<GalleryVO> readGallery(String cp);

    int countGallery();

    GalleryVO readOneGallery(String gno);
}
