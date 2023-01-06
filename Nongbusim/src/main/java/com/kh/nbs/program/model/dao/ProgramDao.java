package com.kh.nbs.program.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.program.model.vo.Program;

@Repository	
public class ProgramDao {


	public int programRegister(SqlSessionTemplate sqlSession,Program p,int memNo) {
		
		return sqlSession.insert("programMapper.registerProgram",p,memNo);
		
		
	}
	
	


}
