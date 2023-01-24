package com.kh.nbs.search.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.market.model.vo.Market;
import com.kh.nbs.search.model.service.SearchService;
import com.kh.nbs.search.model.vo.Search;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;

	// --------------------------------------------- 검색기능 --------------------------

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

	/*
	 * @RequestMapping("search.me") public ModelAndView searchList( ModelAndView mv,
	 * String keyword) { //boardType S K, Q, M
	 * 
	 * HashMap map= new HashMap(); map.put("boardType", "S"); map.put("keyword",
	 * keyword); map.put("condition", "all"); map.put("order", "recent");
	 * System.out.println(map);
	 * 
	 * 
	 * boardService.selectListCount(map);
	 * 
	 * System.out.println(boardService.selectListCount(map)); PageInfo pi= new
	 * PageInfo();
	 * 
	 * pi = Pagination.getPageInfo(boardService.selectListCount(map), 1, 10, 8);
	 * 
	 * // 자랑게시판 boardService.selectList(map, pi);
	 * System.out.println(boardService.selectList(map, pi));
	 * 
	 * 
	 * mv.setViewName("search/searchList");
	 * 
	 * return mv; }
	 */
	@RequestMapping("search.me")
	public ModelAndView searchList(ModelAndView mv, HttpSession session, String keyword) {
		System.out.println(keyword);
		// 1. 일반게시판
		// boardType S K, Q, M
				mv.addObject("boardList", searchService.selectBoardList(keyword))
		  .addObject("farmList", searchService.selectFarmList(keyword))
		  .addObject("infoBoardList", searchService.selectInfoBoardList(keyword))
		  .addObject("marketList", searchService.selectMarketList(keyword))
		  .addObject("programList", searchService.selectProgramList(keyword))
		  .addObject("atList",searchService.searchAttachmentList());

		 
		mv.setViewName("search/searchList");

		return mv;

	}
}
