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
	
	public ArrayList<Farm> selectMyFarmList(SqlSessionTemplate sqlSession,int memNo){
		
		return (ArrayList)sqlSession.selectList("farmMapper.selectMyFarmList",memNo);
	}
	
	public Program selectProgram(SqlSessionTemplate sqlSession, int programdNo){
		
		return sqlSession.selectOne("programMapper.selectProgram",programdNo);
		
	}
	
	
	public int joinProgram(SqlSessionTemplate sqlSession, Program p) {
		
		
		return sqlSession.insert("programMapper.joinProgram",p);
		
	}
	
	public ArrayList selectProgramNo(SqlSessionTemplate sqlSession, int memNo){
		
		return (ArrayList)sqlSession.selectList("programMapper.selectProgramNo",memNo);
		
	}
	
	
	public int wishProgram(SqlSessionTemplate sqlSession, int programNo) {
		
		return sqlSession.insert("programMapper.wishProgram",programNo);
		
		
	}
	
	
	public ArrayList selectMarkNo(SqlSessionTemplate sqlSession, int memNo) {
		
		return (ArrayList)sqlSession.selectList("programMapper.selectMarkNo",memNo);
		
	}
	
	public int wishDelete(SqlSessionTemplate sqlSession, int programNo) {
		
		
		return sqlSession.update("programMapper.wishDelete",programNo);
		
	}
	

}
