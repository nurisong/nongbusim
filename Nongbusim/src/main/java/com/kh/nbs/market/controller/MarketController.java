package com.kh.nbs.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MarketController {

	
	//寃뚯떆�뙋�쑝濡� �씠�룞
	@RequestMapping("list.mk")
	public String marketSelectList() {
		
		return "market/marketListView";
		
	}
	
	
	//寃뚯떆臾쇱긽�꽭�솕硫댁쑝濡� �씠�룞
	@RequestMapping("detail.mk")
	public String marketDetailView() {
		
		return "market/marketDetailView";
		
		
		
	}
	
}
