package com.kh.nbs.farm.model.vo;

import lombok.Data;

@Data
public class Farm {

	private int farmNo;
	private int farmer;
	private String farmName;
	private String farmIntro;
	private String localCode;
	private String address;
	private String phone;
	private String createDate;
	private String status;
	private String crop;
	private String mainImg;
	private String programName;
	private String programNo;
}

