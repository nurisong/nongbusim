package com.kh.nbs.market.model.service;

import java.util.ArrayList;

import com.kh.nbs.common.model.vo.Comment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.model.vo.Recomment;
import com.kh.nbs.market.model.vo.Market;

public class MarketServiceImpl implements MarketService{

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Market> marketSelectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
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
	public int marketInsertForm(Market market) {
		// TODO Auto-generated method stub
		return 0;
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
