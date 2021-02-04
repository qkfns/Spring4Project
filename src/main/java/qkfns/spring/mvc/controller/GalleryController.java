package qkfns.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import qkfns.spring.mvc.service.GalleryService;
import qkfns.spring.mvc.vo.GalleryVO;
import qkfns.spring.mvc.vo.PdsVO;

import javax.servlet.http.HttpServletRequest;

@Controller
public class GalleryController {

    @Autowired private GalleryService gsrv;

    @GetMapping("/gallery/write")
    public String write() {
        return "gallery/write.tiles";
    }

    // 파일업로드 리졸버로 구현한 갤러리
    // 여러 개의 이미지 파일을 업로드하는 경우
    // MultipartFile이라는 객체를 이용하면 편하게 코딩 가능
    // 즉, input type이 file인 객체는 MultipartFile로 가져올 수 있음
    // 그런데, 업로드한 이미지 파일은 총 3개이므로
    // MultipartFile file1, MultipartFile file2,
    // MultipartFile file3 형태로 코드작성해야 함 => 다소 불편
    // 따라서, 이것들을 배열형태로 받아오도록 코드를 개선함
    // => write.jsp의 file 형식 input의 name을 모두 하나의 이름으로 통일해야 함
    @PostMapping("/gallery/write")
    public String writeok(GalleryVO gvo, MultipartFile[] img) {

        gsrv.newGallery(gvo, img);

        return "redirect:/gallery/list?cp=1";
    }

}
