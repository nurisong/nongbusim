package com.kh.nbs.market.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.common.model.vo.Attachment;
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
	public String marketSelectList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
								   Model model) {
		
		PageInfo pi = Pagination.getPageInfo(marketService.selectListCount(), currentPage, 5, 9);
		

		model.addAttribute("pi", pi);
		model.addAttribute("list", marketService.marketSelectList(pi));
		model.addAttribute("at", marketService.attachmentSelectList());
		
		
		ArrayList<Market> list = marketService.marketSelectList(pi);
		
		return "market/marketListView";
		
	}
	
	
	//게시물상세화면으로 이동
	@RequestMapping("detail.mk")
	public String marketDetailView() {
		
		return "market/marketDetailView";
		
	}
	
	//게시물 작성화면으로 이동
	@RequestMapping("insertForm.mk")
	public String marketInsertForm() {
		
		return "market/marketInsertForm";
	}
	
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
	
	@RequestMapping("insert.mk")
	public ModelAndView marketInsert(Market market, ModelAndView mv, MultipartFile[] upfiles, HttpSession session, Attachment a) {
		
		market.setMemNo(((Member)session.getAttribute("loginUser")).getMemNo());
		
		if(marketService.insertMarket(market) > 0) {
			
			int marketNo = market.getMarketNo();
			
			for(MultipartFile upfile : upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {
					a.setBoardNo(marketNo);
					a.setBoardType("mk");
					a.setOriginName(upfile.getOriginalFilename()); // 원본명
					a.setChangeName("resources/uploadFiles/" + saveFile(upfile, session)); // 저장경로
					
					if(marketService.insertAttachment(a) > 0) {
						mv.setViewName("redirect:/");
					} else {
						mv.setViewName("common/errorPage");
					}
						
				}
			}
		
			mv.setViewName("redirect:/");
			
		} else {
			// 첨부파일 삭제
		}
		
		return mv;
		
	}
	
	
	
	
	//게시물 수정화면으로 이동
	@RequestMapping("updateForm.mk")
	public String marketUpdateForm() {
		return "market/marketUpdateForm";
	}
	
	
	
}
