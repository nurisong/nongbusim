package com.kh.nbs.diary.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;
import com.kh.nbs.diary.model.service.DiaryService;
import com.kh.nbs.diary.model.vo.Diary;
import com.kh.nbs.member.model.vo.Member;

@Controller
public class DiaryController {

	@Autowired
	private DiaryService diaryService;
	// dummy memNo

	// list.di 로딩을 위한 메소드
	@RequestMapping("list.di")
	public ModelAndView selectCategoryList(ModelAndView mv, HttpSession session) {

		// diaryListView 진입시 user가 등록한 category를 select태그로 뿌려주기 위한 메소드 (where memNo=사용자)
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		
			
		mv.addObject("categoryList", diaryService.selectCategoryList(memNo))
				.setViewName("member/myPageFarmer/diary/diaryListView");

		return mv;
	}

	// list.di 페이지에서 사용자가 검색조건 설정 후 "검색" 버튼 클릭시 이를 만족하는 diaryList(table표)를 뿌려주기 위한
	// 메소드 (ajax)
	@ResponseBody
	@RequestMapping(value = "selectDiaryList.di", produces = "application/json; charset=UTF-8")
	public String selectDiaryList(@RequestParam(value="cpage",defaultValue="1") int currentPage, Diary diary, HttpSession session) {

		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		diary.setMemNo(memNo);
		PageInfo pi = Pagination.getPageInfo(diaryService.selectListCount(diary), currentPage , 10 , 10);
		System.out.println(pi);
		
		ArrayList result = null;
		if(diaryService.selectDiaryList(diary,pi) != null ) {
			result = diaryService.selectDiaryList(diary, pi);
			result.add(pi);
			// list의 마지막에 pi를 담아 돌려보냄
			
		}
		
		return new Gson().toJson(result);
	}

	// diary등록 form을 띄워주 메소드
	@RequestMapping("enrollForm.di")
	public ModelAndView diaryEnrollForm(ModelAndView mv, HttpSession session) {
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();

		mv.addObject("categoryList", diaryService.selectCategoryList(memNo))
				.setViewName("member/myPageFarmer/diary/diaryEnrollForm");

		return mv;

	}

	// 첨부파일 업로드 시, changename설정을 위한 메소드
	private String saveFile(MultipartFile upfile, HttpSession session) {

		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int) (Math.random() * 90000 + 10000);
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

	// diary enrollForm 입력 후 "등록하기"버튼 누를 시 실행되는 메소드
	@RequestMapping("insert.di")
	public String insertDiary(Diary diary, String newCategory, MultipartFile[] upfiles, HttpSession session,
			Attachment at) {
		// 만약 신규등록한 카테고리가 있다면
		/// diary의 diaryCategory필드 값을 신규등록값으로 변경
		if (!newCategory.equals("")) {
			diary.setDiaryCategory(newCategory);
		}

		System.out.println(diary);

		// diary테이블 insert 성공여부 저장을 위한 변수선언
		int insertDiaryResult = 0;

		// jsp페이지에서 upfiles name속성을 총 3개의 input:file 에 부여하였으므로 최대 3개의 객체배열이 넘어옴
		// 사용자가 등록한 파일이 1개 이상일 경우, 하단 for문 코드블럭 진입
		for (int i = 0; i < upfiles.length; i++) {
			// upfiles 갯수만큼 반복문을 돌면서 각 인덱스에 저장된 파일이 있는지 여부를 확인,
			// 있을시 하단 if문 코드블럭으로
			if (!upfiles[i].getOriginalFilename().equals("")) {

				// 0번째 인덱스에 올려진 파일이 있다면
				if (i == 0) {
					// diary를 insert하기 전 썸네일 필드 세팅(diary의 thumbnail필드엔 첫번쨰 file을 등록)
					diary.setDiaryThumbnail("resources/uploadFiles/" + saveFile(upfiles[i], session));
					// for문 내에서 insert문은 단 한 번만 실행되어야하므로 i==0 블럭에서 실행
					insertDiaryResult = diaryService.insertDiary(diary);
				}

				// insert 성공시 attachment 클래스 필드세팅 후 insert
				if (insertDiaryResult > 0) {
					at.setBoardType("D");
					at.setOriginName(upfiles[i].getOriginalFilename());
					at.setChangeName("resources/uploadFiles/" + saveFile(upfiles[i], session));
					System.out.println(at);
					if (diaryService.insertAttachment(at) < 0) {
						session.setAttribute("alertMsg", "영농일지 작성 실패");
						return "common/errorPage";
					}
				}
			}
		}

		// 사용자가 등록한 파일이 없을 경우, diary를 insert하기 위한 if블럭
		if (insertDiaryResult == 0) {
			insertDiaryResult = diaryService.insertDiary(diary);
		}

		if (insertDiaryResult > 0) {
			session.setAttribute("alertMsg", "영농일지 작성성공");
			return "redirect:list.di";
		} else {
			session.setAttribute("alertMsg", "영농일지 작성 실패");
			return "common/errorPage";
		}

	}


	// 영농일지 상세페이지
	@RequestMapping("detail.di")
	public ModelAndView selectDiary(@RequestParam(value = "dno") int diaryNo, ModelAndView mv) {
		mv.addObject("diary", diaryService.selectDiary(diaryNo))
				.addObject("dAtList", diaryService.selectAttachmentList(diaryNo))
				.setViewName("member/myPageFarmer/diary/diaryDetailView");
		;
		return mv;
	}

