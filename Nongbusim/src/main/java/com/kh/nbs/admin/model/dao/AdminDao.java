package com.kh.nbs.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.member.model.vo.Member;

@Repository
public class AdminDao {
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList"); 
	}

}
