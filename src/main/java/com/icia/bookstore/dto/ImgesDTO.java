package com.icia.bookstore.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ImgesDTO {
    private Long id;
    private Long productsId;
    private String productTitle;
    private int productCnt; // 갯수
    private int productPrice;
    private String productContents;
    private int fileAttached;
    private String originalFileName;
    private String storedFileName;
}
