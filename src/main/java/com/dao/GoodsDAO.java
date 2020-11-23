package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.GoodsDTO;
@Repository
public class GoodsDAO {
	@Autowired
	SqlSessionTemplate template;
	public List<GoodsDTO> goodsList(String gCategory) {
		// TODO Auto-generated method stub
		List<GoodsDTO> list = template.selectList("goodsList",gCategory);
		return list;
	}

	public GoodsDTO goodsRetrieve(String gCode) {
		// TODO Auto-generated method stub
		GoodsDTO dto = template.selectOne("goodsRetrieve", gCode);
		return dto;
	}

}
