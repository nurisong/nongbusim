package com.kh.nbs.program.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.program.model.vo.Program;

@Repository	
public class ProgramDao {
	
	public int selectProgramCount(HashMap map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("programMapper.selectProgramCount",map);
	}
	
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("programMapper.selectListCount"); 
		
	}
	
	public ArrayList<Program> selectList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap map){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("programMapper.selectList", map, rowBounds);
		
		//map만 지우면됨
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
	
	
	
	public ArrayList selectMarkNo(SqlSessionTemplate sqlSession, int memNo) {
		
		return (ArrayList)sqlSession.selectList("programMapper.selectMarkNo",memNo);
		
	}
	
	public int wishProgram(SqlSessionTemplate sqlSession, Program p) {
		
		return sqlSession.insert("programMapper.wishProgram",p);
		
		
	}
	
	public int wishDelete(SqlSessionTemplate sqlSession, Program p) {
		
		
		return sqlSession.update("programMapper.wishDelete",p);
		
	}
	
	public int headCountIncrease(SqlSessionTemplate sqlSession, Program p) {
		
		return sqlSession.update("programMapper.headCountIncrease",p);
		
	}
	
	public ArrayList<Program> selectMyProgram(SqlSessionTemplate sqlSession, int memNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("programMapper.selectMyProgram",memNo, rowBounds);
	}
	
	public ArrayList<Program> selectTopProgram(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("programMapper.selectTopProgram");
	}
	
	

}
