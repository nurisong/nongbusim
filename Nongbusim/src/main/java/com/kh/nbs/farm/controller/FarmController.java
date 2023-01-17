package com.kh.nbs.farm.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;
import com.kh.nbs.common.template.SaveFile;
import com.kh.nbs.farm.model.service.FarmService;
import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.member.model.vo.Member;

@Controller
public class FarmController {
	
	@Autowired
	private FarmService farmService;
	
	@RequestMapping("list.fm")
	public ModelAndView selectFarmList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
									   @RequestParam(value="lco", defaultValue="all") String localCode,
									   ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(farmService.selectFarmCount(localCode), currentPage, 10, 5);
		// 프로그램 조회
		mv.addObject("pi", pi);
		mv.addObject("atList", farmService.selectAttachmentList()); // 첨부파일
		mv.addObject("programList", farmService.selectProgramList());
		mv.addObject("farmList", farmService.selectFarmList(pi, localCode)).setViewName("farm/farmListView");
		mv.addObject("lco", localCode);
		
		return mv;
	}
	
	@RequestMapping("detail.fm")
	public String selectFarm(int fno, Model model) {
		
		model.addAttribute("farm", farmService.selectFarm(fno));
		model.addAttribute("programList", farmService.selectProgram(fno));
		model.addAttribute("atList", farmService.selectAttachment(fno));
		
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
	
	@RequestMapping("insert.fm")
	public ModelAndView insertFarm(Farm f, 
								   @RequestParam(value="upfileMain") MultipartFile upfileMain,
								   @RequestParam(value="upfiles")MultipartFile[] upfiles, 
								   ModelAndView mv, HttpSession session, RedirectAttributes rttr) {
		
		// **farmer에 로그인유저 memNo 넣기**
		f.setFarmer(((Member)session.getAttribute("loginUser")).getMemNo());
		
		if(farmService.insertFarm(f)>0) {

			//int farmNo = f.getFarmNo();
			
			/*
			for(MultipartFile upfile: upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {

					a.setBoardType("F");
					a.setOriginName(upfile.getOriginalFilename()); // 원본명
					a.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfile, session)); // 저장경로
					
					farmService.insertAttachment(a);
				}
			}
			*/
			
			List<Attachment> upfileList = new ArrayList();
			
			// 메인 이미지 등록
			Attachment main = new Attachment();
			
			
			System.out.println(upfileMain);
			
			main.setBoardType("F");
			main.setFileLevel(1);
			main.setOriginName(upfileMain.getOriginalFilename()); // 원본명
			main.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfileMain, session)); // 저장경로
			upfileList.add(main);
			
			
			// 세부사진 등록
			for(MultipartFile upfile: upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {
					
					//System.out.println(upfile.getOriginalFilename());
					
					Attachment at = new Attachment();
					
					at.setBoardType("F");
					at.setOriginName(upfile.getOriginalFilename()); // 원본명
					at.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfile, session)); // 저장경로
					
					upfileList.add(at);
				}
				
				if(farmService.insertAttachment(upfileList) > 0) {
					System.out.println("insert에서 첨부파일 등록 완");
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
	
	@RequestMapping("updateForm.fm")
	public String updateFormFarm(int fno, Model model) {
		
		model.addAttribute("atList", farmService.selectAttachment(fno));
		model.addAttribute("farm", farmService.selectFarm(fno));

		return "farm/farmUpdateForm";
	}
	
	@RequestMapping("update.fm")
	public String updateFarm(Farm farm, 
							 int[] delFiles, String[] delFilesPath,
							 MultipartFile[] upfiles,  
			                 Model model, HttpSession session, RedirectAttributes rttr, HttpServletRequest request) {
		
		// System.out.println("처음 출력" + delFiles);
		
		// 기존 파일 목록
		List fnoList = farmService.selectFileNo(farm.getFarmNo());
		
		List delList = new ArrayList();
		
		for(int i = 0; i < delFiles.length; i++) {
			// System.out.println(delFiles[i]);
			delList.add(delFiles[i]);
		}
	
		// 기존 첨부파일 삭제
		if(delList.size()>0) {
			if(farmService.deleteAttachment(delList) > 0) {
				
				String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
				
				for(int i = 0; i < delFilesPath.length; i++) {
					
					System.out.println(delFilesPath[i]);
					System.out.println(delFilesPath[i]);
					
					if(new File(savePath + delFilesPath[i]).delete()) {
						System.out.println("서버에서 삭제 완" + i);
						
					} else {
						System.out.println("서버에서 삭제 실패ㅎ");
					}
				}
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
			}
		}
		
		// 새로 추가된 첨부파일 추가
		if(upfiles != null) {
			List<Attachment> upfileList = new ArrayList();
			
			for(MultipartFile upfile: upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {
					
					//System.out.println(upfile.getOriginalFilename());
					
					Attachment at = new Attachment();
					
					at.setBoardType("F");
					at.setOriginName(upfile.getOriginalFilename()); // 원본명
					at.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfile, session)); // 저장경로
					at.setBoardNo(farm.getFarmNo());
					
					upfileList.add(at);
				}
			}
			// System.out.println(upfileList);
			
			// 첨부파일 추가 후 정보 수정
			if(farmService.updateInsertAttachment(upfileList) > 0) {
				if(farmService.updateFarm(farm) > 0) {
					rttr.addFlashAttribute("alertMsg", "정보가 수정되었습니다.");
					return "redirect:/detail.fm?fno=" + farm.getFarmNo();
				} else {
					rttr.addFlashAttribute("alertMsg", "정보 수정에 실패했습니다.");
					return "redirect:/detail.fm?fno=" + farm.getFarmNo();
				}
			} else {
				rttr.addFlashAttribute("alertMsg", "첨부파일 수정 실패!!!!!!!!!!!!!!!");
				return "redirect:/detail.fm?fno=" + farm.getFarmNo();
			}
		} else {
			
			// 추가된 첨부파일 X, 정보만 수정
			if(farmService.updateFarm(farm) > 0) {
				rttr.addFlashAttribute("alertMsg", "정보가 수정되었습니다.");
				return "redirect:/detail.fm?fno=" + farm.getFarmNo();
			} else {
				rttr.addFlashAttribute("alertMsg", "정보 수정에 실패했습니다.");
				return "redirect:/detail.fm?fno=" + farm.getFarmNo();
			}
		}
	}
	
	// 언젠가..첨부파일 수정 성공하길..
	//@RequestMapping("update.fm")
	public String updateFarm(int[] originFileNo) {
		
		System.out.println(originFileNo.length);
		for(int fileNo : originFileNo) {
			System.out.println(fileNo);
		}
		//System.out.println(farmService.deleteAttachment(originFileNo));
		//farmService.deleteAttachment(originFileNo);
		return "";
	}
	
	@RequestMapping("delete.fm")
	public String deleteFarm(int fno, Model model, RedirectAttributes rttr) {
		
		if(farmService.deleteFarm(fno) > 0) {
			rttr.addFlashAttribute("alertMsg", "농장이 삭제되었습니다.");
			return "redirect:/myList.fm";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("search.fm")
	public String selectSearchList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
								   @RequestParam(value="lco", defaultValue="all") String localCode, 
								   String condition, String keyword, Model model) {
		
		HashMap<String, String> map = new HashMap();
		map.put("localCode", localCode);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagination.getPageInfo(farmService.selectSearchListCount(map), currentPage, 10, 5);
		
		model.addAttribute("pi", pi);
		model.addAttribute("farmList", farmService.selectSearchList(pi, map));
		model.addAttribute("map", map);
		model.addAttribute("atList", farmService.selectAttachmentList());
		
		return "farm/farmListView";
	}
	
	
}
