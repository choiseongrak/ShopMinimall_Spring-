package com.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate template; //Sqlsession, auto commit 
	public void memberAdd(MemberDTO m) {
		// TODO Auto-generated method stub
		int n = template.insert("memberAdd",m);
		if(n > 0) {
			System.out.println("회원가입 성공");
		} 
	}

	public MemberDTO login(Map<String, String> map) {
		// TODO Auto-generated method stub
		MemberDTO dto = template.selectOne("login", map);
		return dto;
	}

	public int idCheck(String userid) {
		// TODO Auto-generated method stub
		int n = template.selectOne("idCheck", userid);
		return n;
	}

	public int memberUpdate(MemberDTO m) {
		// TODO Auto-generated method stub
		int n = template.update("memberUpdate", m);
		return n;
	}

	public MemberDTO myPage(String userid) {
		// TODO Auto-generated method stub
		MemberDTO dto = template.selectOne("myPage", userid);
		return dto;
	}


}
