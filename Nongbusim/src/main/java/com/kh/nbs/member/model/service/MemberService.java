package com.kh.nbs.member.model.service;

import com.kh.nbs.member.model.vo.Member;

public interface MemberService {

	// 로그인 (select)
	Member loginMember(Member m);
	
	// 일반 사용자 회원가입 (insert)
	int userInsertMember(Member m);
	
	// 농부 회원가입(insert)
	int farmerInsertMember(Member m);
	
	// 일반 사용자 정보 수정 (update)
	int updateUser(Member m);
	
	// 농부 정보 수정(update)
	int updateFarmer(Member m);
	
	// 일반 사용자 탈퇴 (update)
	int deleteUser(String memId);
	
	// 농부 탈퇴(update)
	int deleteFarmer(String memId);
	
	// 아이디 중복체크 (String checkId)
	int idCheck(String memId);
	
	// 아이디 찾기(select)
//	Member findId(String memPwd);
}
