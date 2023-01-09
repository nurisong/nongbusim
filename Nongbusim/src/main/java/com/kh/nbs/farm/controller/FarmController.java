package com.kh.nbs.farm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nbs.farm.model.service.FarmService;

@Controller
public class FarmController {
	
	@Autowired
	private FarmService farmService;
	
	@RequestMapping("list.fm")
	public String selectFarmList() {
		// 전체 농장 리스트 뽑아오기
		return "farm/farmListView";
	}
	
	@RequestMapping("detail.fm")
	public String farmDetailView() {
		// 농장 번호 뽑아서 조회
		return "farm/farmDetailView";
	}
	
	@RequestMapping("enrollForm.fm")
	public String farmEnrollForm() {
		return "farm/farmEnrollForm";
	}

}
