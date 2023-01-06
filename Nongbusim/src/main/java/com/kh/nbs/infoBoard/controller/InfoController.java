package com.kh.nbs.infoBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	
	@RequestMapping("list.if")
	public String infoListView() {
		// 글 전체 리스트 조회해오기
		return "infoBoard/infoBoardListView";
	}
	
	@RequestMapping("detail.if")
	public String infoDetailNew() {
		// 글번호 뽑아서 조회
		return "infoBoard/infoBoardDetailView";
	}

}
