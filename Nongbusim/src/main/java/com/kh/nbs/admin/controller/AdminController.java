package com.kh.nbs.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nbs.admin.model.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("mList.ad")
	public String selectMemberList(Model model) {
		
		model.addAttribute("mList", adminService.selectMemberList());
		System.out.println(adminService.selectMemberList());
		
		return "admin/memberListView";
	}
	
	@RequestMapping("acceptFarmer.ad")
	public String acceptFarmer() {
		// ajax로 농부 신청 승인처리
		return "";
	}
	
	// 회원 탈퇴 처리
	
	// 신고 회원 처리...?(못하려나?)

}
