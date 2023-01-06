package com.kh.nbs.program.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.program.model.vo.Program;

@Repository	
public class ProgramDao {


	public int programRegister(SqlSessionTemplate sqlSession,Program p) {
		
		return sqlSession.insert("programMapper.registerProgram",p);
		
		
	}
	
	public ArrayList<Farm> selectFarmList(SqlSessionTemplate sqlSession,int memNo){
		
		
		return (ArrayList)sqlSession.selectList("farmMapper.selectFarmList",memNo);
		
		
	}
	

}
