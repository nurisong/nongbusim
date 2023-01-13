package com.kh.nbs.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.review.model.vo.Review;


@Repository
public class ReviewDao {
	
	
	public int reviewInsert(SqlSessionTemplate sqlSession,Review r) {
		
		return sqlSession.insert("reviewMapper.reviewInsert",r);
	}
	
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession){
		
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewList");
		
	}
	
	public int selectReviewCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.selectReviewCount");
	}

}
