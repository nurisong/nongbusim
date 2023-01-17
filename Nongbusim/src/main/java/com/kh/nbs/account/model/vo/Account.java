package com.kh.nbs.account.model.vo;

import lombok.Data;

@Data
public class Account {
	
	private int accountNo;
	private String type;
	private String accountCategory;
	private String goods;
	private String startDate;
	private String endDate;
	private String createDate;
	private String amount;
	private String accountContent;
	private String status;
	private int memNo;
	private String nickName;
	
}
