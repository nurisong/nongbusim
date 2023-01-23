package com.kh.nbs.search.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.search.model.dao.SearchDao;
import com.kh.nbs.search.model.vo.Search;

@Service
public class SearchServiceImpl implements SearchService {

	
	@Autowired
	private SearchDao searchDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList recommendKeyword(Search search) {
		return searchDao.recommendKeyword(sqlSession, search);
	}

	@Override
	public ArrayList<Search> selectBoardList() {
		return searchDao.selectBoardList(sqlSession);
	}

	@Override
	public ArrayList<Search> selectFarmList() {
		return searchDao.selectFarmList(sqlSession);
	}

	@Override
	public ArrayList<Search> selectInfoBoardList() {
		return searchDao.selectInfoBoardList(sqlSession);
	}

	@Override
	public ArrayList<Search> selectMarketList() {
		return searchDao.selectMarketList(sqlSession);
	}

	@Override
	public ArrayList<Search> selectProgramList() {
		return searchDao.selectProgramList(sqlSession);
	}
	

	/*
	 * @Override public int reviewInsert(Review r) { return
	 * reviewDao.reviewInsert(sqlSession,r); }
	 */
	
	

}
