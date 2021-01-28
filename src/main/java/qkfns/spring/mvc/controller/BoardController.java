package qkfns.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import qkfns.spring.mvc.service.BoardReplyService;
import qkfns.spring.mvc.service.BoardService;
import qkfns.spring.mvc.util.GoogleCaptchaUtil;
import qkfns.spring.mvc.vo.BoardVO;

@Controller
public class BoardController {

    private BoardService bsrv;
    private GoogleCaptchaUtil gcutil;
    private BoardReplyService brsrv;

    @Autowired
    public BoardController(BoardService bsrv, GoogleCaptchaUtil gcutil) {
        this.bsrv = bsrv;
        this.gcutil = gcutil;
        this.brsrv = brsrv;
    }

    // 게시판 목록 처리 1: 페이징
    // ex) 총게시글 수counts : 101
    // 페이지당 출력 게시글 수 perpage : 10
    // 총 페이지 수pages는? : 11
    // => pages = counts /perpage

    // 게시물의 번호 범위 : 101~1
    // 1page에 출력할 게시물의 범위: 101 ~92
    // 2page에 출력할 게시물의 범위: 91 ~ 82
    // 3page에 출력할 게시물의 범위: 81 ~ 72
    // => 특정 페이지page에 속하는 게시물의 시작범위startnum 산출식
    // counts - (page -1) * 10
    // 구현코드 : select ??? from Board limit startnum, perpage


    // 게시판 목록 처리 2: 검색처리
    @GetMapping("/board/list")  // 게시판 목록 출력
    public ModelAndView list(ModelAndView mv, String cp) {
        if (cp == null) cp = "1";

        mv.setViewName("board/list.tiles");
        mv.addObject("bds",bsrv.readBoard(cp));
        mv.addObject("bdcnt",bsrv.countBoard());

        return mv;
    }

    @GetMapping("/board/view")  // 게시판 본문글 출력
    public ModelAndView view(String bno, ModelAndView mv) {
        mv.setViewName("board/view.tiles");
        mv.addObject("bd",bsrv.readOneBoard(bno));


        return mv;
    }

    @GetMapping("/board/write")
    public String write(){
        return "board/write.tiles";
    }

    @PostMapping("/board/write") //새글쓰기 처리
    public String writeok(BoardVO bvo) {
        String returnPage= "redirect:/board/write";

        bvo.setUserid("지현수지");
        if(bsrv.newBoard(bvo))
            returnPage = "redirect:/board/list";

        return returnPage;
    }

    @GetMapping("/board/update")
    public String update() {

        return "board/update.tiles";
    }

}
