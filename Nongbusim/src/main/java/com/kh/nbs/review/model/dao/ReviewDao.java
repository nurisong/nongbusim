package com.kh.nbs.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.program.model.vo.Program;


@Repository
public class ReviewDao {
	
	
	
public Program reviewEnrollForm(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("programMapper.selectMarkNo",bno);
		
		
		
	}
	
	

}
