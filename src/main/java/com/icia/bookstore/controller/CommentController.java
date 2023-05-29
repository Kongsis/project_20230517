package com.icia.bookstore.controller;

import com.icia.bookstore.dto.CommentDTO;
import com.icia.bookstore.dto.MemberDTO;
import com.icia.bookstore.service.CommentService;
import com.icia.bookstore.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private MemberService memberService;

    @PostMapping("/save")
    public ResponseEntity comment(@RequestBody CommentDTO commentDTO, HttpSession session) {
        String loginEmail = (String) session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        commentDTO.setMemberId(memberDTO.getId());
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getProductId());
        return new ResponseEntity<>(commentDTOList,HttpStatus.OK);
    }
}
