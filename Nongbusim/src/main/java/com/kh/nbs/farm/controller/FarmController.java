package com.kh.nbs.farm.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

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
import com.kh.nbs.market.model.vo.Market;
import com.kh.nbs.member.model.vo.Member;

@Controller
public class FarmController {
	
	@Autowired
	private FarmService farmService;
	
	/**
	 * selectFarmList: 전체 농장 list를 select하는 메소드
	 * selectFarmCount: 전체 농장의 count값을 select하는 메소드
	 * selectAttachmentList: 전체 농장 목록의 대표 이미지 list를 select하는 메소드
	 * selectProgramList: 전체 농장 목록의 프로그램 list를 select하는 메소드
	 * 
	 * @param currentPage: 요청하는 페이지
	 * @param localCode: 지역 코드
	 * @param keyword: 검색 키워드
	 * @param condition: 검색 조건
	 * @param order: 정렬 방식
	 */
	@RequestMapping("list.fm")
	public ModelAndView selectFarmList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
									   @RequestParam(value="lco", defaultValue="all") String localCode,
									   @RequestParam(value="keyword", required=false, defaultValue="") String keyword,
									   @RequestParam(value="condition", required=false, defaultValue="all") String condition,
									   @RequestParam(value="order", required=false, defaultValue="recent") String order,
									   ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("localCode", localCode);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("order", order);
		
		PageInfo pi = Pagination.getPageInfo(farmService.selectFarmCount(map), currentPage, 10, 5);

		mv.addObject("pi", pi)
		  .addObject("map", map)
		  .addObject("farmList", farmService.selectFarmList(pi, map))
		  .setViewName("farm/farmListView");
		
