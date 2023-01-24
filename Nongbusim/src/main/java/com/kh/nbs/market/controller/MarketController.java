package com.kh.nbs.market.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.Comment;
import com.kh.nbs.common.model.vo.Mark;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;
import com.kh.nbs.market.model.service.MarketService;
import com.kh.nbs.market.model.vo.Market;
import com.kh.nbs.member.model.vo.Member;


@Controller
public class MarketController {

	@Autowired
	private MarketService marketService;
	
	
	
	
	
	//게시판으로 이동
	@RequestMapping("list.mk")
	public ModelAndView marketSelectList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
										 @RequestParam(value="MarketCategory", defaultValue="모두") String marketCategory,
										ModelAndView mv, HttpSession session) {
		
		//카테고리를 설정하지 않은경우 모두 셀렉해오기
		PageInfo pi = Pagination.getPageInfo(marketService.selectListCount(), currentPage, 5, 9);

			
			/*if((Member)session.getAttribute("loginUser") != null) {//회원일 경우 회원번호 담아주기(찜하기 목록을 셀렉해오기 위한 처리)
			
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			
			if(marketService.ajaxMarkMarket(memNo) != null) {//비회원일 경우의 널처리
				
				mv.addObject("mark", marketService.ajaxMarkMarket(memNo));
				
			}*/
			
		ArrayList<Market> list = marketService.marketSelectList(pi);
		
		list.get(0).setMarketCategory(marketCategory);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("at", marketService.attachmentSelectList());
		
		
		mv.setViewName("market/marketListView");
		
		return mv;
		
		
		
	}
	
	
	//카테고리 선택했을 때의 게시물 리스트 조회
	@RequestMapping("listCatogory.mk")
	public ModelAndView marketSelectList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			ModelAndView mv, HttpSession session, String marketCategory) {
		
		
		PageInfo pi = Pagination.getPageInfo(marketService.selectListCount(marketCategory), currentPage, 5, 9);
		
		
		mv.addObject("pi", pi);
		mv.addObject("list", marketService.marketSelectListCategory(pi, marketCategory));
		mv.addObject("at", marketService.attachmentSelectListCategory(marketCategory));
		mv.setViewName("market/marketListView");
		
		return mv;
	
		
	}
	
	
	
	
	//게시물상세화면으로 이동
	@RequestMapping("detail.mk")
	public ModelAndView marketDetailView(Market market, ModelAndView mv, HttpSession session) {
		
			
		if(marketService.increaseCount(market) > 0) {
			
			if(marketService.marketDetailView(market) != null) {
				
				mv.addObject("list", marketService.marketDetailView(market));
				
				if(marketService.marketDetailAttachment(market) != null) {
						
					mv.addObject("at", marketService.marketDetailAttachment(market));
					
					if((Member)session.getAttribute("loginUser") != null) { //회원일 경우 북마크 불러오기
						
						market.setMemNo(((Member)session.getAttribute("loginUser")).getMemNo());
						mv.addObject("mark", marketService.markMarket(market));
					
					}
					
					mv.setViewName("market/marketDetailView");
					
				}
			}
		}
		
		return mv;
		
	}
	
	
	
	
	
	
	
	//게시물 작성화면으로 이동
	@RequestMapping("insertForm.mk")
	public String marketInsertForm() {
		
		return "market/marketInsertForm";
	}
	
	
	//파일이름수정
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		// 파일 명 수정 작업 후 서버에 업로드 시키기("image.png" => 2022.12.38123.123.png)
		String originName = upfile.getOriginalFilename();
		
		// "20221226103530"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 12321(5자리 랜덤값)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자하는 폴더의 물리적인경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	
	
	
	
	
	
	//게시물 작성
	@RequestMapping("insert.mk")
	public ModelAndView marketInsert(Market market, ModelAndView mv, MultipartFile[] upfiles, RedirectAttributes rttr, HttpSession session, Attachment a) {
		
		market.setMemNo(((Member)session.getAttribute("loginUser")).getMemNo());
		
		if(marketService.insertMarket(market) > 0) {
	
			for(MultipartFile upfile : upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {

					a.setBoardType("mk");
					a.setOriginName(upfile.getOriginalFilename()); // 원본명
					a.setChangeName("resources/uploadFiles/" + saveFile(upfile, session)); // 저장경로
					
					marketService.insertAttachment(a);
						
				}
			}
			rttr.addFlashAttribute("alertMsg", "게시물이 등록되었습니다");
			mv.setViewName("redirect:/list.mk");
			return mv;
		} else {
			// 첨부파일 삭제
			return mv;
		}
		
		
	}
	
	
	
	
	
	
	
	//게시물 수정화면으로 이동
	@RequestMapping("updateForm.mk")
	public ModelAndView marketUpdateForm(Market market, ModelAndView mv) {

		
		mv.addObject("market", marketService.marketDetailView(market));
		mv.addObject("at", marketService.marketDetailAttachment(market));
		mv.setViewName("market/marketUpdateForm");
		
		return mv;
	
		
	}	
	
	
	//게시물 수정 
	@RequestMapping("update.mk")
	public ModelAndView updateMarket(Market market, Attachment at, HttpServletRequest request, MultipartFile[] reUpFiles, HttpSession session, ModelAndView mv, RedirectAttributes rttr) {
		
		market.setMemNo(((Member)session.getAttribute("loginUser")).getMemNo()); //멤버넘버 가져오기
	
		//System.out.println(request.getParameter("originalFileNo"+1));
		//System.out.println(request.getParameter("originalFileNo"+2));
		
		//게시물 수정 
		if(marketService.marketUpdate(market) > 0) {// 게시글을 수정하고 옴
			
			/*for(int i = 0; i < 4; i++) { //새롭게 첨부한 파일의 갯수만큼 돌면서
				
				//System.out.println(reUpFiles[i].getOriginalFilename());
				
				if(!reUpFiles[i].getOriginalFilename().equals("")) {

					at.setBoardNo(market.getMarketNo());
					at.setOriginName(reUpFiles[i].getOriginalFilename());
					at.setChangeName("resources/uploadFiles/" + saveFile(reUpFiles[i], session));
					
					if(request.getParameter("originalFileNo"+(i+1)) == null){ // 기존 첨부파일이 존재하지 않는다면 insert해라
						
						at.setBoardNo(market.getMarketNo());
						marketService.insertAttachment(at);
						
						/*
						at.setFileNo(Integer.parseInt(request.getParameter("originalFileNo"+(i+1))));
						new File("/"+request.getParameter("orginalChangeName"+(i+1))).delete();
						marketService.updateAttachment(at);
						
					}else {//기존 첨부파일이 존재하지 않는다면 
						
						/*at.setBoardNo(market.getMarketNo());
						marketService.insertAttachment(at);
					}
					
					//System.out.println(at);
					
					}
				}	
			}*/
				
		} //게시물 수정 종료 코드
		
		rttr.addFlashAttribute("alertMsg", "게시물이 수정되었습니다");
		mv.setViewName("redirect:/list.mk");
		
		return mv;
		
		
	}
	
	
	
	
	
	
	//게시물 삭제 
	@RequestMapping("delete.mk")
	public ModelAndView marketDelete(int marketNo, ModelAndView mv, RedirectAttributes rttr) {
		
		if(marketService.marketDeleteAttachment(marketNo) > 0) {
			
			if(marketService.marketDelete(marketNo) > 0) {		
				
				//첨부파일 삭제
				
				
				rttr.addFlashAttribute("alertMsg", "게시물이 삭제되었습니다.");
				mv.setViewName("redirect:list.mk");
				return mv;
			}
			
		}else {
			rttr.addFlashAttribute("alertMsg", "게시물 삭제를 실패했습니다.");
			mv.setViewName("redirect:list.mk");
			return mv;
			
		}
		return mv;

		
	}
	
	

	
	
	//댓글 조회
	@ResponseBody
	@RequestMapping(value="listComment.mk", produces="application/json; charset=UTF-8")
	public String ajaxSelectListMarketComment(Comment comment) {
		
		return new Gson().toJson(marketService.ajaxSelectListMarketComment(comment));
	
	}
	
	
	//댓글 작성
	@ResponseBody
	@RequestMapping("insertComment.mk")
	public String ajaxInsertMarketComment(Comment comment) {

		return marketService.ajaxInsertMarketComment(comment) > 0? "success" : "fail";
	}
	

	//댓글 삭제
	@ResponseBody
	@RequestMapping("deleteComment.mk")
	public String ajaxDeleteMarketComment(Comment comment) {
		
		return marketService.ajaxDeleteMarketComment(comment) > 0? "success" : "fail";
		
		
	}
		
	
	//댓글 수정
	@ResponseBody
	@RequestMapping("updateComment.mk")
	public String ajaxUpdateMarketComment(Comment comment) {
		
		return marketService.ajaxUpdateMarketComment(comment) > 0? "success" : "fail";
	}
	
	
	
	
	
	//찜하기 버튼 클릭
	@ResponseBody
	@RequestMapping("mark.mk")
	public String ajaxClickMarkMarket(Mark mark) {
		
		return marketService.ajaxClickMarkMarket(mark) > 0? "success" : "fail";
	}
	

	//찜하기 해제 버튼 클릭
	@ResponseBody
	@RequestMapping("unMark.mk")
	public String ajaxClickUnmarkMarket(Mark mark) {
		
		return marketService.ajaxClickUnmarkMarket(mark) > 0? "success" : "fail";
	}
	

	
	
	//메인 페이지 게시글 불러오기
	@ResponseBody
	@RequestMapping(value="main.mk", produces="application/json; charset=UTF-8")
	public String ajaxMainMarketList() {
		
		return new Gson().toJson(marketService.ajaxMainMarketList());
		
	}
	
	
}
