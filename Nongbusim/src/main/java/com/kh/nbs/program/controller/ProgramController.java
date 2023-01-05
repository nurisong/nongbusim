package com.kh.nbs.program.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProgramController {

		@RequestMapping("list.pr")
		public String programListView() {
			
			return "program/ProgramBoardList";
		
		}
			

		@RequestMapping("detail.pr")//dd
		public String programDetailView() {
				
			return "program/ProgramDetail";
			
		}
			
			
		
		
		

	
	
}
