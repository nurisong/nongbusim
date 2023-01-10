package com.kh.nbs.program.model.service;

import java.util.ArrayList;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.program.model.vo.Program;

public interface ProgramService {

	int selectListCount();
	
	ArrayList<Farm> selectFarmList(int memNo);

	ArrayList<Program> selectList(PageInfo pi);

	int programRegister(Program p);
	
	Program selectProgram(int bno);
	
	int joinProgram(Program p);
	
	ArrayList selectProgramNo(int memNo);
	
	void wishProgram(Program p);
	
}
