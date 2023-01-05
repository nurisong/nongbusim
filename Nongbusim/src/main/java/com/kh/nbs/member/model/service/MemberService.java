package com.kh.nbs.member.model.service;

import com.kh.nbs.member.model.vo.Member;

public interface MemberService {

	// 로그인 (select)
	Member loginMember(Member m);
	
	// 회원가입 (insert)
	int insertMember(Member m);
	
	// 회원 정보 수정 (update)
	int updateMember(Member m);
	
	// 회원 탈퇴 (update)
	int deleteMember(String memId);
	
	// 아이디 중복체크 (Strign checkId)
	int idCheck(String checkId);
}
