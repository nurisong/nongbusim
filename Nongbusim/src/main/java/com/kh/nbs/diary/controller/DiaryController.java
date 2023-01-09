package com.kh.nbs.diary.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.diary.model.service.DiaryService;

@Controller
public class DiaryController {
	
	@Autowired
	private DiaryService diaryService;
	// dummy memNo
	int memNo = 1; 

	@ResponseBody	
	@RequestMapping(value="calEventList.di", produces="application/json; charset=UTF-8")
	public ModelAndView selectCalEventList (HttpSession session) {
		// session.getAttribute("loginUser")

		diaryService.selectCalEventList(memNo);
		return null;
		
	}
	

	// diaryListView
	
	@RequestMapping("list.di")
	public ModelAndView selectCategoryList(ModelAndView mv) {
		ArrayList<String> categoryList= diaryService.selectCategoryList(memNo);
		
		mv.addObject("categoryList", categoryList).setViewName("member/myPageFarmer/diary/diaryListView");
		
		return mv;
	}
	
	
	@RequestMapping("selectDiaryList")
	public ModelAndView selectDiar
	
	
	@RequestMapping("enrollForm.di")
	public String diaryEnrollForm() {
		return "member/myPageFarmer/diary/diaryEnrollForm" ;
		
	}
	
	@RequestMapping("calView.di")
	public String diaryCalView() {
		return "member/myPageFarmer/diary/diaryCalView" ;
		
	}
	
	

}
