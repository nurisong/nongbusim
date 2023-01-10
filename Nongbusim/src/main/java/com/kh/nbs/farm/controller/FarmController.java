package com.kh.nbs.farm.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.farm.model.service.FarmService;
import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.member.model.vo.Member;

@Controller
public class FarmController {
	
	@Autowired
	private FarmService farmService;
	
	@RequestMapping("list.fm")
	public String selectFarmList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		// 전체 농장 리스트 뽑아오기
		return "farm/farmListView";
	}
	
	@RequestMapping("detail.fm")
	public String selectFarm(int fno, Model model) {
		model.addAttribute("farm", farmService.selectFarm(fno));
		model.addAttribute("atList", farmService.selectAttachment(fno));
		System.out.println(farmService.selectAttachment(fno));
		return "farm/farmDetailView";
	}
	
	@RequestMapping("enrollForm.fm")
	public String farmEnrollForm() {
		return "farm/farmEnrollForm";
	}
	
	@RequestMapping("myList.fm")
	public String selectMyFarmList(HttpSession session, Model model) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		model.addAttribute("farmList", farmService.selectMyFarmList(memNo));
		return "farm/myPageFarmListView";
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()* 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	@RequestMapping("insert.fm")
	public ModelAndView insertFarm(Farm f, MultipartFile[] upfiles, ModelAndView mv, HttpSession session, Attachment a, RedirectAttributes rttr) {
		
		// **farmer에 로그인유저 memNo 넣기**
		f.setFarmer(((Member)session.getAttribute("loginUser")).getMemNo());
		
		if(farmService.insertFarm(f)>0) {

			//int farmNo = f.getFarmNo();
			
			for(MultipartFile upfile: upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {

					a.setBoardType("F");
					a.setOriginName(upfile.getOriginalFilename()); // 원본명
					a.setChangeName("resources/uploadFiles/" + saveFile(upfile, session)); // 저장경로
					
					farmService.insertAttachment(a);
				}
			}
			rttr.addFlashAttribute("alertMsg", "농장이 등록되었습니다.");
			mv.setViewName("redirect:/myList.fm");
			return mv;
		} else {
			// 첨부파일 삭제
			return mv;
		}
	}
	
	
}
