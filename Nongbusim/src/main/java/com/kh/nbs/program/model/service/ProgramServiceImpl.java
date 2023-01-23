package com.kh.nbs.program.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.common.model.vo.Mark;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.program.model.dao.ProgramDao;
import com.kh.nbs.program.model.vo.Program;

@Service
public class ProgramServiceImpl implements ProgramService {

	
	@Override
	public int selectProgramCount(HashMap map) {
		return programDao.selectProgramCount(map, sqlSession);
	}
	
	
	@Autowired
	private ProgramDao programDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return programDao.selectListCount(sqlSession);
	}

	
	@Override
	public ArrayList<Program> selectList(PageInfo pi,HashMap map) {
		return programDao.selectList(sqlSession,pi,map);
	}

	@Override
	public int programRegister(Program p) {
		
		return programDao.programRegister(sqlSession,p);
	}

	@Override
	public ArrayList<Farm> selectMyFarmList(int memNo) {
		return programDao.selectMyFarmList(sqlSession,memNo);
	}


	@Override
	public Program selectProgram(int programNo) {
		return programDao.selectProgram(sqlSession,programNo);
	}
	
	@Override
	public int joinProgram(Program p) {
		return programDao.joinProgram(sqlSession,p);
	}

	@Override
	public ArrayList selectProgramNo(int memNo) {
		return programDao.selectProgramNo(sqlSession,memNo);
	}


	@Override
	public int wishProgram(Program p) {
		
		return programDao.wishProgram(sqlSession,p);
	}


	@Override
	public ArrayList<Mark> selectMarkNo(int memNo) {
		return programDao.selectMarkNo(sqlSession,memNo);
	}


	@Override
	public int wishDelete(Program p) {
		return programDao.wishDelete(sqlSession,p);
	}


	@Override
	public int headCountIncrease(Program p) {
		
		return programDao.headCountIncrease(sqlSession,p);
	}


	@Override
	public ArrayList<Program> selectMyProgram(int memNo,PageInfo pi) {
		
		return programDao.selectMyProgram(sqlSession,memNo,pi);
	}


	@Override
	public ArrayList<Program> selectTopProgram() {
		return programDao.selectTopProgram(sqlSession);
	}


	
}
