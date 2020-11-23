package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.service.CartService;
import com.service.GoodsService;
import com.service.MemberService;

@Controller
public class GoodsController {
	@Autowired
	GoodsService gService;
	@Autowired
	CartService cService;
	@Autowired
	MemberService mService;
	
	@RequestMapping("/goodsList")
	public ModelAndView goodsList(String gCategory) {
		if(gCategory == null) gCategory = "top";
		List<GoodsDTO> list = gService.goodsList(gCategory);
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsList", list);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/goodsRetrieve")
	@ModelAttribute("goodsDTO") //key
	public GoodsDTO goodsRetrieve(String gCode) {
		GoodsDTO dto = gService.goodsRetrieve(gCode);
		return dto;
	}
	
	@RequestMapping("/loginCheck/cartAdd")
	public String cartAdd(CartDTO dto, HttpSession session, RedirectAttributes rttr) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();
		dto.setUserid(userid);
		int n = cService.cartAdd(dto);
		if(n > 0) {
			rttr.addFlashAttribute("mesg", dto.getGName()+"상품이 장바구니에 등록되었습니다.");
		}
		
		return "redirect:../goodsRetrieve?gCode="+dto.getGCode();
	}
	
	
	@RequestMapping("/loginCheck/cartList")
	public String cartList(HttpSession session, RedirectAttributes rttr) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();
		List<CartDTO> list = cService.cartList(userid);
		rttr.addFlashAttribute("cartList", list);
		return "redirect:../cartList";
	}
	
	@RequestMapping("/loginCheck/cartUpdate")
	@ResponseBody
	public String cartUpdate(@RequestParam HashMap<String, Integer> map) {
		cService.cartUpdate(map);
		return "redirect:/loginCheck/cartList";
	}
	
	@RequestMapping("/loginCheck/cartDelete")
	@ResponseBody
	public String cartDelete(int num) {
		cService.cartDel(num);
		return "redirect:/loginCheck/cartList";
	}
	
	@RequestMapping("/loginCheck/delAllCart")
	public String cartAllDelete(String[] check) {
			cService.cartAllDelete(check);
		return "redirect:/loginCheck/cartList";
	}
	
	
	@RequestMapping("/loginCheck/orderConfirm")
	public String orderConfirm(int num, HttpSession session, RedirectAttributes rttr) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();
		mDTO = mService.myPage(userid);
		CartDTO cDTO = cService.cartByNum(num);
		rttr.addFlashAttribute("cDTO",cDTO);
		rttr.addFlashAttribute("mDTO",mDTO);
		return "redirect:../orderConfirm";
	}
	@RequestMapping("/loginCheck/orderDone")
	public String orderDone(OrderDTO dto, int orderNum,HttpSession session, RedirectAttributes rttr) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		dto.setUserid(mDTO.getUserid());
		cService.orderDone(dto, orderNum);
		rttr.addFlashAttribute("dto",dto);
		return "redirect:../orderDone";
	}
	
}
