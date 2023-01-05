package com.kh.nbs.farm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FarmController {
	
	@RequestMapping("list.fm")
	public String farmListView() {
		return "farm/farmListView";
	}

}
