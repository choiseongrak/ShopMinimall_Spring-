package com.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("MemberDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class MemberDTO {

	private String userid;
	private String passwd;
	private String username;
	private String post;
	private String addr1;
	private String addr2;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email1;
	private String email2;
	
}
