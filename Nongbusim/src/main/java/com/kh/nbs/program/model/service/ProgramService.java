package com.kh.nbs.program.model.service;

import java.util.ArrayList;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.program.model.vo.Program;

public interface ProgramService {
	
	//게시글 총 개수 
	int selectListCount();
	
	//게시글 리스트 조회
	ArrayList<Program> selectList(PageInfo pi);
	
	//게시글 작성
	int insertBoard(Program p);
	
	//게시글 상세 조회
	Program selectProgram(int programNo);
	
	//게시글 삭제
	int deleteProgram(int programNo);
	
	//게시글 수정
	int updateProgram(Program p);
	
	
	
	
	

}
