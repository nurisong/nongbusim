package com.kh.nbs.program.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.program.model.vo.Program;

public interface ProgramService {

	//검색 키워드
	int selectProgramCount(HashMap map);
	
	int selectListCount();
	
	ArrayList<Farm> selectMyFarmList(int memNo);

	ArrayList<Program> selectList(PageInfo pi,HashMap map);

	int programRegister(Program p);
	
	Program selectProgram(int bno);
	
	int joinProgram(Program p);
	
	ArrayList selectProgramNo(int memNo);
	
	int wishProgram(Program p);
	
	int wishDelete(Program p);
	
	ArrayList selectMarkNo(int memNo);
	
	// 현재 신청환 회원 증가
	int headCountIncrease(Program p);
	
	//마이페이지에서 후기 작성을 위한 그동안 신청한 목록 조회
	ArrayList<Program> selectMyProgram(int memNo,PageInfo pi);
	
	//신청자 많은 프로그램 분석
	ArrayList<Program> selectTopProgram();
	
	
	
}
