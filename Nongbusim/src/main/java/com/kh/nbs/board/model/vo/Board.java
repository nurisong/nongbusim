package com.kh.nbs.board.model.vo;

import lombok.Data;

@Data
public class Board {

	private int boardNo; 
	private String boardType;
	private String boardTitle;
	private String boardContent; 
	private String createDate;
	private String modifyDate;
	private String thumbnail;
	private String recruitYN;
	private int count;
	private String status;	
	private int memNo;
	
	private String boardWriter;
	private int boardLike;
	

}
