package com.kh.nbs.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.member.model.service.MemberService;
import com.kh.nbs.member.model.vo.Cert;
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
	
	@Autowired
	private JavaMailSender sender;
	
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
		return "redirect:farmerMyBoardList.me";
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
		return "redirect:farmerMyBoardList.me";
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
	
	@RequestMapping("userMyMarketList.me")
	public ModelAndView userMyMarketList(HttpSession session, ModelAndView mv) {
		
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		mv.addObject("list", memberService.userMyMarketList(mNo)).setViewName("member/myPageUser/myMarket");
		return mv;
	}
	
	@RequestMapping("farmerMyMarketList.me")
	public ModelAndView farmerMyMarketList(HttpSession session, ModelAndView mv) {
		
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		mv.addObject("list", memberService.farmerMyMarketList(mNo)).setViewName("member/myPageFarmer/myMarket");
		return mv;
	}
	
	@RequestMapping("farmerMyBoardList.me")
	public ModelAndView farmerMyBoardList(ModelAndView mv, HttpSession session) {
		
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();	// 세션에 담긴 로그인유저의 memNo를 뽑음
		
		mv.addObject("list", memberService.farmerMyBoardList(mNo)).setViewName("member/myPageFarmer/myBoard");
		return mv;
	}
	
	@RequestMapping("farmerMyProgramList.me")
	public ModelAndView farmerMyProgramList(HttpSession session, ModelAndView mv) {
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		mv.addObject("list", memberService.farmerMyProgramList(mNo)).setViewName("member/myPageFarmer/farmerMyProgramList");
		return mv;
	}
	
	@RequestMapping("markProgram.me")
	public ModelAndView markProgram(ModelAndView mv, HttpSession session) {
		int mNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		if(programService.selectMarkNo(mNo) != null ) {
			// 찜한 게시글 번호 조회
			mv.addObject("markNoList", programService.selectMarkNo(mNo));
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
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getMemPwd();	//암호화된 현재 비번
		
		if(bcryptPasswordEncoder.matches(memPwd, encPwd)) {
			
			m.setUpdatePwd(bcryptPasswordEncoder.encode(m.getUpdatePwd()));			// 변경할 비밀번호를 암호화
//			System.out.println(m.getMemPwd());
//			System.out.println(m);
			memberService.updatePwd(m);
			session.setAttribute("loginUser", memberService.loginMember(m));
			model.addAttribute("alertMsg", "비밀번호가 변경되었습니다. 로그인 해주세요.");
			return "redirect:/";
		} else {
			model.addAttribute("alertMsg", "비밀번호를 다시 입력해주세요.");
			return "member/myPageUser/updateUser";
		}
	}
	
	@GetMapping("sendCertNum.me")
	public String input() {
		return "member/userEnrollForm";
	}
	
	@GetMapping("chkCertNum.me")
	public String check() {
		return "member/userEnrollForm";
	}
	
	// 메일 인증번호 랜덤숫자 앞자리 00방지
	public String generateSecret() {
		Random r = new Random();
		int n = r.nextInt(100000);
		Format f = new DecimalFormat("000000");
		String secret = f.format(n);
		
		return secret;
	}
	
	// 메일 인증번호 전송
	@PostMapping(value="sendCertNum.me")
	public String sendCertNum(String email, HttpServletRequest request) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String ip = request.getRemoteAddr();
		String secret = generateSecret();
		Cert cert = Cert.builder().who(ip).secret(secret).build();
		
		memberService.sendCertNum(cert);
		helper.setTo(email);
		helper.setSubject("농부심 인증번호입니다.");
		helper.setText("인증번호 : " + secret);
		sender.send(message);
		
		return "redirect:chkCertNum.me";
	}
	
	// 메일 인증 확인
	@ResponseBody
	@PostMapping(value="chkCertNum.me", produces="application/json; charset=UTF-8") 
	public String chkCertNum(String secret, HttpServletRequest request, HttpSession session) {
		
		System.out.println(secret);
		
		Cert cert = Cert.builder().who(request.getRemoteAddr()).secret(secret).build();
		
		System.out.println(cert);

		
		return new Gson().toJson(memberService.chkCertNum(cert));
		
		/*
		 * String result2 = ""; if(result > 0) { request.setAttribute("alertMsg",
		 * "인증 완료되었습니다."); result2 = "s"; } else { request.setAttribute("alertMsg",
		 * "인증되지 않았습니다. 다시 시도해주세요."); result2 = "f"; }
		 * 
		 * return result2;
		 */
//		if(result > 0) {
//			request.setAttribute("alertMsg", "인증 완료되었습니다.");
//			System.out.println("controller : " + result);
//			return "redirect:/";
//		} else {
//			request.setAttribute("alertMsg", "인증되지 않았습니다. 다시 시도해주세요.");
//			return "member/userEnrollForm";
//		}
	}
	
		
		
		
}
