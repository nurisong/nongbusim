package com.kh.nbs.review.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.program.model.dao.ProgramDao;
import com.kh.nbs.program.model.vo.Program;
import com.kh.nbs.review.model.dao.ReviewDao;

@Service
public class ReviewServiceImpl implements ReviewService {

	
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Program reviewEnrollForm(int bno) {
		
		return reviewDao.reviewEnrollForm(sqlSession,bno);
		
	}
	
	

}
