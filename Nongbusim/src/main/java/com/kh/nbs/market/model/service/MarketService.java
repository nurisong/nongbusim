package com.kh.nbs.market.model.service;

import java.util.ArrayList;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.Comment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.model.vo.Recomment;
import com.kh.nbs.market.model.vo.Market;

public interface MarketService {
	
	
	//게시글 총 갯수 조회 메소드
	//게시판 조회용 메소드
	int selectListCount();
	ArrayList<Market> marketSelectList(PageInfo pi);
	int increaseCount(int boardNo);
	
	//게시물 상세조회 메소드
	Market marketDetailView(int marketNo);

	//게시물 작성 메소드
	//첨부파일 업로드 메소드
	int insertMarket(Market market);
	int insertAttachment(Attachment a);
	
	
	//게시물 수정 메소드
	int marketUpdate(Market market);
	
	//게시물 삭제 메소드
	int marketDelete(int merketNo);
	
	//댓글 리스트 조회 메소드
	ArrayList<Comment> selectCommentList(int marketNo);
	
	//댓글 작성 메소드
	int insertComment(Comment c);
	
	//댓글 삭제 메소드
	int deleteComment(int cno);
	
	//댓글 수정 메소드
	int updateComment(int cno);
	
	//대댓글 리스트 조회 메소드
	ArrayList<Recomment> selectRecommentList(int cno);
	
	//대댓글 작성 메소드
	int insertRecomment(Recomment r);
	
	//대댓글 수정 메소드
	int updateRecomment(int rcno);
	
	//대댓글 삭제 메소드
	int deleteRecomment(int rcno);
	
	//좋아요 메소드
	
	
}
