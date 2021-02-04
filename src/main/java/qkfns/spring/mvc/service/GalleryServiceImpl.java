package qkfns.spring.mvc.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import qkfns.spring.mvc.dao.GalleryDAO;
import qkfns.spring.mvc.util.ImageUploadUtil;
import qkfns.spring.mvc.vo.GalleryVO;

import java.util.ArrayList;
import java.util.List;

@Service("gsrv")
public class GalleryServiceImpl implements GalleryService {

    private GalleryDAO gdao;
    private ImageUploadUtil imgutil;

    @Autowired
    public GalleryServiceImpl(GalleryDAO gdao, ImageUploadUtil imgutil) {
        this.gdao = gdao;
        this.imgutil = imgutil;
    }

    @Override // 업로드 이미지 처리 후 디비에 저장
    public boolean newGallery(GalleryVO gvo, MultipartFile[] img) {

        // 첨부파일이 존재한다면
        if (imgutil.checkGalleryFiles(img)) {
            // 업로드한 이미지파일명을 저장하기 위해 동적배열 생성
            List<String> imgs = new ArrayList<>();

            // 첨부파일이 존재한다면 서버에 저장하고
            // 그 결과로 파일이름을 받아서 동적배열에 저장
            for(MultipartFile f : img) {
                if(!f.getOriginalFilename().isEmpty())
                    imgs.add(imgutil.ImageUpload(f));
                else
                    imgs.add(null);
            }
            // 업로드한 파일명 확인
            System.out.println(imgs.get(0));
            System.out.println(imgs.get(1));
            System.out.println(imgs.get(2));
            System.out.println(gvo.getTitle());
            System.out.println(gvo.getContents());

            // 업로드한 파일명들을 하나로 합쳐서 fnames에 저장
            // 업로드한 파일들의 크기를 하나로 합쳐서 fsizes에 저장
            // imgs : 파일명1/파일명1크기, 파일명2/파일명2크기, 파일명3/파일명3크기
            String fnames = "";
            String fsizes = "";

            for (int i = 0; i < imgs.size(); ++i) {
                fnames += imgs.get(i).split("[/]")[0] + "/";
                fsizes += imgs.get(i).split("[/]")[1] + "/";
            }

            gvo.setFnames( fnames );
            gvo.setFsizes( fsizes );

        } // if

        int cnt = gdao.insertGallery(gvo);

        return true;
    }

}

