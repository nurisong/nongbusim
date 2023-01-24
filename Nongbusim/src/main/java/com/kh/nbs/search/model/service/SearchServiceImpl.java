package com.kh.nbs.search.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.common.model.vo.Attachment;
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
	public ArrayList<Search> selectBoardList(String keyword) {
		return searchDao.selectBoardList(sqlSession, keyword);
	}

	@Override
	public ArrayList<Search> selectFarmList(String keyword) {
		return searchDao.selectFarmList(sqlSession, keyword);
	}

	@Override
	public ArrayList<Search> selectInfoBoardList(String keyword) {
		return searchDao.selectInfoBoardList(sqlSession, keyword);
	}

	@Override
	public ArrayList<Search> selectMarketList(String keyword) {
		return searchDao.selectMarketList(sqlSession, keyword);
	}

	@Override
	public ArrayList<Search> selectProgramList(String keyword) {
		return searchDao.selectProgramList(sqlSession, keyword);
	}

	@Override
	public ArrayList<Attachment> searchAttachmentList() {
		return searchDao.searchAttachmentList(sqlSession);
	}
	

	/*
	 * @Override public int reviewInsert(Review r) { return
	 * reviewDao.reviewInsert(sqlSession,r); }
	 */
	
	

}
