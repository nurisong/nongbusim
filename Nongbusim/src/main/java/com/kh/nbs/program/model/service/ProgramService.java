package com.kh.nbs.program.model.service;

import java.util.ArrayList;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.program.model.vo.Program;

public interface ProgramService {

	int selectListCount();

	ArrayList<Program> selectList(PageInfo pi);

	int programRegister(Program p, int memNo);

}
