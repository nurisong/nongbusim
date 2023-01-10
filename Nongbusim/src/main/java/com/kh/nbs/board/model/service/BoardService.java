package com.kh.nbs.board.model.service;

import java.util.ArrayList;

import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;

public interface BoardService {
	
	//게시글 총 개수 조회
	int selectListCount(String boardType);
	
	//게시글 리스트 조회
	ArrayList<Board> selectList(String boardType, PageInfo pi);
	
	//게시글 조회, 조회수 증가, 첨부파일 조회
	Board selectBoard(int boardNo);
	int increaseCount(int boardNo);
	ArrayList<Attachment> selectAttachmentDetailBoard(Board b);

	//게시글 추가, 첨부파일 업로드
	int insertBoard(Board b);
	int insertAttachment(Attachment a);
	
	
}
