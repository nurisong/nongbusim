package com.kh.nbs.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MarketController {

	
	
	@RequestMapping("list.mk")
	public String MarketselectList() {
		
		return "market/marketListView";
		
	}
	
}
