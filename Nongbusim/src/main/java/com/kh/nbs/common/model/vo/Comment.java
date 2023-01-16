package com.kh.nbs.common.model.vo;

import lombok.Data;

@Data
public class Comment {
	
	private int commentNo;
	private String commentContent;
	private String commentEnrollDate;
	private int boardNo;
	private String boardType;
	private int memNo;
	private String status;
	private String memId;
	private String secret;
	
}
