package com.icia.bookstore.controller;

import com.icia.bookstore.dto.*;
import com.icia.bookstore.service.BoardService;
import com.icia.bookstore.service.CommentService;
import com.icia.bookstore.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private CommentService commentService;

//    @GetMapping("/save")
//    public String saveForm(HttpSession session, Model model) {
//        String loginEmail = (String)session.getAttribute("loginEmail");
//        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
//        model.addAttribute("member", memberDTO);
//        return "boardPages/boardSave";
//    }
//
//    @PostMapping("/save")
//    public String save(HttpSession session, @ModelAttribute BoardDTO boardDTO) throws IOException {
//        String loginEmail = (String) session.getAttribute("loginEmail");
//        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
//        boardDTO.setMemberId(memberDTO.getId());
//        boardService.save(boardDTO);
//        return "boardPages/boardList";
//    }
//
//    @GetMapping("/list")
//    public String findAll(Model model) {
//        List<BoardDTO> boardDTOList = boardService.findAll();
//        model.addAttribute("boardList", boardDTOList);
//        return "boardPages/boardList";
//    }
//
//    @GetMapping("/paging")
//    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
//                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
//                         @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
//                         Model model) {
//        System.out.println("page = " + page + ", q = " + q);
//        List<BoardDTO> boardDTOList = null;
//        PageDTO pageDTO = null;
//        if (q.equals("")) {
//            // 사용자가 요청한 페이지에 해당하는 글 목록 데이터
//            boardDTOList = boardService.pagingList(page);
//            // 하단에 보여줄 페이지 번호 목록 데이터
//            pageDTO = boardService.pagingParam(page);
//        } else {
//            boardDTOList = boardService.searchList(page, type, q);
//            pageDTO = boardService.pagingSearchParam(page, type, q);
//        }
//        model.addAttribute("boardList", boardDTOList);
//        model.addAttribute("paging", pageDTO);
//        model.addAttribute("q", q);
//        model.addAttribute("type", type);
//        return "boardPages/boardPaging";
//    }
//
//    @GetMapping
//    public String findById(@RequestParam("id") Long id, Model model,
//                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
//                           @RequestParam(value = "q", required = false, defaultValue = "") String q,
//                           @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type) {
//        boardService.updateHits(id);
//        BoardDTO boardDTO = boardService.findById(id);
//        model.addAttribute("board", boardDTO);
//        model.addAttribute("page", page);
//        model.addAttribute("q", q);
//        model.addAttribute("type", type);
//        if(boardDTO.getFileAttached() == 1) {
//            List<BoardFileDTO> boardFileDTO = boardService.findFile(id);
//            model.addAttribute("boardFileList", boardFileDTO);
//            System.out.println("boardFileDTO = " + boardFileDTO);
//        }
//        List<CommentDTO> commentDTOList = commentService.findAll(id);
//        if(commentDTOList.size() == 0) {
//            model.addAttribute("commentList", null);
//        } else {
//            model.addAttribute("commentList", commentDTOList);
//        }
//        return "boardPages/boardDetail";
//    }
//
//    @GetMapping("/update")
//    public String updateForm(@RequestParam("id") Long id, Model model) {
//        BoardDTO boardDTO = boardService.findById(id);
//        model.addAttribute("board", boardDTO);
//        return "boardPages/boardUpdate";
//    }
//
//    @PostMapping("/update")
//    public String update(@ModelAttribute BoardDTO boardDTO, Model model) {
//        boardService.update(boardDTO);
//        BoardDTO dto = boardService.findById(boardDTO.getId());
//        model.addAttribute("board", dto);
////        return ""redirect:/board?id="+boardDTO.getId()";
//        if (boardDTO.getFileAttached() == 1) {
//            List<BoardFileDTO> boardFileDTO = boardService.findFile(dto.getId());
//            model.addAttribute("boardFileList", boardFileDTO);
//        }
//        return "boardPages/boardDetail";
//    }
//
//    @GetMapping("/delete-check")
//    public String deleteCheck(@RequestParam("id") Long id, Model model) {
//        BoardDTO boardDTO = boardService.findById(id);
//        model.addAttribute("board", boardDTO);
//        return "boardPages/deleteCheck";
//    }
//
//    @GetMapping("/delete")
//    public String delete(@RequestParam("id") Long id) {
//        boardService.delete(id);
//        return "redirect:/board/";
//    }

    @GetMapping("/save")
    public String saveForm(HttpSession session, Model model) {
        String loginEmail = (String) session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        model.addAttribute("member", memberDTO);
        return "boardPages/boardSave";
    }
    @PostMapping("/save")
    public String save(HttpSession session, @ModelAttribute BoardDTO boardDTO) throws IOException {
        String loginEmail = (String) session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        boardDTO.setAdminId(memberDTO.getId());
        boardService.save(boardDTO);
        return "redirect:/";
    }
    @GetMapping("/productList")
    public String productList(Model model) {
        List<BoardDTO> productDTOList = boardService.findAll();
        model.addAttribute("boardList", productDTOList);
        return "boardPages/boardList";
    }
    @GetMapping("/paging")
    public String paging(
            @RequestParam(value = "page", required = false, defaultValue = "1") int page,
            @RequestParam(value = "q", required = false, defaultValue = "") String q,
            @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
            Model model) {
        System.out.println("페이징 page = " + page + ", q = " + q + ",type= " + type);
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;
        //검색어 q값이 없으면 일반 페이징 처리를해라
        if (q.equals("")) {
            // 사용자가 요청한 페이지에 해당하는 글 목록 데이터
            // 사용자가 3페이지를 보고싶다 하면 3페이지에 해당하는 내용 목록들
            boardDTOList = boardService.pagingList(page);
            // 하단에 보여줄 페이지 번호 목록 데이터
            pageDTO = boardService.pagingParam(page);
            //검색어 q값이 있으면 검색어가 포함된 페이징 처리를 해라
        } else {
            // 검색어가 있으면 검색어가 포함된 페이징 처리를 해라
            boardDTOList = boardService.searchList(page, type, q);
            pageDTO = boardService.pagingSearchParam(page, type, q);
        }
        // 페이지에 들어가는 글 목록들
        model.addAttribute("productList", boardDTOList);
        // 하단에 보여줄 페이지 목록들
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        return "boardPages/boardPaging";
    }
    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
                         @RequestParam(value = "type",required = false, defaultValue = "productTitle") String type,
                         Model model) {
        //조회수를 1씩 증가시키는 메소드이다
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        if (boardDTO.getFileAttached() == 1) {
            // 파일이 있는 게시글을 선택하면
            List<BoardFileDTO> boardFileDTO = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTO);
        }
//        List<CommentDTO> commentDTOList = commentService.findAll(id);
//        if (commentDTOList.size() == 0) {
//            //댓글이 없으면 list에 null적용
//            model.addAttribute("commentList", null);
//        } else {
//            //댓글이 있으면 서버에서 가져온 commentDTOList를 넘겨준다
//            model.addAttribute("commentList", commentDTOList);
//            System.out.println("야야야commentDTOList = " + commentDTOList);
//        }
        return "boardPages/boardDetail";
    }
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO productDTO = boardService.findById(id);
        model.addAttribute("product", productDTO);
        return "boardPages/boardUpdate";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) {
        boardService.update(boardDTO);
        BoardDTO dto = boardService.findById(boardDTO.getId());
        model.addAttribute("board", dto);
        return "boardPages/boardDetail";
    }

    @GetMapping("/DeletePass")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/";
    }
}
