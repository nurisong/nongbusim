package com.kh.nbs.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.Comment;
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
	
	//사진 리스트 조회,
	ArrayList<Attachment> attachmentSelectList();
	
	//게시글 삭제
	int deleteAttachment(Board b); 
	int deleteBoard(Board b);
	
	//좋아요 입력
	int insertLike(Board b);
	//좋아요 삭제
	int deleteLike(Board b);
	//좋아요 수 조회
	int selectLikeCount(Board b);
	//좋아요 조회
	int selectLike(HashMap map);
	//좋아요 증가
	int increaseLike(Board b);
	//좋아요 갑소
	int decreaseLike(Board b);
	
	
	ArrayList<Board> selectListOrder(Board b,PageInfo pi);
	
	int selectSearchListCount(HashMap map);
	ArrayList<Board> selectSearchList(PageInfo pi, HashMap map);
	
	// 댓글 리스트 조회서비스(Ajax)(select)
	ArrayList<Comment> selectReplyList(int boardNo);
	// 댓글 작성 서비스 (Ajax)(insert)
	int insertReply(Comment c);
	
	

	
	
}
