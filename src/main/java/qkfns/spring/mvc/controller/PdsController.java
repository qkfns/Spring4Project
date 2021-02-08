package qkfns.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import qkfns.spring.mvc.service.PdsService;
import qkfns.spring.mvc.util.FileUpDownUtil;
import qkfns.spring.mvc.vo.PdsVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@Controller
public class PdsController {

    private FileUpDownUtil fud;
    private PdsService psrv;


    @Autowired
    public PdsController(FileUpDownUtil fud, PdsService psrv) {
        this.fud = fud;
        this.psrv = psrv;
    }

    @GetMapping("/pds/list")
    public ModelAndView list(ModelAndView mv, String cp){
        mv.setViewName("pds/list.tiles");
        mv.addObject("pds",psrv.readBoard(cp));
        mv.addObject("pdcnt",psrv.countBoard());

        return mv;
    }

    @GetMapping("/pds/view")  // 본문글 출력
    public ModelAndView view(String pno, ModelAndView mv) {
        mv.setViewName("pds/view.tiles");

        mv.addObject("pd",psrv.readOnePds(pno));
        //mv.addObject("rp",prsrv.readReply(pno));

        //psrv.viewCountPds(pno);               // 조회수 증가

        return mv;
    }

    @GetMapping("/pds/write")
    public String write() {
        return "pds/write.tiles";
    }


    // commons FileUpload로 구현한 자료실
//    @PostMapping("/pds/writeok") // 파일업로드
//    public String writeok(PdsVO pvo, HttpServletRequest req) {
//
//        // 업로드 처리 및 폼데이터 가져오기
//        FileUpDownUtil fud = new FileUpDownUtil();
//        Map<String, String> frmdata = fud.procUpload(req);
//
//        System.out.println(frmdata.get("title"));
//        System.out.println(frmdata.get("contents"));
//        System.out.println(frmdata.get("file1"));
//        System.out.println(frmdata.get("file1size"));
//        System.out.println(frmdata.get("file1type"));
//
//        // commons FileUpload를 사용하는 경우 pvo에 값이 자동으로 주입되지 않음.
////        System.out.println(pvo.getTitle());
////        System.out.println(pvo.getContents());
//
//        psrv.newPds(frmdata,pvo);
//
//        return "redirect:/pds/list?cp=1";
//    }

    // MultipartFile로 구현한 자료실
    @PostMapping("/pds/writeok") // 파일업로드
    public String writeok(PdsVO pvo, MultipartFile[] file) {

        psrv.newPds(pvo,file);

        return "redirect:/pds/list?cp=1";
    }

    // 첨부파일 다운로드 하기
    // 파일다운로드시 보안사항
    // 업로드한 파일들은 웹서버와 동일한 디렉토리에 저장하지 말 것!
    // 업로드한 파일을 다운로드할 때 다운로드할 파일이름이 노출되지 않게끔 조치해야함.
    // 다운로드할 파일이름은 원본 + 식별코드를 이용해서 설정.
    // 컨트롤러 메서드에 ResponseBody 어노테이션을 사용하면
    // view를 이용해서 데이터를 출력하지 않고
    // HTTP 응답으로 직접 데이터를 브라우저로 출력할 수 있음.
    @ResponseBody
    @GetMapping("/pds/down")
    public void pdown(String pno, String order,
                      HttpServletResponse res) {
        try {
            PdsVO p = psrv.readOneFname(pno, order);
            fud.procDownloadV2(p.getFname1(), p.getUuid(), res);
            psrv.downCountPds(pno, order);  // 첨부파일 다운수 처리
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
