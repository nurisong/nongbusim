package com.kh.nbs.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	
	@RequestMapping("list.re")
	public String programListView() {
		
		return "review/ReviewBoardList";
	
	}
	

}
