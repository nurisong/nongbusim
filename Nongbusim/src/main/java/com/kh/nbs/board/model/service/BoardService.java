package com.kh.nbs.board.model.service;

import java.util.ArrayList;

import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.common.model.vo.PageInfo;

public interface BoardService {
	
	//게시글 총 개수 조회
	int selectListCount(String boardType);
	
	//게시글 리스트 조회
	ArrayList<Board> selectList(String boardType, PageInfo pi);
}
