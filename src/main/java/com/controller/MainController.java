package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.GoodsDTO;
import com.service.GoodsService;

@Controller
public class MainController {
	@Autowired
	GoodsService gService;
	
	@RequestMapping("/")
	public ModelAndView goodsList(String gCategory) { //main 페이지에서 상품 리스트 출력('/'로 들어왔을 경우 카테고리 defalut 지정
		if(gCategory == null) gCategory = "top";
		List<GoodsDTO> list = gService.goodsList("top");
		System.out.println(list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsList", list);
		mav.setViewName("main");
		return mav;
	}
}
