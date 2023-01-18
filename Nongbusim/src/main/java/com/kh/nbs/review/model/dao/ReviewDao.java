package com.kh.nbs.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.review.model.vo.Review;


@Repository
public class ReviewDao {
	
	
	public int reviewInsert(SqlSessionTemplate sqlSession,Review r) {
		return sqlSession.insert("reviewMapper.reviewInsert",r);
	}
	
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession,PageInfo pi){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewList", null, rowBounds);
		
	}
	
	public int selectReviewCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.selectReviewCount");
	}
	
	public ArrayList<Review> selectMyReview(SqlSessionTemplate sqlSession,int memNo) {
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectMyReview", memNo);
		
	}
	
	public List<Review> reviewSelect(SqlSessionTemplate sqlSession,Review r) {
		
		return (List)sqlSession.selectList("reviewMapper.reviewSelect", r);
		
	}
	
	public int reviewUpdate(SqlSessionTemplate sqlSession, Review r) {
		
		return sqlSession.update("reviewMapper.reviewUpdate",r);
		
	}
	
	public int reviewDelete(SqlSessionTemplate sqlSession, Review r) {
		
		return sqlSession.update("reviewMapper.reviewDelete",r);
	}

}
