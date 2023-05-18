package com.icia.bookstore.controller;

import com.icia.bookstore.dto.MemberDTO;
import com.icia.bookstore.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm() {
        return "memberPages/memberSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        memberService.save(memberDTO);
        return "memberPages/memberLogin";
    }

    @PostMapping("/email-check")
    public ResponseEntity emailCheck(@RequestParam("member-email") String memberEmail){
        System.out.println("member-email = " + memberEmail);
        MemberDTO memberDTO =memberService.findByMemberEmail(memberEmail);
        if(memberDTO == null){
            return new ResponseEntity(HttpStatus.OK);
        }else {
            return new ResponseEntity(HttpStatus.CONFLICT);
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        return "memberPages/memberLogin";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        boolean loginResult = memberService.login(memberDTO);
        if (loginResult) {
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            return "redirect:/";
        } else {
            return "response/loginError";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
