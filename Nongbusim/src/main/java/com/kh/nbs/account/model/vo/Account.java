package com.kh.nbs.account.model.vo;

import lombok.Data;

@Data
public class Account {
	
	private int accountNo;
	private String type;
	private String createDate;
	private String transferDate;
	private String goods;
	private int amount;
	private String content;
	private String status;
	private int memNo;

	
}
