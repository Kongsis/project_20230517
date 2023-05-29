package com.icia.bookstore.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartRepository {
    @Autowired
    private SqlSessionTemplate sql;
}