	// 영농일지 상세페이지에서 "수정" 버튼 누를시 수정 폼을 띄워주는 메소드
	@RequestMapping("updateForm.di")
	public ModelAndView updateDiaryForm(String dno, HttpSession session, ModelAndView mv) {
		// update할때 필요한 정보들은 diaryDetailView에서 필요한 Service메소드 + categoryList Serviec메소드
		// 동일 메소드로 재활용하기
		int diaryNo = Integer.parseInt(dno);
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		
		
		mv.addObject("diary", diaryService.selectDiary(diaryNo)).addObject("dAtList",
				diaryService.selectAttachmentList(diaryNo));
		mv.addObject("categoryList", diaryService.selectCategoryList(memNo));
		mv.setViewName("member/myPageFarmer/diary/diaryUpdateForm");
		return mv;

	}

	// 영농일지 수정하기에서 "확인" 버튼 누를 시, DB에 수정된 내용을 저장하기 위한 메소드
	@RequestMapping("update.di")
	public ModelAndView updateDiary(Diary diary, String newCategory, MultipartFile[] reUpfiles,
			HttpServletRequest request, HttpSession session, Attachment at, ModelAndView mv) {
		// 만약 신규등록한 카테고리가 있다면
		/// diary의 diaryCategory필드 값을 신규등록값으로 변경

		if (!newCategory.equals("")) {
			diary.setDiaryCategory(newCategory);
		}

		for (int i = 0; i < 3; i++) {

			System.out.println("updateDiary reUpfiles" + reUpfiles[i]);
			// 0번째 인덱스에 올려진 파일이 있고

			String which = "";

			if (!reUpfiles[i].getOriginalFilename().equals("")) {

				if (i == 0) {
					// diary를 insert하기 전 썸네일 필드 세팅(diary의 thumbnail필드엔 첫번쨰 file을 등록)
					diary.setDiaryThumbnail("resources/uploadFiles/" + saveFile(reUpfiles[i], session));
					// for문 내에서 insert문은 단 한 번만 실행되어야하므로 i==0 블럭에서 실행
					System.out.println(diary);
					diaryService.updateDiary(diary);
				}

				at.setBoardType("D");
				// attachment vo에 새로 들어온 파일의 값을 담고
				at.setOriginName(reUpfiles[i].getOriginalFilename());
				at.setChangeName("resources/uploadFiles/" + saveFile(reUpfiles[i], session));

				if (request.getParameter("beforeFileNo" + (i + 1)) != null) {
					// 기존 에 파일이 존재했던 인덱스라면
					// DB에서 기존 파일의 fileNo에 덮어쓰기
					at.setFileNo(Integer.parseInt(request.getParameter("beforeFileNo" + (i + 1))));
					// 기존 파일은 삭제
					new File("/" + request.getParameter("beforeFileChangeName" + (i + 1))).delete();
					// 실행할 SQL문은 attachment - UPDATE
					diaryService.updateAttachment(at);

				} else {
					// 기존파일이 존재하지 않을 경우
					// 다이어리 no를 boardNo에 세팅
					at.setBoardNo(diary.getDiaryNo());
					// 실행할 SQL문은 attachment - insert
					diaryService.insertAttachment(at);
				}
			} else {
				diaryService.updateDiary(diary);
			}
		}
		mv.setViewName("member/myPageFarmer/diary/diaryListView");
		return mv;
	}

	@RequestMapping("delete.di")
	public ModelAndView deleteDiary(int diaryNo,  @RequestParam(value="att") String attatchment, ModelAndView mv, HttpSession session) {
		
		if( attatchment.equals("[]")){
			if (diaryService.deleteDiary(diaryNo) >0) {
				session.setAttribute("alertMsg", "영농일지가 삭제되었습니다");
				mv.setViewName("redirect:list.di");
			} else {
				session.setAttribute("alertMsg", "영농일지 삭제에 실패하였습니다.");
				mv.setViewName("common/errorPage");			
			}
			
		} else {
			if(diaryService.deleteDiary(diaryNo)*diaryService.deleteAttachment(diaryNo)>0) {
				session.setAttribute("alertMsg", "영농일지가 삭제되었습니다");
				mv.setViewName("redirect:list.di");
			} else {
				session.setAttribute("alertMsg", "영농일지 삭제에 실패하였습니다.");
				mv.setViewName("common/errorPage");			
			}
			
		}
			return mv;	
		
	}	
	

	@RequestMapping("calView.di")
	public ModelAndView loadDiaryCal(ModelAndView mv) {
		mv.setViewName("member/myPageFarmer/diary/diaryCalView");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "calList.di", produces = "application/json; charset=UTF-8")
	public String selectCalEventList (HttpSession session) {
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();	  
	    System.out.println(diaryService.seletCalEvent(memNo));
	    return new Gson().toJson(diaryService.seletCalEvent(memNo));

	
	}

	//선택한 체크박스  글들을 삭제하는 메소드
	@ResponseBody
	@RequestMapping(value = "deleteSelected.di", produces = "application/json; charset=UTF-8")
	public String deleteSelected(@RequestParam(value="checkboxArr[]") List<String> checkboxArr ,  HttpSession session) {
		System.out.println();
		
		String result = "";
		if(diaryService.deleteCheckedDiaryNo(checkboxArr)>0) {
			diaryService.deleteCheckedAttachment(checkboxArr);
			result = "삭제성공";
		} else {
			result = "삭제실패";
		};
		return new Gson().toJson(result);
		
		// 해당월 총 수입: [Account(accountNo=0, type=I, accountCategory=null, goods=null, startDate=null, endDate=null, createDate=2023-01-01, amount=4010000, accountContent=null, status=null, memNo=0, nickName=null), 
		// 해당월 총 지출: Account(accountNo=0, type=O, accountCategory=null, goods=null, startDate=null, endDate=null, createDate=2023-01-01, amount=895000, accountContent=null, status=null, memNo=0, nickName=null)]	
		
		
	}
	
}
