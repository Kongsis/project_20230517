package com.icia.bookstore.service;

import com.icia.bookstore.dto.MemberDTO;
import com.icia.bookstore.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Member;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public int save(MemberDTO memberDTO) {
        return memberRepository.save(memberDTO);
    }

    public MemberDTO findByMemberEmail(String loginEmail) {
        return memberRepository.findByMemberEmail(loginEmail);
    }

    public boolean login(MemberDTO memberDTO) {
        MemberDTO dto = memberRepository.login(memberDTO);
        if (dto != null) {
            return true;
        } else {
            return false;
        }
    }
}