package com.kh.nbs.account.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nbs.account.model.service.AccountService;

@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	@RequestMapping("list.ac")
	public String accountlist() {
		return "member/myPageFarmer/account/accountListView" ;
		
	}
	
	
	@RequestMapping("enrollForm.ac")
	public String diaryEnrollForm() {
		return "member/myPageFarmer/account/accountEnrollForm" ;
		
	}
	
	
		
	
}
