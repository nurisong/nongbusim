package com.kh.nbs.infoBoard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.infoBoard.model.service.InfoService;
import com.kh.nbs.infoBoard.model.vo.Info;

@Controller
public class InfoController {
	
	@Autowired
	private InfoService infoService;
	
	@RequestMapping("list.if")
	public String infoListView() {
		// 글 전체 리스트 조회해오기
		return "infoBoard/infoBoardListView";
	}
	
	@RequestMapping("detail.if")
	public String infoDetailNew() {
		// 글번호 뽑아서 조회
		return "infoBoard/infoBoardDetailView";
	}
	
	@RequestMapping("enrollForm.if")
	public String infoEnrollForm() {
		return "infoBoard/infoBoardEnrollForm";
	}
	
	@RequestMapping("insert.if")
	public String insertInfo(Info i, Attachment a, MultipartFile[] upfilesImg, MultipartFile[] upfiles, HttpSession session, RedirectAttributes rttr) {
		if(infoService.insertInfo(i) > 0) {
			
			for(MultipartFile upfile: upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {

					a.setBoardType("I");
					a.setOriginName(upfile.getOriginalFilename()); // 원본명
					a.setChangeName("resources/uploadFiles/" + saveFile(upfile, session)); // 저장경로
					
					infoService.insertAttachment(a);
				}
			}
			rttr.addFlashAttribute("alertMsg", "글이 작성되었습니다.");
			return "redirect:/list.if";
		} else {
			return "common/errorPage";
		}
	}
}
