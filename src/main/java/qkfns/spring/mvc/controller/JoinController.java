package qkfns.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import qkfns.spring.mvc.service.MemberService;
import qkfns.spring.mvc.vo.MemberVO;

@Controller
public class JoinController {

    @Autowired
    private MemberService msrv;

    @GetMapping("/join/agree")
    public String agree() {
        return "join/agree.tiles";
    }
    @GetMapping("/join/checkme")
    public String checkme() {
        return "join/checkme.tiles";
    }

    @GetMapping("/join/joinme")  // 회원가입 폼
    public String joinme() {
        return "join/joinme.tiles";
    }

    @PostMapping("/join/joinme")  // 회원가입처리
    public String joinmeok(MemberVO mvo) {
        System.out.println(msrv.newMember(mvo));

        return "redirect:/join/joinok";
    }

    @GetMapping("/join/joinok")
    public String joinok() {
        return "join/joinok.tiles";
    }

}
