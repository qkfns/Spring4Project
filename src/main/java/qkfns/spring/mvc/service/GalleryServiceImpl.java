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
                if (!f.getOriginalFilename().isEmpty())
                    imgs.add(imgutil.ImageUpload(f));
                    // 업로드한 뒤 결과값은 '파일명/파일크기'로 넘어옴
                else
                    imgs.add("-/-");
                // 업로드를 하지 못한 경우는 '-/-'만 넘김
            }

            // 업로드한 파일명, 폼데이터 확인
            System.out.println(imgs.get(0));
            System.out.println(imgs.get(1));
            System.out.println(imgs.get(2));
            //System.out.println(gvo.getTitle());
            //System.out.println(gvo.getContents());

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

        // 업로드한 이미지 정보를 테이블 저장
        int id = gdao.insertGallery(gvo);

        // 업로드한 이미지들 중 첫번째 이미지를 썸네일이미지로 만듬
        imgutil.imageCropResize(gvo.getFnames().split("[/]")[0],id+"");

        return true;
    }

    @Override
    public List<GalleryVO> readGallery(String cp) {
        int snum = (Integer.parseInt(cp)-1) * 24;
        return gdao.selectGallery(snum);
    }

    @Override
    public int countGallery() {
        return gdao.selectCountGallery();
    }

    @Override
    public GalleryVO readOneGallery(String gno) {
        return gdao.selectOneGallery(gno);
    }

}

