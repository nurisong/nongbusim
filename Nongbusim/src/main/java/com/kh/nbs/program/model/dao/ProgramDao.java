package com.kh.nbs.program.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.program.model.vo.Program;

@Repository	
public class ProgramDao {
	
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("programMapper.selectListCount");
		
	}
	
	public ArrayList<Program> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("programMapper.selectList", null, rowBounds);
		
		
	}


	public int programRegister(SqlSessionTemplate sqlSession,Program p) {
		
		return sqlSession.insert("programMapper.registerProgram",p);
		
	}
	
	public ArrayList<Farm> selectFarmList(SqlSessionTemplate sqlSession,int memNo){
		
		return (ArrayList)sqlSession.selectList("farmMapper.selectFarmList",memNo);
	}
	
	public Program selectProgram(SqlSessionTemplate sqlSession, int programdNo){
		
		return sqlSession.selectOne("programMapper.selectProgram",programdNo);
		
	}
	
	
	public int joinProgram(SqlSessionTemplate sqlSession, Program p) {
		
		
		return sqlSession.insert("programMapper.joinProgram",p);
		
	}
	
	

}
