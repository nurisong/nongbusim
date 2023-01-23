package com.kh.nbs.search.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.member.model.vo.Member;
import com.kh.nbs.search.model.service.SearchService;
import com.kh.nbs.search.model.vo.Search;

@Controller
public class SearchController {
	
	@Autowired 
	private SearchService searchService;
	//--------------------------------------------- 검색기능 --------------------------
	

	@RequestMapping("menubarTest.me")
	public ModelAndView menubarTest(ModelAndView mv) {
		mv.setViewName("common/menubar");
		return mv;		
	}
	
	
	// keyup시 검색
	@ResponseBody
	@RequestMapping(value = "recommend.me", produces = "application/json; charset=UTF-8")
	public String recommendKeyword(Search search) {

			return new Gson().toJson(searchService.recommendKeyword(search));
		
	}

	@RequestMapping("search.me")
	public ModelAndView searchList(ModelAndView mv) {
		

		return mv;		
	}
	
	
}
