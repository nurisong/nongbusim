package com.kh.nbs.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.member.model.vo.Member;

@Repository
public class MemberDao {
	
	
	// 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	
	// 일반 사용자 회원가입
	public int userInsertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.userInsertMember", m);
	}
	
	// 농부 회원가입
	public int farmerInsertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.farmerInsertMember", m);
	}
	
	// 일반 사용자 수정
	public int updateUser(SqlSessionTemplate sqlSession, Member m) {
//		System.out.println("Dao : " + m);

		return sqlSession.update("memberMapper.updateUser", m);
	}

	// 아이디 찾기
//	public Member findId(SqlSessionTemplate sqlSession, String memPwd) {
//		return sqlSession.selectOne("memberMapper.findId", memPwd);
//	}
}
