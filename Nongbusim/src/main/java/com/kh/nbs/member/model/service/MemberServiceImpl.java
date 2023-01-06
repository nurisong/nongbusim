package com.kh.nbs.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.member.model.dao.MemberDao;
import com.kh.nbs.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int userInsertMember(Member m) {
		return memberDao.userInsertMember(sqlSession, m);
	}
	
	@Override
	public int farmerInsertMember(Member m) {
		return memberDao.farmerInsertMember(sqlSession, m);
	}


	@Override
	public int updateMember(Member m) {
		return 0;
	}

	@Override
	public int deleteMember(String memId) {
		return 0;
	}

	@Override
	public int idCheck(String checkId) {
		return 0;
	}


}
