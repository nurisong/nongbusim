package com.kh.nbs.diary.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.diary.model.service.DiaryService;

@Controller
public class DiaryController {
	
	@Autowired
	private DiaryService diaryService;

	@ResponseBody	
	@RequestMapping(value="calEventList.di", produces="application/json; charset=UTF-8")
	public ModelAndView selectCalEventList (HttpSession session) {
		// session.getAttribute("loginUser")
		int memNo = 1; 
		diaryService.selectCalEventList(memNo);
		return null;
		
	}
	
	
	@RequestMapping("list.di")
	public String diaryList() {
		return "member/myPageFarmer/diary/diaryListView" ;
		
	}
	
	@RequestMapping("enrollForm.di")
	public String diaryEnrollForm() {
		return "member/myPageFarmer/diary/diaryEnrollForm" ;
		
	}
	
	@RequestMapping("calView.di")
	public String diaryCalView() {
		return "member/myPageFarmer/diary/diaryCalView" ;
		
	}
	
	 @GetMapping("calList.di") //ajax 데이터 전송 URL
	    public @ResponseBody List<Map<String, Object>> getEvent(){
			  return diaryService.selectCalList();
	    }
	

}
