package com.kh.nbs.program.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;
import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.member.model.vo.Member;
import com.kh.nbs.program.model.service.ProgramService;
import com.kh.nbs.program.model.vo.Program;
import com.kh.nbs.review.model.service.ReviewService;

@Controller
public class ProgramController {
	
	@Autowired
	private ProgramService programService;
	
	@Autowired
	private ReviewService reviewService;
			
		//프로그램 리스트 불러오기
		@RequestMapping("list.pr")
		public ModelAndView selectList(@RequestParam(value="cpage",defaultValue="1") int currentPage,@RequestParam(value="keyword", required=false, defaultValue="") String keyword,HttpSession session , ModelAndView mv) {
			
			
			HashMap map= new HashMap();//
			map.put("keyword", keyword);//
			
			
			if(((Member)session.getAttribute("loginUser"))!=null) {
			
				int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			
			if(programService.selectMarkNo(memNo) != null ) {
				
				mv.addObject("markNoList",programService.selectMarkNo(memNo));
			}
			
			}
			
			PageInfo pi = Pagination.getPageInfo(programService.selectProgramCount(map), currentPage , 10 , 5);
			mv.addObject("pi",pi).addObject("programlist",programService.selectList(pi,map));
			mv.addObject("map", map);
			mv.setViewName("program/ProgramBoardList");
			
			return mv;
		}
		
		@RequestMapping("detail.pr")
		public String programDetailView() {
				
			return "program/ProgramDetail";
		}
		
		@RequestMapping("enrollForm.pr")
		public String enrollForm(Program p, Model model,HttpSession session) {
			
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			
			ArrayList<Farm> list = programService.selectMyFarmList(memNo);
			
			model.addAttribute("list", list);
			
			return "program/ProgramRegister";
		}
		
		@RequestMapping("insert.pr")//dd
		public String programRegister(Program p, MultipartFile upfile, HttpSession session, Model model) {
				
			 int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			
			if(!upfile.getOriginalFilename().equals("")) {
				
				String originName = upfile.getOriginalFilename();
				
				
				// "20221226103530"(년월일시분초)
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				
				//12321(5자리 랜덤값)
				
				int ranNum = (int)(Math.random()*90000+10000);
				// 확장자
				String ext = originName.substring(originName.lastIndexOf("."));
				
				String changeName = currentTime + ranNum + ext;
				
				// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
				String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
				p.setOriginName(upfile.getOriginalFilename()); //원본명
				p.setChangeName("resources/uploadFiles/" + saveFile(upfile, session));
				
			}
			
			if(programService.programRegister(p)> 0) { //성공 => 게시글 리스트 페이지
				
				session.setAttribute("alertMsg", "프로그램이 등록 되었습니다.");
				return "redirect:list.pr";
				
				
			} else {
				model.addAttribute("errorMsg", "게시글 작성 실패..");
				return "common/errorPage";
			}
			
		}
		
		public String saveFile(MultipartFile upfile, HttpSession session) { // 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
			
			// 파일 명 수정 작업 후 서버에 업로드 시키기("image.png" =? 202212371232.png)
			String originName = upfile.getOriginalFilename();
			
			
			// "20221226103530"(년월일시분초)
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			//12321(5자리 랜덤값)
			int ranNum = (int)(Math.random()*90000+10000);
			// 확장자
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + ranNum + ext;
			
			// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
			
		}
		
		@RequestMapping("detail.pro")
		public ModelAndView selectBoard(int bno, ModelAndView mv,HttpSession session) {
			
			
			
			if(((Member)session.getAttribute("loginUser"))!=null) {
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo(); 
			
			
			if(programService.selectProgramNo(memNo) != null) {
				//신청한지 조회
				mv.addObject("programList", programService.selectProgramNo(memNo));
				}
			}
			
			if( programService.selectProgram(bno) != null ) { 
				mv.addObject("p", programService.selectProgram(bno)).addObject("bno",bno).setViewName("program/ProgramDetail");
				
			} else {
				
				mv.addObject("errorMsg","게시글 조회 실패").setViewName("common/errorPage");
			}
			
			
			return mv;
		}
			
		@RequestMapping("join.pr")
		public ModelAndView joinProgram(Program p, ModelAndView mv, HttpSession session) {
			
			if(programService.joinProgram(p) > 0) {
				
				session.setAttribute("alertMsg", "프로그램 신청이 되었습니다.");
				mv.setViewName("redirect:list.pr");
				
			}else {
				mv.addObject("errorMsg","신청 실패").setViewName("common/errorPage");
			}

			
			//현재 신청 회원 증가
			programService.headCountIncrease(p);
			
			return mv;
		}
		
		
		@ResponseBody
		@RequestMapping("wish.pr")
		public void wishProgram(Program p) {
			
			programService.wishProgram(p);
		}
		
		
		@ResponseBody
		@RequestMapping("wishDelete.pr")
		public void wishDeltete(Program p) {
			
			programService.wishDelete(p);
			
		}
		
		//마이페이지에서 여기로 내가 참여한프로그램 조회
		@RequestMapping("myProgramlist.re")
		public ModelAndView selectMyProgram (@RequestParam(value="cpage",defaultValue="1") int currentPage,HttpSession session , ModelAndView mv) {
			
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			
			PageInfo pi = Pagination.getPageInfo(programService.selectListCount(), currentPage , 10 , 10);
			
			
			mv.addObject("myReviewlist",reviewService.selectMyReview(memNo));
			
			if(programService.selectMyProgram(memNo,pi) != null ) {
				//내가참여한 프로그램
				mv.addObject("pi", pi).addObject("myProgramList",programService.selectMyProgram(memNo,pi)).setViewName("review/ReviewInsert");
				//System.out.println(programService.selectMyProgram(memNo));
			}
			
			
			return mv;
		}
		
		
		//신청자 많은 프로그램 TOP5
		@ResponseBody
		@RequestMapping(value = "topList.pr", produces="application/json; charset=UTF-8")
		public String ajaxTopProgramList() {
			
			//System.out.println(programService.selectTopProgram());
			return new Gson().toJson(programService.selectTopProgram());
			
			
		}
		
		
		
	
}
