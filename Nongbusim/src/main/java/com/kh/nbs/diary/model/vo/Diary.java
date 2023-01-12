package com.kh.nbs.diary.model.vo;

import lombok.Data;

@Data
public class Diary {

	private int diaryNo;
	private String nickName;
	private String startDate;
	private String endDate;
	private String createDate;
	private String diaryCategory;
	private String diaryContent;
	private String status;
	private int memNo;
	private String diaryThumbnail;
	
}
