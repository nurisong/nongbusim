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

}
