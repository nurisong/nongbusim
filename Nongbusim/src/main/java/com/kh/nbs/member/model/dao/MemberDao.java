package com.kh.nbs.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.member.model.vo.Member;

@Repository
public class MemberDao {
	
	
	
	
	
	// 일반 사용자 회원가입
	public int userInsertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.userInsertMember", m);
	}
	
	// 농부 회원가입
	public int farmerInsertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.farmerInsertMember", m);
	}

}
