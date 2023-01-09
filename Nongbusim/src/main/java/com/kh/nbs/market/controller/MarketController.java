package com.kh.nbs.market.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.market.model.service.MarketService;
import com.kh.nbs.market.model.vo.Market;


@Controller
public class MarketController {

	@Autowired
	private MarketService marketService;
	
	
	//게시판으로 이동
	@RequestMapping("list.mk")
	public String marketSelectList() {
		
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
	
	
	@RequestMapping("insert.mk")
	public String marketInsert(Market market, MultipartFile upfile, HttpSession session, Attachment a) {
		
		if(!upfile.getOriginalFilename().equals("")) {//첨부파일칸에 파일이 비어있지 않으면
			
			a.setOriginName(upfile.getOriginalFilename()); //원본명
			a.setChangeName("resources/uploadFiles/" + saveFile(upfile, session));
			a.setBoardNo(market.getMarketNo());
			
			
		}
		
		return "index";
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
	
	
	
	//게시물 수정화면으로 이동
	@RequestMapping("updateForm.mk")
	public String marketUpdateForm() {
		return "market/marketUpdateForm";
	}
	
	
	
}
