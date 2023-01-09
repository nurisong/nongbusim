package com.kh.nbs.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MarketController {

	
	
	//게시판으로 이동
	@RequestMapping("list.mk")
	public String marketSelectList() {
		
		return "market/marketListView";
		
	}
	
	
	//게시물상세화면으로 이동
	@RequestMapping("detail.mk")
	public String marketDetailView() {
		
		return "market/marketDetailView";
		
	}
	
	//게시물 작성화면으로 이동
	@RequestMapping("insertForm.mk")
	public String marketInsertForm() {
		return "market/marketInsertForm";
	}
	
	
	//게시물 수정화면으로 이동
	@RequestMapping("updateForm.mk")
	public String marketUpdateForm() {
		return "market/marketUpdateForm";
	}
	
	
	
}
