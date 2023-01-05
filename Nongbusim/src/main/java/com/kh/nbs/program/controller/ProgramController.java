package com.kh.nbs.program.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;
import com.kh.nbs.program.model.service.ProgramService;

@Controller
public class ProgramController {
	
	@Autowired
	private ProgramService programService;

		@RequestMapping("register.pr")
		public String programRegisterView() {
		
			return "program/ProgramRegister";
	
		}
	
		@RequestMapping("list.pr")
		public String programListView(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model, ModelAndView mv) {
			
		
			
		    PageInfo pi = Pagination.getPageInfo( programService.selectListCount(), currentPage, 10, 5);

		    model.addAttribute("pi", pi);
		    model.addAttribute("list",programService.selectList(pi));
		    
			return "program/ProgramBoardList";

		
		}
			

		@RequestMapping("detail.pr")
		public String programDetailView() {
				
			return "program/ProgramDetail";
			
		}
			
			
		
		
		

	
	
}
