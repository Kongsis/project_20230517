package com.icia.bookstore.controller;

import com.icia.bookstore.dto.CommentDTO;
import com.icia.bookstore.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/save")
    public ResponseEntity comment(@RequestBody CommentDTO commentDTO, Model model) {
//        System.out.println(commentDTO);
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        model.addAttribute("commentList", commentDTOList);
        return new ResponseEntity<>(commentDTOList,HttpStatus.OK);
    }
}
