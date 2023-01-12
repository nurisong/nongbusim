package com.kh.nbs.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.review.model.service.ReviewService;

@Controller
public class ReviewController {
	
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("list.re")
	public String reviewListView() {
		
		return "review/ReviewBoardList";
	
	}
	
	
	@RequestMapping("reviewInsert.re")
	public String reviewInsertView() {
		
		return "review/ReviewInsert";
	
	}
	
	
	@RequestMapping("reviewEnrollForm.re")
	public ModelAndView reviewEnrollForm(int bno, ModelAndView mv) {
		
		reviewService.reviewEnrollForm(bno);
		
		return mv;
		
	}
}
