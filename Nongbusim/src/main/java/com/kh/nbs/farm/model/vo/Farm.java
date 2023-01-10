package com.kh.nbs.farm.model.vo;

import java.util.ArrayList;

import com.kh.nbs.common.model.vo.Attachment;

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
	private String enrollDate;
	private String status;
	private String crop;
	private ArrayList<Attachment> attaches;
}

