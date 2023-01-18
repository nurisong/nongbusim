package com.kh.nbs.review.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.review.model.dao.ReviewDao;
import com.kh.nbs.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//리뷰 작성 메소드
	@Override
	public int reviewInsert(Review r) {
		return reviewDao.reviewInsert(sqlSession,r);
	}

	@Override
	public ArrayList<Review> selectReviewList(PageInfo pi) {
		return reviewDao.selectReviewList(sqlSession,pi);
	}

	@Override
	public int selectReviewCount() {
		return reviewDao.selectReviewCount(sqlSession);
	}

	@Override
	public ArrayList<Review> selectMyReview(int memNo) {
		return reviewDao.selectMyReview(sqlSession,memNo);
	}

	@Override
	public List<Review> reviewSelect(Review r) {
		return reviewDao.reviewSelect(sqlSession,r);
	}

	@Override
	public int reviewUpdate(Review r) {
		return reviewDao.reviewUpdate(sqlSession,r);
	}

	@Override
	public int reviewDelete(Review r) {
		return reviewDao.reviewDelete(sqlSession,r);
	}

	
	
	

}
