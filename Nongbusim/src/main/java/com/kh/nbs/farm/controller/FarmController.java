package com.kh.nbs.farm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FarmController {
	
	@RequestMapping("list.fm")
	public String farmListView() {
		// 전체 농장 리스트 뽑아오기
		return "farm/farmListView";
	}
	
	@RequestMapping("detail.fm")
	public String farmDetailView() {
		// 농장 번호 뽑아서 조회
		return "farm/farmDetailView";
	}

}
