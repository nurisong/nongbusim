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
import com.kh.nbs.program.model.service.ProgramService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProgramService programService;
	
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
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		
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
	
	@RequestMapping("myPageUser.me")
	public String myPageUser() {
		return "member/myPageUser/myPageUserCommon";
	}
	
	@RequestMapping("updateUserForm.me")
	public String updateUserForm() {
		return "member/myPageUser/updateUser";
	}
	
	@RequestMapping("updateUser.me")
	public String updateUser(Member m, Model model, HttpSession session) {
		
		if(memberService.updateUser(m) > 0 ) {
			session.setAttribute("loginUser", memberService.loginMember(m));
			return "redirect:myPageUser.me";
		} else {
			model.addAttribute("errorMsg", "회원정보 변경 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("myPageFarmer.me")
	public String myPageFarmer() {
		return "member/myPageFarmer/myPageFarmerCommon";
	}
	
	@RequestMapping("updateFarmerForm.me")
	public String updateFarmerForm() {
		return "member/myPageFarmer/updateFarmer";
	}
	
	@RequestMapping("updateFarmer.me")
	public String updateFarmer(Member m, Model model, HttpSession session) {
		
		if(memberService.updateFarmer(m) > 0 ) {
			session.setAttribute("loginUser", memberService.loginMember(m));
			return "redirect:myPageFarmer.me";
		} else {
			model.addAttribute("errorMsg", "회원정보 변경 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteUser.me")
	public String deleteUser(String memId, String memPwd, HttpSession session) {
		
		// memPwd : 회원 탈퇴 요청 시 사용자가 입력한 비밀번호 평문
		// session의 loginUser Member객체의 userPwd필드 : DB에 기록된 암호화된 비밀번호
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getMemPwd();
		if(bcryptPasswordEncoder.matches(memPwd, encPwd)) {
			// 비밀번호가 사용자가 입력한 평문으로 만들어진 암호문일 경우
			
			if(memberService.deleteUser(memId) > 0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "탈퇴되었습니다.");
				return "redirect:/";
			} else {
				session.setAttribute("errorMsg", "회원 탈퇴 실패");
				return "common/errorPage";
			}
			
		} else {
			session.setAttribute("alertMsg", "잘못된 비밀번호입니다.");
			return "redirect:myPageUser.me";
		}
	}
	
	@RequestMapping("deleteFarmer.me")
	public String deleteFarmer(String memId, String memPwd, HttpSession session) {
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getMemPwd();
		if(bcryptPasswordEncoder.matches(memPwd, encPwd)) {
			
			if(memberService.deleteFarmer(memId) > 0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "탈퇴되었습니다.");
				return "redirect:/";
			} else {
				session.setAttribute("errorMsg", "회원 탈퇴 실패");
				return "common/errorPage";
			}
			
		} else {
			session.setAttribute("alertMsg", "잘못된 비밀번호입니다.");
			return "redirect:myPageFarmer.me";
		}
	}
	
	@RequestMapping("userType.me")
	public String userType() {
		return "member/userType";
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public int idCheck(String memId) {
		return memberService.idCheck(memId);
	}
	
//	@RequestMapping("userMyBoardList.me")
//	public String userMyBoardList(Model model) {
//		int memNo = 1;
//		ArrayList<Board> list = memberService.userMyBoardList(memNo);
//		model.addAttribute("list", list);
//		System.out.println(list);
//		return "member/myPageUser/myBoard";
//	}
	
	@RequestMapping("userMyBoardList.me")
	public ModelAndView userMyBoardList(ModelAndView mv, HttpSession session) {
		
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		mv.addObject("list", memberService.userMyBoardList(mNo)).setViewName("member/myPageUser/myBoard");
		return mv;
	}
	
	@RequestMapping("farmerMyBoardList.me")
	public ModelAndView farmerMyBoardList(ModelAndView mv, HttpSession session) {
		
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();	// 세션에 담긴 로그인유저의 memNo를 뽑음
		
		mv.addObject("list", memberService.farmerMyBoardList(mNo)).setViewName("member/myPageFarmer/myBoard");
		return mv;
	}
	
	@RequestMapping("markProgram.me")
	public ModelAndView markProgram(ModelAndView mv, HttpSession session) {
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		if(programService.selectMarkNo(mNo) != null ) {
			// 찜한 게시글 번호 조회
			mv.addObject("markNoList",programService.selectMarkNo(mNo));
		}
		
		mv.addObject("list", memberService.markProgram(mNo)).setViewName("member/myPageUser/markProgram");
		return mv;
	}

	@RequestMapping("markMarket.me")
	public ModelAndView markMarket(ModelAndView mv, HttpSession session) {
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		if(programService.selectMarkNo(mNo) != null ) {
			// 찜한 게시글 번호 조회
			mv.addObject("markNoList",programService.selectMarkNo(mNo));
		}
		
		mv.addObject("list", memberService.markMarket(mNo)).setViewName("member/myPageUser/markMarket");
		return mv;
	}
	
	@RequestMapping("findIdForm.me")
	public String findIdForm() {
		return "member/findId";
	}
	
	@RequestMapping("findId.me")
	public String findId(Member m, HttpSession session) {
//		System.out.println(memberService.findId(m).getMemId());
		
		if(memberService.findId(m).getMemId().equals("9999")) {	// 없는 아이디를 입력하면 9999로 null값 대신 들어가서 아래의 alert창이 뜸
			session.setAttribute("alertMsg", "해당 회원이 존재하지 않습니다.");
			return "member/findId";
		} else {
			session.setAttribute("alertMsg", m.getName() + "님의 아이디는 " + memberService.findId(m).getMemId() + "입니다.");
			return "member/loginForm";
		}
	}

	@RequestMapping("updatePwd.me")
	public String updatePwd(HttpSession session, Member m, String memPwd, Model model) {
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getMemPwd();
		
		if(bcryptPasswordEncoder.matches(memPwd, encPwd)) {
			String updatePwd = bcryptPasswordEncoder.encode(m.getUpdatePwd());
			m.setMemPwd(updatePwd);
			return "redirect:/";
		} else {
			model.addAttribute("alertMsg", "존재하지 않는 비밀번호 입니다.");
			return "member/myPageUser/updateUser";
		}
		
	}
	
	
	
	
	
	
	
}
