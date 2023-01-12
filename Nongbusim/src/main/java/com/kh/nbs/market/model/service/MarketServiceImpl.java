package com.kh.nbs.market.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.Comment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.model.vo.Recomment;
import com.kh.nbs.market.model.dao.MarketDao;
import com.kh.nbs.market.model.vo.Market;

@Service
public class MarketServiceImpl implements MarketService{

	
	@Autowired
	private MarketDao marketdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	// 게시판 조회
	
	@Override
	public int selectListCount() {
		return marketdao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Market> marketSelectList(PageInfo pi) {
		return marketdao.marketSelectList(pi, sqlSession);
	}

	
	@Override
	public ArrayList<Attachment> attachmentSelectList() {
		return marketdao.attachmentSelectList(sqlSession);
	}
	
	
	
	//게시글 작성

	@Override
	public int insertMarket(Market market) {
		return marketdao.insertMarket(market, sqlSession);
	}


	@Override
	public int insertAttachment(Attachment a) {
		return marketdao.insertAttachmentMarket(a, sqlSession);
	}

	
	
	//게시물 조회
	
	@Override
	public int increaseCount(Market market) {
		return marketdao.increaseCount(market, sqlSession);
	}
	
	
	
	@Override
	public Market marketDetailView(Market market) {
		return marketdao.marketDetailView(market, sqlSession);
	}
	
	@Override
	public ArrayList<Attachment> marketDetailAttachment(Market market) {
		return marketdao.marketDetailAttachment(market, sqlSession);
	}
	
	
	
	
	
	
	
	//게시글 수정
	

	@Override
	public int marketUpdate(Market market) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
	
	//게시글 삭제
	@Override
	public int marketDeleteAttachment(int marketNo) {
		return marketdao.marketDeleteAttachment(marketNo, sqlSession);
	}

	@Override
	public int marketDelete(int marketNo) {
		return marketdao.marketDelete(marketNo, sqlSession);
	}
	
	
	
	
	
	//댓글 작성
	@Override
	public int ajaxInsertMarketComment(Comment comment) {
		return marketdao.ajaxInsertMarketComment(comment, sqlSession);
	}
	
	//댓글 조회
	@Override
	public ArrayList<Comment> ajaxSelectListMarketComment(Comment comment) {
		return marketdao.ajaxSelectListMarketComment(comment, sqlSession);
	}

	
	//댓글 삭제
	@Override
	public int ajaxDeleteMarketComment(Comment comment) {
		return marketdao.ajaxDeleteMarketComment(comment, sqlSession);
	}

	
	
	
	
	
	

	@Override
	public ArrayList<Recomment> selectRecommentList(int cno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertRecomment(Recomment r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRecomment(int rcno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRecomment(int rcno) {
		// TODO Auto-generated method stub
		return 0;
	}


}
