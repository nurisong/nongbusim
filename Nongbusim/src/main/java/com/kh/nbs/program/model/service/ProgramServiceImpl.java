package com.kh.nbs.program.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.program.model.dao.ProgramDao;
import com.kh.nbs.program.model.vo.Program;

@Service
public class ProgramServiceImpl implements ProgramService {

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Program> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(Program p) {
		// TODO Auto-generated method stub
		return 0;
	}
	
//	@Autowired
//	private ProgramDao programDao;
//	
//	@Autowired
//	private SqlSessionTemplate sqlSession;
//
//	@Override
//	public int selectListCount() {
//		return programDao.selectListCount(sqlSession);
//	}
////
//	@Override
//	public ArrayList<Program> selectList(PageInfo pi) {
//		return programDao.selectListCount(sqlSession,pi);
//	}
//
//	@Override
//	public int insertBoard(Program p) {
//		return 0;
//	}
//
//	@Override
//	public Program selectProgram(int programNo) {
//		return null;
//	}
//
//	@Override
//	public int deleteProgram(int programNo) {
//		return 0;
//	}
//
//	@Override
//	public int updateProgram(Program p) {
//		return 0;
//	}

}
