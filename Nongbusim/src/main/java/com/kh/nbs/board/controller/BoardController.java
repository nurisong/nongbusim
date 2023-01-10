package com.kh.nbs.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nbs.board.model.service.BoardService;
import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	
	//게시판리스트로 이동(페이징+리스트 조회, 미완성:like조회x)
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage,@RequestParam(value="type") String boardType, ModelAndView mv) {
		
		System.out.println(currentPage);
		System.out.println(boardType);
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectListCount(boardType), currentPage, 10, 5);
		System.out.println(pi.getCurrentPage());
		System.out.println(pi.getListCount());
		
		mv.addObject("pi", pi).addObject("list", boardService.selectList(boardType,pi)).addObject("btype",boardType).setViewName("board/tableBoardList");
		
		return mv;
	}
	
	//자랑게시판으로 이동
	@RequestMapping("picture.bo")
	public ModelAndView pictureBoardView(@RequestParam(value="cpage", defaultValue="1") int currentPage,@RequestParam(value="type") String boardType, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectListCount(boardType), currentPage, 10, 8);
		
		mv.addObject("pi", pi).addObject("list", boardService.selectList(boardType,pi)).addObject("btype",boardType).setViewName("board/pictureBoardList");
		
		return mv;
	}
	
	//게시판 글쓰기로 이동
	@RequestMapping("write.bo")
	public ModelAndView boardWrite(@RequestParam(value="wtype") String boardType, ModelAndView mv) {
		
		System.out.println(boardType);
		
		mv.addObject("btype", boardType).setViewName("board/boardWrite");
		return mv;
	}

	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(ModelAndView mv, int bno) { // 키값과 똑같은 이름의 매개변수, int형으로 쓰면 알아서 파싱

		if(boardService.increaseCount(bno) > 0) {
			
			Board b=boardService.selectBoard(bno);
			ArrayList<Attachment> a= boardService.selectAttachmentsBoard(b);
			

			mv.addObject("a",a).addObject("b", b).setViewName("board/boardDetailView");
			
		}else {
			mv.addObject("errorMsg", "상세조회실패~").setViewName("common/errorPage");
		}

		return mv;
	}
	
	
	//게시판 등록하기(일단 테이블게시판 테스트 해보고 사진게시판 작업)
	@RequestMapping("insert.bo")
	public ModelAndView insertBoard(Board b, MultipartFile[] upfiles, HttpSession session, ModelAndView mv, Attachment a) {
		
		if(boardService.insertBoard(b) > 0) {
			
			int boardNo = b.getBoardNo();
			
			for(MultipartFile upfile : upfiles) {
				
				if(!upfile.getOriginalFilename().equals("")) {
					a.setBoardNo(boardNo);
					a.setBoardType(b.getBoardType());
					a.setOriginName(upfile.getOriginalFilename()); // 원본명
					a.setChangeName("resources/uploadFiles/" + saveFile(upfile, session)); // 저장경로
					
					if(boardService.insertAttachment(a) > 0) {
						mv.addObject("btype", b.getBoardType()).setViewName("redirect:/");
					} else {
						mv.setViewName("common/errorPage");
					}
						
				}
			}
		
			mv.setViewName("redirect:/");
			
		} else {
			// 첨부파일 삭제
		}
		
		return mv;
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) { // 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
		
		// 파일 명 수정 작업 후 서버에 업로드 시키기("image.png" => 2022.12.38123.123.png)
		String originName = upfile.getOriginalFilename();
		
		// "20221226103530"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 12321(5자리 랜덤값)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자하는 폴더의 물리적인경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	
}
