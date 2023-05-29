package com.icia.bookstore.controller;

import com.icia.bookstore.service.CartService;
import com.icia.bookstore.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class CartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private MemberService memberService;
}
