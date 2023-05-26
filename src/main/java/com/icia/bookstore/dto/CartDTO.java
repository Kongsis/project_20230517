package com.icia.bookstore.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
@Getter
@Setter
@ToString
public class CartDTO {
    private Long id;
    private Long memberId;
    private Long productId;
    private String memberName;
    private String productTitle;
    private int productPrice;
    private int money;
    private int productCnt;
    private String productContent;
    private int fileAttached;
    private List<MultipartFile> productFile;
}
