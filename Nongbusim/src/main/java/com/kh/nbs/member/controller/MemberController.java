package com.kh.nbs.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.member.model.service.MemberService;
import com.kh.nbs.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		
		return mv;
	}
}
