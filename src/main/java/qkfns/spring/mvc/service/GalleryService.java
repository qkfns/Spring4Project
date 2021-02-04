package qkfns.spring.mvc.service;

import org.springframework.web.multipart.MultipartFile;
import qkfns.spring.mvc.vo.GalleryVO;

public interface GalleryService {
    boolean newGallery(GalleryVO gvo, MultipartFile[] img);
}
