package com.icia.bookstore.controller;

import com.icia.bookstore.dto.MemberDTO;
import com.icia.bookstore.dto.PageDTO;
import com.icia.bookstore.dto.ProductDTO;
import com.icia.bookstore.dto.ProductFileDTO;
import com.icia.bookstore.service.MemberService;
import com.icia.bookstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private ProductService productService;

    @GetMapping("/save")
    public String productForm(HttpSession session, Model model) {
        String loginEmail = (String) session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        model.addAttribute("member", memberDTO);
        return "productPages/productSave";
    }

    @PostMapping("/save")
    public String productSave(HttpSession session, @ModelAttribute ProductDTO productDTO) throws IOException {
        String loginEmail = (String) session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        productDTO.setMemberId(memberDTO.getId());
        productService.save(productDTO);
        return "redirect:/";
    }

    @GetMapping("/list")
    public String productList(Model model) {
        List<ProductDTO> productDTOList = productService.findAll();
        model.addAttribute("productList", productDTOList);
        return "productPages/productList";
    }

    @GetMapping("/paging")
    public String paging(
            @RequestParam(value = "page", required = false, defaultValue = "1") int page,
            @RequestParam(value = "q", required = false, defaultValue = "") String q,
            @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
            Model model) {
        List<ProductDTO> productDTOList = null;
        PageDTO pageDTO = null;
        if (q.equals("")) {
            productDTOList = productService.pagingList(page);
            pageDTO = productService.pagingParam(page);
        } else {
            productDTOList = productService.searchList(page, type, q);
            pageDTO = productService.pagingSearchParam(page, type, q);
        }
        model.addAttribute("productList", productDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        return "productPages/productPaging";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") Long id,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
                         @RequestParam(value = "type",required = false, defaultValue = "productTitle") String type,
                         Model model) {
        productService.updateHits(id);
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("product", productDTO);
        model.addAttribute("page", page);
        if (productDTO.getFileAttached() == 1) {
            List<ProductFileDTO> productFileDTO = productService.findFile(id);
            model.addAttribute("productFileList", productFileDTO);
        }
        return "productPages/productDetail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        ProductDTO productDTO = productService.findById(id);
        model.addAttribute("product", productDTO);
        return "productPages/productUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute ProductDTO productDTO, Model model) {
        productService.update(productDTO);
        ProductDTO dto = productService.findById(productDTO.getId());
        model.addAttribute("product", dto);
        return "productPages/productDetail";
    }

    @GetMapping("/DeletePass")
    public String delete(@RequestParam("id") Long id) {
        productService.delete(id);
        return "redirect:/";
    }
}
