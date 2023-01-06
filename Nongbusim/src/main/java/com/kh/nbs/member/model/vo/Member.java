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
	private char gender;
	private String email;
	private String enrollDate;
	private char memStatus;
	private int farmerCode;
	private String career;
}
