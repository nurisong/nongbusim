package com.kh.nbs.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;
import com.kh.nbs.member.model.vo.Member;
import com.kh.nbs.review.model.service.ReviewService;
import com.kh.nbs.review.model.vo.Review;

@Controller
public class ReviewController {
	
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("list.re")
	public ModelAndView selectReviewList(@RequestParam(value="cpage",defaultValue="1") int currentPage,ModelAndView mv) {
		
		
		PageInfo pi = Pagination.getPageInfo(reviewService.selectReviewCount(), currentPage , 10 , 5);
		mv.addObject("pi", pi).addObject("reviewList",reviewService.selectReviewList(pi)).setViewName("review/ReviewBoardList");
		
		return mv;
	
	}
	
	@RequestMapping("reviewInsert.re")
	public String reviewInsert(Review r, MultipartFile upfile, HttpSession session, Model model) {
		
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		r.setMemNo(memNo);
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String originName = upfile.getOriginalFilename();
			
			
			// "20221226103530"(년월일시분초)
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			//12321(5자리 랜덤값)
			
			int ranNum = (int)(Math.random()*90000+10000);
			// 확장자
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + ranNum + ext;
			
			// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
			r.setOriginName(upfile.getOriginalFilename()); //원본명
			r.setChangeName("resources/uploadFiles/" + saveFile(upfile, session));
			
		}
		
		
		if(reviewService.reviewInsert(r)> 0) { //성공 => 게시글 리스트 페이지
			
			session.setAttribute("alertMsg", "리뷰가 등록 되었습니다.");
			return "redirect:myProgramlist.re";
			
			
		} else {
			model.addAttribute("errorMsg", "리뷰 작성을 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	//파일 첨부 관련 메소드
	public String saveFile(MultipartFile upfile, HttpSession session) { // 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
		
		// 파일 명 수정 작업 후 서버에 업로드 시키기("image.png" =? 202212371232.png)
		String originName = upfile.getOriginalFilename();
		
		
		// "20221226103530"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		//12321(5자리 랜덤값)
		int ranNum = (int)(Math.random()*90000+10000);
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	
	//마이페이지 참여한 프로그램에서 내가 작성란 리뷰내용을 select하는 요청
	@ResponseBody
	@RequestMapping(value = "reviewSelect.re", produces="application/json; charset=UTF-8" )
	public String reviewSelect( Review r,ModelAndView mv) {
		
		// System.out.println(reviewService.reviewUpdate(r));
		// mv.addObject("reviewUpdate",reviewService.reviewUpdate(r)).setViewName("review/ReviewInsert");
		// JSONObject jObj = new JSONObject();
		// jObj.put("reviewContent", r.getReviewContent());
					
		return new Gson().toJson(reviewService.reviewSelect(r));
	}
	
	
	@RequestMapping("reviewUpdate.re")
	public String reviewUpdate(Review r,Model model) {
		
		reviewService.reviewUpdate(r);
		
		return "review/ReviewInsert";
	}
 
	
	
	
	
	
	
	
}
