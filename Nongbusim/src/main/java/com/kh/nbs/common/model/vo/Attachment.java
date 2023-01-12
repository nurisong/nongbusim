package com.kh.nbs.common.model.vo;

import lombok.Data;

@Data
public class Attachment {
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private String uploadDate;
	private int boardNo;
	private String boardType;
}