		return mv;
	}
	
	/**
	 * selectFarm: farmNo를 통해 농장 상세 정보를 select하는 메소드
	 * selectMarket: farmNo를 통해 해당 농장이 등록한 판매 list를 select하는 메소드
	 * selectMarketAt: 조회된 판매 목록(mkList)을 통해 해당 판매글의 첨부파일을 select하는 메소드
	 * selectAttachment: farmNo를 통해 농장 첨부파일을 select하는 메소드
	 * selectProgram: farmNo를 통해 해당 농장이 등록한 프로그램 정보를 select하는 메소드
	 * 
	 * 
	 * @param fno: 농장 번호
	 */
	@RequestMapping("detail.fm")
	public String selectFarm(int fno, Model model) {
		
		// 이건 selectMarket(fno)로 바꾸면 없앨 코드들
		Farm farm = farmService.selectFarm(fno);
		int memNo = farm.getFarmer();
		ArrayList<Market> mkList = farmService.selectMarket(memNo);
		
		model.addAttribute("farm", farm);
		model.addAttribute("programList", farmService.selectProgram(fno));
		model.addAttribute("mkList", mkList);
		model.addAttribute("mkAtList", farmService.selectMarketAt(mkList));
		model.addAttribute("atList", farmService.selectAttachment(fno));
		
		return "farm/farmDetailView";
	}
	
	
	/**
	 * farmEnrollForm: 농장 등록 페이지로 이동하는 메소드
	 */
	@RequestMapping("enrollForm.fm")
	public String farmEnrollForm() {
		return "farm/farmEnrollForm";
	}
	
	/**
	 * selectMyFarmList: 로그인한 사용자가 등록한 전체 농장 list를 select하는 메소드
	 */
	@RequestMapping("myList.fm")
	public String selectMyFarmList(HttpSession session, Model model) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		model.addAttribute("farmList", farmService.selectMyFarmList(memNo));
		
		return "farm/myPageFarmListView";
	}
	
	/**
	 * insertFarm: 새로운 농장을 insert하는 메소드
	 * 
	 * @param farm: 회원이 수정한 농장 정보 (farmer, farmName, localCode, address, phone, farmIntro, crop)
	 * @param upfileMain: 메인 이미지
	 * @param upfiles: 상세 이미지
	 */
	@RequestMapping("insert.fm")
	public ModelAndView insertFarm(Farm farm, 
								   @RequestParam(value="upfileMain") MultipartFile upfileMain,
								   @RequestParam(value="upfiles") MultipartFile[] upfiles, 
								   ModelAndView mv, HttpSession session, RedirectAttributes rttr) {
		
		// **farmer에 로그인유저 memNo 넣기**
		// f.setFarmer(((Member)session.getAttribute("loginUser")).getMemNo());
		
		// 농장 등록에 성공하면,
		if(farmService.insertFarm(farm) > 0) {

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
			
			// 첨부파일 담아줄 list
			ArrayList<Attachment> upfileList = new ArrayList<Attachment>();
			
			// 메인 이미지 등록
			Attachment main = new Attachment();
			
			System.out.println(upfileMain);
			
			main.setFileLevel(1);
			main.setOriginName(upfileMain.getOriginalFilename()); // 원본명
			main.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfileMain, session)); // 저장경로
			upfileList.add(main);
			
			// 세부사진 등록
			for(MultipartFile upfile: upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {
					
					Attachment at = new Attachment();
					
					at.setFileLevel(0);
					at.setOriginName(upfile.getOriginalFilename()); 
					at.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfile, session)); 
					
					upfileList.add(at);
				}
			}
			
			if(farmService.insertAttachment(upfileList) > 0) {
				System.out.println("DB에 첨부파일 등록 완");
			} else {
				System.out.println("DB에 첨부파일 등록 실패");
			}
			
			rttr.addFlashAttribute("alertMsg", "농장이 등록되었습니다.");
			mv.setViewName("redirect:/myList.fm");
			return mv;
		} else {
			// 첨부파일 삭제
			return mv;
		}
	}
	
	/**
	 * updateFormFarm: 해당 farmNo의 농장 정보를 select하여, 수정 페이지로 이동하는 메소드
	 * 
	 * @param fno: 농장 번호
	 */
	@RequestMapping("updateForm.fm")
	public String updateFormFarm(int fno, Model model) {
		
		model.addAttribute("atList", farmService.selectAttachment(fno));
		model.addAttribute("farm", farmService.selectFarm(fno));

		return "farm/farmUpdateForm";
	}
	
	/**
	 * updateFarm: 농장 정보를 update하는 메소드
	 * 
	 * @param farm: 회원이 입력한 농장 정보 (farmNo, farmer, farmName, localCode, address, phone, farmIntro, crop)
	 * @param delFiles: 삭제할 파일의 changeName
	 * @param delFilesPath: 삭제할 파일의 경로
	 * @param upfileMain: 메인 이미지
	 * @param upfiles: 상세 이미지
	 */
	@RequestMapping("update.fm")
	public String updateFarm(Farm farm, 
							 int[] delFiles, String[] delFilesPath,
							 @RequestParam(value="upfileMain") MultipartFile upfileMain,
							 @RequestParam(value="upfiles") MultipartFile[] upfiles, 
			                 Model model, HttpSession session, RedirectAttributes rttr, HttpServletRequest request) {
		
		// System.out.println("처음 출력" + delFiles);
		
		// System.out.println(farm);
		
		// 기존 파일 목록(fileNo)
		// List fnoList = farmService.selectFileNo(farm.getFarmNo());
		
		
		// 기존 첨부파일 삭제
		// 삭제된 첨부파일이 있다면,
		if(delFiles.length != 0) {
			ArrayList<Integer> delList = new ArrayList<Integer>();
			
			for(int i = 0; i < delFiles.length; i++) {
				System.out.println(delFiles[i]);
				delList.add(delFiles[i]);
			}
		
			// DB에서 삭제에 성공하면
			if(farmService.deleteAttachment(delList) > 0) {
				
				// 실제 서버에 있는 파일 삭제
				for(int i = 0; i < delFilesPath.length; i++) {
					
					System.out.println(delFilesPath[i]);
					
					if(new File(session.getServletContext().getRealPath(delFilesPath[i])).delete()) {
						System.out.println("서버에서 삭제 완" + i);
					} else {
						System.out.println("서버에서 삭제 실패ㅎ");
					}
				}

			} else {
				System.out.println("DB에서 삭제 실패");
			}
		}
		
		// 새로 추가된 첨부파일 추가
		ArrayList<Attachment> upfileList = new ArrayList<Attachment>();
		
		// 메인 이미지 등록
		if(!upfileMain.getOriginalFilename().equals("")) {
			Attachment main = new Attachment();
			System.out.println(upfileMain);
			
			main.setFileLevel(1);
			main.setOriginName(upfileMain.getOriginalFilename()); // 원본명
			main.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfileMain, session)); // 저장경로
			main.setBoardNo(farm.getFarmNo());
			
			upfileList.add(main);
		}
		
		// 세부사진 등록
		if(upfiles != null) {
			for(MultipartFile upfile: upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {
					
					//System.out.println(upfile.getOriginalFilename());
					
					Attachment at = new Attachment();at.setFileLevel(0);
					
					at.setFileLevel(0);
					at.setOriginName(upfile.getOriginalFilename()); // 원본명
					at.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfile, session)); // 저장경로
					at.setBoardNo(farm.getFarmNo());
					
					upfileList.add(at);
				}
			}
		}
		
		// 새로 추가된 첨부파일이 있는 경우
		if(upfileList.size() > 0) {
			
			if(farmService.updateFarm(farm) > 0) {
				if(farmService.updateInsertAttachment(upfileList) > 0) {
						rttr.addFlashAttribute("alertMsg", "정보가 수정되었습니다.");
						return "redirect:/detail.fm?fno=" + farm.getFarmNo();
					} else {
						System.out.println("첨부파일 수정 실패");
					}
				} else {
					rttr.addFlashAttribute("alertMsg", "정보 수정에 실패했습니다.");
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
		return "";
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
	
	
	
	/**
	 * 
	 * deleteFarm: farmNo를 통해 농장을 delete(status를 'N'으로 update)하는 메소드
	 * 
	 * @param fno: 농장 번호
	 */
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
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("localCode", localCode);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagination.getPageInfo(farmService.selectSearchListCount(map), currentPage, 10, 10);
		
		model.addAttribute("pi", pi);
		model.addAttribute("farmList", farmService.selectSearchList(pi, map));
		model.addAttribute("map", map);
		model.addAttribute("atList", farmService.selectAttachmentList());
		
		return "farm/farmListView";
	}
	
	
}
