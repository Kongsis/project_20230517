package com.icia.bookstore.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Getter
@Setter
@ToString
public class ProductDTO {
    private Long id;
    private String productTitle;
    private String productContents;
    private int productPrice;
    private int productQuantity;
    private int productHits;
    private Timestamp productCreatedDate;
    private int fileAttached;
    private List<MultipartFile> productFile;
    private Long memberId;
}
