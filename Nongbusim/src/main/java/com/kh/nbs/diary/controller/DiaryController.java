package com.kh.nbs.diary.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.diary.model.service.DiaryService;
import com.kh.nbs.diary.model.vo.Diary;
import com.kh.nbs.member.model.vo.Member;

@Controller
public class DiaryController {
	
	@Autowired
	private DiaryService diaryService;
	// dummy memNo
	
	

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="calEventList.di",
	 * produces="application/json; charset=UTF-8") public ModelAndView
	 * selectCalEventList (HttpSession session) { //
	 * session.getAttribute("loginUser")
	 * 
	 * diaryService.selectCalEventList(memNo); return null;
	 * 
	 * }
	 */	

	// diaryListView 진입시 사용자가 등록한 category를 select태그로 뿌려주기 위한 메소드
	
	@RequestMapping("list.di")
	public ModelAndView selectCategoryList(ModelAndView mv, HttpSession session ) {
		
		int memNo=((Member)session.getAttribute("loginUser")).getMemNo();
		mv.addObject("categoryList", diaryService.selectCategoryList(memNo)).setViewName("member/myPageFarmer/diary/diaryListView");
		
		return mv;
	}
	
	// 사용자가 
	@ResponseBody
	@RequestMapping(value="selectDiaryList.di", produces="application/json; charset=UTF-8")
	public String selectDiaryList(Diary diary, HttpSession session) {
		
		int memNo= ((Member)session.getAttribute("loginUser")).getMemNo();
		
		diary.setMemNo(memNo);
		System.out.println(diary);
		return new Gson().toJson(diaryService.selectDiaryList(diary));	
	}
	
	@RequestMapping("enrollForm.di")
	public ModelAndView diaryEnrollForm(ModelAndView mv, HttpSession session) {
		Member loginUser= (Member)session.getAttribute("loginUser");
		mv.addObject("categoryList", diaryService.selectCategoryList(loginUser.getMemNo())).setViewName("member/myPageFarmer/diary/diaryErollForm");
		
		return mv ;
		
	}
	
	private String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()* 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return changeName;
	}
	
	@RequestMapping("insert.di")
	public String insertDiary(Diary diary, ModelAndView mv, MultipartFile[] upfiles, HttpSession session, Attachment a) {
		ArrayList dAtList;
		System.out.println(diary);
		System.out.println(upfiles);
		if(diaryService.insertDiary(diary)>0) {
			
			int diaryNo = diary.getDiaryNo();
			
			for(MultipartFile upfile: upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {
					
					dAtList= new ArrayList();
					
					a.setBoardNo(diaryNo);
					a.setBoardType("D");
					a.setOriginName(upfile.getOriginalFilename());
					a.setChangeName("resources/uploadFiles/" + saveFile(upfile, session)); 
					
					if(diaryService.insertAttachment(a) > 0) {
						
						dAtList.add(a);
						
						
					} else {
						
						return "common/errorPage";
						
					}
		
				}
			} 
			session.setAttribute("alertMsg", "영농일지 작성 성공");
			return "redirect:/list.di";
		} else {
			
			session.setAttribute("alertMsg", "영농일지 작성 성공");
			
		return "common/errorPage";
		}
	}
	


	@RequestMapping("calView.di")
	public String diaryCalView() {
		return "member/myPageFarmer/diary/diaryCalView" ;
		
	}
	
	@RequestMapping("detail.di")
	public ModelAndView selectDiary(@RequestParam(value="dno") int diaryNo, ModelAndView mv) {
		mv.addObject("diary", diaryService.selectDiary(diaryNo)).setViewName("member/myPageFarmer/diary/diaryDetailView");
		
		System.out.println(diaryService.selectDiary(diaryNo));
		
		return mv;
	}
	
	

}
