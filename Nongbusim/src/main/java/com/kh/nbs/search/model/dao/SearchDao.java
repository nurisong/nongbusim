package com.kh.nbs.search.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.search.model.vo.Search;


@Repository
public class SearchDao {
	
	


	public ArrayList recommendKeyword(SqlSessionTemplate sqlSession, Search search) {
		return (ArrayList)sqlSession.selectList("searchMapper.recommendKeyword", search);
	}

	public ArrayList<Search> selectBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("searchMapper.selectBoardList");
	}

	public ArrayList<Search> selectFarmList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("searchMapper.selectFarmList");
	}

	public ArrayList<Search> selectInfoBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("searchMapper.selectInfoBoardList");
	}

	public ArrayList<Search> selectMarketList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("searchMapper.selectMarketList");
	}

	public ArrayList<Search> selectProgramList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("searchMapper.selectProgramList");
	}

}
