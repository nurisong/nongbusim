package com.kh.nbs.search.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.search.model.vo.Search;


@Repository
public class SearchDao {
	


	public ArrayList recommendKeyword(SqlSessionTemplate sqlSession, Search search) {
		return (ArrayList)sqlSession.selectList("searchMapper.recommendKeyword", search);
	}

	public ArrayList<Search> selectBoardList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("searchMapper.searchBoardList", keyword);
	}

	public ArrayList<Search> selectFarmList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("searchMapper.searchFarmList", keyword);
	}

	public ArrayList<Search> selectInfoBoardList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("searchMapper.searchInfoBoardList", keyword);
	}

	public ArrayList<Search> selectMarketList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("searchMapper.searchMarketList", keyword);
	}

	public ArrayList<Search> selectProgramList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("searchMapper.searchProgramList", keyword);
	}

	public ArrayList<Attachment> searchAttachmentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("searchMapper.searchAttachmentList");
	}

}
