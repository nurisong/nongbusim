package com.kh.nbs.program.model.service;

import java.util.ArrayList;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.program.model.vo.Program;

public interface ProgramService {
	
	//�Խñ� �� ���� 
	int selectListCount();
	
	//�Խñ� ����Ʈ ��ȸ
	ArrayList<Program> selectList(PageInfo pi);
	
	//�Խñ� �ۼ�
	int insertBoard(Program p);
	
	//�Խñ� �� ��ȸ
	Program selectProgram(int programNo);
	
	//�Խñ� ����
	int deleteProgram(int programNo);
	
	//�Խñ� ����
	int updateProgram(Program p);
	
	
	
	
	

}
