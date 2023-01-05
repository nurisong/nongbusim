package com.kh.nbs.infoBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	
	@RequestMapping("list.if")
	public String infoListView() {
		return "infoBoard/infoBoardListView";
	}

}
