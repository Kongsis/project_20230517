package com.icia.bookstore.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ImgesDTO {
    private Long id;
    private Long boardId;
    private String boardTitle;
    private int boardCnt; // 갯수
    private int boardPrice;
    private String boardContents;
    private int fileAttached;
    private String originalFileName;
    private String storedFileName;
}
