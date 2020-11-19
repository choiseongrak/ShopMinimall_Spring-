package com.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("GoodsDTO")
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class GoodsDTO {

	private String gCode;
	private String gCategory;
	private String gName;
	private String gContent;
	private int gPrice;
	private String gImage;
	
}
