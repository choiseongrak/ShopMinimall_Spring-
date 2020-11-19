package com.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	MemberDAO dao;

	public void memberAdd(MemberDTO m) {
		dao.memberAdd(m);
	}
	
	public MemberDTO login(Map<String, String> map) {
		MemberDTO dto = dao.login(map);
		return dto;
	}

	public int idCheck(String userid) {
		// TODO Auto-generated method stub
		int n = dao.idCheck(userid);
		return n;
		
	}

	public int memberUpdate(MemberDTO m) {
		// TODO Auto-generated method stub
		int n = dao.memberUpdate(m);
		return n;
	}

	public MemberDTO myPage(String userid) {
		// TODO Auto-generated method stub
		MemberDTO dto = dao.myPage(userid);
		return dto;
	}


}
