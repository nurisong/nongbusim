package com.kh.nbs.program.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.program.model.service.ProgramService;
import com.kh.nbs.program.model.vo.Program;

@Controller
public class ProgramController {
	
	@Autowired
	private ProgramService programService;

		@RequestMapping("list.pr")
		public String programListView() {
			
			return "program/ProgramBoardList";
		
		}
			

		@RequestMapping("detail.pr")//dd
		public String programDetailView() {
				
			return "program/ProgramDetail";
			
		}
		
		@RequestMapping("register.pr")//dd
		public String programRegister(Program p, HttpSession session, Model model) {
				
			int memNo=1; 
			
			ArrayList<Farm> list = programService.selectFarmList(memNo);
			
			System.out.println(list);
			//System.out.println();
			
			model.addAttribute("list", list);
			return "program/ProgramRegister";
			
			
			
		}
			
			
			
		
		
		

	
	
}
