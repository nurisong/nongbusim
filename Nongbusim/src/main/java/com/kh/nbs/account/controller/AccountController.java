package com.kh.nbs.account.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.account.model.service.AccountService;
import com.kh.nbs.account.model.vo.Account;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.member.model.vo.Member;

@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;

	@RequestMapping("list.ac")
	public ModelAndView selectCategoryList(ModelAndView mv, HttpSession session ) {

		// accountListView 진입시 user가 등록한  분류(category), 품목(goods)를 select태그로 뿌려주기 위한 메소드 (where memNo=사용자)
		int memNo=((Member)session.getAttribute("loginUser")).getMemNo();
		
		// category와 goods를  각 key(categoryList, goodsList)에 담은
		// haspmap을 반환하는 selectCatAndGoods
		mv.addObject("catAndGoods", (ArrayList<HashMap>)accountService.selectCatAndGoods(memNo))
          .setViewName("member/myPageFarmer/account/accountListView");
		
		return mv;		
	}
	
	
	// list.di 페이지에서 사용자가 검색조건 설정 후 "검색" 버튼 클릭시 이를 만족하는 accountList(table표)를 뿌려주기 위한 메소드 (ajax)
	@ResponseBody
	@RequestMapping(value="selectAccountList.di", produces="application/json; charset=UTF-8")
	public String selectAccountList(Account account, HttpSession session) {
		
		int memNo= ((Member)session.getAttribute("loginUser")).getMemNo();
		
		account.setMemNo(memNo);
		return new Gson().toJson(accountService.selectAccountList(account));	
	}

	
	
	// 가계부 등록form을 띄워주는 메소드
	@RequestMapping("enrollForm.di")
	public ModelAndView accountEnrollForm(ModelAndView mv, HttpSession session) {
		int memNo= ((Member)session.getAttribute("loginUser")).getMemNo();
		
		mv.addObject("catAndGoods", accountService.selectCatAndGoods(memNo)).setViewName("member/myPageFarmer/account/accountEnrollForm");
		return mv ;
		
		}
	
	
			
	private String saveFile(MultipartFile upfile, HttpSession session) {
		
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
	
	// account enrollForm 입력 후 "등록하기"버튼 누를 시 실행되는 메소드	
	@RequestMapping("insert.ac")
	public String insertaccount(Account account, String newCategory, MultipartFile[] upfiles, HttpSession session, Attachment at) {
		// 만약 신규등록한 카테고리가 있다면
		/// account의 accountCategory필드 값을 신규등록값으로 변경
		if(!newCategory.equals("")) {
			account.setAccountCategory(newCategory);
		}
		
		System.out.println(account);
		
		// account테이블 insert 성공여부 저장을 위한 변수선언
		int insertAccountResult = 0;
		
		// jsp페이지에서 upfiles name속성을 총 3개의 input:file 에 부여하였으므로 최대 3개의 객체배열이 넘어옴
		// 사용자가 등록한 파일이 1개 이상일 경우, 하단 for문 코드블럭 진입
		for(int i=0; i<upfiles.length; i++) {
			// upfiles 갯수만큼 반복문을 돌면서 각 인덱스에 저장된 파일이 있는지 여부를 확인, 
			// 있을시 하단 if문 코드블럭으로 
			if(!upfiles[i].getOriginalFilename().equals("")) {
				
				//0번째 인덱스에 올려진 파일이 있다면 
				if(i==0) {
						insertAccountResult= accountService.insertAccount(account);
				}
				
				// insert 성공시 attachment 클래스 필드세팅 후 insert
				if(insertAccountResult>0) {	
					at.setBoardType("D");
					at.setOriginName(upfiles[i].getOriginalFilename());
					at.setChangeName("resources/uploadFiles/" + saveFile(upfiles[i], session)); 
					System.out.println(at);
					if(accountService.insertAttachment(at)<0) {
						session.setAttribute("alertMsg", "영농일지 작성 실패");
						return "common/errorPage";
					}					
				} 				
			}
		} 
		
		// 사용자가 등록한 파일이 없을 경우, account를 insert하기 위한 if블럭 
		if (insertAccountResult==0) {
			insertAccountResult= accountService.insertAccount(account);
		}
	
		
		if(insertAccountResult>0) {			
			session.setAttribute("alertMsg", "영농일지 작성성공");
			return "redirect:list.di";
		} else {			
			session.setAttribute("alertMsg", "영농일지 작성 실패");
			return "common/errorPage";
		}
		
	}	
	
		
	
}
