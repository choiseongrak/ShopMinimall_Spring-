package com.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	MemberService service;
	
	@RequestMapping("/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session, RedirectAttributes rttr) {
		MemberDTO dto = service.login(map);
		String next = "";
		if(dto != null) {
			session.setAttribute("login", dto);
			rttr.addFlashAttribute("mesg", "로그인 성공"); 
			next = "redirect:/"; //로그인 시 상품 리스트 redirect
		} else {
			rttr.addFlashAttribute("mesg", "로그인 실패");
			next = "redirect:loginForm";
		}
		return next;
	}
	@RequestMapping("/loginCheck/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
}
