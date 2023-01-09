package com.kh.nbs.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.member.model.service.MemberService;
import com.kh.nbs.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		
		//System.out.println(loginUser);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {
			
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
			
		} else {
			mv.addObject("errorMsg", "로그인 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
//	@RequestMapping("login.me")
//	public String loginMember(Member m, Model model, HttpSession session) {
//		Member loginUser = memberService.loginMember(m);
//		
//		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {
//			session.setAttribute("loginUser", loginUser);
//			return "redirect:/";
//		} else {
//			model.addAttribute("errorMsg", "에러발생");
//			return "common/errorPage";
//		}
//	}
	
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	@RequestMapping("userEnrollForm.me")
	public String userEnrollForm() {	
		return "member/userEnrollForm";
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
	
	@RequestMapping("farmerEnrollForm.me")
	public String farmerEnrollForm() {	
		return "member/farmerEnrollForm";
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
	
	@RequestMapping("updateUserForm.me")
	public String updateUserForm() {
		return "member/myPageUser/updateUser";
	}
	
	@RequestMapping("updateUser.me")
	public String updateUser(Member m, Model model, HttpSession session) {
		System.out.println(m);
		
		if(memberService.updateUser(m) > 0 ) {
			session.setAttribute("loginUser", memberService.loginMember(m));
			session.setAttribute("alertMsg", "회원 정보를 수정했습니다.");
			return "redirect:updateUser.me";
		} else {
			model.addAttribute("errorMsg", "회원정보 변경 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateFarmerForm.me")
	public String updateFarmerForm() {
		return "member/myPageFarmer/updateFarmer";
	}
	
//	@RequestMapping("updateFarmer.me")
//	public String updateFarmer(Member m, Model model, HttpSession session) {
//		System.out.println(m);
//		
//		if(memberService.updateFarmer(m) > 0 ) {
//			session.setAttribute("loginUser", memberService.loginMember(m));
//			session.setAttribute("alertMsg", "회원 정보를 수정했습니다.");
//			return "redirect:updateFarmer.me";
//		} else {
//			model.addAttribute("errorMsg", "회원정보 변경 실패");
//			return "common/errorPage";
//		}
//	}
	
//	@RequestMapping("findId.me")
//	public String findId(String memPwd, HttpSession session, Model model) {
//		
//		Member findId = memberService.findId(memPwd);
//		
//		if(findId.getMemId() == null) {	
//			model.addAttribute("alertMsg", "해당 회원이 존재하지 않습니다");
//			return "common/errorPage";
//		} else {
//			session.setAttribute("alertMsg", findId.getName() + "님의 아이디는 " + findId.getMemId() + "입니다.");
//			return "redirect:/";
//		}
//	}
	
	
//	@RequestMapping("myPageFarmer.me")
//	public String myPage() {
//		return "member/myPageFarmerCommon";
//	}
	
//	@ResponseBody // 데이터를 돌려보낼 때
//	@RequestMapping("idCheck.me")
//	public String idCheck(String checkId) { // 키값을 적어주기
//		int count = memberService.idCheck(checkId);
//		if (count > 0) { // 이미 존재하는 아이디 => 사용불가 (NNNNN)
//			 return "NNNNN";
//		} else { // 시용 가능 (NNNNY)
//			return "NNNNY";
//		}
//		// return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY"; 억지로 줄일 수 있음
//	}
	
	
}
