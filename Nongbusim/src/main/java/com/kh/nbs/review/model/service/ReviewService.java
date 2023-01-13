package com.kh.nbs.review.model.service;

import com.kh.nbs.review.model.vo.Review;

public interface ReviewService {
	
	//리뷰 작성
	int reviewInsert(Review r);
	
}
