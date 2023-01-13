package com.kh.nbs.member.model.vo;

import lombok.Data;

@Data
public class Member {

	private int memNo;
	private String memId;
	private String memPwd;
	private String name;
	private String nickName;
	private String phone;
	private String gender;
	private String email;
	private String enrollDate;
	private String memStatus;
	private String farmerCode;
	private String career;
	private String modifyDate;
	private String updatePwd;
}
