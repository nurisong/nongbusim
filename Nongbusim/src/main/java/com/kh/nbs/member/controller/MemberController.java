package com.kh.nbs.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.nbs.member.model.service.MemberService;
import com.kh.nbs.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login.me")
	public String loginMember() {
		
		
		
		return "member/login";
	}
	/*
	 * @RequestMapping("login.me") public ModelAndView loginMember(Member m,
	 * ModelAndView mv, HttpSession session) {
	 * 
	 * Member loginUser = memberService.loginMember(m);
	 * 
	 * if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(),
	 * loginUser.getPwd())) {
	 * 
	 * session.setAttribute("loginUser", loginUser); mv.setViewName("redirect:/");
	 * 
	 * } else { // mv.addObject("errorMsg",
	 * "로그인 실패").setViewName("common/errorPage"); }
	 * 
	 * return mv; }
	 */
	
	@RequestMapping("userEnrollForm.me")
	public String userEnrollForm() {	
		return "member/userEnrollForm";
	}
	
	@RequestMapping("farmerEnrollForm.me")
	public String farmerEnrollForm() {	
		return "member/farmerEnrollForm";
	}
	
	@RequestMapping("userInsert.me")
	public String userInsertMember(Member m, Model model, HttpSession session) {
		
//		System.out.println("평문 : " + m.getMemPwd());
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
//		System.out.println("암호문 : " + encPwd);
		
		m.setMemPwd(encPwd);
		
		int result = memberService.userInsertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입에 성공하셨습니다. 로그인 해주세요.");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("farmerInsert.me")
	public String farmerInsertMember(Member m, Model model, HttpSession session) {
		
//		System.out.println("평문 : " + m.getMemPwd());
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
//		System.out.println("암호문 : " + encPwd);
		
		m.setMemPwd(encPwd);
		
		int result = memberService.farmerInsertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입에 성공하셨습니다. 로그인 해주세요.");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}
	
	
	
	
	
	
}
