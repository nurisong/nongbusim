package com.kh.nbs.market.model.vo;

import lombok.Data;

@Data
public class Market {
	
	private int marketNo;
	private String marketCategory;
	private String marketTitle;
	private int marketPrice;
	private String marketIntro;
	private String marketContent;
	private String marketEnrollDate;
	private int marketCount;
	private String marketStatus;
	private int memNo;
	private String changeName;

}
