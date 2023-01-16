package com.kh.nbs.infoBoard.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
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
							   Model model) {
		
		PageInfo pi = Pagination.getPageInfo(infoService.selectListCount(), currentPage, 10, 5);
		
		model.addAttribute("pi", pi);
		model.addAttribute("infoList", infoService.selectList(pi));
		
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
	public String insertInfo(Info i, Attachment a, MultipartFile[] upfilesImg, MultipartFile[] upfiles, HttpSession session, RedirectAttributes rttr) {
		
		if(infoService.insertInfo(i) > 0) {
			
			for(MultipartFile upfile: upfilesImg) {
				
				if(!upfile.getOriginalFilename().equals("")) {

					a.setBoardType("I");
					a.setFileLevel(1); // 이미지 파일
					a.setOriginName(upfile.getOriginalFilename()); // 원본명
					a.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfile, session)); // 저장경로
					
					infoService.insertAttachment(a);
				} 
			}
			
			for(MultipartFile upfile: upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {

					a.setBoardType("I");
					a.setFileLevel(4); // 다운로드 첨부파일
					a.setOriginName(upfile.getOriginalFilename()); // 원본명
					a.setChangeName("resources/uploadFiles/" + SaveFile.getChangeName(upfile, session)); // 저장경로
					
					infoService.insertAttachment(a);
				} 
			}
			rttr.addFlashAttribute("alertMsg", "글이 작성되었습니다.");
			return "redirect:/list.if";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("search.if")
	public String selectSearchList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
			   					   @RequestParam(value="ctg", defaultValue="all") String category,
			   					   String condition, String keyword, Model model) {
		
		HashMap<String, String> map = new HashMap();
		map.put("category", category);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagination.getPageInfo(infoService.selectSearchListCount(map), currentPage, 10, 5);
		
		model.addAttribute("pi", pi);
		model.addAttribute("infoList", infoService.selectSearchList(pi, map));
		model.addAttribute("map", map);
		model.addAttribute("ctg", category);
		
		return "infoBoard/infoBoardListView";
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
