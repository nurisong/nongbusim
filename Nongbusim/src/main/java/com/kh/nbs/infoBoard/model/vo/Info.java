package com.kh.nbs.infoBoard.model.vo;

import lombok.Data;

@Data
public class Info {
	private int infoNo;
	private int writer;
	private String category;
	private String infoTitle;
	private String infoContent;
	private String source;
	private String enrollDate;
	private int count;
	private String status;
}
