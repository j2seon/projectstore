package com.my.pro.dao;

import com.my.pro.domain.ProductDto;

import java.util.List;

public interface ProductDao {
    int insert(ProductDto dto) throws Exception;

    int count() throws Exception;

    List<ProductDto> selectAll() throws Exception;

    ProductDto selectNum(Integer goodsNum)throws Exception;

//    ProductDto select(Integer goodsNum)throws Exception;
     int update(ProductDto dto)throws Exception;
     int delete(Integer goodsNum)throws Exception;



    }
