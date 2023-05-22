package com.icia.bookstore.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductFileDTO {
    private Long id;
    private String originalFileName;
    private String storedFileName;
    private Long productId;
}
