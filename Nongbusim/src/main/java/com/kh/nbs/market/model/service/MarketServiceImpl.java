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
	
	
	
	
	
	
	@Override
	public Market marketDetailView(int marketNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int increaseCount(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

	@Override
	public int insertMarket(Market market) {
		return marketdao.insertMarket(market, sqlSession);
	}


	@Override
	public int insertAttachment(Attachment a) {
		return marketdao.insertAttachmentMarket(a, sqlSession);
	}

	
	

	@Override
	public int marketUpdate(Market market) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int marketDelete(int merketNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Comment> selectCommentList(int marketNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertComment(Comment c) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComment(int cno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComment(int cno) {
		// TODO Auto-generated method stub
		return 0;
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
