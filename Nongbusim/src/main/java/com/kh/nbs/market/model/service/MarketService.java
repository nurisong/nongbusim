package com.kh.nbs.market.model.service;

import java.util.ArrayList;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.Comment;
import com.kh.nbs.common.model.vo.Mark;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.model.vo.Recomment;
import com.kh.nbs.market.model.vo.Market;

public interface MarketService {
	
	
	//게시글 총 갯수 조회 메소드
	//게시판 리스트 조회 메소드
	//게시판 첨부파일(썸네일) 조회 메소드
	int selectListCount();
	ArrayList<Market> marketSelectList(PageInfo pi);
	ArrayList<Attachment> attachmentSelectList();
	
	//카테고리 설정시 게시판 조회 총갯수 조회 메소드
	int selectListCount(String marketCategory);
	ArrayList<Market> marketSelectListCategory(PageInfo pi, String marketCategory);
	ArrayList<Attachment> attachmentSelectListCategory(String marketCategory);
	
	
	//게시물 조회수 증가 메소드
	//게시물 상세조회 메소드
	//게시물 첨부파일 조회 메소드
	int increaseCount(Market market);
	Market marketDetailView(Market market);
	ArrayList<Attachment> marketDetailAttachment(Market market);
	

	//게시물 작성 메소드
	//첨부파일 업로드 메소드
	int insertMarket(Market market);
	int insertAttachment(Attachment a);
	
	
	//게시물 수정 메소드
	int marketUpdate(Market market);
	
	//게시물 삭제 메소드
	int marketDeleteAttachment(int marketNo);
	int marketDelete(int marketNo);
	
	
	
	//댓글 작성 메소드
	int ajaxInsertMarketComment(Comment comment);
	
	//댓글 리스트 조회 메소드
	ArrayList<Comment> ajaxSelectListMarketComment(Comment comment);
	
	//댓글 삭제 메소드
	int ajaxDeleteMarketComment(Comment comment);
	
	//댓글 수정 메소드
	
	int ajaxUpdateMarketComment(Comment comment);
	
	
	//대댓글 리스트 조회 메소드
	ArrayList<Recomment> selectRecommentList(int cno);
	
	//대댓글 작성 메소드
	int insertRecomment(Recomment r);
	
	//대댓글 수정 메소드
	int updateRecomment(int rcno);
	
	//대댓글 삭제 메소드
	int deleteRecomment(int rcno);
	
	
	
	//찜하기 리스트 불러오기 메소드
	ArrayList<Mark> ajaxMarkMarket(int memNo);
	
	//찜하기 메소드
	int ajaxClickMarkMarket(Mark mark);
	
	//찜하기 해제 메소드
	int ajaxClickUnmarkMarket(Mark mark);
	
	//찜하기 불러오기 메소드
	Mark markMarket(Market market);
	
	
	
	//메인페이지에 뿌려줄 리스트 3개만 가져오는 메소드
	ArrayList<Market> ajaxMainMarketList();
	
	
}
