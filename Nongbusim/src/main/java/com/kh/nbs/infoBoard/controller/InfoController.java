package com.kh.nbs.infoBoard.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;
import com.kh.nbs.common.template.SaveFile;
import com.kh.nbs.infoBoard.model.service.InfoService;
import com.kh.nbs.infoBoard.model.vo.Info;

@Controller
public class InfoController {
	
	@Autowired
	private InfoService infoService;
	
	public static final String apiKey = "20230113XYLECMDYAPUCVVYBUIWSA";
	
	@RequestMapping("list.if")
	public String infoListView(@RequestParam(value="cpage", defaultValue="1") int currentPage,
							   @RequestParam(value="ctg", required=false, defaultValue="all") String category,
							   @RequestParam(value="condition", required=false, defaultValue="all") String condition,
							   @RequestParam(value="keyword", required=false, defaultValue="") String keyword,
							   @RequestParam(value="order", defaultValue="recent") String order,
							   Model model) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("order", order);
		
		PageInfo pi = Pagination.getPageInfo(infoService.selectListCount(map), currentPage, 10, 5);
		model.addAttribute("pi", pi);
		model.addAttribute("map", map);
		model.addAttribute("infoList", infoService.selectList(pi, map));
		
		return "infoBoard/infoBoardListView";
	}
	
	@RequestMapping("detail.if")
	public String selectInfo(int ino, Model model) {
	
		if(infoService.increaseCount(ino) > 0 ) {
			model.addAttribute("info", infoService.selecetInfo(ino));
			model.addAttribute("atList", infoService.selectAttachment(ino));
			model.addAttribute("imgList", infoService.selectImg(ino));
			return "infoBoard/infoBoardDetailView";
		}
		return "common/errorPage";
	}
	
	@RequestMapping("enrollForm.if")
	public String infoEnrollForm() {
		return "infoBoard/infoBoardEnrollForm";
	}
	
	@RequestMapping("insert.if")
	public String insertInfo(Info info, MultipartFile[] upfilesImg, MultipartFile[] upfiles, HttpSession session, RedirectAttributes rttr) {
		
		if(infoService.insertInfo(info) > 0) {
			
			ArrayList<Attachment> upfileList = new ArrayList<Attachment>();
			
			for(MultipartFile upfile: upfilesImg) {
				
				if(!upfile.getOriginalFilename().equals("")) {

					Attachment atImg = new Attachment();

					atImg.setBoardType("I");
					atImg.setFileLevel(0); // 이미지 파일
					atImg.setOriginName(upfile.getOriginalFilename()); // 원본명
					atImg.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfile, session)); // 저장경로
					
					System.out.println(atImg.getOriginName());
					
					upfileList.add(atImg);
				} 
			}
			
			for(MultipartFile upfile: upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {
					
					Attachment at = new Attachment();

					at.setBoardType("I");
					at.setFileLevel(4); // 다운로드 첨부파일
					at.setOriginName(upfile.getOriginalFilename()); // 원본명
					at.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfile, session)); // 저장경로
				
					System.out.println(at.getOriginName());
					
					upfileList.add(at);
				} 
			}
			
			if(infoService.insertAttachment(upfileList)>0) {
				System.out.println("첨부파일 등록 성공");
			} else {
				System.out.println("첨부파일 등록 실패");
			}
			rttr.addFlashAttribute("alertMsg", "글이 작성되었습니다.");
			return "redirect:/list.if";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateForm.if")
	public String updateFormInfo(int ino, Model model) {
		model.addAttribute("info", infoService.selecetInfo(ino));
		model.addAttribute("atList", infoService.selectAttachment(ino));
		model.addAttribute("imgList", infoService.selectImg(ino));
		return "infoBoard/infoBoardUpdateForm";
		
	}
	
	@RequestMapping("update.if")
	public String updateInfo(Info info, RedirectAttributes rttr) {
		if(infoService.updateInfo(info) > 0) {
			rttr.addFlashAttribute("alertMsg", "수정되었습니다.");
			return "redirect:/detail.if?ino=" + info.getInfoNo();
		} else {
			rttr.addFlashAttribute("alertMsg", "수정에 실패했습니다.");
			return "redirect:detail.if?ino=" +info.getInfoNo();
		}
	}
	
	@RequestMapping("delete.if")
	public String deleteInfo(int ino, RedirectAttributes rttr) {
		if(infoService.deleteInfo(ino) > 0) {
			rttr.addFlashAttribute("alertMag", "삭제되었습니다.");
			return "redirect:/list.if";
		} else {
			rttr.addFlashAttribute("alertMag", "삭제에 실패했습니다.");
			return "redirect:detail.if?ino=" + ino;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="main.if", produces="application/json; charset=UTF-8")
	public String selectMainList() {
		infoService.selectMainList();
		return new Gson().toJson(infoService.selectMainList());
	}
	
	@ResponseBody
	@RequestMapping(value="monthTech.if", produces="text/xml; charset=UTF-8")
	public String selectMonthTechList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
									  String keyword) throws IOException {
		String url = "http://api.nongsaro.go.kr/service/monthFarmTech/monthFarmTechLst";
		
		url += "?apiKey=" + apiKey;
		//url += "?srchStr=" + keyword;
		//url += "?pageNo=" + currentPage;
		//url += "?numOfRows=" + 10;
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		System.out.println(responseText);
		
		return responseText;
	}
	
	
	public String selectMonthTechList2(@RequestParam(value="cpage", defaultValue="1") int currentPage,
									  String keyword) {
		
		String url = "http://api.nongsaro.go.kr/service/monthFarmTech/monthFarmTechLst";
		
		url += "?apiKey=" + apiKey;
		url += "?srchStr=" + keyword;
		url += "?pageNo=" + currentPage;
		url += "?numOfRows=" + 10;

		StringBuffer sbf = new StringBuffer();
		
		try{
		    URL requestUrl = new URL(url);
		    BufferedReader in = new BufferedReader(new InputStreamReader(requestUrl.openStream(),"UTF-8"));
		    String inputLine;
		    
		    while( (inputLine = in.readLine() ) != null ) sbf.append(inputLine);
		    
		} catch( Exception e ) {   
			e.printStackTrace();
		}
		return "";
	}

}
