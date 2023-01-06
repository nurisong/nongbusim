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

	
	@Autowired
	private ProgramDao programDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return 0;
	}

	@Override
	public ArrayList<Program> selectList(PageInfo pi) {
		return null;
	}

	@Override
	public int programRegister(Program p) {
		
		return programDao.programRegister(sqlSession,p);
	}
	
}
