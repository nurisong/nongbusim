package com.kh.nbs.diary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.nbs.diary.model.service.DiaryService;

@Controller
public class DiaryController {
	
	@Autowired
	private DiaryService diaryService;

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
