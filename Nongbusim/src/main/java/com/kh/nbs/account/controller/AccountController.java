package com.kh.nbs.account.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.account.model.service.AccountService;
import com.kh.nbs.account.model.vo.Account;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;
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
		// list을 반환
		mv.addObject("catAndGoods", (ArrayList<HashMap>)accountService.selectCatAndGoods(memNo))
          .setViewName("member/myPageFarmer/account/accountListView");
		
		return mv;		
	}
	

	
	
	// list.ac 페이지에서 사용자가 검색조건 설정 후 "검색" 버튼 클릭시 이를 만족하는 accountList(table표)를 뿌려주기 위한 메소드 (ajax)
	@ResponseBody
	@RequestMapping(value="selectAccountList.ac", produces="application/json; charset=UTF-8")
	public String selectAccountList(@RequestParam(value="cpage",defaultValue="1") int currentPage, Account account, HttpSession session) {
		
		int memNo= ((Member)session.getAttribute("loginUser")).getMemNo();		
		account.setMemNo(memNo);
		
		PageInfo pi = Pagination.getPageInfo(accountService.selectListCount(account), currentPage , 10 , 10);
	
		
		ArrayList result = null;
		if(accountService.selectAccountList(account,pi) != null ) {
			result =accountService.selectAccountList(account, pi);
			result.add(pi);
			// list의 마지막에 pi를 담아 돌려보냄
			
		}
		
		return new Gson().toJson(result);

	}
	
	// 가계부 등록form을 띄워주는 메소드
	@RequestMapping("enrollForm.ac")
	public ModelAndView accountEnrollForm(ModelAndView mv, HttpSession session) {
		int memNo= ((Member)session.getAttribute("loginUser")).getMemNo();
		mv.addObject("catAndGoods", accountService.selectCatAndGoods(memNo)).setViewName("member/myPageFarmer/account/accountEnrollForm");
		System.out.println("catAndGoods" +accountService.selectCatAndGoods(memNo));
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
	public String insertaccount(Account account, String newCategory, String newGoods, MultipartFile[] upfiles, HttpSession session, Attachment at) {
		
		System.out.println("hiinsertAccount" +account);
		// 만약 신규등록한 카테고리 or 품목이 있다면
		/// account의 accountCategory필드 값을 신규등록값으로 변경
		if(!newCategory.equals("")) {
			account.setAccountCategory(newCategory);
		} 
		if(!newGoods.equals("")) {
			account.setGoods(newGoods);
		} 

		
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
					at.setBoardType("A");
					at.setOriginName(upfiles[i].getOriginalFilename());
					at.setChangeName("resources/uploadFiles/" + saveFile(upfiles[i], session)); 

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
			return "redirect:list.ac";
		} else {			
			session.setAttribute("alertMsg", "영농일지 작성 실패");
			return "common/errorPage";
		}
		
	}	
	
	
	//영농일지 상세페이지
	@RequestMapping("detail.ac")
	public ModelAndView selectAccount(@RequestParam(value="ano") int accountNo, ModelAndView mv) {
		mv.addObject("account", accountService.selectAccount(accountNo)).addObject("aAtList", accountService.selectAttachmentList(accountNo)).setViewName("member/myPageFarmer/account/accountDetailView");;
		return mv;
	}
	
	
	// 영농일지 상세페이지에서 "수정" 버튼 누를시 수정 폼을 띄워주는 메소드
	@RequestMapping("updateForm.ac")
	public ModelAndView updateAccountForm(String ano, HttpSession session, ModelAndView mv) {		
		//update할때 필요한 정보들은 accountDetailView에서 필요한 Service메소드  + categoryList Serviec메소드 
		// 동일 메소드로 재활용하기		
		int accountNo= Integer.parseInt(ano);
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
				
		mv.addObject("account", accountService.selectAccount(accountNo)).addObject("aAtList", accountService.selectAttachmentList(accountNo));
		mv.addObject("catAndGoods", accountService.selectCatAndGoods(memNo));		
		mv.setViewName("member/myPageFarmer/account/accountUpdateForm");
		return mv;	
	
	} 
	
	// 영농일지 수정하기에서 "확인" 버튼 누를 시, DB에 수정된 내용을 저장하기 위한 메소드
	@RequestMapping("update.ac")
	public ModelAndView updateAccount(Account account, String newCategory, String newGoods, MultipartFile[] reUpfiles, HttpServletRequest request, HttpSession session, Attachment at, ModelAndView mv) {
		// 만약 신규등록한 카테고리가 있다면
		/// account의 accountCategory필드 값을 신규등록값으로 변경

		if(!newCategory.equals("")) {
			account.setAccountCategory(newCategory);
		}

		if(!newCategory.equals("")) {
			account.setGoods(newGoods);
		}
		for(int i=0; i<3; i++) {
			
				//0번째 인덱스에 올려진 파일이 있고
			
			String which = "";
			
			if(!reUpfiles[i].getOriginalFilename().equals("")) {					

				if(i==0) {	
						// for문 내에서 insert문은 단 한 번만 실행되어야하므로 i==0 블럭에서 실행
					accountService.updateAccount(account);
				}
			
				
				at.setBoardType("A");
				//attachment vo에 새로 들어온 파일의 값을 담고
				at.setOriginName(reUpfiles[i].getOriginalFilename());
				at.setChangeName("resources/uploadFiles/" + saveFile(reUpfiles[i], session)); 
	
				
				if(request.getParameter("beforeFileNo"+(i+1)) != null) {			
					// 기존 에 파일이 존재했던 인덱스라면 
					// DB에서 기존 파일의 fileNo에 덮어쓰기
					at.setFileNo(Integer.parseInt(request.getParameter("beforeFileNo"+(i+1))));
					// 기존 파일은 삭제
						new File("/"+request.getParameter("beforeFileChangeName"+(i+1))).delete();
					// 실행할 SQL문은  attachment - UPDATE
					accountService.updateAttachment(at);
					
				} else {
					// 기존파일이 존재하지 않을 경우
					// 다이어리 no를 boardNo에 세팅
					at.setBoardNo(account.getAccountNo());
					// 실행할 SQL문은   attachment - insert
					accountService.insertAttachment(at);					
				}
			} else {
				accountService.updateAccount(account);
			}
		}
				mv.setViewName("member/myPageFarmer/account/accountListView");
				return mv;
	}	
	
	
	@RequestMapping("delete.ac")
	public ModelAndView deleteAccount(@RequestParam(value="ano") int accountNo, @RequestParam(value="att") String attatchment , ModelAndView mv, HttpSession session) {	
		
		if( attatchment.equals("[]")){
			if (accountService.deleteAccount(accountNo) >0) {
				session.setAttribute("alertMsg", "가계부가 삭제되었습니다");
				mv.setViewName("redirect:list.ac");
			} else {
				session.setAttribute("alertMsg", "가계부 삭제에 실패하였습니다.");
				mv.setViewName("common/errorPage");			
			}
			
		} else {
			if(accountService.deleteAccount(accountNo)*accountService.deleteAttachment(accountNo)>0) {
				session.setAttribute("alertMsg", "가계부가 삭제되었습니다");
				mv.setViewName("redirect:list.ac");
			} else {
				session.setAttribute("alertMsg", "가계부 삭제에 실패하였습니다.");
				mv.setViewName("common/errorPage");			
			}
			
		}
			return mv;	
	
	} 
	
	
	//선택한 체크박스  글들을 삭제하는 메소드
	@ResponseBody
	@RequestMapping(value = "deleteSelected.ac", produces = "application/json; charset=UTF-8")
	public String deleteSelected(@RequestParam(value="checkboxArr[]") List<String> checkboxArr ,  HttpSession session) {
		System.out.println();
		
		String result = "";
		if(accountService.deleteCheckedAccountNo(checkboxArr)>0) {
			accountService.deleteCheckedAttachment(checkboxArr);
			result = "삭제성공";
		} else {
			result = "삭제실패";
		};
		return new Gson().toJson(result);
		
		// 해당월 총 수입: [Account(accountNo=0, type=I, accountCategory=null, goods=null, startDate=null, endDate=null, createDate=2023-01-01, amount=4010000, accountContent=null, status=null, memNo=0, nickName=null), 
		// 해당월 총 지출: Account(accountNo=0, type=O, accountCategory=null, goods=null, startDate=null, endDate=null, createDate=2023-01-01, amount=895000, accountContent=null, status=null, memNo=0, nickName=null)]	
		
		
	}
	
	
	//----------------------입출금장부 달력보기 초기 진입화면 --------------------------------------------------
	@RequestMapping("calView.ac")
	public ModelAndView loadDiaryCal(ModelAndView mv) {
		mv.setViewName("member/myPageFarmer/account/accountCalView");
		return mv;
	}
	
	//-----------------------calList에서 달력에 event를 띄워주기위한 ajax를 받는메소드, loadEvent()호출------------
	@ResponseBody
	@RequestMapping(value = "calList.ac", produces = "application/json; charset=UTF-8")
	public String selectCalEventList (HttpSession session) {
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();	  
	    return new Gson().toJson(accountService.seletCalEvent(memNo));
	
	}

	
	//-------------------------calView에서 해당월 수입지출 요약정보를 띄워주기위한 ajax를 받는메소드---------------------
	//ajax로 yyyy-mm-01 데이터(yearMonth)를 넘길 때, 
	// 나중에 mapper에 parameterType으로  (yearMonth, memNo) 두개를 넘겨야 하므로
	// Account vo에  두 값을 담을 것임
	// controller에서 data를 받을 때 Account로 받도록 RequestParam 설정
	@ResponseBody
	@RequestMapping(value = "monthlySummary.ac", produces = "application/json; charset=UTF-8")
	public String monthlySummary(Account account,  HttpSession session) {
		
		
		account.setMemNo(((Member) session.getAttribute("loginUser")).getMemNo());
		
		ArrayList<Account> result = accountService.monthlySummary(account);
		
		if(result.size()<3) { 
			if(result.get(0).getType().equals("수입")) {
				result.get(1).setAmount("+"+result.get(1).getAmount());
			} else if(result.get(0).getType().equals("지출"))  {
				result.get(1).setAmount("-"+result.get(1).getAmount());
			}
		}
				
		return new Gson().toJson(result);
		
		// 해당월 총 수입: [Account(accountNo=0, type=I, accountCategory=null, goods=null, startDate=null, endDate=null, createDate=2023-01-01, amount=4010000, accountContent=null, status=null, memNo=0, nickName=null), 
		// 해당월 총 지출: Account(accountNo=0, type=O, accountCategory=null, goods=null, startDate=null, endDate=null, createDate=2023-01-01, amount=895000, accountContent=null, status=null, memNo=0, nickName=null)]	
		
	}
	
	
}
