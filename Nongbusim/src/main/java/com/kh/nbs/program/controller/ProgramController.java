package com.kh.nbs.program.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;
import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.member.model.vo.Member;
import com.kh.nbs.program.model.service.ProgramService;
import com.kh.nbs.program.model.vo.Program;

@Controller
public class ProgramController {
	
	@Autowired
	private ProgramService programService;

		@RequestMapping("list.pr")
		public ModelAndView selectList(@RequestParam(value="cpage",defaultValue="1") int currentPage, ModelAndView mv) {
			
			int memNo = 1;
			
			
			if(programService.selectMarkNo(memNo) != null ) {
				
				System.out.println(programService.selectMarkNo(memNo));
				mv.addObject("markNoList",programService.selectMarkNo(memNo));
			}
			
			
			PageInfo pi = Pagination.getPageInfo(programService.selectListCount(), currentPage , 10 , 5);
			
			mv.addObject("pi",pi).addObject("programlist",programService.selectList(pi)).setViewName("program/ProgramBoardList");
			
			
			return mv;
		
		}
		

		@RequestMapping("detail.pr")//dd
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
				
				
				System.out.println(p);
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
		public ModelAndView selectBoard(int bno, ModelAndView mv) {
			
			int memNo = 1; //로그인 임시!!!!!!!!!!!!!!!!!!
			
			
			if(programService.selectProgramNo(memNo) != null) {
				
				
				mv.addObject("programList", programService.selectProgramNo(memNo));
				
			}
			
			
			if( programService.selectProgram(bno) != null ) { //키값과 똑같은 이름의 매개변수, int형으로 쓰면 알아서 파싱
				
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
			
			return mv;
		}
		
		
		
		@ResponseBody
		@RequestMapping("wish.pr")
		public void wishProgram(int programNo) {
			
			programService.wishProgram(programNo);
			
			
			//return "redirect:list.pr?cpage="+programNo;
		}
		
		
		@ResponseBody
		@RequestMapping("wishDelete.pr")
		public void wishDeltete(int programNo) {
			
			programService.wishDelete(programNo);
			
		}
			
		
		
		

	
	
}
