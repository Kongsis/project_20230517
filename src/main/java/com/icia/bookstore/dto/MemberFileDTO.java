package com.icia.bookstore.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberFileDTO {
    private Long id;
    private String originalMemberFileName;
    private String storedMemberFileName;
    private Long memberId;
}
