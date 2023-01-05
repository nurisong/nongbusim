package com.kh.nbs.diary.model.vo;

import lombok.Data;

@Data
public class Diary {

	private int diaryNo;
	private String startDate;
	private String endDate;
	private String createDate;
	private String goods;
	private String content;
	private String status;
	private int memNo;
	
	
}
