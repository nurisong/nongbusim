package com.kh.nbs.farm.model.vo;

import lombok.Data;

@Data
public class Farm {

	private int farmNo;
	private int farmer;
	private String farmName;
	private String localCode;
	private String address;
	private String phone;
	private String enrollDate;
	private String status;
	private String crop;
}

