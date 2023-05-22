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
public class BoardDTO {
    private Long id;
    private String boardTitle;
    private String boardContents;
    private int boardPrice;
    private int boardAccount;
    private int boardHits;
    private Timestamp boardCreatedDate;
    private int fileAttached;
    private List<MultipartFile> boardFile;
    private Long adminId;
}
