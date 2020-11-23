package com.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("CartDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class CartDTO {
	private int num;
	private String userid;
	private String gCode;
	private String gName;
	private int gPrice;
	private String gSize;
	private String gColor;
	private int gAmount;
	private String gImage;
	
	
	
}
