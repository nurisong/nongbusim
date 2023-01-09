package com.kh.nbs.farm.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.farm.model.service.FarmService;
import com.kh.nbs.farm.model.vo.Farm;

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
	public String farmDetailView() {
		// 농장 번호 뽑아서 조회
		return "farm/farmDetailView";
	}
	
	@RequestMapping("enrollForm.fm")
	public String farmEnrollForm() {
		return "farm/farmEnrollForm";
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		// 파일 명 수정 작업 후 서버에 업로드 시키기("image.png" => 20221238123123.png)
		String originName = upfile.getOriginalFilename();
		
		// "20221226102530"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 12321(5자리 랜덤값)
		int ranNum = (int)(Math.random()* 90000 + 10000);
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
	
	@RequestMapping("insert.fm")
	public ModelAndView insertFarm(Farm f, ModelAndView mv, MultipartFile[] upfiles, HttpSession session, Attachment a) {
		
		//System.out.println(upfiles);
		
		// **farmer에 로그인유저 memNo 넣기**
		
		if(farmService.insertFarm(f)>0) {
			
			// **selectFarm하고 getFarmNo해서 가져오기
			int farmNo = f.getFarmNo();
			
			for(MultipartFile upfile: upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {
					a.setBoardNo(farmNo);
					a.setBoardType("Farm");
					a.setOriginName(upfile.getOriginalFilename()); // 원본명
					a.setChangeName("resources/uploadFiles/" + saveFile(upfile, session)); // 저장경로
					
					if(farmService.insertAttachment(a) > 0) {
						mv.addObject("alertMsg", "농장이 등록되었습니다.").setViewName("redirect:/");
					} else {
						mv.setViewName("common/errorPage");
					}
				}
			}
		} else {
			// 첨부파일 삭제
		}
		
		return mv;
	}

}
