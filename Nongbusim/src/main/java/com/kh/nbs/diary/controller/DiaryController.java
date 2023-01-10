package com.kh.nbs.diary.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.diary.model.service.DiaryService;
import com.kh.nbs.diary.model.vo.Diary;

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
	

	// diaryListView 진입시 사용자가 등록한 category를 select태그로 뿌려주기 위한 메소드
	
	@RequestMapping("list.di")
	public ModelAndView selectCategoryList(ModelAndView mv) {
		ArrayList<Diary> categoryList= diaryService.selectCategoryList(memNo);
		
		mv.addObject("categoryList", categoryList).setViewName("member/myPageFarmer/diary/diaryListView");
		
		return mv;
	}
	
	// 사용자가 
	@ResponseBody
	@RequestMapping(value="selectDiaryList.di", produces="application/json; charset=UTF-8")
	public String selectDiaryList(Diary diary) {
		
		return new Gson().toJson(diaryService.selectDiaryList(diary));		
		
	}
	
	
	@RequestMapping("enrollForm.di")
	public String diaryEnrollForm() {
		return "member/myPageFarmer/diary/diaryEnrollForm" ;
		
	}
	
	@RequestMapping("calView.di")
	public String diaryCalView() {
		return "member/myPageFarmer/diary/diaryCalView" ;
		
	}
	
	@RequestMapping("detail.di")
	public ModelAndView selectDiary(@RequestParam(value="dno") int diaryNo, ModelAndView mv) {
		mv.addObject("diary", diaryService.selectDiary(diaryNo)).setViewName("member/myPageFarmer/diary/diaryDetailView");
		
		return mv;
	}
	
	

}
