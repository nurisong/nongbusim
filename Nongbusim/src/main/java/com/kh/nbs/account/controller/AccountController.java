package com.kh.nbs.account.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.account.model.service.AccountService;
import com.kh.nbs.account.model.vo.Account;
import com.kh.nbs.member.model.vo.Member;

@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	
	
	
	
	@RequestMapping("list.ac")
	
	
	public ModelAndView selectCategoryList(ModelAndView mv, HttpSession session ) {

		// accountListView 진입시 user가 등록한  분류(category), 품목(goods)를 select태그로 뿌려주기 위한 메소드 (where memNo=사용자)
		int memNo=((Member)session.getAttribute("loginUser")).getMemNo();
		
		// category와 goods를  각 key(categoryList, goodsList)에 담은
		// haspmap을 반환하는 selectCatAndGoods
		mv.addObject("catAndGoods", (ArrayList<HashMap>)accountService.selectCatAndGoods(memNo))
          .setViewName("member/myPageFarmer/account/accountListView");
		
		return mv;		
	}
	
	
	// list.di 페이지에서 사용자가 검색조건 설정 후 "검색" 버튼 클릭시 이를 만족하는 accountList(table표)를 뿌려주기 위한 메소드 (ajax)
		@ResponseBody
		@RequestMapping(value="selectAccountList.di", produces="application/json; charset=UTF-8")
		public String selectAccountList(Account account, HttpSession session) {
			
			int memNo= ((Member)session.getAttribute("loginUser")).getMemNo();
			
			account.setMemNo(memNo);
			return new Gson().toJson(accountService.selectAccountList(account));	
		}
	
	
	
	@RequestMapping("enrollForm.ac")
	public String accountEnrollForm() {
		return "member/myPageFarmer/account/accountEnrollForm" ;		
	}
		
		
	
}
